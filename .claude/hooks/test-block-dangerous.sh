#!/usr/bin/env bash
# block-dangerous.sh 테스트: 사례마다 훅에 명령을 넣고 차단(BLOCK)·통과(PASS)가 기대와 같은지 확인한다.
# 실행: bash .claude/hooks/test-block-dangerous.sh  (실패가 있으면 exit 1)
# 명령은 훅에 문자열로만 전달되며 실제로 실행되지 않는다.
here="$(cd "$(dirname "$0")" && pwd)"
hook="$here/block-dangerous.sh"
fail=0
total=0

# 사례별 프로젝트 폴더: 브랜치 영향이 없도록 git 저장소가 아닌 빈 폴더를 기본으로 쓴다.
plain="$(mktemp -d)"
repo="$(mktemp -d)"
git -C "$repo" init -q -b main
trap 'rm -r "$plain" "$repo"' EXIT

run_hook() { # $1=프로젝트 폴더, 표준 입력=훅 입력
  CLAUDE_PROJECT_DIR="$1" "$hook" >/dev/null 2>&1
}

check() { # $1=BLOCK|PASS $2=명령 [$3=프로젝트 폴더]
  local expect="$1" cmd="$2" dir="${3:-$plain}" json rc got
  json="$(python3 -c 'import json,sys; print(json.dumps({"tool_name":"Bash","tool_input":{"command":sys.argv[1]}}))' "$cmd")"
  printf '%s' "$json" | run_hook "$dir"; rc=$?
  if [ "$rc" = 2 ]; then got=BLOCK; else got=PASS; fi
  total=$((total + 1))
  if [ "$got" != "$expect" ]; then
    fail=$((fail + 1))
    printf 'FAIL  기대 %-5s 결과 %-5s  %s\n' "$expect" "$got" "$cmd"
  fi
}

# --- 차단해야 하는 명령 ---
while IFS= read -r c; do [ -n "$c" ] && check BLOCK "$c"; done <<'EOF'
cat .env
echo x > .env
ls && cat .env
cat .env.example; cat .env
cat apps/api/.env.local
cat .envrc
rm -rf /
rm -rf ~
rm -rf .
rm -rf ..
rm -rf *
rm -fr /
rm -r -f ~
rm --recursive --force $HOME
sudo rm -Rf /*
rm -rf /usr
git push --force origin feat/1
git push -f
git push --force-with-lease origin feat/1
git push origin +feat/1
git push origin main
git push origin HEAD:main
git push origin refs/heads/master
git reset --hard HEAD~1
psql -c "DROP TABLE users"
psql -c "drop database app"
EOF

# --- 통과해야 하는 명령 ---
while IFS= read -r c; do [ -n "$c" ] && check PASS "$c"; done <<'EOF'
cat .env.example
cat ./apps/api/.env.local.example
ls -la
git status
npm test
rm -rf ./node_modules
rm -rf apps/web/dist
rm -rf /tmp/build-cache
rm -f old.log
git push origin feat/1-login
git push -u origin feat/1-login
node -e "console.log(process.env.HOME)"
grep -r main src
EOF

# --- 브랜치에 따라 달라지는 명령 ---
check BLOCK "git commit -m x" "$repo"
check BLOCK "git push" "$repo"
check BLOCK "git push origin HEAD" "$repo"
git -C "$repo" switch -q -c feat/1-test
check PASS "git commit -m x" "$repo"
check PASS "git push" "$repo"
check PASS "git push origin HEAD" "$repo"

# --- 입력을 해석할 수 없으면 차단 (fail-closed) ---
total=$((total + 1))
printf 'not json' | run_hook "$plain"
if [ $? != 2 ]; then
  fail=$((fail + 1)); echo "FAIL  기대 BLOCK 결과 PASS  (잘못된 JSON 입력)"
fi

echo "결과: $((total - fail))/$total 통과"
[ "$fail" = 0 ]
