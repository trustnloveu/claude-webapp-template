# 템플릿 관리판

> 대상: 공용

**이 저장소는 템플릿 원본(starter)이다.** 여기서는 프로젝트 단계(0~5)를 진행하지 않는다. 기획·디자인·구현은 이 템플릿으로 만든 복사본에서 한다(docs/guide/SETUP.md 2단계, 복사본의 상태판은 docs/PIPELINE-template.md).
- 이 저장소의 변경은 모두 "템플릿 고도화"로 다룬다: 브랜치(chore/번호-설명) → PR → 사람이 병합. CLAUDE.md의 "현재 단계", "단계 체크" 규칙은 복사본용이며 이 저장소에는 적용하지 않는다.
- 세션을 시작하면 이 파일의 상태, 다음 할 일, "사람 확인 대기"를 요약한다.
- 아래 결정 로그와 확인 기록은 템플릿을 만들며 정한 근거다. 복사본에는 넘어가지 않는다.

템플릿 상태: v1 완성 (2026-11-27 사람 승인. 고도화 1차 PR #4, 2차 PR #5, 관리판 전환 PR #6 병합, GitHub Template repository 설정 켬)
다음 할 일: 아이디어가 정해지면 SETUP.md 2단계의 `gh repo create --template`으로 복사본을 만들어 복사본에서 0단계부터 시작한다. 템플릿을 더 고칠 일이 생기면 이 저장소에서 새 브랜치(chore/번호-설명)를 기본 브랜치 `release/v1`에서 만들고 PR도 `release/v1`로 보낸다(main은 삭제됨, 확인 기록). 작은 버전은 태그(v1.1.0 등)로 표시(사람 승인 후)

## 사람 확인 대기
Claude가 사람의 승인이 필요한 항목을 여기에 남깁니다. 사람이 승인하면 Claude가 해당 항목을 반영하고 이 목록에서 지웁니다.

| 날짜 | 항목 | 종류 | 근거·위치 |
|---|---|---|---|

종류: 기획 승인 / 디자인 승인 / 계획 승인 / 결과 승인 / 단계 완료 / 결정(ADR 채택, MVP 범위, 스택, 디자인) / PR 병합 / 배포 / 비용 발생 / 기타

## 결정 로그
사람이 확정한 결정만 적습니다. Claude의 제안은 "사람 확인 대기"에 둡니다.

| 날짜 | 결정 | 결정자 | 근거 문서 |
|---|---|---|---|
| 2026-11-27 | 위험 명령 훅 보완 승인: 입력 해석 실패 시 차단(fail-closed), .envrc 차단 유지, python3 3.9 이상 필요 | 프로젝트 오너 | .claude/hooks/block-dangerous.sh, .claude/hooks/test-block-dangerous.sh |
| 2026-11-27 | Everything Claude Code(ECC, affaan-m/ECC)는 설치하지 않고 참고만 한다. 쓸 만한 규칙·체크리스트는 기존 에이전트·기준 문서에 옮기는 방식 | 프로젝트 오너 | 이 대화 (이름 충돌, 자동 훅, 도구 중복, 전역 설치 문제) |
| 2026-11-27 | ECC 참고 반영안 7개 적용 승인: reviewer·qa·backend-dev·frontend-dev 보강, tech-stack.md 코드 크기·테스트 기준과 6장 보안 기준(수치는 `(제안)` 유지, 3단계에서 확정), 운영 항목(deploy.md 백업·복구 추가, architecture.md는 deploy.md 안내), CLAUDE.md 도구 사용 규칙 2개(auto 모드, 컨텍스트 80%) | 프로젝트 오너 | .claude/agents/, docs/engineering/tech-stack.md, docs/engineering/deploy.md, CLAUDE.md |
| 2026-11-27 | planner 수정 범위를 CLAUDE.md "문서 담당"에 맞춤: docs/planning/ 전체(requirements.md 원문 제외)와 specs/ | 프로젝트 오너 | .claude/agents/planner.md |
| 2026-11-27 | 전역 도구: diagram-design·humanizer 설치, ccusage는 `DO_NOT_TRACK=1`로 실행만, Context7은 사람이 나중에 직접(`npx ctx7 setup`), 전역 `~/.claude/CLAUDE.md` 작성 | 프로젝트 오너 | docs/guide/SETUP.md 1단계 |
| 2026-11-27 | 저장소 방식: 템플릿 폴더 자체를 저장소로 관리(GitHub `trustnloveu/claude-webapp-template`, 공개). 실제 프로젝트는 아이디어가 정해지면 복사본으로 만든다 | 프로젝트 오너 | docs/guide/SETUP.md 2단계 |
| 2026-11-27 | main 보호: 공개 저장소 유지, PR 필수(승인 수 0), 관리자 포함 적용, 강제 푸시·삭제 금지. CI 통과 조건은 CI를 만든 뒤 추가 | 프로젝트 오너 | GitHub 브랜치 보호 설정 |
| 2026-11-27 | 템플릿 저장소 기본 브랜치를 버전 브랜치 `release/v1`로 바꾸고 main은 삭제. 주 버전마다 `release/vN`, 작은 버전은 태그. 보호는 `release/*` 패턴 하나로(GitHub ruleset: main과 같은 PR 필수·관리자 포함·강제 푸시·삭제 금지, 훅·settings.json deny). 훅은 복사본용으로 main·master도 계속 보호. 전역 ~/.claude/CLAUDE.md 규칙도 "기본 브랜치(main 또는 release/*)"로 넓힘. 복사본 전략은 따로 설계(사람 확인 대기) | 프로젝트 오너 | .claude/hooks/block-dangerous.sh, .claude/settings.json, CLAUDE.md, README.md |
| 2026-11-27 | uv를 brew로 설치(PC 전역). Spec Kit v1.4.5를 템플릿에 설치하고 기획용 스킬(specify·clarify·checklist)만 쓴다. plan·tasks·analyze·constitution은 사람 지시 때만, implement·converge는 settings.json에서 차단 | 프로젝트 오너 | CLAUDE.md "구조"·"도구 사용", .claude/settings.json |
| 2026-11-27 | Trail-code 보류: 전역 훅 5개, 에이전트가 결정을 "학습"으로 자동 저장(결정 로그와 이중 기록), 템플릿에 코드 없음. 실제 프로젝트에 코드가 생긴 뒤 dry-run 확인 후 재검토 | 프로젝트 오너 | 이 PIPELINE "다음 할 일" |
| 2026-11-27 | UI UX Pro Max v2.15.0을 프로젝트 범위에 설치. `design-system/` 폴더를 만들지 않고, 스타일·색·글꼴 결정은 designer만, frontend-dev는 구현 점검에만 사용 | 프로젝트 오너 | CLAUDE.md "도구 사용" |
| 2026-11-27 | 템플릿 v1 완성 승인: 고도화 1·2차, 관리판 전환, SETUP 1~5단계 확인 완료(Trail-code 보류, DB·Sentry MCP는 복사본에서 나중에) | 프로젝트 오너 | 이 파일, PR #4~#6 |
| 2026-11-27 | 템플릿 저장소는 starter 원본이라 프로젝트 단계(0~5)를 진행하지 않는다. 이 파일을 "템플릿 관리판"으로 바꾸고(단계 목록·기능 표 제거, 복사본은 PIPELINE-template.md 사용), "0단계 완료 승인"은 "템플릿 v1 완성 승인"으로 대체 | 프로젝트 오너 | 이 파일, docs/PIPELINE-template.md |
| 2026-11-27 | 템플릿 고도화 2차 승인: 복사본은 GitHub 템플릿 저장소 기능(`gh repo create --template`)으로 만들고 `docs/PIPELINE-template.md`로 PIPELINE을 초기화(템플릿 저장소의 PIPELINE은 템플릿 자체 상태판으로 유지), SETUP.md를 실제 확인한 명령으로 갱신(3단계는 "템플릿에 포함, 확인만"), 사람용 안내서를 에이전트 9개 기준으로 수정 | 프로젝트 오너 | docs/PIPELINE-template.md, docs/guide/SETUP.md, docs/guide/roles.md, docs/guide/agents.md, README.md |
| 2026-11-27 | superpowers는 설치하지 않는다: 자동 스킬(brainstorming, writing-plans, TDD)이 /refine·/plan-work·planner와 겹침. 필요하면 새 결정으로 재검토 | 프로젝트 오너 | docs/guide/SETUP.md 1단계 |
| 2026-11-27 | 참조 리포트("클로드 코드 작업 프로세스 향상 가이드", 보리스 체르니 영상 요약) 기반 반영안 6개 적용 승인: R1 에이전트별 effort 기본값(planner·designer·qa·reviewer·security-auditor·appsec-engineer high, frontend-dev·backend-dev·a11y-auditor medium)과 /plan-work effort 칸, R2 외부 도구 관리 파일 Edit·Write deny(.specify/scripts·templates, speckit-*·ui-ux-pro-max 스킬), R3 CLAUDE.md "구조"·검증 목록 중복 정리(156→146줄), R4 총괄이 "수정 필요" 지적 근거 확인 후 재지시, R5 /refine 완료 조건을 판정 가능한 검사로·재량 칸, R6 세션 끝 스킬화 제안 | 프로젝트 오너 | CLAUDE.md, .claude/agents/, .claude/commands/, .claude/settings.json |
| 2026-11-27 | Homebrew 탭 `adoptopenjdk/openjdk` 삭제(사람이 `brew untap` 실행). 이 탭으로 설치한 패키지 없음, Java는 SDKMAN(Corretto 8·11·17)으로 관리하며 영향 없음 | 프로젝트 오너 | 확인 기록 |
| 2026-11-27 | `packages/shared` 생성 결과는 `packages/shared/generated/`에 두고 settings.json deny(Edit·Write)로 직접 수정을 막는다. deny는 Edit·Write 도구만 막으므로 Bash 생성 명령은 영향 없음 | 프로젝트 오너 | .claude/settings.json, packages/shared/README.md, CLAUDE.md "구조" |
| 2026-11-27 | 07~09 에이전트(Agency Agents)는 원문을 유지한다. 복사본에서 실제 호출 시 보고 형식 위반·범위 이탈이 보이면 축약을 재검토 | 프로젝트 오너 | .claude/agents/security-auditor.md, appsec-engineer.md, a11y-auditor.md |
| 2026-11-27 | 복사본 브랜치 전략: `feat/*` → `dev`(개발, 기본 브랜치, 병합 시 개발 서버 자동 배포) → `prd`(운영, 릴리스 PR 병합 시 수동 승인) + 태그 `vX.Y.Z`. 로컬은 브랜치를 두지 않고 내 PC에서 작업 브랜치를 실행하는 환경. 보호 대상에 `dev`·`prd` 추가(훅·settings.json deny·복사본 ruleset), main·master·release/*는 유지. 복사 직후 `release/v1`→`prd` 이름 변경, `dev` 생성·기본 브랜치 지정(SETUP.md 2단계) | 프로젝트 오너 | docs/guide/SETUP.md, docs/engineering/deploy.md, .claude/hooks/block-dangerous.sh, .claude/settings.json, CLAUDE.md "규칙" |
| 2026-11-27 | 시안 흐름: designer가 `docs/design/mockups/`에 HTML 시안(+ `tokens.css`)을 만들고 사람과 수정·재생성하며 결정. 결정되면 Playwright로 PNG로 바꿔 외부 채널에 업로드(공유·보관용). 다음 수정은 저장소 HTML에서 시작하고, 외부 채널은 사람이 직접 고쳤을 때만 다시 읽는다. 탐색용 시안 도구는 Stitch(기본·무료, 사람이 웹에서 사용), Figma는 선택(유료). 업로드 흐름은 복사본 2단계 첫 시안 때 시험. 반영은 `chore/012` | 프로젝트 오너 | 이 대화 |
| 2026-11-27 | Agency Agents 3개를 읽기 전용 에이전트로 추가: security-auditor(07), appsec-engineer(08), a11y-auditor(09). 원문 앞에 프로젝트 규칙 머리말, 역할 표·/plan-work 갱신, MIT 고지 | 프로젝트 오너 | .claude/agents/, CLAUDE.md, .claude/commands/plan-work.md, THIRD_PARTY_NOTICES.md |
| 2026-11-28 | 유튜브 영상 3편 반영안 A~F 적용 승인: A 제품 원칙(판단 기준) 칸과 CLAUDE.md 기준 1줄, B /refine 질문을 라운드 방식(Grill Me)으로 교체, C reviewer 문서 검토 모드(새 맥락 검토, Elephant-Goldfish)·문서 어긋남 기준을 기획 승인·ADR 채택 전에, D tech-stack.md 구현 순서(Ponytail), E Stop 훅으로 코드 변경 시 테스트 점검, F SETUP.md에 Claude Code Setup 안내. 플러그인은 하나도 설치하지 않고 방법만 옮김. Claude-Mem·FreeLLMAPI·21st.dev MCP·Archify·Marketing Skills·HyperFrames 제외 | 프로젝트 오너 | docs/requests/2026-11-28-video-methods.md |
| 2026-11-28 | 전역 Humanizer를 한국어판으로 교체: blader/humanizer 제거, epoko77-ai/im-not-ai(`humanize-korean` 2.4.8) 설치. 문서·주석을 영어로 쓸 일이 없어 인지도(6.8k, 영어판 74k)보다 언어 적합성 우선 | 프로젝트 오너 | docs/guide/SETUP.md 1단계, docs/engineering/tool-catalog.md |
| 2026-11-28 | 도구 재검토(GitHub 별·월평균 별·최근 활동) 반영 G·H·I 승인: G 도구 목록 `docs/engineering/tool-catalog.md` 신설(사용 중·후보·방법만 차용·보류·제외, 에이전트는 후보를 "도구 제안"으로 보고), H `/tool-review` 명령과 교체 기준(대안이 별·월평균 2배 이상, 최근 3개월 활동, 허용 라이선스, 위험이 크지 않음, 겹침 해결 가능), I qa 오류 분석 절차(재현→줄이기→가설→확인→위치). 재검토 결과 지금 구성(Spec Kit, UI UX Pro Max, Agency Agents, Playwright MCP, diagram-design)은 유지, Archify·Chrome DevTools MCP·공식 플러그인 등은 후보, superpowers·ECC는 제외 유지 | 프로젝트 오너 | docs/engineering/tool-catalog.md, .claude/commands/tool-review.md, .claude/agents/qa.md, CLAUDE.md |

## 확인 기록
사실 확인 결과를 남깁니다. 결정이 아닙니다.

| 날짜 | 확인 내용 | 결과 |
|---|---|---|
| 2026-11-27 | settings.json `ask` 규칙이 승인 창을 띄우는지 | 기본 권한 모드에서 `npm install --dry-run`으로 확인, 승인 창 뜸(사람 확인). auto 모드에서는 창 없이 실행됨 → 설치·배포가 있는 작업은 auto 모드를 쓰지 않는다 |
| 2026-11-27 | 설치된 도구 버전 | Claude Code CLI 2.1.332(2.1.104에서 업데이트), Homebrew 7.0.16(3.6.21에서 업데이트, macOS 27 미지원이라 필수), gh 2.106.0, pre-commit 4.7.0, gitleaks v8.30.1(pre-commit 훅), diagram-design 2.6.181, humanizer 4.0.0. 미설치: pnpm, uv, specify(3단계에서) |
| 2026-11-27 | `pre-commit autoupdate` 결과 | gitleaks를 v8.30.0으로만 올림. 최신 릴리스 v8.30.1은 직접 지정 → autoupdate 뒤 릴리스 페이지와 비교 필요 |
| 2026-11-27 | GitHub 무료 계정의 비공개 저장소 브랜치 보호 | 유료(Pro) 필요로 추정(미확인). 저장소를 공개로 두어 보호 적용 |
| 2026-11-27 | 위험 명령 훅이 `grep` 패턴 속 `.env` 글자도 차단 | 의도대로 동작(오탐이지만 안전한 쪽). 검사 명령에서 `.env` 글자를 빼고 실행 |
| 2026-11-27 | Spec Kit v1.4.5 빈 폴더 확인 | `--integration claude` 유효(예전 `--ai` 아님). 비대화형은 `--non-interactive --force` 필요. `.specify/`(constitution 포함)와 `.claude/skills/speckit-*` 9개 생성(`.claude/commands/` 아님). 스펙은 `specs/001-<이름>/spec.md`. /refine·/plan-work와 이름 겹침 없음. 훅·settings·CLAUDE.md를 건드리지 않고, git 브랜치는 git 확장이 없으면 만들지 않음 |
| 2026-11-27 | settings.json `Skill(...)` deny가 동작하는지 | `Skill(speckit-implement)` 호출 시 "blocked by permission rules"로 차단됨(이 세션에서 확인) |
| 2026-11-27 | 3단계 설치 도구 버전 | uv 0.13.10(brew, 다른 패키지 변경 없음), Spec Kit v1.4.5(uvx 일회 실행, 전역 설치 없음), UI UX Pro Max v2.15.0(gh skill, 70개 파일). UI UX Pro Max 스크립트는 표준 라이브러리만 쓰고 네트워크·셸 실행 없음(import 확인), 검색 동작 확인 |
| 2026-11-27 | Trail-code 0.30.5 설치 영향(README·소스 확인, 미설치) | 전역 `~/.claude/settings.json`에 훅 5개(SessionStart, UserPromptSubmit, PreToolUse Bash, PostToolUse, Stop)와 상태줄, 프로젝트 `.mcp.json`·`.claude/skills/trail/`·`.trail/`. npm postinstall이 익명 설치 통계 전송(`DO_NOT_TRACK=1`로 차단). `trail init`은 과거 세션을 Claude Sonnet으로 읽고(사용량 소모) 최근 병합 PR 50개 리뷰를 읽음. Bash 훅은 오류 시 통과(fail-open)라 block-dangerous.sh와 직접 충돌은 없어 보임(추정) |
| 2026-11-27 | 새 에이전트 07~09가 Agent 목록에 뜨는지 | 확인됨. 새 세션 Agent 목록에 security-auditor, appsec-engineer, a11y-auditor가 뜸. 스킬 목록에도 `speckit-*` 9개와 `ui-ux-pro-max`가 뜸 |
| 2026-11-27 | SETUP 4단계: MCP 연결 | Figma: `.mcp.json`의 HTTP `https://mcp.figma.com/mcp`(프로젝트 범위)로 연결, `whoami`로 인증 확인(파일 작업 없음). Playwright: `npx @playwright/mcp@latest`(0.0.86)로 연결, 설치된 Google Chrome을 써서 브라우저 추가 설치 불필요(about:blank로 확인). 실행 시 저장소에 `.playwright-mcp/`가 생겨 .gitignore에 추가. 터미널 CLI(`claude mcp list`)에서는 두 서버가 "승인 대기"로 나옴 → CLI로 쓸 때 처음 한 번 승인 필요. 켜 둔 MCP 5개: 프로젝트 2(playwright, figma) + claude.ai 커넥터 2(Claude Docs, Notion) + 앱 기본 1(scheduled-tasks), 전역 사용자 범위 0 → 기준(5~6) 안. DB·Sentry MCP는 추가 안 함 |
| 2026-11-27 | GitHub "Template repository" 설정 | 사람 승인 후 `gh repo edit --template`으로 켬. `gh repo view` 결과 isTemplate=true, 공개 유지 |
| 2026-11-27 | 템플릿 고도화 1차(R1~R6) 검증 | settings.json JSON 문법 통과, 훅 테스트 46/46 통과, `.specify/templates`·`.claude/skills/ui-ux-pro-max` Edit가 "denied by your permission settings"로 차단됨(이 세션). speckit-specify가 `.specify/feature.json`을 Write로 쓰므로 `.specify/` 전체가 아니라 scripts·templates만 막음 |
| 2026-11-27 | SETUP 5단계: 동작 확인 | 훅: 존재하지 않는 경로로 `.env` 읽기를 시도하자 "차단됨: .env 파일 접근"으로 막힘. gitleaks: 테스트 브랜치에서 무작위 가짜 GitHub 토큰을 커밋 시도 → `github-pat` 규칙으로 차단, 커밋 생기지 않음, 파일·테스트 브랜치 삭제. PIPELINE 요약: 새 세션에서 "현재 단계: 0. 환경"으로 요약함 |
| 2026-11-27 | 에이전트 머리말 `effort:`가 적용되는지 | 적용됨. 문서: https://code.claude.com/docs/en/sub-agents "Frontmatter reference"에 `effort` 필드(low·medium·high·xhigh·max, 세션 effort보다 우선, `CLAUDE_CODE_EFFORT_LEVEL` 환경변수가 있으면 그 값이 우선, 호출 때 effort를 지정하면 그 값이 우선). 관찰(CLI 2.1.332): effort 없이 reviewer를 읽기 작업으로 호출 → 서브에이전트 기록(`~/.claude/projects/<프로젝트>/<세션>/subagents/*.jsonl`)에 `"effort":"high"`, 같은 방식으로 부른 내장 web-fetch는 `"medium"`. 이 PC에는 effort 환경변수 없음 |
| 2026-11-27 | 기본 브랜치 `release/v1` 전환 결과 | `gh repo view`: 기본 브랜치 release/v1, isTemplate=true 유지. ruleset `release-branches`(대상 `refs/heads/release/*`, 예외 없음): `release/v1`에 deletion·non_fast_forward·pull_request(승인 0) 적용 확인. main은 보호 해제 후 삭제(사람이 직접 `git push origin --delete main`), `v1.0`·`chore/009` 브랜치 삭제. 훅·settings deny가 Claude의 `release/*` 푸시를 막아 `release/v1` 첫 푸시와 main 삭제는 사람이 터미널에서 실행. 전역 ~/.claude/CLAUDE.md 규칙 갱신. 이 기록의 PR이 release/v1 대상 첫 PR |
| 2026-11-27 | GitHub "병합 시 작업 브랜치 자동 삭제"(Automatically delete head branches) | 사람이 켬. PR 병합 후 작업 브랜치가 GitHub에서 자동 삭제됨(내 PC의 로컬 브랜치는 남음) |
| 2026-11-27 | Homebrew 탭 정리 | `brew untap adoptopenjdk/openjdk` 후 `brew tap` 결과 비어 있음. SDKMAN Java(`current` → 17.0.7-amzn)는 로그인 셸에서 정상 |
| 2026-11-27 | Figma 좌석·MCP 한도 | `whoami`: Starter 플랜, View 좌석, 팀 admin. 문서(https://developers.figma.com/docs/figma-mcp-server/rate-limits-access/): Starter·View·Collab은 읽기 도구 월 20회, 쓰기 도구(`generate_figma_design` 등)는 한도 제외지만 좌석·파일 권한은 그대로 적용(View에서 쓰기 가능 여부 미확인). Professional 이상 Full·Dev 좌석은 하루 200회 |
| 2026-11-27 | Google Stitch 무료 범위(검색, 공식 수치 미확인) | 월 약 350회(Standard) + 50~200회(Experimental). MCP(`stitch.googleapis.com`)는 Google Cloud 프로젝트·인증 필요, 사용량은 같은 한도에서 차감. 2026년 중 유료 플랜 예상, 무료 유지 보장 없음 |

| 2026-11-27 | 시안 흐름 변경(PR #12) 결과 | 사람이 병합(결과 승인). 남은 확인: PNG 내보내기 저장 위치·`file://` 접근·외부 업로드는 복사본 2단계 첫 시안 때 시험(PIPELINE-template 2단계) |
| 2026-11-27 | 공유용 온라인 문서 갱신 | 개발 파이프라인 가이드(시안 흐름 10곳, 브랜치 5곳, 흐름도 라벨, 변경 기록 1줄)와 Claude 개발 환경 설계안(시안 흐름 11곳, 브랜치 2곳)을 PR #11·#12 기준으로 문구만 수정. 두 문서의 에이전트 목록(6개, 실제 9개)은 기존 불일치로 남음 |
| 2026-11-27 | 시안 PNG 내보내기 시험(임시 폴더의 시험용 HTML) | `file://` 주소는 Playwright MCP가 차단("Access to file: protocol is blocked"). `python3 -m http.server`(127.0.0.1)로 열면 `tokens.css`까지 적용돼 표시됨. 스크린샷 저장은 저장소와 `.playwright-mcp/`만 허용(저장소 밖 경로 거부), 저장소 기준 상대 경로로 `docs/design/mockups/exports/`에 저장 확인. 시험 파일은 삭제. 외부 업로드는 미시험(복사본 2단계) → mockups/README.md 5번에 절차 반영 |
| 2026-11-28 | 에이전트 기본 컨텍스트 토큰(측정용 빈 호출의 첫 입력, 데스크톱 앱) | 변경 전: 메인 세션 약 80,800, designer 61,078·frontend-dev 60,356·backend-dev 60,417(`tools:` 없음, 앱 도구 41개 상속), planner 17,126, qa 15,219, reviewer 15,419, security-auditor 20,884, a11y-auditor 21,038, appsec-engineer 25,184. 서브에이전트에도 CLAUDE.md가 실림(9개 모두 "## 시크릿" 첫 문장 인용). Figma·Playwright MCP는 지연 로드라 기본에 안 실림, 큰 몫은 데스크톱 앱 도구 32개 |
| 2026-11-28 | E2 에이전트 `tools:` 지정 효과(chore/016) | 새 세션에서 재측정: designer 31,711(도구 14개), frontend-dev 30,544(11개), backend-dev 17,059(6개). 머리말에 이름으로 넣은 Playwright·Figma 도구는 지연 없이 바로 보임. Figma 읽기 도구 4개가 약 1.3만 토큰을 차지(추정, frontend-dev와 backend-dev 차이). 에이전트 정의는 세션 시작 때 읽혀서, 고친 세션 안에서는 재측정해도 바뀌지 않음 |
| 2026-11-28 | 사람용 안내서 가독성 보완(chore/015) Mermaid 렌더링 | README·SETUP·roles·operations·agents·request-guide·prompts/README에 넣은 Mermaid 10개를 mermaid 11.4.1로 렌더링해 모두 오류 없음(로컬 검사 페이지). GitHub 화면 확인은 PR에서. 옛 단계 번호(request-guide "5. 기능 루프" 등, 4-feature-loop "5-4~5-6", prompts/README "0~6단계")를 PIPELINE 0~5에 맞춤 |
| 2026-11-28 | PR #16 병합 순서 | 사람이 00:46에 PR #16을 병합한 뒤 추가 커밋이 같은 브랜치에 푸시돼 release/v1에 빠짐 → 새 브랜치 chore/018-tool-catalog로 옮겨 PR #17로 병합(01:11). 병합 후 작업 브랜치에 푸시하지 않고, 추가 작업은 새 브랜치로 한다. 다시 생긴 원격 chore/017 브랜치와 임시 worktree는 chore/019에서 정리 |
| 2026-11-28 | 영상 반영(chore/017) 검증 | Stop 훅 테스트 `test-check-tests-on-stop.sh` 13/13 통과(코드만 변경 시 멈춤, 같은 변경 두 번째·테스트 동반·자동 생성 파일·stop_hook_active·입력 오류·git 아님은 통과), 기존 `test-block-dangerous.sh` 64/64 통과, settings.json JSON 문법 통과, 이 저장소(코드 없음)에서 훅 실행 시 통과. 실제 세션에서 Stop 훅이 뜨는지는 병합 후 복사본에서 확인 필요 |
| 2026-11-27 | 공유용 온라인 문서 에이전트 수 | 두 문서의 에이전트 표기를 9개로 수정(가이드: 구성원 표에 07~09 행 추가, 소개·완료 조건·폴더 구조. 설계안: 표·목록·요약 6곳) |
