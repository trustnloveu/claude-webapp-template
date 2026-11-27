# Pipeline 상태

> 대상: 공용

<!-- 템플릿에서 복사본을 만들 때 이 파일로 docs/PIPELINE.md를 덮어쓰고, 이 주석과 PIPELINE-template.md를 지운다 (docs/guide/SETUP.md 2단계) -->

현재 단계: 0. 환경
다음 할 일: docs/guide/SETUP.md 2단계(저장소 설정)부터 진행. 1단계 전역 도구가 이 PC에 이미 있으면 건너뛴다. 0단계를 마치면 사람이 "0단계 완료"를 승인하고 1단계(기획: 아이디어·요구사항 원문)로 넘어간다

템플릿을 만들 때 정한 결정(훅, Spec Kit 사용 범위, 에이전트 구성 등)의 근거는 템플릿 저장소(trustnloveu/claude-webapp-template)의 docs/PIPELINE.md 결정 로그에 있다. 그 결정은 CLAUDE.md와 .claude/에 이미 반영되어 있다.

## 사람 확인 대기
Claude가 사람의 승인이 필요한 항목을 여기에 남깁니다. 사람이 승인하면 Claude가 해당 항목을 반영하고 이 목록에서 지웁니다.

| 날짜 | 항목 | 종류 | 근거·위치 |
|---|---|---|---|

종류: 기획 승인 / 디자인 승인 / 계획 승인 / 결과 승인 / 단계 완료 / 결정(ADR 채택, MVP 범위, 스택, 디자인) / PR 병합 / 배포 / 비용 발생 / 기타

## 단계
단계 체크와 "현재 단계" 변경은 사람이 승인한 뒤에만 합니다.

- [ ] 0. 환경 → 이 저장소, CLAUDE.md, 훅 (docs/guide/SETUP.md)
- [ ] 1. 기획: 요구사항 분석 → 질문 → 정형화 → 고도화 → **기획 승인** — docs/planning/requirements.md, docs/planning/idea.md, specs/ (1-planning-requirements.md, 1-planning-spec.md)
- [ ] 2. UI/UX: UX 설계 → UI 정형화 → HTML 시안(사람 결정) → 고도화 → **디자인 승인** — docs/design/ux.md, docs/design/README.md, docs/design/mockups/ (2-uiux.md). 첫 시안 때 외부 채널(Stitch·Figma) PNG 업로드를 시험하고 결과를 확인 기록에 남김(PNG 내보내기는 템플릿에서 확인됨, mockups/README.md 5번)
- [ ] 3. 구현 준비: 기술 스택·구조(ADR), 아키텍처, API 계약, DB, 뼈대 → 스테이징 URL — docs/engineering/tech-stack.md, docs/engineering/architecture.md, OpenAPI, docs/engineering/database.md (3-build-setup.md)
- [ ] 4. 기능 구현 루프 (4-feature-loop.md)
- [ ] 5. 출시 → 테스트·보안 보고서(docs/reports), 운영 URL, 모니터링, 릴리스 노트 (5-release.md)

## 기능 구현 루프
기능마다 기획 확인 → 디자인 확인 → 계획 → 구현 → 검증 순서로 진행합니다. 확인 칸이 "필요"면 해당 단계(1 또는 2)를 먼저 거칩니다.
승인 칸(기획·디자인·계획·결과)과 병합 칸은 사람이 승인한 뒤에만 채웁니다.

| 기능 ID | 기획 확인 | 디자인 확인 | 계획 승인 | 백엔드 | 프론트 | 검증(qa·리뷰·디자인·기획) | 결과 승인 | PR·병합 |
|---|---|---|---|---|---|---|---|---|

확인 칸 값: 승인됨 / 필요 / 해당 없음

## 결정 로그
사람이 확정한 결정만 적습니다. Claude의 제안은 "사람 확인 대기"에 둡니다.

| 날짜 | 결정 | 결정자 | 근거 문서 |
|---|---|---|---|

## 확인 기록
사실 확인 결과를 남깁니다. 결정이 아닙니다.

| 날짜 | 확인 내용 | 결과 |
|---|---|---|
