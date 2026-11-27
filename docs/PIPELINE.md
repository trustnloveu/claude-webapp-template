# Pipeline 상태

> 대상: 공용

현재 단계: 0. 환경
다음 할 일: 템플릿 고도화 1차(PR #4, 병합됨)와 2차(PR chore/005-template-copy-guide: 복사본용 PIPELINE-template.md, SETUP.md 명령 갱신, 안내서 에이전트 9개, superpowers 미설치 확정)를 마쳤다. 2차 PR 병합 후(Template repository 설정은 켬), 사람이 "0단계 완료"를 승인하고 1단계(기획: 아이디어·요구사항 원문)로 넘어간다. 실제 프로젝트는 SETUP.md 2단계의 `gh repo create --template`으로 복사본을 만든다. DB MCP는 백엔드 작업 시작 때, Sentry MCP는 배포 후 추가. Trail-code는 복사본에 코드 뼈대가 생긴 뒤(3단계 이후) `DO_NOT_TRACK=1`과 `trail init --dry-run`부터

## 사람 확인 대기
Claude가 사람의 승인이 필요한 항목을 여기에 남깁니다. 사람이 승인하면 Claude가 해당 항목을 반영하고 이 목록에서 지웁니다.

| 날짜 | 항목 | 종류 | 근거·위치 |
|---|---|---|---|
| 2026-11-27 | Homebrew 경고: 신뢰하지 않은 탭 `adoptopenjdk/openjdk`가 무시되고 있음. `brew untap adoptopenjdk/openjdk`로 지울지 결정 필요(사람 PC 설정) | 기타 | `brew install uv` 출력 |
| 2026-11-27 | 0단계 완료 승인(템플릿 고도화 후): SETUP.md 1~5단계 확인 끝(Trail-code 보류, DB·Sentry MCP는 나중). 한 번 승인했으나 고도화를 0단계 안에서 하기로 하고 사람 지시로 되돌림. 고도화가 끝나면 다시 승인받아 "단계"의 0을 체크하고 "현재 단계"를 1. 기획으로 바꾼다 | 단계 완료 | 이 파일 "확인 기록" 2026-11-27 4·5단계 줄 |
| 2026-11-27 | 에이전트 머리말 `effort:`가 실제로 적용되는지 확인: Claude Code Agent 도구 설명(에이전트 정의 frontmatter에서 effort를 읽음)을 근거로 넣었고, CLI로는 확인 방법을 찾지 못함(추정). 병합 후 새 세션에서 확인, 안 되면 값을 빼거나 /plan-work 지정 방식만 쓴다 | 기타 | .claude/agents/*.md |
| 2026-11-27 | `packages/shared` 직접 수정 금지를 settings.json deny로 강제할지: 생성 파일 위치가 3단계에서 정해지므로 이번엔 넣지 않음(README.md는 사람이 채울 칸이 있어 폴더 전체 deny는 부적합). 3단계에서 생성 폴더가 정해지면 추가 제안 | 결정 | CLAUDE.md "구조", .claude/settings.json |
| 2026-11-27 | 07~09 에이전트(Agency Agents 원문 234~567줄) 축약 여부: 긴 지시문이 판단을 방해할 수 있다는 참조 리포트 의견. 호출될 때만 읽히고 외부 원문이라 보류 후보 | 결정 | .claude/agents/security-auditor.md, a11y-auditor.md, appsec-engineer.md |
| 2026-11-27 | Figma 좌석이 "View"(starter 팀): 읽기는 되지만 Figma 파일 편집·MCP 쓰기 도구는 제한될 수 있음(추정). 2단계 시안을 Figma에서 직접 만들려면 편집 가능 좌석이 필요한지 확인 | 기타 | `mcp__figma__whoami` 결과 |

종류: 기획 승인 / 디자인 승인 / 계획 승인 / 결과 승인 / 단계 완료 / 결정(ADR 채택, MVP 범위, 스택, 디자인) / PR 병합 / 배포 / 비용 발생 / 기타

## 단계
단계 체크와 "현재 단계" 변경은 사람이 승인한 뒤에만 합니다.

- [ ] 0. 환경 → 이 저장소, CLAUDE.md, 훅 (docs/guide/SETUP.md)
- [ ] 1. 기획: 요구사항 분석 → 질문 → 정형화 → 고도화 → **기획 승인** — docs/planning/requirements.md, docs/planning/idea.md, specs/ (1-planning-requirements.md, 1-planning-spec.md)
- [ ] 2. UI/UX: UX 설계 → UI 정형화 → Figma 시안 → 고도화 → **디자인 승인** — docs/design/ux.md, docs/design/README.md, Figma (2-uiux.md)
- [ ] 3. 구현 준비: 기술 스택·구조(ADR), 아키텍처, API 계약, DB, 뼈대 → 스테이징 URL — docs/engineering/tech-stack.md, docs/engineering/architecture.md, OpenAPI, docs/engineering/database.md (3-build-setup.md)
- [ ] 4. 기능 구현 루프 (4-feature-loop.md)
- [ ] 5. 출시 → 테스트·보안 보고서(docs/reports), 운영 URL, 모니터링, 릴리스 노트 (5-release.md)

## 기능 구현 루프
기능마다 기획 확인 → 디자인 확인 → 계획 → 구현 → 검증 순서로 진행합니다. 확인 칸이 "필요"면 해당 단계(1 또는 2)를 먼저 거칩니다.
승인 칸(기획·디자인·계획·결과)과 병합 칸은 사람이 승인한 뒤에만 채웁니다.

| 기능 ID | 기획 확인 | 디자인 확인 | 계획 승인 | 백엔드 | 프론트 | 검증(qa·리뷰·디자인·기획) | 결과 승인 | PR·병합 |
|---|---|---|---|---|---|---|---|---|

확인 칸 값: 승인됨 / 필요 / 해당 없음

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
| 2026-11-27 | uv를 brew로 설치(PC 전역). Spec Kit v1.4.5를 템플릿에 설치하고 기획용 스킬(specify·clarify·checklist)만 쓴다. plan·tasks·analyze·constitution은 사람 지시 때만, implement·converge는 settings.json에서 차단 | 프로젝트 오너 | CLAUDE.md "구조"·"도구 사용", .claude/settings.json |
| 2026-11-27 | Trail-code 보류: 전역 훅 5개, 에이전트가 결정을 "학습"으로 자동 저장(결정 로그와 이중 기록), 템플릿에 코드 없음. 실제 프로젝트에 코드가 생긴 뒤 dry-run 확인 후 재검토 | 프로젝트 오너 | 이 PIPELINE "다음 할 일" |
| 2026-11-27 | UI UX Pro Max v2.15.0을 프로젝트 범위에 설치. `design-system/` 폴더를 만들지 않고, 스타일·색·글꼴 결정은 designer만, frontend-dev는 구현 점검에만 사용 | 프로젝트 오너 | CLAUDE.md "도구 사용" |
| 2026-11-27 | 템플릿 고도화 2차 승인: 복사본은 GitHub 템플릿 저장소 기능(`gh repo create --template`)으로 만들고 `docs/PIPELINE-template.md`로 PIPELINE을 초기화(템플릿 저장소의 PIPELINE은 템플릿 자체 상태판으로 유지), SETUP.md를 실제 확인한 명령으로 갱신(3단계는 "템플릿에 포함, 확인만"), 사람용 안내서를 에이전트 9개 기준으로 수정 | 프로젝트 오너 | docs/PIPELINE-template.md, docs/guide/SETUP.md, docs/guide/roles.md, docs/guide/agents.md, README.md |
| 2026-11-27 | superpowers는 설치하지 않는다: 자동 스킬(brainstorming, writing-plans, TDD)이 /refine·/plan-work·planner와 겹침. 필요하면 새 결정으로 재검토 | 프로젝트 오너 | docs/guide/SETUP.md 1단계 |
| 2026-11-27 | 참조 리포트("클로드 코드 작업 프로세스 향상 가이드", 보리스 체르니 영상 요약) 기반 반영안 6개 적용 승인: R1 에이전트별 effort 기본값(planner·designer·qa·reviewer·security-auditor·appsec-engineer high, frontend-dev·backend-dev·a11y-auditor medium)과 /plan-work effort 칸, R2 외부 도구 관리 파일 Edit·Write deny(.specify/scripts·templates, speckit-*·ui-ux-pro-max 스킬), R3 CLAUDE.md "구조"·검증 목록 중복 정리(156→146줄), R4 총괄이 "수정 필요" 지적 근거 확인 후 재지시, R5 /refine 완료 조건을 판정 가능한 검사로·재량 칸, R6 세션 끝 스킬화 제안 | 프로젝트 오너 | CLAUDE.md, .claude/agents/, .claude/commands/, .claude/settings.json |
| 2026-11-27 | Agency Agents 3개를 읽기 전용 에이전트로 추가: security-auditor(07), appsec-engineer(08), a11y-auditor(09). 원문 앞에 프로젝트 규칙 머리말, 역할 표·/plan-work 갱신, MIT 고지 | 프로젝트 오너 | .claude/agents/, CLAUDE.md, .claude/commands/plan-work.md, THIRD_PARTY_NOTICES.md |

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

