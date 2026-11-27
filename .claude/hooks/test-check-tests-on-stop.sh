#!/usr/bin/env bash
# check-tests-on-stop.sh 테스트: 임시 git 저장소에서 사례마다 훅을 실행해 멈춤(STOP)·통과(PASS)가 기대와 같은지 확인한다.
# 실행: bash .claude/hooks/test-check-tests-on-stop.sh  (실패가 있으면 exit 1)
here="$(cd "$(dirname "$0")" && pwd)"
hook="$here/check-tests-on-stop.sh"
fail=0
total=0
default_input='{"hook_event_name": "Stop", "stop_hook_active": false}'

work="$(mktemp -d)"
trap 'rm -r "$work"' EXIT

new_repo() { # 빈 커밋 하나가 있는 저장소를 만들고 경로를 출력
  local d="$work/r$RANDOM$RANDOM"
  mkdir -p "$d" && git -C "$d" init -q -b main
  git -C "$d" -c user.name=t -c user.email=t@example.com commit -q --allow-empty -m init
  printf '%s' "$d"
}

check() { # $1=STOP|PASS $2=설명 $3=프로젝트 폴더 [$4=훅 입력 JSON]
  local expect="$1" name="$2" dir="$3" json="${4:-$default_input}" rc got
  printf '%s' "$json" | CLAUDE_PROJECT_DIR="$dir" "$hook" >/dev/null 2>&1; rc=$?
  if [ "$rc" = 2 ]; then got=STOP; else got=PASS; fi
  total=$((total + 1))
  if [ "$got" != "$expect" ]; then
    fail=$((fail + 1))
    printf 'FAIL  기대 %-4s 결과 %-4s  %s\n' "$expect" "$got" "$name"
  fi
}

add() { mkdir -p "$1/$(dirname "$2")" && echo x > "$1/$2"; }

r="$(new_repo)"
check PASS "변경 없음" "$r"
add "$r" docs/a.md
check PASS "문서만 바뀜" "$r"
add "$r" apps/web/src/a.ts
check STOP "코드만 바뀜" "$r"
check PASS "같은 변경에 두 번째" "$r"
add "$r" apps/api/src/b.py
check STOP "코드가 더 바뀌면 다시 확인" "$r"

r="$(new_repo)"
add "$r" apps/web/src/a.ts
check PASS "훅 때문에 이어서 일하는 중" "$r" '{"stop_hook_active": true}'
check PASS "입력 해석 실패" "$r" 'not json'

r="$(new_repo)"
add "$r" apps/web/src/a.ts; add "$r" apps/web/src/a.test.ts
check PASS "코드와 테스트가 함께 바뀜(.test.)" "$r"

r="$(new_repo)"
add "$r" apps/api/src/b.py; add "$r" apps/api/tests/test_b.py
check PASS "코드와 테스트가 함께 바뀜(tests/)" "$r"

r="$(new_repo)"
add "$r" packages/shared/generated/api.ts
check PASS "자동 생성 파일만 바뀜" "$r"

r="$(new_repo)"
add "$r" apps/web/src/a.ts
git -C "$r" add -A && git -C "$r" -c user.name=t -c user.email=t@example.com commit -q -m code
check PASS "기본 브랜치를 모르면 커밋한 변경은 HEAD 기준이라 제외" "$r"

# 기본 브랜치(origin/HEAD)가 있으면 갈라진 지점부터의 커밋도 본다
origin="$(new_repo)"
r="$work/clone"
git clone -q "$origin" "$r" 2>/dev/null
git -C "$r" switch -q -c feat/1
add "$r" apps/web/src/a.ts
git -C "$r" add -A && git -C "$r" -c user.name=t -c user.email=t@example.com commit -q -m code
check STOP "작업 브랜치에 커밋한 코드" "$r"

plain="$work/plain"; mkdir -p "$plain/apps/web"; echo x > "$plain/apps/web/a.ts"
check PASS "git 저장소가 아님" "$plain"

echo "check-tests-on-stop: ${total}개 중 실패 ${fail}개"
[ "$fail" = 0 ]
