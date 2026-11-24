import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/home/latest_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 11, 26, 15); // 木曜

  test('既定は新着順・全期間', () {
    final w = const LatestFilter().where(['G', 'R15'], now);
    expect(w['orderBy'], 'DATE_CREATED');
    expect(w['isNowCreatedAt'], true);
    expect(w.containsKey('createdAtAfter'), false);
    expect(const LatestFilter().activeCount, 0);
  });

  test('昨日は 0 時で区切る', () {
    final w = const LatestFilter(range: LatestRange.yesterday).where(['G'], now);
    expect(w['createdAtAfter'], DateTime(2026, 11, 25).toUtc().toIso8601String());
    expect(w['beforeCreatedAt'], DateTime(2026, 11, 26).toUtc().toIso8601String());
    expect(w.containsKey('isNowCreatedAt'), false);
  });

  test('週間は先週の月曜〜今週の月曜', () {
    final w = const LatestFilter(range: LatestRange.week).where(['G'], now);
    expect(w['createdAtAfter'], DateTime(2026, 11, 16).toUtc().toIso8601String());
    expect(w['beforeCreatedAt'], DateTime(2026, 11, 23).toUtc().toIso8601String());
  });

  test('プロンプト・種類・1人1作品', () {
    final f = const LatestFilter(workType: 'NOVEL', hasPrompt: false, oneWorkPerUser: true, sort: LatestSort.comments);
    final w = f.where(['G'], now);
    expect(w['workType'], 'NOVEL');
    expect(w['hasPrompt'], false);
    expect(w['isPromptPublic'], false);
    expect(w['isOneWorkPerUser'], true);
    expect(w['orderBy'], 'COMMENTS_COUNT');
    expect(f.activeCount, 4);
    expect(f.copyWith(hasPrompt: () => null).hasPrompt, null);
  });

  test('関連タグは多い順で、探した言葉を除く', () {
    final tags = collectRelatedTags([
      ['猫', '女の子', ' 夜 '],
      ['猫', '夜'],
      ['夜', '猫', '猫'],
    ], '猫');
    expect(tags, ['夜', '女の子']);
  });

  test('日付をずらす', () {
    expect(shiftDateString('2026-03-01', -1), '2026-02-28');
    expect(shiftDateString('2026-12-31', 1), '2027-01-01');
    expect(jstDateString(DateTime.utc(2026, 11, 24, 16)), '2026-11-25');
  });

  test('並び順の古い順は ASC', () {
    final w = const WorkFilter(sort: WorkSort.oldest, prompt: PromptFilter.without, userId: '1').where();
    expect(w['sort'], 'ASC');
    expect(w['orderBy'], 'DATE_CREATED');
    expect(w['hasPrompt'], false);
    expect(w['userId'], '1');
  });
}
