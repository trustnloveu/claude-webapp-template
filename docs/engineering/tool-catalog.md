# 도구 목록 (스킬·MCP·플러그인)

> 대상: 공용

> 작성: 총괄(메인 세션) · 확정: 사람 (설치·교체·제외는 사람 결정)

에이전트가 작업 중에 고를 수 있는 도구 선택지입니다. 스킬과 도구는 계속 새로 나오고 바뀌므로, 이 목록을 정기적으로 다시 봅니다(`/tool-review`).

## 쓰는 규칙
- 작업에 도움이 될 도구가 있으면 이 목록의 "후보"에서 고른다. 직접 설치하지 않고 보고에 "도구 제안"(도구, 쓰려는 작업, 기대 효과, 겹치는 도구)으로 적는다. 총괄이 "사람 확인 대기"에 올린다.
- 목록에 없는 도구를 알게 되면 같은 방식으로 제안한다. 총괄이 아래 "들일 때 확인할 것"을 조사해 목록에 더할지 제안한다.
- "사용 중"이 아닌 도구를 쓰려면 사람 승인이 있어야 한다. 승인되면 상태를 "사용 중"으로 바꾸고 설치 방법을 SETUP.md에 옮긴다.
- 같은 일을 하는 도구는 하나만 "사용 중"으로 둔다(CLAUDE.md "도구 사용").

## 들일 때 확인할 것
1. 적합성: 역할 분리·사람 승인·디자인 토큰 같은 기존 규칙과 맞는가, 이미 있는 도구와 겹치는가
2. 안전: 훅·로컬 서버·전역 설치·외부 전송·사용 통계가 있는가. 스킬·에이전트 파일은 지시문이므로 내용을 읽는다
3. 인지도: GitHub 별, 월평균 별(만든 뒤 한 달 평균), 최근 업데이트, 열린 이슈 수, 라이선스
4. 비용: 유료 플랜, API 키, 사용량 소모

## 교체 기준
같은 역할의 대안이 아래를 모두 만족하면 `/tool-review`가 교체 후보로 올린다. 인기만으로 바꾸지 않는다.
1. 별 또는 월평균 별이 지금 도구의 2배 이상
2. 최근 3개월 안에 업데이트
3. 쓸 수 있는 라이선스(MIT, Apache-2.0 등)
4. 훅·외부 전송·전역 설치 위험이 지금 도구보다 크지 않음
5. 기존 규칙과의 겹침을 해결할 수 있음

예외: 한국어 문서 윤문처럼 언어·규칙 적합성이 결정적이면 인지도가 낮아도 고른다(im-not-ai, 2026-11-28 사람 결정).

## 목록
상태: 사용 중 / 후보 / 방법만 차용(규칙·에이전트에 옮기고 설치 안 함) / 보류 / 제외. 수치는 조사일 기준이다.

### 사용 중
| 분류 | 도구 | 쓰는 때 | 담당 | 별 (월평균) | 조사일 | 설치 위치 | 메모 |
|---|---|---|---|---|---|---|---|
| 기획 문서 | Spec Kit (github/spec-kit) | 스펙 작성 | planner | 152k (10.0k) | 2026-11-28 | 프로젝트 | 분야 1위. 기획용 스킬만 씀 |
| 디자인 지식 | UI UX Pro Max (nextlevelbuilder/ui-ux-pro-max-skill) | 스타일·색·글꼴 결정, 구현 점검 | designer, frontend-dev(점검만) | 155k (13.0k) | 2026-11-28 | 프로젝트 | 분야 1위 |
| 보안·접근성 에이전트 | Agency Agents (msitarzewski/agency-agents) | 보안·위협 모델·접근성 검증 | 07~09 | 171k (12.6k) | 2026-11-28 | 프로젝트(복사) | 대안 wshobson/agents 43k |
| 브라우저 | Playwright MCP (microsoft/playwright-mcp) | 시안 PNG 내보내기, 화면 확인, E2E | designer, qa | 40k (2.0k) | 2026-11-28 | 프로젝트 | 시안 내보내기 동작 확인됨 |
| 디자인 연동 | Figma MCP (공식) | Figma 시안 읽기(선택) | designer, frontend-dev | — | — | 프로젝트 | 무료 좌석은 읽기 월 20회 |
| 다이어그램 | diagram-design (cathrynlavery/diagram-design) | 구조도·흐름도, SVG·PNG 내보내기 | 총괄, designer | 74k (10.0k) | 2026-11-28 | 전역 | 열린 이슈 33 |
| 한국어 윤문 | humanize-korean (epoko77-ai/im-not-ai) | 사람용 한국어 문서 다듬기(`/humanize-korean`) | 총괄 | 6.8k (0.9k) | 2026-11-28 | 전역 | 훅 없음, 표준 라이브러리만. 에이전트 9개 중 5개는 그 저장소 개발용 |

