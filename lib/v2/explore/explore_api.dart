import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/sensitive_tags.dart';
import 'package:intl/intl.dart';

/// 探す・検索・タグ・ランキングで使う GraphQL（Web と同じもの）

/// 作品の並び順
enum WorkSort {
  likes('人気', 'Popular', 'LIKES_COUNT'),
  latest('新着', 'Latest', 'DATE_CREATED'),
  views('閲覧数', 'Views', 'VIEWS_COUNT'),
  bookmarks('ブックマーク', 'Bookmarks', 'BOOKMARKS_COUNT'),
  comments('コメント', 'Comments', 'COMMENTS_COUNT');

  const WorkSort(this._ja, this._en, this.value);

  final String _ja;
  final String _en;
  final String value;

  String get label => tr(_ja, _en);
}

/// 作品の種類
enum WorkKind {
  all('すべて', 'All', null),
  image('イラスト', 'Illustrations', 'WORK'),
  novel('小説', 'Novels', 'NOVEL'),
  video('動画', 'Videos', 'VIDEO'),
  column('コラム', 'Columns', 'COLUMN');

  const WorkKind(this._ja, this._en, this.value);

  final String _ja;
  final String _en;
  final String? value;

  String get label => tr(_ja, _en);
}

/// 年齢区分（アプリでは R18 は出さない）
enum RatingFilter {
  all('すべて', 'All', ['G', 'R15']),
  g('全年齢', 'All ages', ['G']),
  r15('R15', 'R15', ['R15']);

  const RatingFilter(this._ja, this._en, this.ratings);

  final String _ja;
  final String _en;
  final List<String> ratings;

  String get label => tr(_ja, _en);
}

/// 画風
enum StyleFilter {
  all('すべて', 'All', null),
  illustration('イラスト系', 'Illustration', 'ILLUSTRATION'),
  real('リアル系', 'Realistic', 'REAL');

  const StyleFilter(this._ja, this._en, this.value);

  final String _ja;
  final String _en;
  final String? value;

  String get label => tr(_ja, _en);
}

/// 検索のしかた（タグの一致 / キーワード）
enum SearchMode { tag, keyword }

class WorkFilter {
  const WorkFilter({
    this.sort = WorkSort.likes,
    this.kind = WorkKind.all,
    this.rating = RatingFilter.all,
    this.style = StyleFilter.all,
    this.withPrompt = false,
  });

  final WorkSort sort;
  final WorkKind kind;
  final RatingFilter rating;
  final StyleFilter style;
  final bool withPrompt;

  /// 並び順以外の絞り込みの数
  int get activeCount =>
      (kind != WorkKind.all ? 1 : 0) + (rating != RatingFilter.all ? 1 : 0) + (style != StyleFilter.all ? 1 : 0) + (withPrompt ? 1 : 0);

  WorkFilter copyWith({WorkSort? sort, WorkKind? kind, RatingFilter? rating, StyleFilter? style, bool? withPrompt}) => WorkFilter(
        sort: sort ?? this.sort,
        kind: kind ?? this.kind,
        rating: rating ?? this.rating,
        style: style ?? this.style,
        withPrompt: withPrompt ?? this.withPrompt,
      );

  Map<String, dynamic> where() => {
        'ratings': rating.ratings,
        'orderBy': sort.value,
        'sort': 'DESC',
        if (kind.value != null) 'workType': kind.value,
        if (style.value != null) 'style': style.value,
        if (withPrompt) 'hasPrompt': true,
      };
}

/// タグのサムネイル: 先頭の作品が全年齢（G）のときだけ URL を返す
String? tagThumbnailIfAllAges(Map<String, dynamic>? work) {
  if (work == null || work['rating'] != 'G') return null;
  final url = (work['smallThumbnailImageURL'] as String?)?.trim() ?? '';
  return url.isEmpty ? null : url;
}

class TagSummary {
  const TagSummary({required this.name, this.thumbnailUrl});

  final String name;
  final String? thumbnailUrl;
}

/// お題の代表サムネイル: 作品が全年齢（G）のときだけ URL を返す（年齢区分が分からない作品は出さない）
String? themeThumbnailIfAllAges(Map<String, dynamic>? work, {bool large = false}) {
  if (work == null || work['rating'] != 'G') return null;
  final url = (work[large ? 'largeThumbnailImageURL' : 'smallThumbnailImageURL'] as String?)?.trim() ?? '';
  return url.isEmpty ? null : url;
}

