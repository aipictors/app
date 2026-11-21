import { Editor } from "@tiptap/core"
import { createRoot, type Root } from "react-dom/client"
import { BookReader } from "~/components/book-reader/book-reader"
import { createWorkMarkdownExtensions } from "~/components/book-reader/work-markdown-extensions"
import { keepMarkdownIndent } from "~/utils/keep-markdown-indent"
import { repairMarkdownHardBreaks } from "~/utils/repair-markdown-hard-breaks"
import "./main.css"

/**
 * アプリに入れて使う「本のように読む」画面。Web の /posts/:id/reader と同じ部品
 * （app/components/book-reader）を 1 つの HTML にまとめたもの。
 * 作品の情報と本文の Markdown はアプリから window.AipictorsReader.open で受け取る
 */

type OpenPayload = {
  md: string
  title: string
  authorName?: string
  coverUrl?: string
  foreword?: string
  workId: string
  workType: "NOVEL" | "COLUMN"
  lang?: string
}

const postToApp = (message: string) => {
  const channel = (
    window as unknown as {
      AipictorsApp?: { postMessage?: (value: string) => void }
    }
  ).AipictorsApp
  try {
    channel?.postMessage?.(message)
  } catch {
    // アプリの外では何もしない
  }
}

/** 本文の Markdown を、作品ページと同じ tiptap の設定で HTML にする */
const toReaderHtml = (md: string) => {
  const editor = new Editor({
    editable: false,
    extensions: createWorkMarkdownExtensions(),
    content: keepMarkdownIndent(repairMarkdownHardBreaks(md)),
  })
  const html = editor.getHTML()
  editor.destroy()
  return html
}

let root: Root | null = null

const open = (payload: OpenPayload) => {
  ;(window as unknown as { __aipLang?: string }).__aipLang = payload.lang
  const html = toReaderHtml(payload.md ?? "")
  const container = document.getElementById("root")
  if (container === null) return
  root?.unmount()
  root = createRoot(container)
  root.render(
    <BookReader
      key={payload.workId}
      html={html}
      title={payload.title}
      authorName={payload.authorName || undefined}
      coverUrl={payload.coverUrl || undefined}
      foreword={payload.foreword || undefined}
      workId={payload.workId}
      workType={payload.workType === "COLUMN" ? "COLUMN" : "NOVEL"}
      onClose={() => postToApp("close")}
    />,
  )
  requestAnimationFrame(() => postToApp("ready"))
}

/**
 * 折りたたみ端末のヒンジ（Flutter の displayFeatures）を Viewport Segments API の形で渡す。
 * 読書画面は window.viewportSegments を見て見開きの間を空ける
 */
const setSegments = (segments: { x: number; y: number; width: number; height: number }[] | null) => {
  Object.defineProperty(window, "viewportSegments", {
    configurable: true,
    value: segments && segments.length === 2 ? segments : null,
  })
  window.dispatchEvent(new Event("aipictors-segments"))
}

/** ノッチ・ホームバーの幅（WebView では env(safe-area-inset-*) が 0 になる端末があるのでアプリから渡す） */
const setInsets = (insets: { top: number; right: number; bottom: number; left: number }) => {
  const style = document.documentElement.style
  for (const side of ["top", "right", "bottom", "left"] as const) {
    style.setProperty(`--app-safe-${side}`, `${Math.max(0, insets[side] ?? 0)}px`)
  }
  window.dispatchEvent(new Event("aipictors-segments"))
}

;(window as unknown as Record<string, unknown>).AipictorsReader = {
  open,
  setSegments,
  setInsets,
}
postToApp("loaded")
