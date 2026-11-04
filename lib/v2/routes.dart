// 機能ごとの画面の登録。追加は 2 行だけ（import と一覧）。README.md を参照。
// このファイルは .gitattributes で merge=union にしてあり、複数の作業で行を足しても衝突しない。
import 'package:aipictors/v2/achievements/achievements_routes.dart';
import 'package:aipictors/v2/debug/debug_routes.dart';
import 'package:aipictors/v2/explore/explore_routes.dart';
import 'package:aipictors/v2/my/my_routes.dart';
import 'package:aipictors/v2/notifications/notifications_routes.dart';
import 'package:aipictors/v2/plans/plans_routes.dart';
import 'package:aipictors/v2/settings/settings_routes.dart';
import 'package:aipictors/v2/support/support_routes.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> v2Routes = [
  ...achievementsRoutes,
  ...debugRoutes,
  ...exploreRoutes,
  ...myRoutes,
  ...notificationsRoutes,
  ...plansRoutes,
  ...settingsRoutes,
  ...supportRoutes,
];
