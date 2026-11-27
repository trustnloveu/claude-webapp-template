# 스펙 (Spec Kit)

> 대상: 공용
> 작성: Agent 01 기획(planner) · 확정: 사람(기획 승인)

Spec Kit이 기능별 스펙을 이 폴더에 만듭니다(`specs/001-<기능이름>/spec.md`). Spec Kit의 기본 위치라서 `docs/` 밖에 있습니다.
스펙 작성 기준은 [docs/planning/spec-guide.md](../docs/planning/spec-guide.md), 요구사항과 아이디어는 [docs/planning/](../docs/planning/)에 있습니다.

- 만드는 방법: planner가 `/speckit-specify`로 만들고, `/speckit-clarify`(모호한 부분 질문), `/speckit-checklist`(요구사항 점검)로 다듬습니다. 사용 범위는 `CLAUDE.md` "도구 사용"을 따릅니다.
- 번호(`001`, `002`…)는 Spec Kit이 이 폴더의 기존 번호를 보고 정합니다.
- Spec Kit은 git 브랜치를 만들지 않습니다. 브랜치는 `CLAUDE.md` "규칙"의 형식(`유형/번호-설명`)대로 직접 만듭니다.
