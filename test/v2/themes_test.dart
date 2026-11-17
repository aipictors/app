import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/theme_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> _theme({String title = '着物', String? enTitle = 'Kimono', String? rating = 'G', int day = 15}) => {
      'id': '1603',
      'title': title,
      'enTitle': enTitle,
      'dateText': '2026-11-$day',
      'year': 2026,
      'month': 11,
      'day': day,
      'worksCount': 205,
      'note': '  ',
      'proposer': {'id': '1', 'name': 'あいぴく'},
      'firstWork': rating == null
          ? null
          : {'id': '9', 'rating': rating, 'smallThumbnailImageURL': 'https://x/s.webp', 'largeThumbnailImageURL': 'https://x/l.webp'},
    };

void main() {
  tearDown(() => L10n.override = null);

  group('お題の作品一覧の条件', () {
    test('並びごとに orderBy を変え、お題 ID・全年齢の区分・公開済みは保つ', () {
      final expected = {WorkSort.likes: 'LIKES_COUNT', WorkSort.latest: 'DATE_CREATED', WorkSort.views: 'VIEWS_COUNT', WorkSort.comments: 'COMMENTS_COUNT'};
      expect(themeSorts, expected.keys.toList());
      for (final e in expected.entries) {
        final w = themeWorksWhere('1603', e.key);
        expect(w['orderBy'], e.value);
        expect(w['sort'], 'DESC');
        expect(w['subjectId'], 1603);
        expect(w['ratings'], ['G', 'R15']);
        expect(w['isNowCreatedAt'], true);
      }
    });

    test('並びの名前は英語表示で英語', () {
      L10n.override = 'en';
      expect(themeSorts.map((s) => s.label), ['Popular', 'Latest', 'Views', 'Comments']);
      L10n.override = 'ja';
      expect(themeSorts.map((s) => s.label), ['人気', '新着', '閲覧数', 'コメント']);
    });
  });

  group('お題の代表サムネイル', () {
    test('全年齢（G）の作品だけ出す', () {
      expect(DailyTheme.fromJson(_theme()).thumbnailUrl, 'https://x/s.webp');
      expect(DailyTheme.fromJson(_theme(), largeThumbnail: true).thumbnailUrl, 'https://x/l.webp');
      for (final r in ['R15', 'R18', 'R18G', '']) {
        expect(DailyTheme.fromJson(_theme(rating: r)).thumbnailUrl, isNull, reason: r);
      }
      expect(DailyTheme.fromJson(_theme(rating: null)).thumbnailUrl, isNull);
      expect(themeThumbnailIfAllAges({'smallThumbnailImageURL': 'https://x/s.webp'}), isNull);
    });
  });

  group('お題名', () {
    test('英語表示は enTitle、無ければ元のお題名。日本語表示は元のまま', () {
      L10n.override = 'en';
      expect(DailyTheme.fromJson(_theme()).title, 'Kimono');
      expect(DailyTheme.fromJson(_theme(enTitle: '')).title, '着物');
      expect(DailyTheme.fromJson(_theme(enTitle: null)).title, '着物');
      L10n.override = 'ja';
      expect(DailyTheme.fromJson(_theme()).title, '着物');
    });

    test('日付・パス・空のひとこと・提案者', () {
      final t = DailyTheme.fromJson(_theme());
      expect(t.path, '/themes/2026/11/15');
      expect(t.note, isNull);
      expect(t.proposerName, 'あいぴく');
    });
  });

  test('過去のお題は新しい順に並べ直す', () {
    final list = sortThemesNewestFirst([DailyTheme.fromJson(_theme(day: 3)), DailyTheme.fromJson(_theme(day: 16)), DailyTheme.fromJson(_theme(day: 9))]);
    expect(list.map((t) => t.day), [16, 9, 3]);
  });

  test('日付の表示', () {
    final d = DateTime(2026, 11, 16);
    L10n.override = 'ja';
    expect(themeDateLabel(d), '11/16（月）');
    expect(themeMonthLabel(d), '2026年11月');
    L10n.override = 'en';
    expect(themeDateLabel(d, year: true), 'Nov 16, 2026 (Mon)');
    expect(themeWorksCountLabel(1), '1 work');
    expect(themeWorksCountLabel(205), '205 works');
  });
}
