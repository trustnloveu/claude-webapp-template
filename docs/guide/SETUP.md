# 템플릿 사용법

> 대상: 사람

「Claude 개발 환경 설계안」과 「개발 파이프라인 가이드」의 0단계(환경)를 이 순서로 진행합니다.
모든 설치 명령은 실행 직전에 각 저장소 README에서 최신 명령인지 다시 확인합니다.
외부 스킬·에이전트·MCP는 설치 전에 내용(`SKILL.md`, 에이전트 파일)을 읽습니다.

## 1. 전역 도구 (PC에 한 번만)

Claude Code 세션 안에서 실행합니다.

```text
/plugin install superpowers@claude-plugins-official
/plugin marketplace add cathrynlavery/diagram-design
/plugin install diagram-design@diagram-design
/plugin marketplace add blader/humanizer
```

터미널에서 실행합니다.

```bash
# Context7 MCP (라이브러리 최신 문서 참조) — 사용자 범위로 등록
claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp

# ccusage (토큰 사용량 확인)
npx ccusage@latest
```

- [ ] 전역 `~/.claude/CLAUDE.md`에 개인 규칙 작성(응답 언어, 커밋 스타일, 선호 스택)
- [ ] 상태줄에 컨텍스트 사용률 표시(ccstatusline 등)

## 2. 저장소 만들기

```bash
cp -R webapp-template <프로젝트-이름>
cd <프로젝트-이름>
git init
chmod +x .claude/hooks/block-dangerous.sh
pip install pre-commit && pre-commit install
pre-commit autoupdate
```

- [ ] GitHub에 비공개 저장소를 만들고 푸시
- [ ] main 브랜치 보호(PR 필수, CI 통과 필수) 설정

## 3. 프로젝트 도구 (저장소 안에서)

```bash
# Trail-code: 코드 지도와 팀 지식
npm install -g @trailhq/trail-code
trail init --agents claude

# Spec Kit: 스펙·계획 문서 (아래 "Spec Kit 확인"을 먼저 하세요)
uvx --from git+https://github.com/github/spec-kit.git specify init --here --integration claude

# UI UX Pro Max: 프론트엔드 UI·UX 규칙
npx skills add https://github.com/nextlevelbuilder/ui-ux-pro-max-skill --skill ui-ux-pro-max

# Agency Agents: 필요한 부서만 (부서 이름은 저장소에서 확인)
git clone https://github.com/msitarzewski/agency-agents /tmp/agency-agents
/tmp/agency-agents/scripts/install.sh --tool claude-code --division <부서>
```

Agency Agents 설치 스크립트는 기본적으로 `~/.claude/agents/`(전역)에 복사합니다.
이 프로젝트에서만 쓰려면 필요한 에이전트 파일을 `.claude/agents/`로 옮깁니다.

### Spec Kit 확인 (처음 한 번)
Spec Kit은 버전에 따라 옵션과 폴더 구조가 바뀝니다. 프로젝트에 설치하기 전에 빈 폴더에서 먼저 확인합니다.

```bash
mkdir /tmp/speckit-check && cd /tmp/speckit-check && git init
uvx --from git+https://github.com/github/spec-kit.git specify init --here --integration claude
```

- [ ] 옵션 이름 확인: `--integration`이 오류를 내면 `specify init --help`로 현재 옵션을 확인합니다(예전 버전은 `--ai`).
- [ ] 폴더 확인: `.specify/`(설정)와 `.claude/commands/`(명령)가 생기는지, 첫 스펙을 만들면 `specs/001-.../`에 생기는지 확인합니다.
- [ ] `.claude/commands/`에 이미 있는 `/refine`, `/plan-work`와 이름이 겹치는 명령이 없는지 확인합니다.
- [ ] 위치나 이름이 다르면 `CLAUDE.md`의 "구조", `docs/README.md`, `specs/README.md`를 실제 위치에 맞게 고칩니다.

확인이 끝나면 테스트 폴더를 지우고 프로젝트 폴더에서 위 init 명령을 실행합니다.

## 4. MCP 연결

`.mcp.json`에 Playwright와 Figma가 등록되어 있습니다.

- [ ] Figma: 처음 사용할 때 Figma 계정 인증. 연결 주소와 방식은 Figma 공식 문서에서 확인
- [ ] Playwright: 처음 실행 시 브라우저 설치가 필요할 수 있음
- [ ] 백엔드 작업을 시작할 때 DB MCP(개발 DB 전용), 배포 후 Sentry MCP 추가
- [ ] 켜 둔 MCP 서버가 5~6개를 넘지 않는지 확인

## 5. 동작 확인

- [ ] Claude Code에서 `cat .env`를 시키면 훅이 차단한다
- [ ] 가짜 시크릿을 커밋하면 gitleaks가 막는다
- [ ] 새 세션에서 `docs/PIPELINE.md를 읽고 현재 단계를 요약해 줘.`라고 하면 "0단계"라고 답한다

모두 통과하면 `docs/PIPELINE.md`의 0단계를 체크하고 1단계(아이디어)로 넘어갑니다.
`< >`로 표시된 부분은 단계를 진행하면서 채웁니다.