/// お題の作品一覧で選べる並び（サーバーの WorkOrderBy のうち、お題で意味のあるもの）
const themeSorts = [WorkSort.likes, WorkSort.latest, WorkSort.views, WorkSort.comments];

/// お題の作品一覧の条件（Web の /themes/\$date と同じ subjectId・isNowCreatedAt に、並びと全年齢の区分）
Map<String, dynamic> themeWorksWhere(String themeId, WorkSort sort) => {
      'subjectId': int.tryParse(themeId) ?? 0,
      'ratings': appRatings,
      'orderBy': sort.value,
      'sort': 'DESC',
      'isNowCreatedAt': true,
    };

class DailyTheme {
  const DailyTheme({
    required this.id,
    required this.title,
    required this.dateText,
    required this.worksCount,
    this.thumbnailUrl,
    this.year = 0,
    this.month = 0,
    this.day = 0,
    this.note,
    this.proposerName,
  });

  /// GraphQL の dailyTheme。お題名は英語表示で enTitle があればそれ、サムネイルは全年齢の作品だけ
  factory DailyTheme.fromJson(Map<String, dynamic> t, {bool largeThumbnail = false}) {
    final note = t.strOrNull('note')?.trim();
    return DailyTheme(
      id: t.str('id'),
      title: localizedContent(t.str('title'), t.strOrNull('enTitle')),
      dateText: t.str('dateText'),
      worksCount: t.integer('worksCount'),
      thumbnailUrl: themeThumbnailIfAllAges(t.obj('firstWork'), large: largeThumbnail),
      year: t.integer('year'),
      month: t.integer('month'),
      day: t.integer('day'),
      note: note == null || note.isEmpty ? null : note,
      proposerName: t.obj('proposer')?.strOrNull('name'),
    );
  }

  final String id;
  final String title;
  final String dateText;
  final int worksCount;
  final String? thumbnailUrl;
  final int year;
  final int month;
  final int day;
  final String? note;
  final String? proposerName;

  DateTime get date => DateTime(year, month, day);

  /// /themes/年/月/日
  String get path => '/themes/$year/$month/$day';
}

/// サーバーの並び（sort）が効かないことがあるので日付で並べ直す
List<DailyTheme> sortThemesNewestFirst(List<DailyTheme> themes) => [...themes]..sort((a, b) => b.date.compareTo(a.date));

/// ランキングの 1 件
class RankedWork {
  const RankedWork({required this.rank, required this.likes, required this.work});

  final int rank;
  final int likes;
  final WorkSummary work;
}

enum RankingPeriod { daily, weekly, monthly }

class ExploreApi {
  ExploreApi._();

  static const _recommendedTags = '''
query SearchPopularTags(\$limit: Int!, \$where: RecommendedTagsWhereInput!) {
  recommendedTags(limit: \$limit, where: \$where) {
    tagName
  }
}''';

  /// 名前だけの人気のタグ（検索の候補用）
  static Future<List<TagSummary>> popularTags({int limit = 24}) async {
    final data = await Api.query(
      _recommendedTags,
      variables: {
        'limit': limit,
        'where': {'isSensitive': false},
      },
      cacheFor: const Duration(minutes: 10),
    );
    return data
        .list('recommendedTags')
        .map((t) => t.str('tagName'))
        .where((name) => name.isNotEmpty && !SensitiveTags.isBlocked(name))
        .map((name) => TagSummary(name: name))
        .toList();
  }

  static const _hotTags = '''
query HotTagsWithThumbnail {
  hotTags { name firstWork { smallThumbnailImageURL rating } }
}''';

  /// サムネイル付きの人気のタグ（Web のトップのタグ一覧と同じ hotTags）。
  /// サムネイルは先頭の作品が全年齢（G）のときだけ使い、それ以外はサムネイルなしにする
  static Future<List<TagSummary>> popularTagsWithThumbnail({int limit = 24}) async {
    final data = await Api.query(_hotTags, cacheFor: const Duration(minutes: 10));
    return [
      for (final t in data.list('hotTags'))
        if (t.str('name').isNotEmpty && !SensitiveTags.isBlocked(t.str('name')))
          TagSummary(name: t.str('name'), thumbnailUrl: tagThumbnailIfAllAges(t.obj('firstWork'))),
    ].take(limit).toList();
  }

