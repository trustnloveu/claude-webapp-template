# 문서 안내

> 대상: 공용

이 프로젝트의 모든 기준 문서가 `docs/`에 있습니다. 처음 참여했다면 이 페이지부터 읽습니다.
작업 순서와 같은 순서로 폴더를 나눴습니다: **기획 → UI/UX 디자인 → 기술(구현)**.

## 처음 참여했다면 (30분 읽기 순서)

1. [../README.md](../README.md) — 프로젝트 한 줄 소개, 로컬 실행
2. [guide/roles.md](guide/roles.md) — 누가 무엇을 맡는지, 일이 어떤 순서로 흐르는지
3. [PIPELINE.md](PIPELINE.md) — 지금 어느 단계인지, 무엇이 승인 대기 중인지
4. [planning/requirements.md](planning/requirements.md) → [../specs/](../specs/README.md) — 무엇을 왜 만드는지 (스펙은 Spec Kit 기본 위치인 저장소 루트 `specs/`에 있음)
5. [design/ux.md](design/ux.md) → [design/README.md](design/README.md) — 어떤 화면이 어떻게 보이는지
6. [engineering/tech-stack.md](engineering/tech-stack.md) → [engineering/architecture.md](engineering/architecture.md) — 무엇으로 어떤 구조로 만드는지
7. [../CLAUDE.md](../CLAUDE.md) — 프로젝트 규칙 전체(AI가 따르는 기준이지만 사람에게도 유효)

## 폴더 구조

```text
docs/
├─ README.md              이 문서 (문서 지도)
│                          ※ 기능별 스펙은 docs 밖 저장소 루트 specs/ (Spec Kit 기본 위치)
│                          ※ Spec Kit 설정은 루트 .specify/, 스킬은 .claude/skills/speckit-* (Spec Kit이 관리)
├─ PIPELINE.md            진행 상태판: 현재 단계, 사람 확인 대기, 기능 표, 결정 로그
│
├─ planning/              ① 기획 — 무엇을, 왜, 누구를 위해          담당: 01 기획
│  ├─ requirements.md        요구사항 원문 · 분석 · 질문과 답 · 추적표 · 고도화 제안
│  ├─ idea.md                서비스 한 문장, 문제, 사용자, 차별화, 성공 기준
│  └─ spec-guide.md          스펙 작성 기준 (스펙 자체는 루트 specs/)
│
├─ design/                ② UI/UX — 어떤 화면에서 어떻게 보이나     담당: 02 디자인
│  ├─ ux.md                  IA · 화면 목록 · 화면 흐름 · 화면 상세
│  └─ README.md              디자인 컨셉 · 화면별 시안 상태 · 토큰 · 컴포넌트 상태 · Figma 링크
│
├─ engineering/           ③ 기술 — 무엇으로, 어떤 구조로             담당: 총괄, 04 백엔드
│  ├─ tech-stack.md          스택 · 도구 · 폴더 구조 · 패턴 · 코드 크기 기준 · 라이브러리 · 보안 기준 (단일 기준)
│  ├─ architecture.md        시스템 구성 · 인증 · 외부 연동 · 환경
│  ├─ database.md            ERD · 테이블 · 인덱스
│  └─ deploy.md              환경 · 환경 변수 이름 · 롤백 · 백업·복구 · 모니터링
│
├─ decisions/             결정 기록(ADR) — 왜 그렇게 정했나          ADR-000-template.md
├─ requests/              기능 단위 요청서                          README=양식
├─ reports/               테스트·보안 점검 보고서                    test-report-template.md
│
└─ guide/                 사람용 안내서 (AI는 지시로 따르지 않음)
   ├─ roles.md               구성원과 작업 흐름
   ├─ SETUP.md               환경 설치 순서
   ├─ request-guide.md       요청 작성법
   ├─ operations.md          사람이 챙길 일, 결정 목록
   ├─ agents.md              에이전트 관리
   └─ prompts/               단계별 프롬프트 (파일 번호 = 파이프라인 단계)
```

## 질문별로 찾기

| 알고 싶은 것 | 문서 |
|---|---|
| 지금 무슨 작업을 하고 있나, 무엇이 막혀 있나 | [PIPELINE.md](PIPELINE.md) |
| 이 기능은 왜 필요하고 누가 요청했나 | [planning/requirements.md](planning/requirements.md) (원문·추적표) |
| 이 기능이 정확히 무엇을 해야 하나 (완료 기준) | 루트 [specs/](../specs/README.md)의 기능 명세와 인수 기준 |
| 이 화면은 어떤 상태와 동작을 가져야 하나 | [design/ux.md](design/ux.md)의 화면 상세 |
| 색·간격·컴포넌트는 무엇을 써야 하나 | [design/README.md](design/README.md)의 토큰 |
| 어떤 언어·라이브러리·폴더 구조를 써야 하나 | [engineering/tech-stack.md](engineering/tech-stack.md) |
| 함수·파일 크기, 커버리지, 보안 규칙은 | [engineering/tech-stack.md](engineering/tech-stack.md)의 "코드 크기와 테스트 기준", "보안 기준" |
| DB 백업과 복구는 어떻게 하나 | [engineering/deploy.md](engineering/deploy.md)의 "백업·복구" |
| API 응답 형식, 에러 코드 | `apps/api/CLAUDE.md`, OpenAPI 파일 |
| 테이블 구조 | [engineering/database.md](engineering/database.md), 마이그레이션 파일 |
| 왜 이 기술(설계)을 골랐나 | [decisions/](decisions/) |
| 배포는 어떻게, 환경 변수는 무엇이 필요한가 | [engineering/deploy.md](engineering/deploy.md), `.env.example` |
| 누가 이 문서를 고칠 수 있나 | [../CLAUDE.md](../CLAUDE.md)의 "문서 담당" |

## 용어

| 용어 | 뜻 |
|---|---|
| R-001 | 요구사항 번호 (planning/requirements.md) |
| F-001 | 기능 ID (스펙의 기능 명세) |
| S-001 | 화면 ID (design/ux.md) |
| MoSCoW | 기능 우선순위: Must / Should / Could / Won't |
| 인수 기준 | 기능이 완료됐다고 판단하는 조건 (Given–When–Then) |
| ADR | Architecture Decision Record, 결정과 이유를 남기는 문서 |
| 4개 승인 | 기획 승인 · 디자인 승인 · 계획 승인 · 결과 승인 (모두 사람이 함) |
| (사람 결정) / (제안) | 사람이 확정해야 하는 칸 / Claude가 쓴 초안 |
| 총괄 | Claude Code 메인 세션. 요청을 받아 에이전트에게 나눠 주는 역할 |

## 문서 규칙

- 각 문서 상단의 `> 대상:`은 누가 읽는 문서인지, `> 작성:`은 누가 고치는 문서인지를 뜻합니다.
- 기준 문서마다 작성 담당은 하나입니다. 다른 사람(에이전트)은 직접 고치지 않고 변경을 제안합니다.
- 템플릿 파일(`*-template.md`)은 복사해서 씁니다. 원본은 고치지 않습니다.
