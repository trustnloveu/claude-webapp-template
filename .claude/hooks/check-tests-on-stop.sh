#!/usr/bin/env bash
# Stop 훅: Claude가 작업을 마치려 할 때, 코드 파일은 바뀌었는데 테스트 파일 변경이 없으면 한 번 멈추고 이유를 묻는다.
# - 비교 기준: 기본 브랜치(origin/HEAD)와 갈라진 지점부터 지금 작업 폴더까지(커밋한 것 + 커밋 안 한 것 + 새 파일). 기본 브랜치를 모르면 HEAD 기준.
# - 같은 변경 묶음에는 한 번만 멈춘다(.git 안 표시 파일). 코드가 더 바뀌면 다시 확인한다.
# - 알림용이라 입력 해석 실패·git 오류 때는 통과한다(fail-open). 위험 명령 훅(block-dangerous.sh)은 반대로 막는다.
# 테스트: bash .claude/hooks/test-check-tests-on-stop.sh

input="$(cat)"
active="$(printf '%s' "$input" | python3 -c 'import json,sys
try:
    print(str(json.load(sys.stdin).get("stop_hook_active", False)).lower())
except Exception:
    print("error")' 2>/dev/null)"
# 훅 때문에 이미 이어서 일하는 중(stop_hook_active=true)이거나 해석 실패면 통과: 무한 반복 방지
[ "$active" = "false" ] || exit 0

cd "${CLAUDE_PROJECT_DIR:-$PWD}" 2>/dev/null || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

base=""
default_ref="$(git symbolic-ref -q --short refs/remotes/origin/HEAD 2>/dev/null)"
[ -n "$default_ref" ] && base="$(git merge-base HEAD "$default_ref" 2>/dev/null)"
[ -n "$base" ] || base="HEAD"

changed="$( { git diff --name-only --diff-filter=ACMR "$base" 2>/dev/null; git ls-files --others --exclude-standard 2>/dev/null; } | sort -u)"

test_re='(^|/)(tests?|__tests__|e2e)/|\.(test|spec)\.[^/]+$|(^|/)test_[^/]+\.py$|_test\.(py|go)$'
code_re='^(apps|packages)/.+\.(ts|tsx|js|jsx|mjs|cjs|vue|svelte|py|go|rs|java|kt|rb|php|cs|swift)$'

tests="$(printf '%s\n' "$changed" | grep -E "$test_re")"
code="$(printf '%s\n' "$changed" | grep -E "$code_re" | grep -vE "$test_re" | grep -v '^packages/shared/generated/')"

[ -n "$code" ] || exit 0   # 코드 변경 없음(문서·설정만)
[ -z "$tests" ] || exit 0  # 테스트도 함께 바뀜

marker="$(git rev-parse --git-path claude-stop-tests-notified 2>/dev/null)" || exit 0
sig="$(printf '%s' "$code" | git hash-object --stdin 2>/dev/null)" || exit 0
if [ -f "$marker" ] && [ "$(cat "$marker" 2>/dev/null)" = "$sig" ]; then
  exit 0
fi
printf '%s' "$sig" > "$marker" 2>/dev/null || exit 0

n="$(printf '%s\n' "$code" | wc -l | tr -d ' ')"
{
  echo "테스트 점검: 코드 파일 ${n}개가 바뀌었는데 테스트 파일 변경이 없습니다."
  printf '%s\n' "$code" | head -5 | sed 's/^/  - /'
  echo "테스트를 추가하거나, 테스트가 필요 없는 이유(설정·문구만 바뀜 등)를 보고에 적고 마치세요. 같은 변경에는 다시 멈추지 않습니다."
} >&2
exit 2
