# 시안 (HTML 목업)

> 대상: 공용
> 작성: Agent 02 디자인(designer) · 결정: 사람(디자인 승인)

이 폴더의 HTML이 **시안의 원본**입니다. 외부 채널(Stitch, Figma)에 올린 이미지는 공유·보관용 사본입니다.

## 폴더 구조
```text
docs/design/mockups/
├─ README.md          이 문서
├─ tokens.css         디자인 토큰을 CSS 변수로 옮긴 것 (값의 기준은 docs/design/README.md 토큰 표)
├─ S-001.html         화면 ID별 시안 하나 (화면 ID는 docs/design/ux.md 화면 목록)
├─ stitch/            Stitch에서 내려받은 탐색용 결과 (참고 자료, 원본 아님)
└─ exports/           결정된 시안의 PNG (S-001-desktop-20261127.png 처럼 화면 ID-크기-날짜)
```

## 흐름
1. **탐색 (선택)**: 사람이 Stitch(stitch.withgoogle.com, 무료)에서 화면 아이디어를 여러 개 만들어 보고, 마음에 드는 결과의 HTML·이미지를 `stitch/`에 넣습니다. Stitch로 만들면 Claude 토큰이 들지 않습니다.
2. **와이어프레임**: designer가 화면 상세(docs/design/ux.md)를 바탕으로 회색 상자 수준의 HTML을 만듭니다. 화면 구성과 흐름을 먼저 맞춥니다.
3. **시안 다듬기**: 사람이 브라우저로 HTML을 열어 보고 의견을 주면, designer가 수정합니다. 배치를 크게 바꿀 때만 다시 생성합니다.
4. **결정**: 사람이 시안을 결정했다고 말하면 designer가 docs/design/README.md의 화면별 상태를 "시안 완료"로 적습니다. "승인"은 사람만 바꿉니다.
5. **내보내기**: designer가 Playwright로 결정된 HTML을 PNG로 저장합니다(`exports/`, 데스크톱 1440px·모바일 375px). Playwright MCP는 `file://` 주소를 막으므로 로컬 서버로 엽니다(2026-11-27 확인).
   - 서버: `python3 -m http.server 8765 --bind 127.0.0.1` (`docs/design/mockups/`에서, 백그라운드로 실행하고 끝나면 종료)
   - 열기: `http://127.0.0.1:8765/S-001.html` → 창 크기 조절 → 전체 페이지 스크린샷
   - 저장 이름은 저장소 기준 상대 경로로 지정합니다(`docs/design/mockups/exports/S-001-desktop-20261127.png`). 저장소 밖 경로는 Playwright MCP가 거부합니다.
6. **업로드**: PNG를 외부 채널(Stitch 또는 Figma)에 올립니다. 외부 전송이므로 사람이 직접 올리거나, 사람이 승인한 뒤에만 Claude가 올립니다.
7. **추가 요청**: 다음 수정은 항상 이 폴더의 HTML에서 시작해 3~6을 반복합니다. 외부 채널의 결과는 사람이 거기서 직접 고쳤을 때만 다시 읽습니다. 의견(댓글)은 이미지보다 글로 가져옵니다.

## 작성 규칙
- 색·글꼴·간격·모서리·그림자는 `tokens.css`의 CSS 변수만 씁니다. HTML에 값을 직접 쓰지 않습니다.
- 토큰 값은 docs/design/README.md 토큰 표가 기준입니다. 표를 바꾸면 `tokens.css`도 같이 바꿉니다.
- 화면 하나에 HTML 파일 하나. 외부 라이브러리·스크립트를 불러오지 않고 파일만 열어도 보이게 만듭니다.
- 상태(기본·로딩·빈 상태·에러·권한 없음)는 같은 파일 안에 구역으로 나눠 보여 줍니다.
- 시안 HTML은 앱 코드가 아닙니다. 구현은 frontend-dev가 apps/web에서 tech-stack.md 기준으로 새로 합니다.
- `exports/`에는 화면별 최종 PNG만 둡니다. 새로 내보내면 같은 화면의 이전 PNG는 지웁니다(이전 판은 git 이력에 남음). 저장소가 커지는 것을 막기 위해서입니다.
- Stitch 결과(`stitch/`)의 스타일을 그대로 확정하지 않습니다. designer가 검토해 토큰 표와 시안에 반영합니다.

## 토큰 아끼기
| 하는 일 | 비용 (추정) | 방법 |
|---|---|---|
| 화면 새로 생성 | 화면당 수천 토큰 | 와이어프레임부터, 다시 생성은 배치가 크게 바뀔 때만 |
| 부분 수정 | 수백 토큰 | 파일 전체를 다시 쓰지 않고 바뀐 곳만 고침 |
| 색·간격 변경 | 몇 줄 | `tokens.css`만 고침 |
| 스크린샷 확인 | 장당 1~2천 토큰 | 사람이 브라우저로 보고, Claude는 필요할 때만 |
| 외부 채널 다시 읽기 | 화면당 1만 토큰 이상 | 사람이 외부에서 직접 고쳤을 때만 |

## Figma를 쓸 때 (선택, 유료 좌석 권장)
- 무료(Starter)·View 좌석은 Figma MCP 읽기 도구가 월 20회로 제한됩니다. 시안을 Figma에서 다루려면 Professional 이상의 Full 또는 Dev 좌석을 검토합니다.
- Figma MCP의 코드 → 디자인 기능(`generate_figma_design`)을 쓰면 이미지 대신 편집 가능한 레이어로 올릴 수 있습니다(좌석 권한 필요, 미확인).
- Figma를 쓰면 docs/design/README.md "시안" 칸에 파일 링크를, 화면별 상태 표에 프레임 링크를 적습니다.
