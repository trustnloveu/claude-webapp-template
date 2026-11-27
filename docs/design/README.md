# 디자인

> 대상: 공용
> 작성: Agent 02 디자인(designer) · 승인: 사람
> 시각 디자인 문서입니다. IA·화면 목록·화면 흐름·화면 상세는 docs/design/ux.md(같은 디자인 담당)에 있습니다.
> `(사람 결정)` 칸은 Claude가 초안만 쓰고 `(제안)`을 붙입니다.

## Figma
- 파일: <Figma 파일 링크>
- 디자인 토큰(Variables) 페이지: <링크>
- 기준 (사람 결정): <Desktop/Mobile 우선>, <1440px>, <12 Column Grid> (ADR로 결정)

## 디자인 컨셉 (사람 결정)
- 방향: <>
- 키워드: <5개>
- 반응형 기준: <브레이크포인트>

## 화면별 디자인 상태
화면 ID와 화면 정의는 docs/design/ux.md의 화면 목록을 따릅니다. 모든 화면이 "승인"이어야 디자인 승인이 끝납니다.

| 화면 ID | Figma 프레임 | 상태 (사람 결정) | 메모 |
|---|---|---|---|
| S-001 | | 시안 전 | |

상태: 시안 전 → 시안 완료 → **승인**(사람) → 구현 → 검수 완료. Claude는 "승인"으로 바꾸지 않습니다.

## 디자인 토큰
Figma Variables 이름과 코드의 토큰 이름을 1:1로 맞춥니다. 코드 위치: `<토큰 파일 경로>` (docs/engineering/tech-stack.md의 스타일링 방식을 따름)

| 분류 | 토큰 예시 | 값 |
|---|---|---|
| Color | color.primary.500 | |
| Typography | font.body.md | |
| Spacing | space.4 | |
| Radius | radius.md | |
| Shadow | shadow.sm | |

## 컴포넌트 상태
| 컴포넌트 | Default | Hover | Active | Disabled | Error |
|---|---|---|---|---|---|
| Button | | | | | — |
| Input | | | | | |
| Card | | | | — | — |
| Modal | | — | — | — | — |
| Navigation | | | | | — |
