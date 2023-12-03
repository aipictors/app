[Discussions](https://github.com/aipictors/app/discussions)または[Issues](https://github.com/aipictors/app/issues)に自由に投稿できます。

- [Discussions](https://github.com/aipictors/app/discussions)
→ アプリのアイデアや質問など
- [Issues](https://github.com/aipictors/app/issues)
→ 不具合や改善など具体的な開発内容

Discordの「アプリ」カテゴリでも交流できます！

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

## アップデート

定期的にFlutterを更新する必要がある。

```
$ flutter channel stable
$ flutter upgrade
```

## 不具合

以下の不具合が確認されている。

- https://github.com/rrousselGit/riverpod/issues/2273

殆どの場合はこれで解決する。

```
$ flutter clean
```

Flutterのビルドでエラーが発生する場合は以下のバージョンを試す。

```
$ ruby --version
ruby 3.1.3p185 (2022-11-24 revision 1a6b16756e) [arm64-darwin22]
$ gem --version
3.3.26
$ pod --version
1.12.1
$ flutter --version
Flutter 3.10.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 796c8ef792 (4 weeks ago) • 2023-06-13 15:51:02 -0700
Engine • revision 45f6e00911
Tools • Dart 3.0.5 • DevTools 2.23.1
```

## GraphQL

更新があった場合は取得する。

```
$ rover graph introspect https://router-6ouzjmdzha-an.a.run.app -o lib/schema.graphql
```

https://www.apollographql.com/docs/rover/commands/supergraphs

## ビルド

アイコンを生成する。

```
$ flutter pub run flutter_launcher_icons:main
```

### ビルド（iOS）

```
$ flutter build ios --release --dart-define-from-file=dart_defines/production.json
```

### ビルド（Android）

```
$ flutter build appbundle --dart-define-from-file=dart_defines/production.json
```

Apkファイルの場合は以下。

```
$ flutter build apk --dart-define-from-file=dart_defines/production.json
```
