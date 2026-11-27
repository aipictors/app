import 'package:aipictors/v2/settings/coins_screen.dart';
import 'package:flutter_test/flutter_test.dart';

// 2026-11-24 12:00 JST
const _now = 1795489200;

CoinLedgerRow _row(int id, String kind, int delta, {String coinType = 'FREE', String? reason, String? source, int at = _now}) =>
    CoinLedgerRow(id: id, coinType: coinType, delta: delta, kind: kind, reason: reason, source: source, createdAt: at);

void main() {
  test('日時は秒・ミリ秒・文字列を秒にそろえる', () {
    expect(coinUnixSeconds(_now), _now);
    expect(coinUnixSeconds(_now * 1000), _now);
    expect(coinUnixSeconds('$_now'), _now);
    expect(coinUnixSeconds('2026-11-24T03:00:00Z'), _now);
    expect(coinUnixSeconds(''), isNull);
    expect(coinUnixSeconds(null), isNull);
  });

  test('JST の日付と、0時の失効は前の日の 24:00', () {
    expect(jstDateKey(_now), '2026-11-24');
    // 2026-11-25 00:00 JST
    expect(formatCoinExpiry(_now + 12 * 3600, _now), '今日 24:00');
    expect(formatCoinExpiry(_now + 36 * 3600, _now), '明日 24:00');
    expect(formatCoinExpiry(_now + 3 * 86400, _now), '11/27 12:00');
    expect(formatLedgerDay(_now - 86400, _now), '昨日');
    expect(formatLedgerDay(_now - 3 * 86400, _now), '11/21 (土)');
  });

  test('履歴の絞り込みの分類', () {
    final grant = _row(1, 'GRANT', 10);
    final consume = _row(2, 'CONSUME', -3);
    final expire = _row(3, 'EXPIRE', -5);
    final refund = _row(4, 'REFUND', 3);
    expect([grant, consume, expire, refund].where((r) => matchesCoinLedgerFilter(r, CoinLedgerFilter.received)).map((r) => r.id), [1, 4]);
    expect([grant, consume, expire].where((r) => matchesCoinLedgerFilter(r, CoinLedgerFilter.used)).map((r) => r.id), [2]);
    expect([grant, consume, expire].where((r) => matchesCoinLedgerFilter(r, CoinLedgerFilter.expired)).map((r) => r.id), [3]);
    expect([grant, consume, expire].where((r) => matchesCoinLedgerFilter(r, CoinLedgerFilter.all)).length, 3);
  });

  test('見出しは内部の識別子を出さない', () {
    expect(coinLedgerLabel(_row(1, 'GRANT', 10, reason: 'FREE daily generation coin grant')), '毎日のコイン');
    expect(coinLedgerLabel(_row(1, 'GRANT', 10, reason: 'STANDARD daily generation coin grant')), '毎日のコイン（STANDARD）');
    expect(coinLedgerLabel(_row(1, 'CONSUME', -1, reason: 'image-generation:flux')), '画像生成（FLUX）');
    // 作品への推しは終了したので、過去のコメント・作品経由の推しもユーザーへの推しとして出す
    expect(coinLedgerLabel(_row(1, 'CONSUME', -1, reason: 'work-comment-support', source: 'work-comment:123:9')), 'ユーザーを推した');
    expect(coinLedgerLabel(_row(1, 'GRANT', 1, reason: 'work-comment-support')), '推してもらった');
    expect(coinLedgerLabel(_row(1, 'CONSUME', -1, source: 'work-comment:123:9')), 'ユーザーを推した');
    expect(coinLedgerLabel(_row(1, 'GRANT', 5, reason: '実績の報酬')), '実績の報酬');
    expect(coinLedgerLabel(_row(1, 'GRANT', 5, reason: 'some-internal-id')), 'コインを受け取り');
  });

  test('続く同じ行をまとめ、今日の合計を出す', () {
    final rows = mergeCoinLedger(
      [_row(3, 'CONSUME', -2, reason: 'image-generation:text_to_image', at: _now), _row(2, 'CONSUME', -2, reason: 'image-generation:text_to_image', at: _now - 60)],
      [_row(2, 'CONSUME', -2, reason: 'image-generation:text_to_image', at: _now - 60), _row(1, 'GRANT', 10, reason: 'FREE daily generation coin grant', at: _now - 120), _row(0, 'EXPIRE', -4, at: _now - 86400)],
    );
    expect(rows.map((r) => r.id), [3, 2, 1, 0]);
    final days = groupCoinLedgerByDay(rows);
    expect(days.length, 2);
    expect(days.first.groups.length, 2);
    expect(days.first.groups.first.count, 2);
    expect(days.first.groups.first.delta, -4);
    final stats = todayCoinLedgerStats(rows, _now);
    expect((stats.received, stats.used, stats.expired), (10, 4, 0));
  });

  test('失効予定は期限の早い順・同時刻はフリー先、有効期限なしを出す', () {
    const lots = [
      ExpiringCoinLot(coinType: 'PREMIUM', amount: 100, expiresAt: 200),
      ExpiringCoinLot(coinType: 'FREE', amount: 30, expiresAt: 200),
      ExpiringCoinLot(coinType: 'FREE', amount: 20, expiresAt: 100),
    ];
    expect(sortExpiringLots(lots).map((l) => '${l.coinType}${l.expiresAt}'), ['FREE100', 'FREE200', 'PREMIUM200']);
    final n = noExpiryCoins(lots, freeBalance: 60, premiumBalance: 90);
    expect((n.free, n.premium), (10, 0));
    final full = List.generate(maxExpiringCoinLots, (i) => ExpiringCoinLot(coinType: 'FREE', amount: 1, expiresAt: i));
    final m = noExpiryCoins(full, freeBalance: 999, premiumBalance: 999);
    expect((m.free, m.premium), (0, 0));
  });

  test('残高カードの一言', () {
    const lots = [ExpiringCoinLot(coinType: 'FREE', amount: 1200, expiresAt: _now + 12 * 3600)];
    expect(coinBalanceNote(lots, 'FREE', 1200, _now), '今日 24:00 に 1,200 枚失効');
    expect(coinBalanceNote(lots, 'PREMIUM', 5, _now), '有効期限なし');
    expect(coinBalanceNote(const [], 'FREE', 0, _now), '毎日もらえます');
    expect(coinBalanceNote(const [], 'PREMIUM', 0, _now), '購入から3か月有効');
  });
}
