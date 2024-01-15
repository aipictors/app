import { defineConfig } from "vitepress"
import { generateSidebarItems } from "./utils/generate-sidebar-items"

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Aipictors",
  description: "A VitePress Site",
  themeConfig: {
    sidebar: [
      {
        text: "開発メモ",
        items: generateSidebarItems("docs"),
      },
      {
        text: "アプリ",
        items: generateSidebarItems("lib"),
      },
    ],
    socialLinks: [
      { icon: "github", link: "https://github.com/aipictors/app" },
    ],
  },
})
