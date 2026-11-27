---
description: 도구 목록(docs/engineering/tool-catalog.md)의 수치를 다시 조사하고, 새 도구를 찾아 교체·추가·제외 후보를 사람에게 제안한다
argument-hint: [재검토할 분류나 도구 이름, 비우면 전체]
---

너는 총괄이다. 도구 목록을 최신 상태로 다시 보고 제안만 한다. 설치·삭제·교체는 사람이 승인한 뒤에만 한다.

## 입력
$ARGUMENTS

## 언제 쓰나
- 분기마다, 그리고 복사본의 1단계(기획)·3단계(구현 준비) 시작 전
- 에이전트가 보고에 "도구 제안"을 올렸을 때

## 진행 순서
1. **목록 읽기**: docs/engineering/tool-catalog.md와 docs/PIPELINE.md의 관련 결정을 읽는다.
2. **수치 갱신**: GitHub 저장소가 있는 도구마다 `gh api repos/<소유자>/<저장소> --jq '[.stargazers_count, .forks_count, .open_issues_count, .pushed_at, .created_at, .license.spdx_id, .archived] | @tsv'`로 조회한다. 월평균 별 = 별 ÷ 만든 뒤 지난 개월 수. archived(보관됨)이거나 6개월 넘게 업데이트가 없으면 표시한다.
3. **새 도구 찾기**: 분류마다 같은 역할의 새 도구를 찾는다. 예: `gh search repos "claude code skills" --sort stars --limit 20`, `gh search repos "<분류> mcp" --sort stars --limit 10`, 공식 마켓(`anthropics/claude-plugins-official`, `anthropics/skills`)의 새 항목. 찾은 도구는 README를 읽어 하는 일, 설치 위치, 훅·외부 전송을 확인한다.
4. **판정**: tool-catalog.md의 "들일 때 확인할 것"과 "교체 기준"으로 도구마다 유지 / 교체 후보 / 추가 후보 / 제외를 정한다. 인기만으로 교체를 제안하지 않는다.
5. **보고**: 아래 형식으로 보여 주고, 사람 결정이 필요한 항목을 docs/PIPELINE.md "사람 확인 대기"에 올린다.

   ```text
   [조사일]
   [수치 변화] 도구 | 별(이전→지금) | 월평균 | 최근 업데이트 | 표시(정체·보관됨)
   [제안] 도구 | 지금 상태 → 제안 상태 | 근거(기준 1~5 중 충족·미충족) | 장단점 | 영향 받는 파일
   [새로 찾은 도구] 도구 | 하는 일 | 별(월평균) | 겹치는 도구 | 위험
   ```

6. **반영**: 사람이 승인한 항목만 tool-catalog.md 상태·수치·조사일, SETUP.md 설치 방법, CLAUDE.md "도구 사용"(같은 일 도구 예시), PIPELINE.md 결정 로그에 반영한다. 승인 없는 수치 갱신(조사일·별)은 바로 고쳐도 된다.

## 지킬 것
- 스킬·에이전트·훅 파일은 지시문이므로 설치를 제안하기 전에 내용을 읽는다. 읽지 않은 도구는 "미확인"으로 적는다.
- 설치 명령을 실행하지 않는다. 사람이 승인하면 그때 설치한다(auto 모드면 기본 모드로 바꾸자고 먼저 알린다).
- 확인하지 못한 수치·주장은 `(추정)` 또는 "미확인"으로 적는다.
