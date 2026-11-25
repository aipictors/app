import 'package:aipictors/v2/post/post_event.dart';
import 'package:flutter_test/flutter_test.dart';

int wall(int y, int m, int d, [int h = 0]) => DateTime.utc(y, m, d, h).millisecondsSinceEpoch ~/ 1000;

PostEvent event(String slug, String tag, {required int startAt, required int endAt}) =>
    PostEvent(slug: slug, title: slug, description: null, thumbnailUrl: null, tag: tag, startAt: startAt, endAt: endAt);

void main() {
  final ongoing = event('a', 'イベントA', startAt: wall(2026, 11, 1), endAt: wall(2026, 11, 30, 23));
  final upcoming = event('b', 'イベントB', startAt: wall(2026, 12, 10), endAt: wall(2026, 12, 20));
  // 2026/11/25 10:00 JST
  final now = DateTime.utc(2026, 11, 25, 1);

  test('今は日本時間の壁時計を UTC とした秒', () {
    expect(eventPublishAt(null, now: now), wall(2026, 11, 25, 10));
    expect(eventPublishAt(DateTime(2026, 12, 12, 9, 30)), DateTime.utc(2026, 12, 12, 9, 30).millisecondsSinceEpoch ~/ 1000);
  });

  test('開催期間外のイベントのタグを付けて投稿すると止める（Web の getPostEventPeriodError）', () {
    expect(postEventPeriodError(tags: ['イベントA'], events: [ongoing, upcoming], reservedAt: null, now: now), isNull);
    expect(postEventPeriodError(tags: ['ほか'], events: [ongoing, upcoming], reservedAt: null, now: now), isNull);
    expect(postEventPeriodError(tags: ['イベントB'], events: [ongoing, upcoming], reservedAt: null, now: now), contains('まだ開始されていません'));
    expect(postEventPeriodError(tags: ['イベントB'], events: [ongoing, upcoming], reservedAt: DateTime(2026, 12, 15, 12), now: now), isNull);
    expect(postEventPeriodError(tags: ['イベントA'], events: [ongoing, upcoming], reservedAt: DateTime(2026, 12, 15, 12), now: now), contains('予約公開日時'));
    final ended = event('c', 'イベントC', startAt: wall(2026, 10, 1), endAt: wall(2026, 10, 31));
    expect(postEventPeriodError(tags: ['イベントC'], events: [ended], reservedAt: null, now: now), contains('終了'));
  });

  test('参加ボタンから来たイベントは一覧になければ足す（Web の mergePostFormEvents）', () {
    final user = event('u', 'ユーザー企画', startAt: wall(2026, 11, 1), endAt: wall(2026, 11, 30));
    expect(mergePostEvents([ongoing], user).map((e) => e.slug), ['a', 'u']);
    expect(mergePostEvents([ongoing], ongoing).map((e) => e.slug), ['a']);
    expect(mergePostEvents([ongoing], event('x', 'イベントA', startAt: 0, endAt: 0)).map((e) => e.slug), ['a']);
    expect(mergePostEvents([ongoing], null).map((e) => e.slug), ['a']);
  });

  test('開催期間は UTC の各要素で出す', () {
    expect(formatEventDateTime(wall(2026, 11, 30, 23)), '2026/11/30 23:00');
  });
}
