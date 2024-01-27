
# ビルド

アイコンを生成する。

```
$ flutter pub run flutter_launcher_icons:main
```

## ビルド（iOS）

```
$ flutter build ios --release --dart-define-from-file=dart_defines/production.json
```

## ビルド（Android）

```
$ flutter build appbundle --dart-define-from-file=dart_defines/production.json
```

Apk ファイルの場合は以下。

```
$ flutter build apk --dart-define-from-file=dart_defines/production.json
```
