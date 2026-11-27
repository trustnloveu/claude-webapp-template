# 프론트엔드 규칙 (apps/web)

> 대상: AI

## 스택
docs/engineering/tech-stack.md를 따른다. 이 파일에는 프론트엔드에만 해당하는 실행 방법과 규칙만 둔다.

## 명령
- 개발 서버: <명령>
- 테스트: <명령>
- E2E: <명령>

## 규칙
- 화면은 결정된 시안(docs/design/mockups/의 HTML, Figma를 쓰면 Figma 프레임)을 읽어 구현한다. 시안 위치는 docs/design/README.md에 있다. 시안 HTML은 복사하지 않고 tech-stack.md 구조로 새로 만든다.
- 디자인 토큰(docs/design/README.md의 토큰 표, 코드 위치는 그 문서에 명시)만 사용한다.
- 화면 정의와 화면 상세(상태, 인터랙션, 반응형, 접근성)는 docs/design/ux.md를 따른다.
- 디자인 상태가 "승인"이 아닌 화면은 구현하지 않는다.
- API 호출은 packages/shared의 타입을 쓴다. 응답 모양을 직접 정의하지 않는다.
- 구현 후 Playwright로 스크린샷을 찍어 시안(docs/design/mockups/exports/의 PNG 또는 Figma 프레임)과 비교한다.
- 디자인을 임의로 바꾸지 않는다. 구현이 어려운 부분은 먼저 알린다.
- 화면마다 로딩, 빈 상태, 에러 상태를 만든다.
- 사용자 입력은 화면에서도 검증하지만, 최종 검증은 서버가 한다.
- 접근성: 키보드로 조작 가능, 입력창 라벨, 색 대비 기준 충족.
- API 키 등 시크릿을 프론트엔드 코드나 번들에 넣지 않는다.
