# lib/v2（新しい画面）

## 画面を足す

1. `lib/v2/<feature>/<feature>_screen.dart` を作る。
2. `lib/v2/<feature>/<feature>_routes.dart` に `final List<RouteBase> <feature>Routes = [GoRoute(...)];` を書く。
3. `lib/v2/routes.dart` に import と `...<feature>Routes,` の 2 行を足す。

`lib/router.dart` は触らない。`routes.dart` は merge=union なので、複数の作業で行を足しても衝突しない。
旧画面と同じパスを置き換えるときは、`v2Routes` が先に一致するのでそのまま書けばよい。

## 移動

`core/nav.dart` の `Nav.work / user / tag / search / login / plans` を使う。ログインが要る操作は先に `if (!Nav.requireLogin(context)) return;`。
新しい行き先は `Nav` に足さず、機能の routes ファイルに小さな関数を置く（`nav.dart` の衝突を防ぐ）。

## API

`core/api.dart` の `Api.query(doc, variables:, cacheFor:)` と `Api.mutate(doc, variables:)`。結果は Map で、`j.str / integer / boolean / obj / list` で読む。失敗は `ApiException`（`message` をそのまま画面に出せる）。

- ユーザーを取るときは `user { $userSummaryFields }`（`core/models.dart`）。枠・公式マークはこれで揃う。
- 作品一覧は `workCardFields` と `WorkSummary.listFrom`（R18 はここで除く）。
- ページ送りは `core/paged.dart` の `PagedController`。

## 共通部品

| 部品 | import | 使い方 |
| --- | --- | --- |
| `UserAvatar` | `widgets/user_avatar.dart` | `UserAvatar.summary(user, size: 40, tappable: true)` / `UserAvatar.json(map)`。プロフィールだけ `animateDecoration: true` |
| `UserNameRow` | `widgets/user_name_row.dart` | `UserNameRow.summary(user, style: ...)`。幅が決まった場所に置く |
| `StatusBalloon` | `widgets/status_balloon.dart` | `StatusBalloon(user.statusText!)` |
| `Skeleton` `SkeletonList` `SkeletonGrid` | `widgets/common.dart` | 読み込み中。本物と同じ高さにしてずれを防ぐ。sliver 用は `sliver: true` |
| `StateView.empty` `StateView.error` | 同上 | 空・エラー + 再読み込み |
| `SectionHeader` `PillTabs` `Badge2` `Pressable` | 同上 | 見出し、タブ、ラベル、押したときの反応 |
| `AppRefresh` | 同上 | 引っ張って更新 |
| `showConfirmSheet` | 同上 | `if (await showConfirmSheet(context, title: '...', destructive: true)) ...` |
| `context.toast('...')` | `core/design.dart` | `error: true` で赤 |
| `GradientButton` `PrimaryButton` `SecondaryButton` `AppChip` | `widgets/common.dart` | 画面で一番目立たせる 1 つだけ Gradient |
| `ContentWidth` | 同上 | iPad で広がりすぎるフォームや文章を収める |

デバッグビルドで `--dart-define=debugRoute=/debug/widgets` を付けると見本が開く。

## 作業ツリーの準備

新しい worktree には git に入っていないものをメインのチェックアウトからコピーする。

- 生成コード: `git status --short --ignored lib` の `!!`（`__generated__` など。無いと `flutter build` が失敗する）
- Android の署名: `android/key.properties`（コミットしない）

シミュレーターは `~/Documents/aipictors-app-1.7/sim.sh <名前> [タブ] [ルート]`。worktree は `WT=`、端末は `UDID=`、ダークは `APPEARANCE=dark` で変える。

## 決まりごと

- 余白・角丸・時間は `Ds`、色は `context.cs` / `context.muted` / `context.hairline` / `context.surfaceCard`。色を直接書かない（ダークモードが崩れる）。
- `CircleAvatar` や `Avatar` を自作せず、ユーザーのアイコンは必ず `UserAvatar`。
- App Store / Play の決まり: デジタル商品について Stripe や Web 購入へのリンク・ボタンをアプリに置かない。R18 はモバイルでは出さない。通報・ブロック・ミュートと退会を残す。
- テストで他の人のデータを変える mutation を本番に送らない。審査用アカウントは読み取りと自分の設定だけ。秘密の値はコミットしない（公開リポジトリ）。
- `flutter analyze` にエラーを増やさない。コメントとコミットメッセージは日本語で短く。
