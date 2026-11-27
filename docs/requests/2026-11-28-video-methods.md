# 유튜브 영상 3편의 도구·방법론을 템플릿에 반영

> 대상: 공용

- 날짜: 2026-11-28
- 요청자: 프로젝트 오너
- 관련: 템플릿 고도화 (브랜치 `chore/017-video-methods`)

## 원문
영상 링크:
- https://youtube.com/shorts/smRzIr2t4y4?si=IwsHIcrKPVcvhi0P
- https://youtu.be/XJILzLeuAfg?si=C9sJovPi83xFsrov
- https://youtu.be/yv0Gzjkkkc4?si=JzfJkn-Fvbw52svP

요지(총괄 세션이 전달한 원문 요지): "제시되는 내용들을 적극적으로 참고해서 해당 템플릿 설계에 적용하고 싶어. 상위호환이 되는 부분은 기존 걸 버리고 새로운걸로 교체하는 등 구조적으로 프로젝트 진행하는 입장에서 효과적으로 사용할 수 있는 방향으로 수정해줘."

## 확인 방법
- 제목·설명: 유튜브 페이지. 자막: 유튜브 "스크립트 표시"(자동 자막). 강의·홍보 부분은 요약에서 뺐습니다.
- 영상 1의 안내 페이지는 이메일 등록이 필요해 도구 이름(섹션 제목)까지만 읽었습니다.
- 도구 설명은 각 공식 GitHub 저장소 README로 확인했습니다(2026-11-28 기준).

## 영상별 요약

### 1. 게으른빌더 "클로드 코드에 이 5개만 설치하면…" (쇼츠, 47초)
| 도구 | 내용 | 저장소 |
|---|---|---|
| Claude-Mem | 세션이 바뀌어도 지난 작업을 기억. 훅 9개와 로컬 서버(Bun)·DB(SQLite·Chroma), 익명 통계 기본 켜짐 | thedotmack/claude-mem |
| FreeLLMAPI | 여러 무료 AI 모델을 한 주소로 묶고 한도가 차면 다음 모델로 | (안내 페이지 이름만 확인) |
| Claude Code Setup | Anthropic 공식 플러그인. 코드를 읽고 훅·스킬·MCP·서브에이전트를 분야마다 1~2개 추천, 읽기 전용 | anthropics/claude-plugins-official |
| Elephant-Goldfish Model | 맥락을 가진 쪽(코끼리)이 설계 문서를 쓰고, 이전 대화를 모르는 새 검토자(금붕어)가 숨은 가정·빈틈을 찾음. 문서와 코드 어긋남 보고도 있음 | google/elephant-goldfish-model |
| 21st.dev Magic MCP | 미리 만든 UI 컴포넌트·템플릿을 가져다 씀 | 21st.dev |

### 2. 보스턴빌더 "미친 스킬 8가지" (23분)
| 스킬 | 내용 |
|---|---|
| Grill Me (mattpocock/skills) | 만들기 전에 AI가 나를 인터뷰. 결정 트리를 라운드로 묻고 질문마다 추천 답, 사실은 AI가 직접 찾음. 직접 불러야 켜짐 |
| Ponytail | "게으른 고수": 필요한가 → 이미 있는가 → 표준 기능 → 설치된 라이브러리 → 최소 코드. 검증·보안·접근성은 줄이지 않음. 항상 켜짐. 효과는 제작자 26% 절감 주장, 외부 측정 약 10% |
| UI UX Pro Max | 업종별 디자인 규칙·색·글꼴 조합 |
| Marketing Skills | 마케팅 스킬 53개 |
| Humanizer (+한국어판 im-not-ai) | AI 말투를 사람 말투로 |
| Claude-Mem | 영상 1과 같음 |
| Archify | 구조를 클릭할 수 있는 HTML 그림으로 |
| HyperFrames | 설명으로 홍보 영상(MP4) 만들기 |

영상의 결론: 다 따라갈 필요 없고, 비슷한 스킬이 여러 개면 엉뚱한 스킬이 켜지니 나에게 맞는 하나를 제대로 쓴다.

