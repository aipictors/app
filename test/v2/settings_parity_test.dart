import 'package:aipictors/v2/settings/account_delete_screen.dart';
import 'package:aipictors/v2/settings/followed_tags_screen.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/settings/settings_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('お気に入りタグの候補は 20 文字まで・登録済みを除いて 6 つ', () {
    final names = ['a', 'b', 'あ' * 21, 'c', 'c', 'd', 'e', 'f', 'g', 'h'];
    expect(followedTagSuggestions(names, ['b']), ['a', 'c', 'd', 'e', 'f', 'g']);
  });

  test('退会の確認はアカウントIDの先頭 6 文字（短ければ全部）', () {
    expect(withdrawLoginPrefix('aipictors'), 'aipict');
    expect(withdrawLoginPrefix('abc'), 'abc');
    expect(withdrawLoginPrefix(''), '');
  });

  test('受け取った推しの集計は文字列の数も読む', () {
    final s = SupportReceivedSummary.fromJson({
      'cumulativeReceivedPt': '1200',
      'cumulativeReceivedCoins': 300,
      'cumulativeReceivedFreePt': 200,
      'cumulativeReceivedFreeCoins': 200,
      'cumulativeReceivedPremiumPt': '1000.0',
      'cumulativeReceivedPremiumCoins': 100,
      'recentReceivedTransfers': [
        {'senderUserId': '1', 'coinType': 'PREMIUM', 'coinAmount': '10', 'ptAmount': 100, 'createdAt': 1764000000},
      ],
    });
    expect(s.totalPt, 1200);
    expect(s.premiumPt, 1000);
    expect(s.recent.single.isPremium, isTrue);
    expect(s.recent.single.coins, 10);
  });

  test('日時は日本時間', () {
    // 2025-11-24 15:00 UTC = 2025-11-25 00:00 JST
    expect(formatJstDateTime(DateTime.utc(2025, 11, 24, 15).millisecondsSinceEpoch ~/ 1000), '2025/11/25 00:00');
  });

  test('設定の検索で SNS 連携・コイン・アイコン枠が見つかる', () {
    List<String> ids(String q) => searchSettings(q, (_) => true).map((h) => h.item.id).toList();
    expect(ids('Google'), contains('accountLink'));
    expect(ids('コイン'), contains('coins'));
    expect(ids('アイコン枠'), contains('frames'));
    expect(ids('失効'), contains('coins'));
  });
}