  static const _hotWorks = '''
query HotWorks(\$where: HotWorksWhereInput) {
  hotWorks(where: \$where) {
    $workCardFields
  }
}''';

  /// いま人気の作品（全年齢のみ）
  static Future<List<WorkSummary>> hotWorks() async {
    final data = await Api.query(
      _hotWorks,
      variables: {
        'where': {'isSensitive': false},
      },
      cacheFor: const Duration(minutes: 5),
    );
    return WorkSummary.listFrom(data.list('hotWorks'));
  }

  static const _themeFields = 'id title enTitle dateText year month day worksCount note proposer { id name } firstWork { id rating smallThumbnailImageURL largeThumbnailImageURL }';

  static const _dailyTheme = '''
query DailyTheme(\$year: Int, \$month: Int, \$day: Int) {
  dailyTheme(year: \$year, month: \$month, day: \$day) {
    $_themeFields
  }
}''';

  static Future<DailyTheme?> todayTheme() {
    final now = DateTime.now();
    return themeOn(now.year, now.month, now.day);
  }

  /// その日のお題（無ければ null）
  static Future<DailyTheme?> themeOn(int year, int month, int day) async {
    final data = await Api.query(
      _dailyTheme,
      variables: {'year': year, 'month': month, 'day': day},
      cacheFor: const Duration(minutes: 10),
    );
    final t = data.obj('dailyTheme');
    return t == null ? null : DailyTheme.fromJson(t);
  }

  static const _dailyThemes = '''
query AppDailyThemes(\$offset: Int!, \$limit: Int!, \$where: DailyThemesWhereInput) {
  dailyThemes(offset: \$offset, limit: \$limit, where: \$where) {
    $_themeFields
  }
}''';

  static String _ymd(DateTime d) => '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// 過去のお題（昨日から [days] 日分、新しい順）
  static Future<List<DailyTheme>> pastThemes({int days = 14}) async {
    final now = DateTime.now();
    final end = DateTime(now.year, now.month, now.day - 1);
    final start = DateTime(end.year, end.month, end.day - days + 1);
    final data = await Api.query(_dailyThemes, variables: {
      'offset': 0,
      'limit': days,
      'where': {'startDate': _ymd(start), 'endDate': _ymd(end), 'orderBy': 'DATE_STARTED', 'sort': 'DESC'},
    }, cacheFor: const Duration(minutes: 10));
    return sortThemesNewestFirst([
      for (final t in data.list('dailyThemes'))
        if (!DateTime(t.integer('year'), t.integer('month'), t.integer('day')).isAfter(end)) DailyTheme.fromJson(t),
    ]);
  }

  /// その月のお題（日付の古い順）
  static Future<List<DailyTheme>> monthThemes(int year, int month) async {
    final data = await Api.query(_dailyThemes, variables: {
      'offset': 0,
      'limit': 40,
      'where': {'year': year, 'month': month},
    }, cacheFor: const Duration(minutes: 5));
    return sortThemesNewestFirst(data.list('dailyThemes').map(DailyTheme.fromJson).toList()).reversed.toList();
  }

  static const _themeWorks = '''
query ThemeWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    $workCardFields
  }
}''';

  static Future<List<WorkSummary>> themeWorks(String themeId, WorkSort sort, int offset, int limit) async {
    final data = await Api.query(_themeWorks, variables: {
      'offset': offset,
      'limit': limit,
      'where': themeWorksWhere(themeId, sort),
    });
    return WorkSummary.listFrom(data.list('works'));
  }

  static const _tagWorks = '''
query SearchTagWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  tagWorks(offset: \$offset, limit: \$limit, where: \$where) {
    $workCardFields
  }
}''';

  static const _textWorks = '''
query SearchTextWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    $workCardFields
  }
}''';

