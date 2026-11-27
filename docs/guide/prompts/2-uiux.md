# 2단계. UI/UX 설계

> 대상: 사람

담당: Agent 02 디자인(designer). 시안은 designer가 HTML로 만들고, 내가 보고 의견을 주고 결정합니다. 탐색은 Stitch(무료), Figma는 선택(유료).
저장 위치: `docs/design/ux.md`(IA·화면 목록·흐름·화면 상세), `docs/design/README.md`(컨셉·토큰·디자인 상태), `docs/design/mockups/`(HTML 시안, 흐름은 그 폴더의 README.md)
진입 조건: **기획 승인**. 끝에 **디자인 승인**을 받습니다.

## 정보 구조, IA (원본 ⑦)
```text
승인된 스펙을 바탕으로 메뉴 구조를 1~3 Depth 트리로 설계해 줘.
메뉴마다 역할과 연결된 기능 ID를 적고, docs/design/ux.md의 "정보 구조(IA)"에 넣어(designer, UX 설계 모드).
```

## 화면 목록 (원본 ⑨)
```text
IA와 스펙의 사용자 시나리오를 바탕으로 전체 화면 목록을 docs/design/ux.md의 "화면 목록" 표에 채우고,
Must 기능이 모두 어느 화면에서 수행되는지 "기능 ↔ 화면 대응" 표를 채워 줘. 화면 간 이동은 "화면 흐름"에 Mermaid로 그려.
화면 ID, 화면명, 목적, 관련 기능 ID, 사용자 액션, 연결 화면, 필요한 데이터, 권한.
```

## 화면 상세 (UI 정형화, 템플릿 추가)
```text
docs/design/ux.md의 화면마다 "화면 상세"를 채워 줘(designer, UI 정형화 모드).
영역 구성, 컴포넌트, 상태(기본·로딩·빈 상태·에러·권한 없음), 인터랙션, 입력 검증 메시지, 반응형, 접근성,
그리고 시안 요청문(Stitch 탐색과 HTML 시안의 기준)까지. 스펙에 없는 기능은 넣지 마.
```

## 디자인 컨셉 (원본 ⑩)
```text
docs/planning/idea.md와 페르소나에 맞는 UI/UX 디자인 컨셉을 제안해 줘.
디자인 방향, 키워드 5개, 컬러 팔레트, 타이포그래피, 버튼·입력창 스타일, 카드·리스트, 내비게이션, 반응형 기준.
CSS 변수(docs/design/mockups/tokens.css)로 바로 옮길 수 있게 구체적인 값으로 쓰고, UI UX Pro Max 기준으로 접근성 문제를 점검해.
결과는 docs/design/README.md의 "디자인 컨셉"에 저장해.
```

## 디자인 시스템 (원본 ⑫)
```text
디자인 컨셉을 디자인 시스템으로 정의해 줘.
토큰: Color, Typography, Spacing, Radius, Shadow
컴포넌트: Button, Input, Card, Modal, Navigation — 각각 Default, Hover, Active, Disabled, Error 상태 포함
docs/design/README.md 토큰 표에 정리하고, 같은 이름의 CSS 변수로 docs/design/mockups/tokens.css를 만들어.
코드의 토큰 파일(Figma를 쓰면 Variables)과 이름이 1:1로 대응하게 해.
```

## Stitch 탐색 (선택, 내가 웹에서) — 원본 ⑪ 대체
stitch.withgoogle.com에서 아래처럼 넣고 여러 안을 만들어 봅니다. 마음에 드는 결과의 HTML·이미지를 `docs/design/mockups/stitch/`에 넣습니다.
```text
다음 화면 상세로 웹앱 화면을 디자인해 줘.
[docs/design/ux.md 화면 상세의 "시안 요청문" 붙여 넣기]
조건: [Desktop/Mobile] 우선, [1440px] 기준, [12] Column Grid, 반응형 고려.
```
기준 해상도와 우선 기기는 사람이 정하고 ADR에 남깁니다.

## HTML 시안 만들기·다듬기 (designer, 시안 작성·수정 모드)
```text
docs/design/ux.md의 [화면 ID] 화면 상세로 docs/design/mockups/[화면 ID].html 와이어프레임을 만들어 줘
(docs/design/mockups/README.md 규칙, tokens.css 변수만 사용). stitch/에 참고 결과가 있으면 참고해.
```
의견을 줄 때는 "다시 만들어"보다 "[영역]의 [무엇]을 [어떻게]"처럼 바뀔 곳을 짚으면 부분 수정으로 끝나 토큰이 적게 듭니다.

## 시안 결정과 내보내기
```text
[화면 ID] 시안으로 결정할게. 디자인 상태를 "시안 완료"로 바꾸고,
Playwright로 데스크톱·모바일 PNG를 docs/design/mockups/exports/에 저장해 줘.
```
PNG는 내가 외부 채널(Stitch 또는 Figma)에 올립니다. 다음 수정은 저장소 HTML에서 시작하고, 외부에서 내가 직접 고친 경우에만 그 결과를 다시 읽게 합니다.

## 시안 검증과 디자인 고도화 (템플릿 추가)
```text
시안이 정해졌어. designer가 docs/design/mockups/의 시안이 docs/design/ux.md 화면 상세, 토큰, 접근성과 맞는지 검증하고,
사용성·일관성 관점의 고도화 제안을 따로 정리해 줘. 차이가 의도된 것인지 모르면 나에게 물어봐.
```

## 디자인 승인 요청 (템플릿 추가)
```text
디자인 승인을 받을 수 있게 요약해 줘: 화면 수, 화면별 시안 상태, 기능 ↔ 화면 대응 누락 여부,
남은 질문, 내가 결정해야 할 컨셉·기준 항목.
```

