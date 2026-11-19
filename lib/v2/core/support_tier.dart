import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 推し（コイン付きのコメント・推し）の段階。YouTube のスーパーチャットのように、
/// プレミアムコインの枚数が多いほど色が濃く・長く上に出る。フリーコインだけの推しは枚数に関係なくシルバー。
/// Web（app/utils/support-tier.ts）と同じ区切り・同じ色
class SupportTier {
  const SupportTier({required this.level, required this.minPremium, required this.pinSeconds, required this.color, required this.onColor, this.color2});

  /// 0 = シルバー（フリーだけ）、1〜4 = プレミアムの枚数で青・緑・黄・赤
  final int level;

  /// この段階になる最小のプレミアムコインの枚数（シルバーは 0）
  final int minPremium;

  /// コメント欄の上の「応援の帯」に出しておく時間（投稿からの秒数）
  final int pinSeconds;

  /// 帯の塗り（color2 があれば横のグラデーション）
  final Color color;
  final Color? color2;

  /// 帯の上の文字色
  final Color onColor;

  Gradient get gradient => LinearGradient(colors: [color, color2 ?? color]);

  static const _hour = 3600;

  /// フリーコインだけの推し
  static const silver = SupportTier(level: 0, minPremium: 0, pinSeconds: _hour, color: Color(0xFF94A3B8), color2: Color(0xFFCBD5E1), onColor: Color(0xFF0F172A));

  /// プレミアムコインを含む推し（1〜499 枚は青）
  static const premiumTiers = <SupportTier>[
    SupportTier(level: 1, minPremium: 1, pinSeconds: 3 * _hour, color: Color(0xFF0284C7), onColor: Colors.white),
    SupportTier(level: 2, minPremium: 500, pinSeconds: 12 * _hour, color: Color(0xFF059669), onColor: Colors.white),
    SupportTier(level: 3, minPremium: 1000, pinSeconds: 24 * _hour, color: Color(0xFFFBBF24), onColor: Color(0xFF451A03)),
    SupportTier(level: 4, minPremium: 3000, pinSeconds: 7 * 24 * _hour, color: Color(0xFFE11D48), color2: Color(0xFFDC2626), onColor: Colors.white),
  ];

  static const all = <SupportTier>[silver, ...premiumTiers];

  /// フリー・プレミアムの枚数から段階を決める。両方 0 は null（推しなし）
  static SupportTier? of({required int free, required int premium}) {
    if (premium <= 0) return free > 0 ? silver : null;
    var found = premiumTiers.first;
    for (final t in premiumTiers) {
      if (premium >= t.minPremium) found = t;
    }
    return found;
  }

  static int ptOf(int free, int premium) => (free < 0 ? 0 : free) + (premium < 0 ? 0 : premium) * 10;
}

/// プレミアムコインの枚数のプリセット（よく使われる少額の 1〜10 枚。Web のコメント欄と同じ。色の区切り 500・1,000・3,000 枚は −/＋ で選べる）
const premiumSupportPresets = [1, 2, 3, 5, 10];

/// プレミアムの −/＋（1 枚ずつ。最小 1・最大は残高。使わないときはクリアで 0）
int stepPremiumSupport(int current, int delta, int balance) {
  if (balance <= 0) return 0;
  return (current + delta).clamp(1, balance);
}

/// コメント欄の上の「応援の帯」に並べる推しを選ぶ（読み込んだコメントだけで決める。問い合わせは増やさない）
/// 時間では消さずにいつも出す。課金額（プレミアムコイン）の多い順・合計 pt の多い順・新しい順に最大 limit 件（Web と同じ）
List<T> pickPinnedSupports<T>(List<T> items, {required int Function(T) createdAt, required int Function(T) free, required int Function(T) premium, int limit = 50}) {
  final picked = items.where((x) => SupportTier.of(free: free(x), premium: premium(x)) != null).toList();
  int pt(T x) => math.max(0, free(x)) + math.max(0, premium(x)) * 10;
  picked.sort((a, b) {
    final byPremium = math.max(0, premium(b)).compareTo(math.max(0, premium(a)));
    if (byPremium != 0) return byPremium;
    final byPt = pt(b).compareTo(pt(a));
    return byPt != 0 ? byPt : createdAt(b).compareTo(createdAt(a));
  });
  return picked.take(limit).toList();
}

/// 推した作品がクリエイター報酬の対象になりうるか（全年齢＝G / R15 だけ）
bool isCreatorRewardRating(String? rating) => rating == 'G' || rating == 'R15';
