import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
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

  static final _checkRequests = StreamController<void>.broadcast();

  /// いいね・フォローなどのあとに呼ぶ。少し待ってからまとめて確かめる（Web の requestAchievementCheck）
  static void requestCheck() => _checkRequests.add(null);

  static Stream<void> get checkRequests => _checkRequests.stream;

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
  /// まだ見ていない達成（新しい順）を返す。[force] は投稿・いいねのあとなど、サーバーの間隔を待たずに数え直すとき。
  /// 審査用アカウントのコインや実績を増やさないよう、デバッグでは送らない（sample:achievement なら見本を返す）
  static Future<AchievementCheckResult?> check({bool force = false}) async {
    if (kDebugMode) return DebugBoot.flag('sample:achievement') ? AchievementCheckResult.sample() : null;
    final data = await Api.mutate(r'''
mutation AppCheckAchievements($force: Boolean) {
  checkAchievements(force: $force) {
    isInitialSync
    unlocked { key name enName description enDescription tier isHidden rewardCoins }
  }
}''', variables: {'force': force});
    final r = data.obj('checkAchievements');
    if (r == null) return null;
    return AchievementCheckResult(
      isInitialSync: r.boolean('isInitialSync'),
      unlocked: r.list('unlocked').map(UnlockedAchievement.fromJson).toList(),
    );
  }

  /// 見たことにする（次の確認から返らない）
  static Future<void> markSeen(List<String> keys) async {
    if (kDebugMode || keys.isEmpty) return;
    await Api.mutate(r'''
mutation AppMarkAchievementsSeen($keys: [String!]!) {
  markAchievementsSeen(keys: $keys)
}''', variables: {'keys': keys});
  }
}

class UnlockedAchievement {
  const UnlockedAchievement({
    required this.key,
    required this.name,
    required this.enName,
    required this.description,
    required this.enDescription,
    required this.tier,
    required this.isHidden,
    required this.rewardCoins,
  });

  final String key;
  final String name;
  final String enName;
  final String description;
  final String enDescription;
  final int tier;
  final bool isHidden;
  final int rewardCoins;

  factory UnlockedAchievement.fromJson(Map<String, dynamic> j) => UnlockedAchievement(
        key: j.str('key'),
        name: j.str('name'),
        enName: j.str('enName'),
        description: j.str('description'),
        enDescription: j.str('enDescription'),
        tier: j.integer('tier', 1),
        isHidden: j.boolean('isHidden'),
        rewardCoins: j.integer('rewardCoins'),
      );
}

class AchievementCheckResult {
  const AchievementCheckResult({required this.isInitialSync, required this.unlocked});

  /// はじめての確認（これまでの分がまとめて返る）
  final bool isInitialSync;
  final List<UnlockedAchievement> unlocked;

  /// 開発用の見本（本番のデータは変えない）
  factory AchievementCheckResult.sample() => const AchievementCheckResult(isInitialSync: false, unlocked: [
        UnlockedAchievement(
            key: 'likes-given-100', name: '応援の輪', enName: 'Circle of cheers', description: 'いいねを100回する', enDescription: 'Give 100 likes', tier: 3, isHidden: false, rewardCoins: 10),
        UnlockedAchievement(key: 'works-1', name: 'はじめての一枚', enName: 'First work', description: '作品を1つ投稿する', enDescription: 'Post 1 work', tier: 1, isHidden: false, rewardCoins: 0),
      ]);
}
