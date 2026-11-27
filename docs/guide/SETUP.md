# 템플릿 사용법

> 대상: 사람

「Claude 개발 환경 설계안」과 「개발 파이프라인 가이드」의 0단계(환경)를 이 순서로 진행합니다.
아래 명령은 2026-11-27에 실제로 실행해 확인한 것입니다. 오래 지났으면 실행 직전에 각 저장소 README에서 최신 명령인지 다시 확인합니다.
외부 스킬·에이전트·MCP는 설치 전에 내용(`SKILL.md`, 에이전트 파일)을 읽습니다.

## 1. 전역 도구 (PC에 한 번만)

이미 설치한 PC면 건너뜁니다. 필요한 것: Claude Code CLI 2.1.142 이상(humanizer 요구), Homebrew, gh, python3 3.9 이상(위험 명령 훅).

Claude Code 세션 안에서 실행합니다.

```text
/plugin marketplace add cathrynlavery/diagram-design
/plugin install diagram-design@diagram-design
/plugin marketplace add blader/humanizer
/plugin install humanizer@humanizer
```

터미널에서 실행합니다.

```bash
# gh(GitHub CLI), pre-commit
brew install gh pre-commit

# Context7 (라이브러리 최신 문서 참조) — 로그인과 API 키 설정을 안내에 따라 직접 진행
npx ctx7 setup

# ccusage (토큰 사용량 확인) — 설치 없이 실행만, 사용 통계 전송 끔
DO_NOT_TRACK=1 npx ccusage@latest
```

- [ ] 전역 `~/.claude/CLAUDE.md`에 개인 규칙 작성(응답 언어, 커밋 스타일, 선호 스택)
- [ ] 상태줄에 컨텍스트 사용률 표시(ccstatusline 등)

superpowers는 설치하지 않습니다. 자동으로 실행되는 스킬(brainstorming, writing-plans, TDD)이 `/refine`·`/plan-work`·planner와 겹치기 때문입니다(템플릿 결정 로그 2026-11-27).

## 2. 저장소 만들기

템플릿 저장소(`trustnloveu/claude-webapp-template`)는 GitHub "Template repository"로 설정되어 있습니다. 아래 명령은 템플릿의 git 이력 없이 새 저장소를 만들고 내려받습니다.

```bash
gh repo create <프로젝트-이름> --template trustnloveu/claude-webapp-template --public --clone
cd <프로젝트-이름>
```

- `--public` 대신 `--private`도 됩니다. 단, 무료 계정의 비공개 저장소는 main 브랜치 보호를 쓸 수 없는 것으로 보입니다(추정, 유료 Pro 필요). 보호가 필요하면 공개로 만들거나 Pro를 씁니다.
- 폴더를 `cp -R`로 복사하지 않습니다. 템플릿의 git 이력과 개인 설정 파일(`.claude/settings.local.json`)까지 복사됩니다.

PIPELINE을 초기 상태로 바꾸고 첫 변경을 올립니다. main 보호를 켜기 전에, 내 터미널에서 실행합니다(Claude의 훅은 main 커밋을 막습니다).

```bash
cp docs/PIPELINE-template.md docs/PIPELINE.md
git rm -q docs/PIPELINE-template.md
pre-commit install
git add docs/PIPELINE.md
git commit -m "chore: PIPELINE 초기화"
git push
```

`docs/PIPELINE.md` 맨 위의 복사 안내 주석은 이때 지워도 되고, 나중에 Claude에게 지우라고 해도 됩니다.

- [ ] `.claude/hooks/block-dangerous.sh`에 실행 권한이 있는지 확인(`ls -l`에 `x`). 없으면 `chmod +x .claude/hooks/block-dangerous.sh`
- [ ] main 브랜치 보호: GitHub 저장소 Settings → Branches(또는 Rules)에서 PR 필수(승인 수 0), 관리자 포함 적용, 강제 푸시·삭제 금지. CI 통과 조건은 CI를 만든 뒤 추가
- [ ] `pre-commit autoupdate`는 최신 릴리스보다 낮은 버전으로 올릴 때가 있습니다. 실행했다면 gitleaks 릴리스 페이지의 최신 버전과 비교합니다

## 3. 프로젝트 도구 (템플릿에 이미 포함)

아래 도구는 템플릿 안에 들어 있어 새로 설치하지 않습니다. 있는지만 확인합니다.

