# 프롬프트 모음

> 대상: 사람

「AI 활용 기획·개발 실무 프롬프트 35선」을 이 저장소의 파이프라인(0~6단계)과 Claude Code 도구에 맞게 고친 것입니다.
원본의 ChatGPT(기획)·Codex(개발) 역할은 모두 Claude Code가 맡고, 결과는 대화가 아니라 저장소 파일로 남깁니다.

## 쓰는 법

0. 하고 싶은 일이 막연하면 먼저 `/refine <요청>`으로 구체화합니다. 요청을 직접 잘 쓰는 법은 [요청 작성 가이드](../request-guide.md)에 있습니다.
1. `docs/PIPELINE.md`에서 현재 단계를 확인합니다.
2. 해당 단계 파일에서 프롬프트를 골라 `[대괄호]`를 채워 붙여 넣습니다.
3. 모든 프롬프트 앞에는 [공통 원칙](common.md)이 `CLAUDE.md`를 통해 자동 적용됩니다. 따로 붙이지 않아도 됩니다.
4. 프롬프트마다 적힌 "저장 위치"에 결과가 저장됐는지 확인하고 커밋합니다.

## 단계별 목록

우선순위는 기획 → UI/UX → 구현입니다. 파일 번호는 docs/PIPELINE.md의 단계 번호와 같습니다.

| 파이프라인 단계 | 담당 | 파일 | 프롬프트 (원본 번호) |
|---|---|---|---|
| 1. 기획 (요구사항) | 01 기획 | [1-planning-requirements.md](1-planning-requirements.md) | 요구사항 분석(추가), 아이디어 구체화(①), 경쟁 분석(②), 페르소나(③) |
| 1. 기획 (정형화·고도화) | 01 기획 | [1-planning-spec.md](1-planning-spec.md) | PRD(④), 기능 명세(⑤), MVP 우선순위(⑥), 사용자 시나리오(⑧), 고도화·추적(추가) |
| 2. UI/UX | 02 디자인 | [2-uiux.md](2-uiux.md) | IA(⑦), 화면 목록·흐름(⑨), 화면 상세(추가), 디자인 컨셉(⑩), 디자인 시스템(⑫), Figma 화면(⑪), 시안 검증(추가) |
| 3. 구현 준비 | 총괄, 04 백엔드 | [3-build-setup.md](3-build-setup.md) | 기술 스택(⑬), 구조·패턴(추가), 아키텍처(⑭), DB(⑮), API 명세(⑯), 초기 세팅(⑰), 코드 구조(⑱) |
| 4. 기능 구현 루프 | 03·04, 검증 05·06·02·01 | [4-feature-loop.md](4-feature-loop.md) | Figma→코드(⑲), 프론트엔드(⑳), 백엔드 API(㉑), AI 기능(㉒), 디자인 검수(㉔) |
| 5. 출시·운영 | 총괄, 05·06 | [5-release.md](5-release.md) | 전체 테스트(㉓), 코드 리뷰(㉕), 배포(㉖), 보안(㉗), 성능(㉘), 모니터링(㉙), 고도화(㉚) |
| 모든 단계 | 총괄 | [request-guide.md](../request-guide.md), `/refine`, `/plan-work` | 요청 정리, 단계 판정 |
| 공통 | — | [common.md](common.md) | 질문 우선(㉛), 계획 먼저(㉜), 기존 코드 보호(㉝), 자체 검증(㉞), 문서 갱신(㉟) |

## 가장 자주 쓰는 10개

| 순서 | 프롬프트 | 결과물 | 저장 위치 |
|---:|---|---|---|
| 1 | 요구사항 분석 → 아이디어 구체화 | 요구사항 분석서, 기획안 | `docs/planning/requirements.md`, `docs/planning/idea.md` |
| 2 | PRD | 요구사항 정의 | `specs/001-mvp/` |
| 3 | MVP 우선순위 | Must 기능 목록 | `specs/001-mvp/` |
| 4 | IA | 메뉴 구조 | `docs/design/ux.md` |
| 5 | 화면 목록·상세 | 화면 설계서 | `docs/design/ux.md` |
| 6 | Figma 화면 | UI 디자인 | Figma |
| 7 | 아키텍처 | 시스템 구조도 | `docs/engineering/architecture.md` |
| 8 | DB 설계 | ERD, 스키마 | `docs/engineering/database.md` |
| 9 | Figma→코드 | 화면 구현 | `apps/web` |
| 10 | 전체 테스트 | 테스트 보고서 | `docs/reports/` |
