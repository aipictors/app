import 'package:aipictors/v2/core/store_policy.dart';
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
  comments('コメント', 'Comments', 'COMMENTS_COUNT'),
  // Web の検索の「古い順」
  oldest('古い順', 'Oldest', 'DATE_CREATED', ascending: true);

  const WorkSort(this._ja, this._en, this.value, {this.ascending = false});

  final String _ja;
  final String _en;
  final String value;
  final bool ascending;

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

  const RatingFilter(this._ja, this._en, this._ratings);

  final String _ja;
  final String _en;
  final List<String> _ratings;

  /// 検索で送る年齢区分（Android 版は全年齢だけ）
  List<String> get ratings => _ratings.where(AppContentFilter.allows).toList().ifEmpty(const ['G']);

  /// 絞り込みで選べるもの（Android 版は R15 を出さない）
  static List<RatingFilter> get choices => StorePolicy.strict ? const [RatingFilter.all] : RatingFilter.values;

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

/// プロンプトの有無（Web の検索の「プロンプトあり / なし」）
enum PromptFilter {
  all('すべて', 'All', null),
  with_('プロンプトあり', 'With prompt', true),
  without('プロンプトなし', 'Without prompt', false);

  const PromptFilter(this._ja, this._en, this.hasPrompt);

  final String _ja;
  final String _en;
  final bool? hasPrompt;

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
    this.prompt = PromptFilter.all,
    this.userId,
  });

  final WorkSort sort;
  final WorkKind kind;
  final RatingFilter rating;
  final StyleFilter style;
  final PromptFilter prompt;

  /// 自分の作品だけ（Web の検索の「自分の作品だけ」。ログイン中の人の ID）
  final String? userId;

  /// 並び順以外の絞り込みの数
  int get activeCount =>
      (kind != WorkKind.all ? 1 : 0) +
      (rating != RatingFilter.all ? 1 : 0) +
      (style != StyleFilter.all ? 1 : 0) +
      (prompt != PromptFilter.all ? 1 : 0) +
      (userId != null ? 1 : 0);

  WorkFilter copyWith({WorkSort? sort, WorkKind? kind, RatingFilter? rating, StyleFilter? style, PromptFilter? prompt, String? userId, bool clearUser = false}) => WorkFilter(
        sort: sort ?? this.sort,
        kind: kind ?? this.kind,
        rating: rating ?? this.rating,
        style: style ?? this.style,
        prompt: prompt ?? this.prompt,
        userId: clearUser ? null : (userId ?? this.userId),
      );

  Map<String, dynamic> where() => {
        'ratings': rating.ratings,
        'orderBy': sort.value,
        'sort': sort.ascending ? 'ASC' : 'DESC',
        if (kind.value != null) 'workType': kind.value,
        if (style.value != null) 'style': style.value,
        if (prompt.hasPrompt != null) 'hasPrompt': prompt.hasPrompt,
        if (userId != null) 'userId': userId,
      };

  @override
  bool operator ==(Object other) =>
      other is WorkFilter && other.sort == sort && other.kind == kind && other.rating == rating && other.style == style && other.prompt == prompt && other.userId == userId;

  @override
  int get hashCode => Object.hash(sort, kind, rating, style, prompt, userId);
}

/// タグのサムネイル: 先頭の作品が全年齢（G）でセンシティブでないときだけ URL を返す
String? tagThumbnailIfAllAges(Map<String, dynamic>? work) {
  if (work == null || work['rating'] != 'G' || work['isSensitive'] == true) return null;
  final url = (work['smallThumbnailImageURL'] as String?)?.trim() ?? '';
  return url.isEmpty ? null : url;
}

class TagSummary {
  const TagSummary({required this.name, this.thumbnailUrl});

  final String name;
  final String? thumbnailUrl;
}

class DailyTheme {
  const DailyTheme({required this.id, required this.title, required this.dateText, required this.worksCount, this.thumbnailUrl});

