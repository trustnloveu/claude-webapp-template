# 서브에이전트 관리

> 대상: 사람

에이전트는 9개입니다. 구성원 정보는 [프로젝트 구성원](roles.md)을 봅니다.

| 번호 | 이름 | 역할 | 쓰기 권한 | effort 기본값 |
|---|---|---|---|---|
| 01 | `planner` | 기획 | 기획 문서 | high |
| 02 | `designer` | 디자인 | 디자인 문서 | high |
| 03 | `frontend-dev` | 프론트엔드 구현 | apps/web | medium |
| 04 | `backend-dev` | 백엔드 구현 | apps/api 등 | medium |
| 05 | `qa` | 동작 테스트 | 없음 | high |
| 06 | `reviewer` | 코드 리뷰 | 없음 | high |
| 07 | `security-auditor` | AI 코드 보안 | 없음 | high |
| 08 | `appsec-engineer` | 위협 모델링·보안 심층 검토 | 없음 | high |
| 09 | `a11y-auditor` | 접근성 | 없음 | medium |

- effort는 에이전트가 생각에 쓰는 노력 수준입니다(low·medium·high·xhigh·max). 에이전트 파일 머리말의 `effort:`가 기본값이고, 작업마다 바꿀 때는 총괄이 계획서에 적어 승인받습니다.
- 07~09는 Agency Agents(MIT) 원문 앞에 프로젝트 규칙 머리말을 붙인 것입니다. 출처는 `THIRD_PARTY_NOTICES.md`에 있습니다.

## 에이전트를 추가하거나 뺄 때

`.claude/agents/`는 Claude Code가 서브에이전트 정의를 읽는 곳이라, 에이전트 파일 외에는 넣지 않습니다. 에이전트를 바꾸면 아래를 함께 고칩니다.

- `CLAUDE.md`의 역할 표(와 필요하면 단계 표)
- `.claude/commands/plan-work.md`의 배정 기준과 규모별 검증 표, effort 기본값
- 이 문서와 [프로젝트 구성원](roles.md), `README.md`
- 외부 파일이면 `THIRD_PARTY_NOTICES.md`

외부 에이전트(Agency Agents 등)는 이렇게 넣습니다.

- 설치 스크립트를 쓰지 않습니다(전역 `~/.claude/agents/`에 복사함). 필요한 파일만 골라 `.claude/agents/`에 복사합니다.
- 복사 전에 파일 내용을 읽습니다(지시문이므로).
- 원문 앞에 프로젝트 규칙 머리말(역할, 수정 권한, 보고 형식)을 붙이고, 읽기 전용이면 `tools`를 읽기 도구로 제한합니다.
- 한 달 동안 쓰지 않은 에이전트는 지웁니다.
