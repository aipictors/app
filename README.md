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
$ npx get-graphql-schema http://localhost:3000/api > lib/schema.graphql
// $ npx get-graphql-schema https://subgraph-aipictors-sn4ve5jg4q-an.a.run.app/api -h 'secret=xwzkbm237trfs3y9j4j9cui8e2setaj4' > lib/schema.graphql
// $ npx get-graphql-schema https://federation-jjkihxkmtq-an.a.run.app > lib/schema.graphql
```

## ビルド

```
flutter build ios --release --dart-define-from-file=dart_defines/release_production.json
```