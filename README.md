[Discussions](https://github.com/aipictors/app/discussions)または[Issues](https://github.com/aipictors/app/issues)に自由に投稿できます。

- [Discussions](https://github.com/aipictors/app/discussions)
  → アプリのアイデアや質問など
- [Issues](https://github.com/aipictors/app/issues)
  → 不具合や改善など具体的な開発内容

Discord の「アプリ」カテゴリでも交流できます！

https://discord.gg/aipictors

## セットアップ

FVMを使用してFlutterのバージョンを管理しています。

```bash
# FVMをインストール（未インストールの場合）
$ dart pub global activate fvm

# プロジェクトで指定されたFlutterバージョンをインストール
$ fvm install
```

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

Flutterのバージョンを更新する場合はFVMを使用する。

```bash
# 新しいバージョンをインストールして切り替え
$ fvm use <version>

# 例: 3.40.0に更新
$ fvm use 3.40.0
```

`.fvmrc`が更新されるのでコミットする。

## パッケージの更新

たぶん。

```bash
$ flutter pub upgrade --tighten
```

## キャッシュ

```
$ rm -rf ~/flutter/bin/cache
$ rm -rf build
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
