#!/usr/bin/env bash
# PreToolUse 훅: 위험한 Bash 명령을 실행 전에 차단한다.
# 표준 입력으로 받은 JSON의 tool_input.command를 검사하고, 걸리면 exit 2로 막는다.
# 입력을 해석하지 못하면 막는다(fail-closed). 테스트: bash .claude/hooks/test-block-dangerous.sh
# 한계: 글자 검사라 bash -c "$(…)"나 스크립트 파일 안에 숨긴 명령은 잡지 못한다. 실수를 막는 안전벨트다.

block() {
  echo "차단됨: $1 — 필요하면 사람이 직접 실행하세요." >&2
  exit 2
}

input="$(cat)"

# 검사 코드는 변수에 담아 실행한다. ($( ) 안에 heredoc을 두면 macOS 기본 bash 3.2가 잘못 해석한다)
read -r -d '' check_py <<'PY'
import json, os, re, shlex, subprocess

try:
    cmd = json.loads(os.environ["HOOK_INPUT"]).get("tool_input", {}).get("command", "")
except Exception:
    print("BLOCK 훅 입력을 해석하지 못함")
    raise SystemExit

if not isinstance(cmd, str):
    print("BLOCK 훅 입력을 해석하지 못함")
    raise SystemExit

def current_branch():
    proj = os.environ.get("CLAUDE_PROJECT_DIR") or "."
    try:
        r = subprocess.run(["git", "-C", proj, "branch", "--show-current"],
                           capture_output=True, text=True, timeout=5)
        return r.stdout.strip()
    except Exception:
        return ""

PROTECTED = {"main", "master", "dev", "prd"}

def is_protected(branch):
    # 복사본의 dev(개발)·prd(운영), main·master, 템플릿의 버전 브랜치(release/로 시작)를 보호한다
    return branch in PROTECTED or branch.startswith("release/")

# 1) .env 파일: 명령 안의 .env… 이름을 모두 찾아 .example로 끝나는 것만 허용한다.
for name in re.findall(r"(?<![A-Za-z0-9_])\.env(?:rc)?(?:\.[A-Za-z0-9_-]+)*(?![A-Za-z0-9_])", cmd):
    if not name.endswith(".example"):
        print("BLOCK .env 파일 접근")
        raise SystemExit

# 2) DB 삭제
if re.search(r"\bdrop\s+(database|table)\b", cmd, re.IGNORECASE):
    print("BLOCK DB 삭제 명령")
    raise SystemExit

# 명령을 ; && || | & 줄바꿈 단위로 나눠 하나씩 검사한다.
def tokens_of(segment):
    try:
        toks = shlex.split(segment)
    except ValueError:
        toks = segment.split()
    return [t.strip("(){}`") for t in toks if t.strip("(){}`")]

BROAD_RM = {"/", "/*", "~", "~/", "~/*", "$HOME", "$HOME/", "$HOME/*", "${HOME}", "${HOME}/",
            "${HOME}/*", ".", "./", "./*", "..", "../", "../*", "*"}

def is_broad_target(t):
    if t in BROAD_RM:
        return True
    # /usr, /Users 같은 최상위 폴더 통째 삭제
    return t.startswith("/") and len([p for p in t.split("/") if p]) <= 1

for segment in re.split(r"&&|\|\||[;|&\n]", cmd):
    toks = tokens_of(segment)
    if not toks:
        continue

    # 3) 광범위한 rm -rf (옵션 순서·표기와 무관)
    for i, t in enumerate(toks):
        if os.path.basename(t) != "rm":
            continue
        recursive = force = False
        targets, opts_done = [], False
        for a in toks[i + 1:]:
            if not opts_done and a == "--":
                opts_done = True
            elif not opts_done and a.startswith("--"):
                recursive |= a == "--recursive"
                force |= a == "--force"
            elif not opts_done and a.startswith("-") and len(a) > 1:
                recursive |= ("r" in a or "R" in a)
                force |= "f" in a
            else:
                targets.append(a)
        if recursive and force and any(is_broad_target(x) for x in targets):
            print("BLOCK 광범위한 rm -rf")
            raise SystemExit

    if "git" not in toks:
        continue
    g = toks.index("git")
    rest = toks[g + 1:]

    # 4) git reset --hard
    if "reset" in rest and "--hard" in rest:
        print("BLOCK git reset --hard")
        raise SystemExit

    # 5) 보호 브랜치(dev/prd/main/master/release/*)에서 커밋
    if "commit" in rest:
        b = current_branch()
        if is_protected(b):
            print(f"BLOCK {b} 브랜치에서 커밋 (기능 브랜치를 먼저 만드세요)")
            raise SystemExit

    # 6) git push: 강제 푸시, 보호 브랜치로 푸시
    if "push" in rest:
        args = rest[rest.index("push") + 1:]
        flags = [a for a in args if a.startswith("-")]
        positional = [a for a in args if not a.startswith("-")]
        if any(f == "--force" or f.startswith("--force-with-lease") or f == "--force-if-includes"
               or (not f.startswith("--") and "f" in f) for f in flags):
            print("BLOCK 강제 푸시")
            raise SystemExit
        refspecs = positional[1:]  # 첫 번째는 원격 이름
        for r in refspecs:
            if r.startswith("+"):
                print("BLOCK 강제 푸시")
                raise SystemExit
            dst = r.split(":")[-1]
            if is_protected(dst.removeprefix("refs/heads/")):
                print("BLOCK 보호 브랜치(dev/prd/main/release/*) 직접 푸시")
                raise SystemExit
        if not refspecs or all(r in ("HEAD", "@") for r in refspecs):
            b = current_branch()
            if is_protected(b):
                print("BLOCK 보호 브랜치(dev/prd/main/release/*) 직접 푸시")
                raise SystemExit

print("OK")
PY

verdict="$(HOOK_INPUT="$input" python3 -c "$check_py" 2>/dev/null)"

case "$verdict" in
  OK) exit 0 ;;
  "BLOCK "*) block "${verdict#BLOCK }" ;;
  *) block "훅 검사 실패 (python3 확인 필요)" ;;
esac
