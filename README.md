# <프로젝트 이름>

> 대상: 사람

<한 문장 설명: 우리는 <대상>이 <문제>를 <방법>으로 해결하게 돕는다>

## 처음 시작한다면

0. 처음 참여했다면 [docs/README.md](docs/README.md)의 "읽는 순서"부터 봅니다.
1. [docs/guide/SETUP.md](docs/guide/SETUP.md)로 환경을 준비합니다.
2. [docs/guide/prompts/](docs/guide/prompts/README.md)에서 현재 단계의 프롬프트를 고릅니다.
3. 요청이 막연하면 `/refine <요청>`을 쓰거나 [요청 작성 가이드](docs/guide/request-guide.md)를 봅니다.
4. 구성원(총괄 + 에이전트 9개)과 진행 흐름은 [프로젝트 구성원](docs/guide/roles.md)에 있습니다. 우선순위는 **기획 → UI/UX 디자인 → 구현**입니다.
5. 내가 결정하고 챙길 일은 [운영 체크리스트](docs/guide/operations.md)에 있습니다. `docs/PIPELINE.md`의 "사람 확인 대기"를 자주 확인합니다.

## 구조

| 경로 | 내용 |
|---|---|
| `apps/web` | 프론트엔드 |
| `apps/api` | 백엔드 |
| `packages/shared` | API 타입(OpenAPI에서 생성) |
| `docs/` | 모든 기준 문서. **[docs/README.md](docs/README.md)가 문서 지도**입니다 |
| `docs/planning/` | 기획: 요구사항, 아이디어, 스펙 작성 기준 |
| `specs/` | 기능별 스펙 (Spec Kit 기본 위치) |
| `docs/design/` | UI/UX: 화면 설계, 디자인 시스템 |
| `docs/engineering/` | 기술: 스택, 아키텍처, DB, 배포 |
| `docs/guide/` | 사람용 안내서: 설치, 역할, 단계별 프롬프트, 요청 작성 가이드, 운영 체크리스트, 에이전트 관리 |

## 파일 읽는 대상

파일마다 제목 아래에 `> 대상:` 표시가 있습니다.

| 대상 | 파일 | 누가 쓰고 누가 읽나 | 사람이 직접 고쳐도 되나 |
|---|---|---|---|
| **AI** | `CLAUDE.md`, `apps/*/CLAUDE.md`, `.claude/`(설정·훅·명령), `.mcp.json` | 사람이 쓰고 Claude가 매 세션 자동으로 읽는 지시문 | 됨. 규칙을 바꿀 때만 고치고, 고친 뒤 새 세션에서 확인 |
| **공용** | `docs/PIPELINE.md`, `docs/planning/idea.md`, `specs/`, `docs/design/`, `docs/engineering/tech-stack.md`, `docs/decisions/`, `docs/engineering/architecture.md`, `docs/engineering/database.md`, `docs/engineering/deploy.md`, `docs/reports/`, `docs/requests/` | 사람이 결정하고 Claude가 작성하는 프로젝트의 기준 문서 | 됨. 결정은 사람이, 정리는 Claude가 |
| **사람** | `README.md`, `docs/guide/`, `.github/` 템플릿 | 사람이 읽고 복사해 쓰는 안내서. Claude는 지시로 따르지 않음 | 됨. 자유롭게 |

Claude가 사람용 안내서의 내용을 따르게 하려면 내용을 붙여 넣거나 "docs/guide/…대로 해"라고 직접 가리킵니다.

## 로컬 실행

<3단계 설계 후 채움>

## 진행 상황

[docs/PIPELINE.md](docs/PIPELINE.md)

## 사람과 Claude의 역할

| | 사람 | Claude |
|---|---|---|
| 요청 | 요구사항을 제시한다 | 원문을 기록하고 어느 단계부터 필요한지 판정한다(`/refine`, `/plan-work`) |
| 기획 | 질문에 답하고 **기획 승인** | 01 기획이 분석·정형화·고도화한다 |
| UI/UX | 시안을 보고 의견을 주고 결정한 뒤 **디자인 승인** (Stitch 탐색은 선택) | 02 디자인이 IA·화면·디자인 시스템을 설계하고 HTML 시안을 만들고 고친다 |
| 계획 | **계획 승인** | 총괄이 구현 작업을 나누고 배정한다 |
| 구현·검증 | 지켜본다 | 03·04가 만들고 05·06·02·01(+ 해당 시 07~09)이 동시에 검증한다 |
| 결과 | **결과 승인**, 병합한다 | 검증 결과를 하나로 합쳐 보고한다 |
| 결정 | 확정한다(단계 완료, MVP, 스택, 디자인, 병합, 배포) | 선택지와 근거를 제안하고 "사람 확인 대기"에 남긴다 |
| 작업 | 승인 요청에 답한다 | 계획을 보여 주고, 승인 후 작업하고, 검증 결과를 보고한다 |
| 기록 | 결정 로그·ADR 채택을 승인한다 | 문서를 갱신하고 제안에는 `(제안)`을 붙인다 |
| 시크릿 | 값을 직접 넣는다 | 변수 이름만 다룬다 |

기술적으로 막혀 있는 것: `.env` 읽기, 강제 푸시, 보호 브랜치(dev, prd, main, release/*) 푸시, 보호 브랜치에서 커밋, 위험한 삭제 명령(차단). PR 병합, 릴리스 태그, 패키지 설치, 배포 명령(실행 전 승인 요청).
