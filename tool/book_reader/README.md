# 本のように読む（アプリに入れる読書画面）

`assets/book_reader/reader.html` を作る。Web（aipictors/aipictors）の
`app/components/book-reader`（縦書き・見開き・上下 2 段・しおり・書体・配色）をそのまま使い、
React・tiptap・Tailwind ごと 1 つの HTML にまとめる。アプリはこれを WebView に文字列で読み込み
（起点は https://www.aipictors.com/ にして、しおり・設定を Web の読書画面と共有する）、
作品の情報と本文の Markdown を `window.AipictorsReader.open({...})` で渡す（`lib/v2/work/book_reader_screen.dart`）。

```sh
tool/book_reader/build.sh        # FRONT=Web のチェックアウト（node_modules を使う）、REF=使うコミット（既定 origin/main）
```

アプリ用に Web の部品を 3 か所だけ書き換える（build.sh の perl）:

- `env(safe-area-inset-*)` → アプリが渡す `--app-safe-*` を優先（WebView では env が 0 になる端末がある）
- 画面の高さをノッチ・ホームバーの余白を除いて測る（含めるとページが上下のバーの下まで伸びて見切れる）
- `aipictors-segments` イベントで測り直す（折りたたみ・2 画面のヒンジをアプリから `setSegments` で渡す）

Web の読書画面を直したら、このスクリプトで作り直してアプリに入れる。