### 후보
| 분류 | 도구 | 쓰는 때 | 담당 | 별 (월평균) | 조사일 | 설치 | 주의 |
|---|---|---|---|---|---|---|---|
| 라이브러리 문서 | Context7 (upstash/context7) | 라이브러리 최신 문서 확인(3단계 스택 비교) | 총괄, 03·04 | 66k (3.3k) | 2026-11-28 | `npx ctx7 setup`(사람) | 로그인·API 키 |
| 브라우저 진단 | Chrome DevTools MCP (ChromeDevTools/chrome-devtools-mcp) | 성능(Core Web Vitals)·콘솔·네트워크 문제 진단 | qa, frontend-dev | 60k (4.1k) | 2026-11-28 | MCP 추가 | Playwright와 역할 일부 겹침, MCP 개수 기준 |
| 자동화 추천 | Claude Code Setup (anthropics/claude-plugins-official) | 코드 뼈대가 생긴 뒤 훅·MCP·에이전트 추천 | 총괄 | 48k (공식 묶음) | 2026-11-28 | `/plugin` 공식 마켓 | 읽기 전용. SETUP.md 3단계 |
| 코드 이해 | 공식 LSP 플러그인(typescript-lsp, pyright-lsp 등) | 스택이 정해진 뒤 정의 이동·참조 찾기·타입 오류 | 03·04, reviewer | 공식 묶음 | 2026-11-28 | `/plugin` 공식 마켓 | 언어 서버를 전역 설치해야 함 |
| 보안 점검 | security-guidance (공식) | 3단계 이후 코드 수정마다 보안 패턴 경고·차이 검토 | 07과 함께 | 공식 묶음 | 2026-11-28 | `/plugin` 공식 마켓 | 턴마다 차이를 LLM으로 검토(사용량), security-auditor와 겹침 확인 필요 |
| 프론트 디자인 | frontend-design (anthropics/skills) | UI가 흔한 AI 모양으로 나올 때 | designer | 201k (공식 묶음) | 2026-11-28 | 스킬 | UI UX Pro Max와 겹침, 둘 중 하나만 |
| 다이어그램 | Archify (tt-a1i/archify) | 클릭해서 펼치는 구조도가 필요할 때 | 총괄 | 101k (13.5k) | 2026-11-28 | 스킬 | diagram-design과 같은 일, 열린 이슈 363 |
| 마케팅 문구 | Marketing Skills (coreyhaines31/marketingskills) | 복사본의 랜딩·출시 문구 | 총괄 | 63k (6.0k) | 2026-11-28 | 플러그인 | 스킬 53개 자동 실행, 출시 단계에서만 |
| 홍보 영상 | HyperFrames (heygen-com/hyperframes) | 복사본 출시 홍보 영상 | 총괄 | 91k (10.6k) | 2026-11-28 | 플러그인 | 렌더링이 느림 |
| 세션 기억 | Claude-Mem (thedotmack/claude-mem) | PIPELINE 인수인계로 부족해 세션이 자주 끊길 때만 | 총괄 | 120k (8.0k) | 2026-11-28 | `npx claude-mem install` | 전역 훅 9개, 로컬 서버, 사용 통계 기본 켜짐(`npx claude-mem telemetry disable`) |

### 방법만 차용
| 도구 | 별 (월평균) | 옮긴 곳 | 설치하지 않는 이유 |
|---|---|---|---|
| mattpocock/skills (Grill Me, diagnosing-bugs) | 334k (34.1k) | /refine 라운드 질문, qa 오류 분석 | 자동 실행 스킬(tdd·code-review·prototype)이 TDD 규칙·reviewer·designer와 겹침 |
| Ponytail (DietrichGebert/ponytail) | 200k (35.9k) | tech-stack.md "구현 순서" | 항상 켜짐 |
| agent-skills (addyosmani/agent-skills) | 121k (12.8k) | idea.md 제품 원칙, qa 오류 분석 | 전체 흐름이 역할·승인 구조와 겹침 |
| Elephant-Goldfish Model (google/elephant-goldfish-model) | 23k (9.3k) | reviewer 문서 검토 모드 | Spec Kit과 같은 일 |

### 보류
| 도구 | 별 (월평균) | 이유 | 다시 볼 때 |
|---|---|---|---|
| Trail-code (trailhq/Trail-Code) | 11.5k (2.4k) | 전역 훅 5개, 결정 자동 저장이 결정 로그와 겹침, 열린 이슈 280 | 3단계 코드 뼈대 이후(SETUP.md) |

### 제외
| 도구 | 별 (월평균) | 이유 |
|---|---|---|
| superpowers (obra/superpowers) | 328k (24.0k) | "작업 전 스킬 강제" 흐름이 사람 승인 단계를 건너뜀 |
| ECC (affaan-m/ECC) | 312k (30.2k) | 같은 이름 에이전트, 자동 훅, 도구 중복. 규칙 일부는 기존 에이전트에 반영(2026-11-27) |
| blader/humanizer | 74k (7.2k) | 영어 기준. 한국어판으로 교체(2026-11-28) |
| 21st.dev Magic MCP (21st-dev/magic-mcp) | 6.7k (0.3k) | 디자인 토큰 규칙과 충돌, API 키, 2026-09 이후 업데이트 없음 |
| FreeLLMAPI | — | 코드를 여러 외부 모델 업체로 보냄 |
| OpenSpec, BMAD-METHOD | 76k (4.8k), 56k (2.9k) | Spec Kit(152k)과 같은 일 |
