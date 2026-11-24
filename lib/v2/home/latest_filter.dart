import 'package:aipictors/v2/core/l10n.dart';

/// ホームの「新着」の表示（Web の新着タブの 新着 / 人気 / 新規ユーザ）
enum LatestView { latest, popular, newUsers }

/// 期間（Web の新着の絞り込みの「期間」）
enum LatestRange {
  all('全期間', 'All time'),
  today('本日', 'Today'),
  yesterday('昨日', 'Yesterday'),
  week('週間', 'Week');

  const LatestRange(this._ja, this._en);

  final String _ja;
  final String _en;

  String get label => tr(_ja, _en);
}

/// 並び順（Web の新着の絞り込みの「並び順」）
enum LatestSort {
  latest('最新', 'Latest', 'DATE_CREATED'),
  likes('人気', 'Popular', 'LIKES_COUNT'),
  comments('コメント', 'Comments', 'COMMENTS_COUNT');

  const LatestSort(this._ja, this._en, this.value);

  final String _ja;
  final String _en;
  final String value;

  String get label => tr(_ja, _en);
}

/// 種類（null はすべて）
const latestWorkTypes = <(String?, String, String)>[
  (null, 'すべて', 'All'),
  ('WORK', '画像', 'Image'),
  ('VIDEO', '動画', 'Video'),
  ('NOVEL', '小説', 'Novel'),
  ('COLUMN', 'コラム', 'Column'),
];

/// ホームの新着の絞り込み（Web の HomeWorksFilterPanel と同じ項目）
class LatestFilter {
  const LatestFilter({this.workType, this.hasPrompt, this.sort = LatestSort.latest, this.range = LatestRange.all, this.oneWorkPerUser = false});

  final String? workType;

  /// null: すべて true: あり false: なし
  final bool? hasPrompt;
  final LatestSort sort;
  final LatestRange range;
  final bool oneWorkPerUser;

  int get activeCount =>
      (workType != null ? 1 : 0) + (hasPrompt != null ? 1 : 0) + (sort != LatestSort.latest ? 1 : 0) + (range != LatestRange.all ? 1 : 0) + (oneWorkPerUser ? 1 : 0);

  LatestFilter copyWith({String? Function()? workType, bool? Function()? hasPrompt, LatestSort? sort, LatestRange? range, bool? oneWorkPerUser}) => LatestFilter(
        workType: workType != null ? workType() : this.workType,
        hasPrompt: hasPrompt != null ? hasPrompt() : this.hasPrompt,
        sort: sort ?? this.sort,
        range: range ?? this.range,
        oneWorkPerUser: oneWorkPerUser ?? this.oneWorkPerUser,
      );

  /// works の where（Web の makeWhere と同じ。期間はその端末の 0 時で区切る）
  Map<String, dynamic> where(List<String> ratings, DateTime now) {
    final today0 = DateTime(now.year, now.month, now.day);
    DateTime? after;
    DateTime? before;
    var isNow = false;
    switch (range) {
      case LatestRange.today:
        after = today0;
        isNow = true;
      case LatestRange.yesterday:
        after = today0.subtract(const Duration(days: 1));
        before = today0;
      case LatestRange.week:
        // 先週の月曜 0 時〜今週の月曜 0 時
        final thisMon = today0.subtract(Duration(days: today0.weekday - 1));
        after = thisMon.subtract(const Duration(days: 7));
        before = thisMon;
      case LatestRange.all:
        isNow = true;
    }
    return {
      'ratings': ratings,
      'sort': 'DESC',
      'orderBy': sort.value,
      if (workType != null) 'workType': workType,
      if (hasPrompt != null) ...{'hasPrompt': hasPrompt, 'isPromptPublic': hasPrompt},
      if (after != null) 'createdAtAfter': after.toUtc().toIso8601String(),
      if (before != null) 'beforeCreatedAt': before.toUtc().toIso8601String(),
      if (isNow) 'isNowCreatedAt': true,
      if (oneWorkPerUser) 'isOneWorkPerUser': true,
    };
  }
}
