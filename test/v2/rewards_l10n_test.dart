import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/requests/requests_api.dart';
import 'package:aipictors/v2/settings/creator_rewards_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> _summary({bool joined = false, bool ready = false, bool needsMore = false}) => {
  'config': {'enabled': true, 'rateMilliyen': 500, 'holdDays': 7, 'closeDays': [10, 25], 'minYen': 3000, 'maxYen': 100000, 'feeYen': 500, 'withholdingPpm': 102100},
  'joined': joined,
  'onboardingAvailable': true,
  'profile': joined
      ? {
          'payoutReady': ready,
          'hasAccount': needsMore,
          'taxKind': ready ? 'INDIVIDUAL' : null,
          'requirements': {'disabledReason': needsMore ? 'requirements.past_due' : null},
        }
      : null,
  'balances': {'holdingYen': 40, 'availableYen': 3000, 'inPayoutYen': 0, 'paidYen': 3092},
  'nextCloseAt': 1795000000,
  'earnings': [
    {'id': 1, 'kind': 'REQUEST', 'coins': 90, 'amountYen': 45, 'status': 'HOLDING', 'createdAt': 1794000000, 'availableAt': 1794600000},
  ],
  'payouts': [],
};

void main() {
  tearDown(() => L10n.override = null);

  group('収益の受け取り', () {
    test('API のエラーコードを文に（知らないコードは「うまくいきませんでした」）', () {
      expect(creatorRewardErrorMessage('NO_ACCOUNT'), contains('口座が登録されていません'));
      expect(creatorRewardErrorMessage('TERMS_OUTDATED'), contains('規約'));
      expect(creatorRewardErrorMessage('SUSPENDED'), contains('お問い合わせ'));
      expect(creatorRewardErrorMessage('Unauthorized'), 'ログインしてください');
      expect(creatorRewardErrorMessage('???'), startsWith('うまくいきませんでした'));
      L10n.override = 'en';
      expect(creatorRewardErrorMessage('NO_ACCOUNT'), startsWith('No bank account'));
    });

    test('応答の読み取り: 日本語は UTF-8、エラーはコード付きの ApiException', () {
      final ok = CreatorRewardsApi.parse(200, utf8.encode(jsonEncode({'error': null, 'data': {'name': '報酬'}})));
      expect(ok['name'], '報酬');
      expect(
        () => CreatorRewardsApi.parse(404, utf8.encode(jsonEncode({'error': 'NO_ACCOUNT', 'data': null}))),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', 'NO_ACCOUNT')),
      );
      // HTML のエラーページでも落ちない
      expect(() => CreatorRewardsApi.parse(502, utf8.encode('<html>')), throwsA(isA<ApiException>().having((e) => e.code, 'code', 'HTTP_502')));
    });

    test('ステップ・締めの日・明細の名前（有料リクエストの報酬）', () {
      expect(creatorRewardStep(_summary()), 1);
      expect(creatorRewardStep(_summary(joined: true)), 2);
      expect(creatorRewardStep(_summary(joined: true, ready: true)), 3);
      expect(creatorRewardCloseDays({'closeDays': [10, 25]}), [10, 25]);
      expect(creatorRewardCloseDays({'closeDay': 10}), [10]);
      expect(creatorEarningTitle({'kind': 'REQUEST'}), '有料リクエスト');
      expect(creatorEarningTitle({'kind': 'SUPPORT', 'workId': '1'}), '作品への推し');
      expect(creatorEarningTitle({'kind': 'SUPPORT'}), 'プロフィールへの推し');
      expect(creatorEarningStatusLabel('HOLDING'), '確認期間中');
      expect(creatorEarningStatusLabel('HELD'), '次の振込に入る');
    });
  });

  group('英語表示', () {
    test('金額と日付', () {
      expect(formatYenL10n(3092), '3,092円');
      expect(formatDateL10n(1795000000), '2026/11/18');
      L10n.override = 'en';
      expect(formatYenL10n(3092), '¥3,092');
      expect(formatYenL10n(-500), '-¥500');
      expect(formatDateL10n(1795000000), 'Nov 18, 2026');
      expect(tr('推す', 'Support'), 'Support');
    });

    test('リクエスト: エラー・状態・運営のメッセージ・終わった理由', () {
      expect(requestErrorMessage('CLOSED'), contains('30 日'));
      expect(requestClosedReason('overdue'), '納期を過ぎたためキャンセルされました');
      expect(requestClosedReason('イメージと違うため'), 'イメージと違うため');
      expect(requestSystemMessage('依頼を承諾しました'), '依頼を承諾しました');
      L10n.override = 'en';
      expect(requestErrorMessage('INSUFFICIENT_COINS'), 'Not enough coins');
      expect(requestStatusLabels['PENDING'], 'Waiting');
      expect(requestSystemMessage('依頼を承諾しました'), 'The request was accepted');
      expect(requestSystemMessage('依頼をお断りしました。コインは全額返却されました\n理由: 忙しい'), 'The request was declined. Coins were fully returned\nReason: 忙しい');
      expect(requestSystemMessage('よろしくお願いします'), 'よろしくお願いします');
      expect(requestClosedReason('no_response'), 'Not accepted before the deadline');
    });
  });

  test('リクエストの応答は charset なしでも UTF-8 で読む（文字化けしない）', () {
    final res = http.Response.bytes(utf8.encode(jsonEncode({'error': null, 'data': {'title': 'ゆるかわアイコン'}})), 200, headers: {'content-type': 'application/json'});
    expect((RequestsApi.parse(res) as Map)['title'], 'ゆるかわアイコン');
    final err = http.Response.bytes(utf8.encode(jsonEncode({'error': 'NOT_FOUND'})), 404, headers: {'content-type': 'application/json'});
    expect(() => RequestsApi.parse(err), throwsA(isA<ApiException>().having((e) => e.message, 'message', 'この依頼は見つかりませんでした')));
  });

  testWidgets('収益の受け取りの画面: 未参加は 3 ステップと参加ボタン、明細に有料リクエスト', (tester) async {
    tester.view.physicalSize = const Size(1170, 4000);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(home: CreatorRewardsScreen(debugSummary: _summary())));
    expect(find.text('受け取りまでの 3 ステップ'), findsOneWidget);
    expect(find.text('同意して参加する'), findsOneWidget);
    expect(find.text('口座を登録する'), findsNothing);
    expect(find.textContaining('Payouts are currently available only'), findsNothing);
  });

  testWidgets('収益の受け取りの画面: 参加済みは残高 4 つと「口座を登録する」、登録の途中なら続きの案内', (tester) async {
    tester.view.physicalSize = const Size(1170, 5000);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(home: CreatorRewardsScreen(debugSummary: _summary(joined: true, needsMore: true))));
    for (final t in ['確認期間中', '次の振込に入る', '振込の準備中', 'これまでに振込', '口座の登録を続ける', '用意するもの']) {
      expect(find.text(t), findsWidgets, reason: t);
    }
    expect(find.textContaining('登録の途中です'), findsOneWidget);
    expect(find.textContaining('有料リクエスト', findRichText: true), findsOneWidget);
    expect(find.text('3,000円'), findsOneWidget);
  });

  testWidgets('収益の受け取りの画面（英語）: 文言・円の表記・日本の口座だけの案内', (tester) async {
    L10n.override = 'en';
    tester.view.physicalSize = const Size(1170, 5000);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(home: CreatorRewardsScreen(debugSummary: _summary(joined: true, ready: true))));
    expect(find.text('Rewards payout'), findsWidgets);
    expect(find.text('3 steps to get paid'), findsOneWidget);
    expect(find.text('Change bank account or details'), findsOneWidget);
    expect(find.text('¥3,000'), findsOneWidget);
    expect(find.textContaining('Payouts are currently available only to bank accounts in Japan'), findsOneWidget);
  });
}
