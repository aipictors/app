#!/bin/bash
# アプリに入れる「本のように読む」画面（assets/book_reader/reader.html）を作る。
# Web（aipictors/aipictors の origin/main）の app/components/book-reader をそのまま使い、
# アプリ用に 2 か所だけ書き換える（ノッチ・ホームバーの幅とヒンジをアプリから受け取る）
set -euo pipefail
cd "$(dirname "$0")"
FRONT=${FRONT:-$HOME/Documents/GitHub/aipictors/aipictors}
APP=${APP:-$(cd ../.. && pwd)}
REF=${REF:-origin/main}

git -C "$FRONT" fetch -q origin main
rm -rf src/app && mkdir -p src/app
git -C "$FRONT" archive "$REF" app/components/book-reader app/utils/keep-markdown-indent.ts app/utils/repair-markdown-hard-breaks.ts | tar -x -C src
rm -f src/app/components/book-reader/*.test.ts
# env(safe-area-inset-*) はアプリが渡す値を優先する
perl -pi -e 's/env\(safe-area-inset-(top|right|bottom|left)\)/var(--app-safe-$1, env(safe-area-inset-$1))/g' src/app/components/book-reader/*.ts*
# ヒンジ・余白が変わったら画面の大きさを測り直す
perl -0pi -e 's/(const observer = new ResizeObserver\(update\)\n\s*observer\.observe\(element\)\n)(\s*)return \(\) => observer\.disconnect\(\)/$1$2window.addEventListener("aipictors-segments", update)\n$2return () => {\n$2  observer.disconnect()\n$2  window.removeEventListener("aipictors-segments", update)\n$2}/' src/app/components/book-reader/book-reader.tsx
# 画面の高さはノッチ・ホームバーの余白（padding）を除いて測る（含めるとページがバーの下まで伸びて上下が見切れる）
perl -pi -e 's/setStage\(\{ width: element\.clientWidth, height: element\.clientHeight \}\)/const box = window.getComputedStyle(element)\n      setStage({\n        width: element.clientWidth,\n        height: element.clientHeight - (Number.parseFloat(box.paddingTop) || 0) - (Number.parseFloat(box.paddingBottom) || 0),\n      })/' src/app/components/book-reader/book-reader.tsx
grep -q 'box.paddingTop' src/app/components/book-reader/book-reader.tsx || { echo "patch failed: stage height"; exit 1; }
grep -q 'aipictors-segments' src/app/components/book-reader/book-reader.tsx || { echo "patch failed: segments"; exit 1; }
grep -q 'app-safe-top' src/app/components/book-reader/book-reader.tsx || { echo "patch failed: insets"; exit 1; }

ln -sfn "$FRONT/node_modules" node_modules
"$FRONT/node_modules/.bin/vite" build --logLevel warn
node inline.mjs dist/index.html "$APP/assets/book_reader/reader.html" "$(git -C "$FRONT" rev-parse --short "$REF")"
ls -la "$APP/assets/book_reader/reader.html"