### 3. 마일드코드 "상위 0.1% 바이브코딩 노하우" (15분, Addy Osmani의 agent-skills)
- 정의 → 계획 → 구현 → 검증 → 리뷰 → 배포 6단계. AI는 가장 빠른 길로 가며 단계를 건너뛰므로 스펙부터 쓴다.
- 스펙에 다 담기지 않는 판단 기준(서비스가 왜 존재하는지, 결정 철학, 절대 하지 않을 것)을 문서로 남긴다. 의도를 말하지 않으면 AI는 가장 흔한 방식으로 간다.
- 중요한 규칙은 사람 기억이 아니라 스킬·훅 같은 시스템으로 만든다.
- 테스트 먼저, 브라우저 확인, 리뷰. 작업을 마치려는 순간 테스트가 충분한지 훅으로 점검하는 사례.
- 남이 만든 플러그인에는 내 판단 기준이 없다. 내 기준으로 넣을 것과 뺄 것을 고른다.

## 비교표와 판정
| # | 항목 (영상) | 이전 템플릿 | 판정 | 근거 |
|---|---|---|---|---|
| A | 판단 기준 문서화 (3) | idea.md에 한 문장·하지 않을 것만 | 추가 | idea.md "제품 원칙", CLAUDE.md 작업 방식 1줄 |
| B | Grill Me 인터뷰 (2·3) | /refine 빈칸 질문, 한 번에 최대 3개 | 교체(질문 방식) | /refine 3번을 라운드 질문으로. 요청서 형식은 유지. 플러그인 미설치(스킬 38개가 /refine·planner와 겹침) |
| C | 새 맥락 검토 (1·3) | 스펙·ADR은 사람 승인 전 독립 검토 없음 | 추가 | reviewer "문서 검토 모드"·문서 어긋남 기준, /plan-work·CLAUDE.md·roles.md. EGM 미설치(Spec Kit과 같은 일) |
| D | Ponytail 최소 구현 (2) | tech-stack.md 코드 크기 수치만 | 추가 | tech-stack.md "구현 순서", reviewer 품질 기준. 미설치(항상 켜지는 스킬) |
| E | 완료 직전 테스트 점검 훅 (3) | CLAUDE.md 규칙만 | 추가 | `.claude/hooks/check-tests-on-stop.sh`, settings.json Stop 훅 |
| F | Claude Code Setup (1) | 안내 없음 | 추가(안내만) | SETUP.md 3단계 선택 항목. 미설치 |
| — | 6단계·스펙 먼저·TDD·리뷰·규칙 파일·스킬화 (3) | 이미 있음 | 유지 | agent-skills로 바꾸면 역할 분리·승인 단계가 사라짐 |
| — | UI UX Pro Max, Humanizer (2) | 설치됨 | 유지 | |
| — | 겹치는 스킬 금지, 남의 플러그인엔 내 기준 없음 (2·3) | "같은 일 도구 하나", ECC·superpowers 미설치 | 유지 | |
| — | Claude-Mem (1·2) | PIPELINE.md 인수인계, 자동 메모리 | 제외 | 전역 훅 9개, 로컬 서버·DB, 익명 통계 기본 켜짐, 결정 로그와 이중 기록 |
| — | FreeLLMAPI (1) | — | 제외 | 코드를 여러 외부 업체로 보냄, 품질·약관 불확실 |
| — | 21st.dev MCP (1) | designer + 디자인 토큰 규칙 | 제외 | 외부 컴포넌트 스타일이 토큰 규칙과 충돌, API 키 필요 |
| — | Archify (2) | diagram-design, Mermaid | 제외 | 같은 일 도구 |
| — | Marketing Skills, HyperFrames (2) | — | 제외 | 개발 템플릿 범위 밖. 복사본에서 필요하면 결정 |
| — | 한국어 Humanizer im-not-ai (2) | — | 보류 | 전역 설치, Humanizer와 역할 겹침 |

## 결과
- 2026-11-28 사람이 A~F 전부 적용 승인. 설치·삭제한 것 없음.
- PR: https://github.com/trustnloveu/claude-webapp-template/pull/16
