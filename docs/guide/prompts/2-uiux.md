# 2단계. UI/UX 설계

> 대상: 사람

담당: Agent 02 디자인(designer). Figma 시안은 사람이 Figma(AI)로 만듭니다.
저장 위치: `docs/design/ux.md`(IA·화면 목록·흐름·화면 상세), `docs/design/README.md`(컨셉·토큰·디자인 상태), Figma
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
그리고 Figma(AI)에 넣을 시안 요청문까지. 스펙에 없는 기능은 넣지 마.
```

## 디자인 컨셉 (원본 ⑩)
```text
docs/planning/idea.md와 페르소나에 맞는 UI/UX 디자인 컨셉을 제안해 줘.
디자인 방향, 키워드 5개, 컬러 팔레트, 타이포그래피, 버튼·입력창 스타일, 카드·리스트, 내비게이션, 반응형 기준.
Figma 디자인 시스템으로 바로 옮길 수 있게 구체적인 값으로 쓰고, UI UX Pro Max 기준으로 접근성 문제를 점검해.
결과는 docs/design/README.md의 "디자인 컨셉"에 저장해.
```

## 디자인 시스템 (원본 ⑫)
```text
디자인 컨셉을 디자인 시스템으로 정의해 줘.
토큰: Color, Typography, Spacing, Radius, Shadow
컴포넌트: Button, Input, Card, Modal, Navigation — 각각 Default, Hover, Active, Disabled, Error 상태 포함
Figma Variables와 코드의 토큰 파일 이름이 1:1로 대응하도록 이름을 정하고 docs/design/README.md에 표로 정리해.
```

## Figma 화면 (원본 ⑪) — Figma AI에 입력
```text
다음 화면 목록과 기능 명세로 웹앱 UI를 설계해 줘.
[docs/design/ux.md 화면 상세의 "Figma 시안 요청문" 붙여 넣기]
조건: [Desktop/Mobile] 우선, [1440px] 기준, [12] Column Grid, 디자인 시스템 Variables 사용,
재사용 컴포넌트, Auto Layout, 반응형 고려.
```
기준 해상도와 우선 기기는 사람이 정하고 ADR에 남깁니다.

## 시안 검증과 디자인 고도화 (템플릿 추가)
```text
Figma 시안이 나왔어. designer가 Figma MCP로 시안을 읽어 docs/design/ux.md 화면 상세, 토큰, 접근성과 맞는지 검증하고,
사용성·일관성 관점의 고도화 제안을 따로 정리해 줘. 차이가 의도된 것인지 모르면 나에게 물어봐.
```

## 디자인 승인 요청 (템플릿 추가)
```text
디자인 승인을 받을 수 있게 요약해 줘: 화면 수, 화면별 시안 상태, 기능 ↔ 화면 대응 누락 여부,
남은 질문, 내가 결정해야 할 컨셉·기준 항목.
```

