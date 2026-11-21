// dist の HTML に JS と CSS を埋め込んで 1 つのファイルにする（アプリの WebView に文字列で渡すため）
import fs from "node:fs"
import path from "node:path"

const [input, output, rev] = process.argv.slice(2)
const dir = path.dirname(input)
let html = fs.readFileSync(input, "utf8")
html = html.replace(/<link rel="stylesheet"[^>]*href="([^"]+)"[^>]*>/g, (_, href) =>
  `<style>${fs.readFileSync(path.join(dir, href), "utf8")}</style>`,
)
html = html.replace(/<script type="module"[^>]*src="([^"]+)"[^>]*><\/script>/g, (_, src) => {
  const js = fs.readFileSync(path.join(dir, src), "utf8").replace(/<\/script/gi, "<\\/script")
  // body の最後で読む（#root ができてから）
  return `\u0000${js}\u0000`
})
const scripts = []
html = html.replace(/\u0000([\s\S]*?)\u0000/g, (_, js) => {
  scripts.push(js)
  return ""
})
html = html.replace("</body>", () => `${scripts.map((js) => `<script type="module">${js}</script>`).join("")}</body>`)
html = html.replace("<head>", () => `<head>\n    <!-- aipictors/aipictors ${rev} app/components/book-reader -->`)
fs.mkdirSync(path.dirname(output), { recursive: true })
fs.writeFileSync(output, html)
