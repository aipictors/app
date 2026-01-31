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

# 指示に従い、fvmをパスに追加
$ export PATH="$PATH":"$HOME/.pub-cache/bin"

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

## ソーシャルログイン（Google / X(Twitter)）

Flutter側の実装は以下のフローです。

1. Firebase Auth で Google / X(Twitter) にサインイン
2. Firebase ID Token を `Authorization: Bearer <token>` に載せて GraphQL を呼ぶ
3. `isInitializedUserProfile` が `false` の場合はプロフィール初期設定へ遷移
4. 初期設定画面で `updateUserProfile` を実行して完了

関連コード:

- ログインUI: [lib/features/home/hello_screen.dart](lib/features/home/hello_screen.dart)
- Googleログイン: [lib/features/login/functions/login_with_google.dart](lib/features/login/functions/login_with_google.dart)
- X(Twitter)ログイン: [lib/features/login/functions/login_with_twitter.dart](lib/features/login/functions/login_with_twitter.dart)
- 初期化判定: [lib/features/login/functions/is_initialized_user_profile.dart](lib/features/login/functions/is_initialized_user_profile.dart)
- プロフィール初期設定画面: [lib/features/login/profile_setup_screen.dart](lib/features/login/profile_setup_screen.dart)

Firebase Console 側の設定（必須）:

- Authentication → Sign-in method で **Google** と **Twitter(X)** を有効化
- Android: Firebaseプロジェクトにアプリを登録し、`SHA-1/SHA-256` を登録（Googleログインで必須）
- iOS: `REVERSED_CLIENT_ID` のURL Schemeが設定されていること（Googleログインで必須）
- Twitter(X): API Key / API Secret を Firebase に設定（X Developer Portal 側のアプリ作成が必要）

※ Twitter(X) はプロジェクトごとにキーが異なるため、このリポジトリには値を同梱していません。

## ツール

モジュールをインストールする。

```bash
$ bun i
```

翻訳を追加する。

```bash
$ bun run tools/i18n
```
