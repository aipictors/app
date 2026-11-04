import 'package:aipictors/v2/core/api.dart';
import 'package:flutter/foundation.dart';

class Achievement {
  const Achievement({
    required this.key,
    required this.name,
    required this.description,
    required this.category,
    required this.series,
    required this.tier,
    required this.points,
    required this.rewardCoins,
    required this.isHidden,
    required this.isUnlocked,
    required this.unlockedAt,
    required this.progressCurrent,
    required this.progressTarget,
    required this.rarity,
  });

  final String key;
  final String name;
  final String description;
  final String category;
  final String series;
  final int tier;
  final int points;
  final int rewardCoins;
  final bool isHidden;
  final bool isUnlocked;
  final int? unlockedAt;
  final int? progressCurrent;
  final int? progressTarget;
  final double? rarity;

  /// 隠し実績は取るまで中身を見せない
  bool get isMasked => isHidden && !isUnlocked;

  factory Achievement.fromJson(Map<String, dynamic> j) => Achievement(
        key: j.str('key'),
        name: j.str('name'),
        description: j.str('description'),
        category: j.str('category'),
        series: j.str('series'),
        tier: j.integer('tier', 1),
        points: j.integer('points'),
        rewardCoins: j.integer('rewardCoins'),
        isHidden: j.boolean('isHidden'),
        isUnlocked: j.boolean('isUnlocked'),
        unlockedAt: j['unlockedAt'] == null ? null : j.integer('unlockedAt'),
        progressCurrent: j['progressCurrent'] == null ? null : j.integer('progressCurrent'),
        progressTarget: j['progressTarget'] == null ? null : j.integer('progressTarget'),
        rarity: j['rarity'] == null ? null : j.number('rarity'),
      );
}

class AchievementSummary {
  const AchievementSummary({
    required this.level,
    required this.points,
    required this.currentLevelPoints,
    required this.nextLevelPoints,
    required this.unlockedCount,
    required this.totalCount,
    required this.currentStreak,
    required this.longestStreak,
    required this.loginDays,
    required this.featured,
  });

  final int level;
  final int points;
  final int currentLevelPoints;
  final int nextLevelPoints;
  final int unlockedCount;
  final int totalCount;
  final int currentStreak;
  final int longestStreak;
  final int loginDays;
  final List<Achievement> featured;

  double get levelProgress {
    final span = nextLevelPoints - currentLevelPoints;
    if (span <= 0) return 1;
    return ((points - currentLevelPoints) / span).clamp(0.0, 1.0);
  }

  factory AchievementSummary.fromJson(Map<String, dynamic> j) => AchievementSummary(
        level: j.integer('level', 1),
        points: j.integer('points'),
        currentLevelPoints: j.integer('currentLevelPoints'),
        nextLevelPoints: j.integer('nextLevelPoints'),
        unlockedCount: j.integer('unlockedCount'),
        totalCount: j.integer('totalCount'),
        currentStreak: j.integer('currentStreak'),
        longestStreak: j.integer('longestStreak'),
        loginDays: j.integer('loginDays'),
        featured: j.list('featured').map(Achievement.fromJson).toList(),
      );
}

class AchievementSettings {
  const AchievementSettings({required this.isHiddenOnProfile, required this.isUnlockNoticeOff});

  final bool isHiddenOnProfile;
  final bool isUnlockNoticeOff;
}

class AchievementsApi {
  AchievementsApi._();

  static const _fields = 'key name description category series tier points rewardCoins isHidden isUnlocked unlockedAt progressCurrent progressTarget rarity';

  static const _page = '''
query AppAchievements(\$userId: ID) {
  achievementSummary(userId: \$userId) {
    unlockedCount totalCount points level currentLevelPoints nextLevelPoints currentStreak longestStreak loginDays
    featured { $_fields }
  }
  achievements(userId: \$userId) { $_fields }
}''';

  /// [userId] が null なら自分。相手が非公開なら summary が null
  static Future<(AchievementSummary?, List<Achievement>)> page(String? userId) async {
    final data = await Api.query(_page, variables: {'userId': userId});
    final s = data.obj('achievementSummary');
    return (s == null ? null : AchievementSummary.fromJson(s), data.list('achievements').map(Achievement.fromJson).toList());
  }

  static const _showcase = '''
query AppAchievementShowcase(\$userId: ID) {
  achievementSummary(userId: \$userId) {
    unlockedCount totalCount points level currentLevelPoints nextLevelPoints currentStreak longestStreak loginDays
    featured { $_fields }
  }
}''';

  static Future<AchievementSummary?> showcase(String userId) async {
    final data = await Api.query(_showcase, variables: {'userId': userId}, cacheFor: const Duration(minutes: 2));
    final s = data.obj('achievementSummary');
    return s == null ? null : AchievementSummary.fromJson(s);
  }

  static Future<AchievementSettings?> settings() async {
    final data = await Api.query(r'''
query AppAchievementSettings {
  achievementSettings { isHiddenOnProfile isUnlockNoticeOff }
}''');
    final s = data.obj('achievementSettings');
    return s == null ? null : AchievementSettings(isHiddenOnProfile: s.boolean('isHiddenOnProfile'), isUnlockNoticeOff: s.boolean('isUnlockNoticeOff'));
  }

  static Future<void> updateSettings(AchievementSettings s) async {
    await Api.mutate(r'''
mutation AppUpdateAchievementSettings($input: UpdateAchievementSettingsInput!) {
  updateAchievementSettings(input: $input) { isHiddenOnProfile isUnlockNoticeOff }
}''', variables: {
      'input': {'isHiddenOnProfile': s.isHiddenOnProfile, 'isUnlockNoticeOff': s.isUnlockNoticeOff},
    });
    Api.clearCache();
  }

  /// Web の AchievementWatcher と同じ確認。ログイン日数と実績はこれで進む。
  /// 新しく取った実績の名前を返す。審査用アカウントのコインや実績を増やさないよう、デバッグでは呼ばない
  static Future<List<String>> check() async {
    if (kDebugMode) return const [];
    try {
      final data = await Api.mutate(r'''
mutation AppCheckAchievements {
  checkAchievements {
    isInitialSync
    unlocked { key name }
  }
}''');
      final r = data.obj('checkAchievements');
      final unlocked = r?.list('unlocked') ?? const <Map<String, dynamic>>[];
      if (unlocked.isEmpty) return const [];
      await Api.mutate(r'''
mutation AppMarkAchievementsSeen($keys: [String!]!) {
  markAchievementsSeen(keys: $keys)
}''', variables: {'keys': unlocked.map((a) => a.str('key')).toList()});
      // 初めての同期では過去の分がまとめて返るので知らせない
      return r?.boolean('isInitialSync') == true ? const [] : unlocked.map((a) => a.str('name')).toList();
    } catch (_) {
      return const [];
    }
  }
}
