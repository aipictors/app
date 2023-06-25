A new Flutter project.

## はじめに

コードを生成する。

```bash
$ dart run build_runner build
```

or

```bash
$ flutter pub run build_runner build
```

監視する場合は

```bash
$ dart run build_runner watch
```

## GraphQL

更新があった場合は取得する。

```
$ npx get-graphql-schema https://federation-jjkihxkmtq-an.a.run.app > schema.graphql
```

## ビルド

```
flutter build ios --release --dart-define-from-file=dart_defines/release_production.json
```