- [ ] Spec Kit v1.4.5: `.specify/`와 스킬 `.claude/skills/speckit-*` 9개. 기획용(`/speckit-specify`, `/speckit-clarify`, `/speckit-checklist`)만 씁니다. 실행할 때 `uv`(`brew install uv`)가 필요합니다
- [ ] UI UX Pro Max v2.15.0: `.claude/skills/ui-ux-pro-max`
- [ ] Agency Agents 3개: `.claude/agents/`의 security-auditor(07), appsec-engineer(08), a11y-auditor(09). 출처는 `THIRD_PARTY_NOTICES.md`

이 폴더들은 `.claude/settings.json`에서 Claude의 수정이 막혀 있습니다. 업그레이드할 때만 아래 명령을 쓰고, 바뀐 내용을 읽은 뒤 PR로 올립니다.

```bash
# Spec Kit (uv 필요). 버전을 바꾸려면 @v1.4.5 부분을 바꿉니다
uvx --from git+https://github.com/github/spec-kit.git@v1.4.5 specify init --here --force --integration claude --script sh --non-interactive

# UI UX Pro Max
gh skill install nextlevelbuilder/ui-ux-pro-max-skill .claude/skills/ui-ux-pro-max --agent claude-code --scope project --pin v2.15.0
```

- Spec Kit은 버전마다 옵션과 폴더가 바뀝니다. 업그레이드 전에 빈 폴더에서 먼저 실행해 보고, `CLAUDE.md`의 "구조"·`docs/README.md`·`specs/README.md`와 맞는지 확인합니다.
- Agency Agents는 설치 스크립트(전역 `~/.claude/agents/`에 복사)를 쓰지 않습니다. 필요한 에이전트 파일만 내용을 읽고 `.claude/agents/`에 복사한 뒤, 프로젝트 규칙 머리말을 붙이고 `THIRD_PARTY_NOTICES.md`에 고지를 추가합니다. 에이전트를 추가하면 [에이전트 관리](agents.md)대로 함께 고칠 곳을 고칩니다.

### Trail-code (보류)
코드 지도·팀 지식 도구입니다. 전역 훅 5개를 설치하고, 결정을 "학습"으로 자동 저장해 결정 로그와 겹쳐서 보류했습니다. 3단계(구현 준비)에서 코드 뼈대가 생긴 뒤 다시 검토합니다. 그때는 아래처럼 사용 통계를 끄고 미리보기부터 합니다.

```bash
DO_NOT_TRACK=1 npm install -g @trailhq/trail-code
trail init --agents claude --dry-run
```

## 4. MCP 연결

`.mcp.json`에 Figma와 Playwright가 등록되어 있습니다.

- [ ] Figma: HTTP 방식(`https://mcp.figma.com/mcp`). 처음 사용할 때 Figma 계정으로 인증합니다. 좌석이 "View"면 파일 편집이 제한될 수 있으니 2단계(디자인) 전에 확인합니다
- [ ] Playwright: `npx @playwright/mcp@latest`. 설치된 Google Chrome을 쓰므로 브라우저 추가 설치가 필요 없습니다. 실행하면 `.playwright-mcp/` 폴더가 생깁니다(.gitignore에 포함)
- [ ] 데스크탑 앱과 별개로, 터미널 CLI(`claude mcp list`)에서는 두 서버가 "승인 대기"로 나옵니다. CLI로 쓸 때 처음 한 번 승인합니다
- [ ] 백엔드 작업을 시작할 때 DB MCP(개발 DB 전용), 배포 후 Sentry MCP 추가
- [ ] 켜 둔 MCP 서버가 5~6개를 넘지 않는지 확인(claude.ai 커넥터와 앱 기본 서버도 셉니다)

## 5. 동작 확인

- [ ] Claude Code에서 `.env` 파일을 읽으라고 시키면 훅이 "차단됨"으로 막는다(파일이 없어도 됨)
- [ ] 테스트 브랜치에서 가짜 시크릿을 커밋하면 gitleaks가 막는다. 확인 뒤 파일과 테스트 브랜치를 지운다
- [ ] 새 세션에서 `docs/PIPELINE.md를 읽고 현재 단계를 요약해 줘.`라고 하면 "0. 환경"이라고 답한다
- [ ] 새 세션의 에이전트 목록에 9개(planner, designer, frontend-dev, backend-dev, qa, reviewer, security-auditor, appsec-engineer, a11y-auditor)가 보인다

모두 통과하면 Claude에게 "0단계 완료"를 승인한다고 말합니다. Claude가 `docs/PIPELINE.md`의 0단계를 체크하고 현재 단계를 1. 기획으로 바꿉니다.
`< >`로 표시된 부분은 단계를 진행하면서 채웁니다.
