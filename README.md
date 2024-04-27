[Discussions](https://github.com/aipictors/app/discussions)または[Issues](https://github.com/aipictors/app/issues)に自由に投稿できます。

- [Discussions](https://github.com/aipictors/app/discussions)
  → アプリのアイデアや質問など
- [Issues](https://github.com/aipictors/app/issues)
  → 不具合や改善など具体的な開発内容

Discord の「アプリ」カテゴリでも交流できます！

https://discord.gg/aipictors

## コード生成

必要な場合はコードを生成する。

```bash
$ dart run build_runner build
```

監視する場合は

```bash
$ dart run build_runner watch
```

## 開発

VSCodeのRunからDevelopまたはProductionを選択して実行する。

| モード | 値 |
| -- | -- |
| 開発モード | Develop |
| リリースモード | Production |

## アップデート

定期的に Flutter を更新する必要がある。

```bash
$ flutter channel stable
$ flutter upgrade
```

## パッケージの更新

たぶん。

```bash
$ flutter pub upgrade --tighten
```

## GraphQL

更新があった場合は取得する。

```bash
$ bunx get-graphql-schema "https://aipics.fly.dev" > lib/schema.graphql
```

https://aipics.fly.dev

## ツール

モジュールをインストールする。

```bash
$ bun i
```

翻訳を追加する。

```bash
$ bun run tools/i18n
```
