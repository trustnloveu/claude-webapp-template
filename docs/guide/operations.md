# 운영 체크리스트

> 대상: 사람

Claude가 아니라 사람이 직접 챙기는 일입니다.

## 정기 점검
- [ ] 매주: ccusage로 토큰 사용량과 비용 확인
- [ ] 매주: `docs/PIPELINE.md`의 "사람 확인 대기"를 비우기(승인 또는 반려)
- [ ] 매월: 설치된 스킬·에이전트·MCP 목록을 검토하고 쓰지 않는 것 제거
- [ ] 매월: `.claude/settings.json`의 승인 요청(ask)·차단(deny) 목록이 지금 쓰는 도구와 맞는지 확인

## 내가 결정하는 것
Claude는 아래 항목을 제안만 하고, 확정은 내가 합니다.

| 항목 | 확정하는 곳 |
|---|---|
| 기획 승인 | 스펙·인수 기준·MoSCoW 확정 (`specs/`, `requirements.md`) |
| 디자인 승인 | 화면 상세 확정, 화면별 디자인 상태 "승인" (`docs/design/`) |
| 계획 승인 | `/plan-work`가 보여 준 계획서 |
| 결과 승인 | 총괄(메인 세션)의 통합 보고(QA·리뷰·디자인 검증 포함) |
| 단계 완료, 다음 단계로 이동 | `docs/PIPELINE.md` 단계 체크 |
| MVP 범위(MoSCoW 최종) | 스펙 |
| 기술 스택, 주요 구조, 라이브러리 추가 | ADR "채택", `docs/engineering/tech-stack.md` |
| 디자인 승인 | Figma, `docs/design/README.md` 화면별 디자인 상태 |
| PR 병합 | GitHub (앱이 승인 요청을 띄움) |
| 배포, 릴리스 태그 | 배포처 (앱이 승인 요청을 띄움) |
| 비용이 드는 서비스 가입, 시크릿 값 입력 | 각 서비스에서 직접 |
| 새 패키지·스킬·MCP 설치 | 앱의 승인 요청 |

## 팀 전환 시
- [ ] main 브랜치 보호와 리뷰 필수 설정
- [ ] `.github/CODEOWNERS`의 담당자를 채우고 주석 해제
- [ ] 이슈 트래커(Linear 또는 Jira) MCP 연결
- [ ] 새 팀원 온보딩: `CLAUDE.md`, `docs/`, Trail-code 지도, `docs/guide/SETUP.md`
- [ ] 개인 설정(`settings.local.json`, `CLAUDE.local.md`)과 공유 설정(`.claude/settings.json`, `.mcp.json`)의 구분을 팀에 공유
- [ ] "내가 결정하는 것" 표의 결정자를 역할별로 다시 정하기

## 공유용 온라인 문서
템플릿의 내용을 사람이 읽기 쉽게 정리한 공유용 문서입니다. Claude는 작업 중에 이 문서를 읽지 않고, 기준은 항상 템플릿(`CLAUDE.md`, `docs/`)입니다.

| 문서 | 내용 | 템플릿에서 대응하는 파일 |
|---|---|---|
| [개발 파이프라인 가이드](https://claude.ai/artifact/4rGUU5FmRfnSRoaZV3EYJg) | 구성원, 단계와 승인, 단계별 카드, 흐름도 | `CLAUDE.md`, `docs/guide/roles.md`, `docs/PIPELINE.md` |
| [Claude 개발 환경 설계안](https://claude.ai/artifact/HuCLZRACz2x5P5B3dBxrKR) | 도구 선택 이유, 설치 범위, 저장소 구조 | `docs/guide/SETUP.md`, `docs/README.md` |

- [ ] 구성원, 단계, 승인, 문서 구조처럼 **큰 변경**이 있으면 위 문서도 함께 갱신한다. 작은 문구 수정은 갱신하지 않아도 된다.
- [ ] 갱신할 때는 템플릿을 먼저 고치고, 그 내용을 온라인 문서에 옮긴다.