  /// タグが一致する作品
  static Future<List<WorkSummary>> tagWorks(String tag, WorkFilter filter, int offset, int limit) async {
    final data = await Api.query(_tagWorks, variables: {
      'offset': offset,
      'limit': limit,
      'where': {
        ...filter.where(),
        'tagNames': [tag],
      },
    });
    return WorkSummary.listFrom(data.list('tagWorks'));
  }

  /// キーワード（タイトル・タグ・説明）で探す
  static Future<List<WorkSummary>> keywordWorks(String text, WorkFilter filter, int offset, int limit) async {
    final data = await Api.query(_textWorks, variables: {
      'offset': offset,
      'limit': limit,
      'where': {
        ...filter.where(),
        'search': text,
        'searchInTags': true,
        'searchInDescription': true,
      },
    });
    return WorkSummary.listFrom(data.list('works'));
  }

  static const _tagCount = '''
query SearchExactTagWorksCount(\$where: TagWorksCountWhereInput!) {
  tagWorksCount(where: \$where)
}''';

  static const _worksCount = '''
query SearchTagWorksCount(\$where: WorksWhereInput) {
  worksCount(where: \$where)
}''';

  /// タグの作品数（絞り込みがあるときは worksCount で数える）
  static Future<int> tagWorksCount(String tag, [WorkFilter filter = const WorkFilter()]) async {
    if (filter.activeCount == 0 || (filter.activeCount == 1 && filter.rating != RatingFilter.all)) {
      final data = await Api.query(_tagCount, variables: {
        'where': {'tagName': tag, 'ratings': filter.rating.ratings},
      }, cacheFor: const Duration(minutes: 5));
      return data.integer('tagWorksCount');
    }
    final data = await Api.query(_worksCount, variables: {
      'where': {
        ...filter.where()..remove('orderBy')..remove('sort'),
        'tagNames': [tag],
      },
    }, cacheFor: const Duration(minutes: 5));
    return data.integer('worksCount');
  }

  static const _tags = '''
query SearchTags(\$offset: Int!, \$limit: Int!, \$where: TagsWhereInput) {
  tags(offset: \$offset, limit: \$limit, where: \$where) {
    id
    name
    firstWork {
      id
      rating
      smallThumbnailImageURL
    }
  }
}''';

  /// 名前に文字を含むタグ（入力中の候補にも使う）
  static Future<List<TagSummary>> searchTags(String text, int offset, int limit) async {
    final data = await Api.query(
      _tags,
      variables: {
        'offset': offset,
        'limit': limit,
        'where': {'search': text},
      },
      cacheFor: const Duration(minutes: 5),
    );
    return data.list('tags').map((t) {
      final first = t.obj('firstWork');
      final safe = first != null && first.str('rating') == 'G';
      return TagSummary(name: t.str('name'), thumbnailUrl: safe ? first.strOrNull('smallThumbnailImageURL') : null);
    })
        // 昔の作品には「ねこ 猫 ぬこ」のように空白でつないだ 1 つのタグがあるので候補から外す
        .where((t) => t.name.trim().isNotEmpty && t.name.trim().split(RegExp(r'\s+')).length < 3 && !SensitiveTags.isBlocked(t.name))
        .toList();
  }

  static const _followingTags = '''
query TagPageViewerFollowedTags(\$offset: Int!, \$limit: Int!) {
  viewer {
    id
    followingTags(offset: \$offset, limit: \$limit) {
      id
      name
    }
  }
}''';

  static Future<bool> isFollowingTag(String name) async {
    final data = await Api.query(_followingTags, variables: {'offset': 0, 'limit': 500});
    final tags = data.obj('viewer')?.list('followingTags') ?? const [];
    return tags.any((t) => t.str('name') == name);
  }

  static Future<void> followTag(String name, bool follow) async {
    if (follow) {
      await Api.mutate(r'''
mutation FollowTag($input: FollowTagInput!) {
  followTag(input: $input)
}''', variables: {
        'input': {'tagName': name},
      });
    } else {
      await Api.mutate(r'''
mutation UnFollowTag($input: UnfollowTagInput!) {
  unfollowTag(input: $input)
}''', variables: {
        'input': {'tagName': name},
      });
    }
  }

  static const _workAwards = '''
query WorkAwards(\$offset: Int!, \$limit: Int!, \$where: WorkAwardsWhereInput!) {
  workAwards(offset: \$offset, limit: \$limit, where: \$where) {
    id
    index
    dateText
    snapshotLikedCount
    work {
      $workCardFields
    }
  }
}''';

