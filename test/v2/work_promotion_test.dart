import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/work/work_promotion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _pumpSheet(WidgetTester tester, {int premium = 1200, List<ActiveWorkPromotion> active = const []}) async {
  await tester.binding.setSurfaceSize(const Size(430, 1400));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: WorkPromotionSheet(
        workId: '1',
        title: '夕焼けの丘',
        imageUrl: null,
        userName: 'あいぴく',
        userIconUrl: null,
        sample: WorkPromotionSample(
          status: WorkPromotionStatus(plan: const WorkPromotionPlan(), active: active),
          balance: CoinSummary(free: 50, premium: premium),
        ),
        onPurchased: (_) {},
      ),
    ),
  ));
  await tester.pump();
}

void main() {
  group('WorkPromotionSlotState（Web の toWorkPromotionSlotState と同じ）', () {
    const active = [ActiveWorkPromotion(slot: WorkPromotionSlot.general, workId: '1', endsAt: 100)];

    test('枠が空いていれば買える', () {
      expect(WorkPromotionSlotState.of(slot: WorkPromotionSlot.general, workId: '1', active: const []).kind, WorkPromotionSlotKind.available);
    });

    test('同じ枠でこの作品・別の作品が宣伝中かを分ける', () {
      final mine = WorkPromotionSlotState.of(slot: WorkPromotionSlot.general, workId: '1', active: active);
      expect(mine.kind, WorkPromotionSlotKind.thisWork);
      expect(mine.endsAt, 100);
      final other = WorkPromotionSlotState.of(slot: WorkPromotionSlot.general, workId: '2', active: active);
      expect(other.kind, WorkPromotionSlotKind.otherWork);
      expect(other.endsAt, 100);
      expect(other.otherWorkId, '1');
    });

    test('全年齢と R18 は別の枠', () {
      expect(WorkPromotionSlotState.of(slot: WorkPromotionSlot.sensitive, workId: '2', active: active).kind, WorkPromotionSlotKind.available);
    });
  });

  test('API の応答を読む', () {
    final p = ActiveWorkPromotion.fromJson({'slot': 'SENSITIVE', 'workId': 9, 'endsAt': 1700000000, 'isPurchased': false});
    expect(p.slot, WorkPromotionSlot.sensitive);
    expect(p.workId, '9');
    expect(p.endsAt, 1700000000);
    expect(p.isPurchased, false);
  });

  group('宣伝できる作品（アプリは全年齢の枠だけ）', () {
    final now = DateTime.utc(2026, 11, 24, 5);
    final past = now.millisecondsSinceEpoch ~/ 1000 - 60;
    test('公開中の全年齢・R15 は出す', () {
      expect(canPromoteInApp(rating: 'G', accessType: 'PUBLIC', createdAt: past, now: now), true);
      expect(canPromoteInApp(rating: 'R15', accessType: 'PUBLIC', createdAt: past, now: now), true);
    });
    test('R18・R18G・非公開・限定公開・予約投稿は出さない', () {
      expect(canPromoteInApp(rating: 'R18', accessType: 'PUBLIC', createdAt: past, now: now), false);
      expect(canPromoteInApp(rating: 'R18G', accessType: 'PUBLIC', createdAt: past, now: now), false);
      expect(canPromoteInApp(rating: 'G', accessType: 'PRIVATE', createdAt: past, now: now), false);
      expect(canPromoteInApp(rating: 'G', accessType: 'LIMITED', createdAt: past, now: now), false);
      expect(canPromoteInApp(rating: 'G', accessType: 'PUBLIC', createdAt: past + 3600, now: now), false);
    });
  });

  test('終わる時刻は今から日数ぶん（API と同じ）', () {
    final now = DateTime.utc(2026, 11, 24, 5, 37);
    expect(workPromotionEndsAt(now, 7), now.millisecondsSinceEpoch ~/ 1000 + 7 * 86400);
  });

  test('終わる日時は日本時間で月・日・時・分', () {
    // 2026-12-01 05:37 UTC = 12月1日 14:37 JST
    final sec = DateTime.utc(2026, 12, 1, 5, 37).millisecondsSinceEpoch ~/ 1000;
    expect(formatPromotionEnd(sec), '12月1日 14:37');
    expect(formatPromotionEndDay(sec), '12月1日');
    // 日付をまたぐ: 2026-11-30 20:05 UTC = 12月1日 05:05 JST
    expect(formatPromotionEnd(DateTime.utc(2026, 11, 30, 20, 5).millisecondsSinceEpoch ~/ 1000), '12月1日 05:05');
  });

  test('払ったあとの残り。足りなければ null', () {
    expect(premiumAfterPurchase(1200, 500), 700);
    expect(premiumAfterPurchase(500, 500), 0);
    expect(premiumAfterPurchase(499, 500), isNull);
  });

  group('宣伝のシートの表示（購入は本番に送らない）', () {
    testWidgets('枠が空いていて足りる: 見本・期間・残高→支払い後・購入ボタン', (tester) async {
      await _pumpSheet(tester);
      expect(find.text('この作品を宣伝する'), findsOneWidget);
      expect(find.text('あいぴくさんの宣伝作品です'), findsOneWidget);
      expect(find.text('夕焼けの丘'), findsOneWidget);
      expect(find.textContaining('（7日間）'), findsOneWidget);
      expect(find.text('プレミアムコイン（有償）'), findsOneWidget);
      expect(find.text('1,200'), findsOneWidget);
      expect(find.text('700'), findsOneWidget);
      expect(find.text('500枚で7日間宣伝する'), findsOneWidget);
    });

    testWidgets('足りない: 不足の枚数とアプリ内のコイン購入', (tester) async {
      await _pumpSheet(tester, premium: 200);
      expect(find.text('プレミアムコインがあと300枚足りません'), findsOneWidget);
      expect(find.text('プレミアムコインを買う'), findsOneWidget);
      expect(find.text('500枚で7日間宣伝する'), findsNothing);
    });

    testWidgets('この作品が宣伝中: 終わる日時。購入ボタンは出さない', (tester) async {
      final endsAt = DateTime.utc(2026, 12, 1, 5, 37).millisecondsSinceEpoch ~/ 1000;
      await _pumpSheet(tester, active: [ActiveWorkPromotion(slot: WorkPromotionSlot.general, workId: '1', endsAt: endsAt)]);
      expect(find.text('この作品は宣伝中です（12月1日 14:37 まで）'), findsOneWidget);
      expect(find.text('500枚で7日間宣伝する'), findsNothing);
    });

    testWidgets('別の作品が枠を使用中: その旨と宣伝中の作品へ', (tester) async {
      final endsAt = DateTime.utc(2026, 12, 1, 5, 37).millisecondsSinceEpoch ~/ 1000;
      await _pumpSheet(tester, active: [ActiveWorkPromotion(slot: WorkPromotionSlot.general, workId: '2', endsAt: endsAt)]);
      expect(find.textContaining('全年齢の枠は別の作品で使っています（12月1日 14:37 まで）'), findsOneWidget);
      expect(find.text('宣伝中の作品を見る'), findsOneWidget);
      expect(find.text('500枚で7日間宣伝する'), findsNothing);
    });

    testWidgets('確認で有償コインを使うことを出し、買えたら成功の表示と「宣伝中」（テストでは送らない: mockSend）', (tester) async {
      await _pumpSheet(tester);
      await tester.tap(find.text('500枚で7日間宣伝する'));
      await tester.pumpAndSettle();
      expect(find.text('プレミアムコインを500枚使います'), findsOneWidget);
      expect(find.textContaining('有償のプレミアムコインで支払います'), findsOneWidget);
      expect(find.textContaining('残りは700枚'), findsOneWidget);
      await tester.tap(find.text('宣伝を始める'));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('宣伝を始めました'), findsOneWidget);
      expect(find.textContaining('宣伝中・'), findsOneWidget);
      expect(find.text('プレミアムコインの残り 700 枚'), findsOneWidget);
    });

    testWidgets('R18 の枠の宣伝は全年齢の作品の購入を止めない', (tester) async {
      await _pumpSheet(tester, active: const [ActiveWorkPromotion(slot: WorkPromotionSlot.sensitive, workId: '3', endsAt: 100)]);
      expect(find.text('500枚で7日間宣伝する'), findsOneWidget);
    });
  });

  testWidgets('作品画面のバッジ「宣伝中・〇月〇日まで」', (tester) async {
    final endsAt = DateTime.utc(2026, 12, 1, 5, 37).millisecondsSinceEpoch ~/ 1000;
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Center(child: WorkPromotionActiveBadge(endsAt: endsAt)))));
    expect(find.text('宣伝中・12月1日まで'), findsOneWidget);
    expect(find.text('PR'), findsOneWidget);
  });
}
