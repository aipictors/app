import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';

/// 探す・検索・タグ・ランキングで使う GraphQL（Web と同じもの）

/// 作品の並び順
enum WorkSort {
  likes('人気', 'LIKES_COUNT'),
  latest('新着', 'DATE_CREATED'),
  views('閲覧数', 'VIEWS_COUNT'),
  bookmarks('ブックマーク', 'BOOKMARKS_COUNT'),
  comments('コメント', 'COMMENTS_COUNT');

  const WorkSort(this.label, this.value);

  final String label;
  final String value;
}

/// 作品の種類
enum WorkKind {
  all('すべて', null),
  image('イラスト', 'WORK'),
  novel('小説', 'NOVEL'),
  video('動画', 'VIDEO'),
  column('コラム', 'COLUMN');

  const WorkKind(this.label, this.value);

  final String label;
  final String? value;
}

/// 年齢区分（アプリでは R18 は出さない）
enum RatingFilter {
  all('すべて', ['G', 'R15']),
  g('全年齢', ['G']),
  r15('R15', ['R15']);

  const RatingFilter(this.label, this.ratings);

  final String label;
  final List<String> ratings;
}

/// 画風
enum StyleFilter {
  all('すべて', null),
  illustration('イラスト系', 'ILLUSTRATION'),
  real('リアル系', 'REAL');

  const StyleFilter(this.label, this.value);

  final String label;
  final String? value;
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
    thumbnailUrl
  }
}''';

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
        .map((t) => TagSummary(name: t.str('tagName'), thumbnailUrl: t.strOrNull('thumbnailUrl')))
        .where((t) => t.name.isNotEmpty)
        .toList();
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
    dateText
    worksCount
    firstWork {
      id
      rating
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
    final safe = first != null && appRatings.contains(first.str('rating'));
    return DailyTheme(
      id: t.str('id'),
      title: t.str('title'),
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
      final safe = first != null && appRatings.contains(first.str('rating'));
      return TagSummary(name: t.str('name'), thumbnailUrl: safe ? first.strOrNull('smallThumbnailImageURL') : null);
    }).where((t) => t.name.trim().isNotEmpty).toList();
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
