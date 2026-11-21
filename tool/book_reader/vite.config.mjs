import path from "node:path"
import tailwindcss from "@tailwindcss/vite"
import { defineConfig } from "vite"

export default defineConfig({
  root: import.meta.dirname,
  plugins: [tailwindcss()],
  resolve: {
    alias: [
      { find: "~/hooks/use-translation", replacement: path.resolve(import.meta.dirname, "src/shims/use-translation.ts") },
      { find: /^~\//, replacement: `${path.resolve(import.meta.dirname, "src/app")}/` },
    ],
  },
  esbuild: { jsx: "automatic" },
  define: { "process.env.NODE_ENV": JSON.stringify("production") },
  build: {
    outDir: "dist",
    emptyOutDir: true,
    target: ["es2019", "safari13"],
    cssTarget: ["safari13"],
    modulePreload: false,
    assetsInlineLimit: 100_000_000,
    rollupOptions: { output: { inlineDynamicImports: true } },
  },
})
