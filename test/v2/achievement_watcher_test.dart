import 'dart:async';

import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/v2/achievements/achievement_ui.dart';
import 'package:aipictors/v2/achievements/achievement_watcher.dart';
import 'package:aipictors/v2/achievements/achievements_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

UnlockedAchievement _a(String key, {int tier = 1, String? name}) => UnlockedAchievement(
      key: key,
      name: name ?? key,
      enName: name ?? key,
      description: '説明',
      enDescription: 'desc',
      tier: tier,
      isHidden: false,
      rewardCoins: 0,
    );

void main() {
  late StreamController<String?> auth;
  late List<bool> checks;
  late List<List<String>> seen;
  late List<AchievementCheckResult?> results;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    ConfigRepository.instance = await SharedPreferences.getInstance();
    AchievementBadge.loadImages = false;
    auth = StreamController<String?>.broadcast();
    checks = [];
    seen = [];
    results = [];
    AchievementWatcher.uidChanges = () => auth.stream;
    AchievementWatcher.checkAchievements = ({bool force = false}) async {
      checks.add(force);
      return results.isEmpty ? null : results.removeAt(0);
    };
    AchievementWatcher.markSeen = (keys) async => seen.add(keys);
    AchievementWatcher.loadSettings = () async => const AchievementSettings(isHiddenOnProfile: false, isUnlockNoticeOff: false);
  });

  tearDown(() => auth.close());

  Future<GoRouter> pump(WidgetTester tester) async {
    final router = GoRouter(routes: [
      GoRoute(path: '/', builder: (_, __) => const Scaffold(body: Text('home'))),
      GoRoute(path: '/achievements', builder: (_, __) => const Scaffold(body: Text('achievements page'))),
      GoRoute(path: '/works/create', builder: (_, __) => const Scaffold(body: Text('post'))),
    ]);
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        builder: (context, child) => AchievementWatcher(router: router, child: child!),
      ),
    ));
    return router;
  }

  testWidgets('開いたときに確かめ、達成したものを 1 件ずつ古い順に出して、見せたものを既読にする', (tester) async {
    // サーバーは新しい順に返す
    results.add(AchievementCheckResult(isInitialSync: false, unlocked: [_a('works-3', name: '新しい'), _a('works-1', name: '古い')]));
    await pump(tester);
    auth.add('u1');
    await tester.pump();
    await tester.pump();
    expect(checks, [false]);

    expect(find.text('古い'), findsOneWidget);
    expect(find.text('ほか 1 件'), findsOneWidget);
    expect(seen, [
      ['works-1'],
    ]);

    // 6 秒で消えて次が出る
    await tester.pump(const Duration(seconds: 6));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
    expect(find.text('古い'), findsNothing);
    expect(find.text('新しい'), findsOneWidget);
    expect(seen.last, ['works-3']);

    await tester.pump(const Duration(seconds: 7));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
    expect(find.text('新しい'), findsNothing);
  });

  testWidgets('押すと実績の画面へ', (tester) async {
    results.add(AchievementCheckResult(isInitialSync: false, unlocked: [_a('likes-given-100', tier: 3, name: '応援の輪')]));
    await pump(tester);
    auth.add('u1');
    await tester.pump();
    await tester.pump();
    await tester.tap(find.text('応援の輪'));
    await tester.pumpAndSettle();
    expect(find.text('achievements page'), findsOneWidget);
    expect(find.text('応援の輪'), findsNothing);
  });

  testWidgets('はじめての確認でまとめて達成したときは、1 枚にまとめて出す', (tester) async {
    results.add(AchievementCheckResult(isInitialSync: true, unlocked: [_a('works-1'), _a('works-3'), _a('likes-given-100', tier: 3, name: 'いちばん'), _a('followers-1')]));
    await pump(tester);
    auth.add('u1');
    await tester.pump();
    await tester.pump();
    expect(find.text('これまでの実績 4 個を達成しました！'), findsOneWidget);
    expect(find.text('いちばん上は「いちばん」'), findsOneWidget);
    expect(seen.single.toSet(), {'works-1', 'works-3', 'likes-given-100', 'followers-1'});
    await tester.pump(const Duration(seconds: 7));
    await tester.pump(const Duration(milliseconds: 400));
  });

  testWidgets('知らせない設定なら出さずに既読にだけする', (tester) async {
    AchievementWatcher.loadSettings = () async => const AchievementSettings(isHiddenOnProfile: false, isUnlockNoticeOff: true);
    results.add(AchievementCheckResult(isInitialSync: false, unlocked: [_a('works-1', name: '古い')]));
    await pump(tester);
    auth.add('u1');
    await tester.pump();
    await tester.pump();
    expect(find.text('古い'), findsNothing);
    expect(seen, [
      ['works-1'],
    ]);
  });

  testWidgets('いいねなどのあとは少し待ってから、間隔をあけずに確かめる。画面の移動は 10 分に 1 回まで', (tester) async {
    final router = await pump(tester);
    auth.add('u1');
    await tester.pump();
    expect(checks, [false]);

    // 10 分たっていないので、画面を移っても確かめない
    router.push('/achievements');
    await tester.pumpAndSettle();
    expect(checks, [false]);

    AchievementsApi.requestCheck();
    AchievementsApi.requestCheck();
    await tester.pump(const Duration(milliseconds: 1000));
    expect(checks, [false]);
    await tester.pump(const Duration(milliseconds: 600));
    expect(checks, [false, true]);
  });

  testWidgets('投稿の画面から移ったときはすぐ確かめる', (tester) async {
    final router = await pump(tester);
    auth.add('u1');
    await tester.pump();
    router.push('/works/create');
    await tester.pumpAndSettle();
    router.pop();
    await tester.pumpAndSettle();
    expect(checks, [false, true]);
  });

  test('バッジ画像は Web と同じ場所。未達成の隠し実績と他の人の隠し実績は「?」', () {
    expect(achievementBadgeUrl('works-1', isHidden: false, isUnlocked: false), 'https://www.aipictors.com/achievements/badges/works-1.svg?v=2');
    expect(achievementBadgeUrl('special-night-owl', isHidden: true, isUnlocked: false), 'https://www.aipictors.com/achievements/badges/hidden.svg?v=2');
    expect(achievementBadgeUrl('special-night-owl', isHidden: true, isUnlocked: true), 'https://www.aipictors.com/achievements/badges/special-night-owl.svg?v=2');
    expect(achievementBadgeUrl('hidden-3', isHidden: false, isUnlocked: true), 'https://www.aipictors.com/achievements/badges/hidden.svg?v=2');
  });

  test('レベルの段階は Web と同じ幅', () {
    expect(achievementLevelTier(1).tier.key, 'sprout');
    expect(achievementLevelTier(4).tier.key, 'sprout');
    expect(achievementLevelTier(5).tier.key, 'bronze');
    expect(achievementLevelTier(19).next?.key, 'sapphire');
    expect(achievementLevelTier(59).tier.key, 'diamond');
    expect(achievementLevelTier(80).tier.key, 'legend');
    expect(achievementLevelTier(80).next, isNull);
    expect(achievementTier(99).ja, 'ブロンズ');
    expect(achievementTier(7).ja, '神話');
  });
}