  final String id;
  final String title;
  final String dateText;
  final int worksCount;
  final String? thumbnailUrl;
}

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
  hotTags { name firstWork { smallThumbnailImageURL rating isSensitive } }
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

  static const _dailyTheme = '''
query DailyTheme(\$year: Int, \$month: Int, \$day: Int) {
  dailyTheme(year: \$year, month: \$month, day: \$day) {
    id
    title
    enTitle
    dateText
    worksCount
    firstWork {
      id
      rating
      isSensitive
      smallThumbnailImageURL
    }
  }
}''';

  static Future<DailyTheme?> todayTheme() async {
    final now = DateTime.now();
    final data = await Api.query(
      _dailyTheme,
      variables: {'year': now.year, 'month': now.month, 'day': now.day},
      cacheFor: const Duration(minutes: 10),
    );
    final t = data.obj('dailyTheme');
    if (t == null) return null;
    final first = t.obj('firstWork');
    final safe = first != null && AppContentFilter.allows(first.str('rating')) && !(StorePolicy.strict && first.boolean('isSensitive'));
    return DailyTheme(
      id: t.str('id'),
      title: localizedContent(t.str('title'), t.strOrNull('enTitle')),
      dateText: t.str('dateText'),
      worksCount: t.integer('worksCount'),
      thumbnailUrl: safe ? first.strOrNull('smallThumbnailImageURL') : null,
    );
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
      'where': {
        'subjectId': int.tryParse(themeId) ?? 0,
        'ratings': appRatings,
        'orderBy': sort.value,
        'sort': 'DESC',
      },
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
      isSensitive
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
      return TagSummary(name: t.str('name'), thumbnailUrl: tagThumbnailIfAllAges(t.obj('firstWork')));
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

/// 作品のタグから関連タグを数の多い順に 16 個（Web の collectRelatedTags と同じ。探している言葉は除く）
List<String> collectRelatedTags(Iterable<List<String>> tagNamesOfWorks, String? query) {
  final q = query?.trim().toLowerCase();
  final counts = <String, int>{};
  for (final names in tagNamesOfWorks) {
    for (final name in names.map((n) => n.trim()).toSet()) {
      if (name.isEmpty || name.toLowerCase() == q) continue;
      counts[name] = (counts[name] ?? 0) + 1;
    }
  }
  final entries = counts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
  return entries.take(16).map((e) => e.key).toList();
}

/// 日本時間の日付（YYYY-MM-DD）。今日の人気・ルーキーの日付に使う
String jstDateString(DateTime t) {
  final j = t.toUtc().add(const Duration(hours: 9));
  return '${j.year.toString().padLeft(4, '0')}-${j.month.toString().padLeft(2, '0')}-${j.day.toString().padLeft(2, '0')}';
}

/// YYYY-MM-DD を days 日ずらす
String shiftDateString(String date, int days) {
  final d = DateTime.parse('${date}T00:00:00Z').add(Duration(days: days));
  return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

class ExploreMoreApi {
  ExploreMoreApi._();

  static const _relatedTagWorks = '''
query AppRelatedTagWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  tagWorks(offset: \$offset, limit: \$limit, where: \$where) {
    id
    tagNames
  }
}''';

  static const _relatedTextWorks = '''
query AppRelatedTextWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    id
    tagNames
  }
}''';

  /// 関連タグ（Web のタグページ・検索の「関連タグ」。1 ページ目の作品のタグから数える）
  static Future<List<String>> relatedTags(String text, {required bool tagMode}) async {
    final where = <String, dynamic>{
      'ratings': appRatings,
      'orderBy': 'LIKES_COUNT',
      'sort': 'DESC',
      if (tagMode) 'tagNames': [text] else ...{'search': text, 'searchInTags': true, 'searchInDescription': true},
    };
    final data = await Api.query(
      tagMode ? _relatedTagWorks : _relatedTextWorks,
      variables: {'offset': 0, 'limit': 32, 'where': where},
      cacheFor: const Duration(minutes: 10),
    );
    final works = data.list(tagMode ? 'tagWorks' : 'works');
    return collectRelatedTags(
      works.map((w) => (w['tagNames'] as List?)?.whereType<String>().toList() ?? const <String>[]),
      text,
    ).where((t) => !SensitiveTags.isBlocked(t)).toList();
  }

  static const _rookie = '''
query RookieWorkAwards(\$offset: Int!, \$limit: Int!, \$date: String) {
  rookieWorkAwards(offset: \$offset, limit: \$limit, date: \$date) {
    id
    index
    dateText
    snapshotLikedCount
    work {
      $workCardFields
    }
  }
}''';

  /// ルーキーランキング（Web の /rankings/rookie。date を省くと最新の日）
  static Future<({String? date, List<RankedWork> items})> rookieAwards(String? date) async {
    final data = await Api.query(_rookie, variables: {'offset': 0, 'limit': 50, 'date': date}, cacheFor: const Duration(minutes: 30));
    final awards = data.list('rookieWorkAwards');
    final out = <RankedWork>[];
    for (final a in awards) {
      final works = WorkSummary.listFrom([if (a.obj('work') != null) a.obj('work')!]);
      if (works.isEmpty) continue;
      out.add(RankedWork(rank: a.integer('index'), likes: a.integer('snapshotLikedCount'), work: works.first));
    }
    out.sort((a, b) => a.rank.compareTo(b.rank));
    final first = awards.isEmpty ? null : awards.first.strOrNull('dateText');
    return (date: first ?? date, items: out);
  }

  static const _popular = '''
query PopularWorks(\$where: PopularWorksWhereInput!) {
  popularWorks(where: \$where) {
    $workCardFields
  }
}''';

  /// 今日の人気作品（Web の /popular。毎日お昼に選ばれる全年齢の 100 件、いいねの多い順）
  static Future<List<WorkSummary>> popularWorks(String date) async {
    final data = await Api.query(_popular, variables: {
      'where': {'date': date, 'isSensitive': false},
    }, cacheFor: const Duration(minutes: 30));
    return WorkSummary.listFrom(data.list('popularWorks'))..sort((a, b) => b.likesCount.compareTo(a.likesCount));
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

extension on List<String> {
  List<String> ifEmpty(List<String> fallback) => isEmpty ? fallback : this;
}