  static Future<List<RankedWork>> workAwards(Map<String, dynamic> where, {int limit = 200}) async {
    final data = await Api.query(
      _workAwards,
      variables: {'offset': 0, 'limit': limit, 'where': where},
      cacheFor: const Duration(minutes: 30),
    );
    final out = <RankedWork>[];
    for (final a in data.list('workAwards')) {
      final w = a.obj('work');
      if (w == null) continue;
      final works = WorkSummary.listFrom([w]);
      if (works.isEmpty) continue;
      out.add(RankedWork(rank: a.integer('index'), likes: a.integer('snapshotLikedCount'), work: works.first));
    }
    out.sort((a, b) => a.rank.compareTo(b.rank));
    return out;
  }
}

/// ランキングの期間（Web の週の数え方に合わせる：その月の何番目の月曜から始まる週か）
class RankingDate {
  RankingDate._();

  static List<int> _mondays(int year, int month) {
    final days = DateTime(year, month + 1, 0).day;
    return [
      for (var d = 1; d <= days; d++)
        if (DateTime(year, month, d).weekday == DateTime.monday) d,
    ];
  }

  static DateTime mondayOf(DateTime d) => DateTime(d.year, d.month, d.day - (d.weekday - 1));

  /// 月曜日 → (year, month, weekIndex)
  static ({int year, int month, int week}) weekOf(DateTime monday) {
    final m = mondayOf(monday);
    final index = _mondays(m.year, m.month).indexOf(m.day) + 1;
    return (year: m.year, month: m.month, week: index < 1 ? 1 : index);
  }

  static DateTime today() {
    final n = DateTime.now();
    return DateTime(n.year, n.month, n.day);
  }

  /// 期間の最初の候補（最新の公開済み）
  static DateTime initial(RankingPeriod p) {
    final t = today();
    switch (p) {
      case RankingPeriod.daily:
        return t.subtract(const Duration(days: 1));
      case RankingPeriod.weekly:
        return mondayOf(t).subtract(const Duration(days: 7));
      case RankingPeriod.monthly:
        return DateTime(t.year, t.month - 1, 1);
    }
  }

  static DateTime step(RankingPeriod p, DateTime d, int delta) {
    switch (p) {
      case RankingPeriod.daily:
        return DateTime(d.year, d.month, d.day + delta);
      case RankingPeriod.weekly:
        return DateTime(d.year, d.month, d.day + 7 * delta);
      case RankingPeriod.monthly:
        return DateTime(d.year, d.month + delta, 1);
    }
  }

  static Map<String, dynamic> where(RankingPeriod p, DateTime d) {
    switch (p) {
      case RankingPeriod.daily:
        return {'year': d.year, 'month': d.month, 'day': d.day};
      case RankingPeriod.weekly:
        final w = weekOf(d);
        return {'year': w.year, 'month': w.month, 'weekIndex': w.week};
      case RankingPeriod.monthly:
        return {'year': d.year, 'month': d.month};
    }
  }

  static String label(RankingPeriod p, DateTime d) {
    if (!L10n.isJa) {
      switch (p) {
        case RankingPeriod.daily:
          return DateFormat('EEE, MMM d, y', 'en_US').format(d);
        case RankingPeriod.weekly:
          final end = d.add(const Duration(days: 6));
          return '${DateFormat('MMM d', 'en_US').format(d)} – ${DateFormat('MMM d', 'en_US').format(end)}';
        case RankingPeriod.monthly:
          return DateFormat('MMMM y', 'en_US').format(d);
      }
    }
    const wd = ['月', '火', '水', '木', '金', '土', '日'];
    switch (p) {
      case RankingPeriod.daily:
        return '${d.year}年${d.month}月${d.day}日（${wd[d.weekday - 1]}）';
      case RankingPeriod.weekly:
        final end = d.add(const Duration(days: 6));
        final w = weekOf(d);
        return '${w.month}月 第${w.week}週（${d.month}/${d.day}〜${end.month}/${end.day}）';
      case RankingPeriod.monthly:
        return '${d.year}年${d.month}月';
    }
  }
}
