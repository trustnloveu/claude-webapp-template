# 3단계. 구현 준비 — 기술 설계와 뼈대

> 대상: 사람

담당: 총괄(기술 스택·구조·아키텍처), Agent 04 백엔드(API 계약·DB), 03·04(뼈대).
저장 위치: `docs/engineering/tech-stack.md`, `docs/engineering/architecture.md`, `docs/decisions/`, OpenAPI, `docs/engineering/database.md`, `apps/`
진입 조건: **기획 승인**, 화면이 있으면 **디자인 승인**. API와 DB는 docs/design/ux.md의 "필요한 데이터"를 기준으로 설계합니다.

## 기술 스택 (원본 ⑬)
```text
specs/001-mvp를 구현할 기술 스택을 영역별로 2~3개 후보씩 비교해 줘.
영역: Frontend, Backend, Database, Authentication, Hosting, Storage, AI 연동(필요 시), CI/CD
기준: 혼자 개발 속도, 나중에 팀원 채용 쉬움, 월 비용(MVP 규모), 학습 난이도, 확장성, Claude Code·Context7 지원 수준.
최신 정보는 Context7과 공식 문서로 확인하고 확인하지 못한 수치는 표시해.
내가 고르면 docs/decisions/ADR-001-stack.md로 기록하고, 채택되면 docs/engineering/tech-stack.md의 "스택"과 "개발 도구" 표를 채워.
```

## 구조와 디자인 패턴 (템플릿 추가)
```text
ADR-001 스택으로 docs/engineering/tech-stack.md의 "구조와 디자인 패턴"을 채워 줘.
폴더 구조, 계층별 책임과 금지 사항, 상태 관리, 에러 처리, 데이터 검증, 이름 규칙, 테스트 위치.
스택의 공식 권장 방식을 Context7로 확인하고, MVP 규모에 맞게 가장 단순한 방식을 제안해.
주요 선택(예: 상태 관리 방식)은 ADR 제안으로 따로 남겨.
```

## 시스템 아키텍처 (원본 ⑭)
```text
ADR-001 스택으로 시스템 아키텍처를 설계해 docs/engineering/architecture.md 템플릿을 채워 줘.
전체 구성, 프론트·백엔드 구조, API 통신, DB 연결, 인증·권한, 외부 서비스, AI 연동, 배포 환경.
구조도는 Mermaid로 그리고, MVP에 필요 없는 구성 요소는 넣지 마.
```

## 데이터베이스 (원본 ⑮)
```text
스펙의 기능 명세로 DB를 설계해 docs/engineering/database.md 템플릿을 채워 줘.
테이블 목록과 역할, 컬럼·타입, PK·FK, 관계, 인덱스(어떤 조회 때문인지 함께), 무결성 조건.
ERD는 Mermaid erDiagram으로, 스키마는 ADR-001의 DB와 ORM 기준 마이그레이션 초안으로 작성해.
```

## API 명세 (원본 ⑯)
```text
기능 명세와 DB 설계로 OpenAPI 명세를 작성해 줘.
API마다 operationId, Method, Path, 설명, 인증 여부, 파라미터, 요청·응답 스키마, 상태 코드, 에러 코드.
apps/api/CLAUDE.md의 "응답·에러 형식"을 모든 엔드포인트에 일관되게 적용하고,
docs/design/ux.md 화면 목록의 "필요한 데이터"가 모두 어떤 API로 채워지는지 대응표를 함께 보여 줘.
```

## 초기 세팅 (원본 ⑰)
```text
docs/engineering/tech-stack.md 기준으로 apps/web과 apps/api를 초기화해 줘. 기능은 만들지 않는다.
1. 프로젝트 초기화와 필수 패키지   2. 폴더 구조   3. .env.example에 필요한 변수 이름
4. 기본 라우팅과 공통 레이아웃      5. 포맷·린트·타입 검사 설정
6. 디자인 토큰 파일 연결           7. 빌드·테스트 실행 확인
기존 파일을 덮어쓰기 전에 확인하고, 각 단계 결과를 보고해. 끝나면 CLAUDE.md들의 "명령"을 채워.
```

## 코드 구조 (원본 ⑱)
```text
apps/web과 apps/api의 폴더 구조를 제안해 줘.
기준: 기능별 모듈, 공통 컴포넌트, API 통신 모듈, 상태 관리, 타입(packages/shared), 유틸, 환경별 설정 분리.
지금 MVP에 필요한 만큼만 만들고, 정한 구조는 docs/engineering/tech-stack.md의 "폴더 구조"에 반영해.
```

## 한 줄 연결 (가이드 4단계)
```text
화면 하나 → API 하나 → DB 값 하나가 연결되는 뼈대만 만들자.
CI(린트, 타입, 테스트, gitleaks), 스테이징 배포, Playwright E2E 한 개까지 통과하면 끝이야.
단계마다 멈추고 결과를 보여 줘.
```

