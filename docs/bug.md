# 不具合

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
