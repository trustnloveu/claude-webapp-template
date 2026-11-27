# Pipeline 상태

> 대상: 공용

현재 단계: 0. 환경
다음 할 일: SETUP.md 1·2단계 완료(2026-11-27). 다음은 SETUP.md 3단계(프로젝트 도구: Spec Kit 확인부터), 4단계(MCP), 5단계(동작 확인). 템플릿 고도화는 별도 세션에서 브랜치·PR로 진행

## 사람 확인 대기
Claude가 사람의 승인이 필요한 항목을 여기에 남깁니다. 사람이 승인하면 Claude가 해당 항목을 반영하고 이 목록에서 지웁니다.

| 날짜 | 항목 | 종류 | 근거·위치 |
|---|---|---|---|
| 2026-11-27 | SETUP.md(사람용) 명령 갱신 제안: humanizer 설치 줄(`/plugin install humanizer@humanizer`, Claude Code 2.1.142 이상) 추가, Context7을 `npx ctx7 setup`(로그인·API 키)으로 변경, pre-commit 설치를 macOS `brew install pre-commit`으로, 2단계를 "템플릿 저장소 / 프로젝트 복사본" 구분과 PR 흐름에 맞게 정리 | 기타 | docs/guide/SETUP.md |
| 2026-11-27 | superpowers 설치 여부: 자동 스킬(brainstorming, writing-plans, TDD)이 /refine·/plan-work·planner와 겹쳐 보류. 템플릿 고도화 때 검토 | 결정 | docs/guide/SETUP.md 1단계 |

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

## 확인 기록
사실 확인 결과를 남깁니다. 결정이 아닙니다.

| 날짜 | 확인 내용 | 결과 |
|---|---|---|
| 2026-11-27 | settings.json `ask` 규칙이 승인 창을 띄우는지 | 기본 권한 모드에서 `npm install --dry-run`으로 확인, 승인 창 뜸(사람 확인). auto 모드에서는 창 없이 실행됨 → 설치·배포가 있는 작업은 auto 모드를 쓰지 않는다 |
| 2026-11-27 | 설치된 도구 버전 | Claude Code CLI 2.1.332(2.1.104에서 업데이트), Homebrew 7.0.16(3.6.21에서 업데이트, macOS 27 미지원이라 필수), gh 2.106.0, pre-commit 4.7.0, gitleaks v8.30.1(pre-commit 훅), diagram-design 2.6.181, humanizer 4.0.0. 미설치: pnpm, uv, specify(3단계에서) |
| 2026-11-27 | `pre-commit autoupdate` 결과 | gitleaks를 v8.30.0으로만 올림. 최신 릴리스 v8.30.1은 직접 지정 → autoupdate 뒤 릴리스 페이지와 비교 필요 |
| 2026-11-27 | GitHub 무료 계정의 비공개 저장소 브랜치 보호 | 유료(Pro) 필요로 추정(미확인). 저장소를 공개로 두어 보호 적용 |
| 2026-11-27 | 위험 명령 훅이 `grep` 패턴 속 `.env` 글자도 차단 | 의도대로 동작(오탐이지만 안전한 쪽). 검사 명령에서 `.env` 글자를 빼고 실행 |

