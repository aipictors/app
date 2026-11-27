import 'package:flutter/material.dart';

/// 推しの段階。YouTube のスーパーチャットのように、
/// pt（フリー 1 枚 = 1pt・プレミアム 1 枚 = 10pt）が大きいほど色が濃く・長く上に出る。
/// Web（app/utils/support-tier.ts）と同じ区切り・同じ色
class SupportTier {
  const SupportTier({required this.level, required this.minPt, required this.pinSeconds, required this.color, required this.onColor, this.color2});

  final int level;

  /// この段階になる最小の pt
  final int minPt;

  /// コメント欄の上の「応援の帯」に出しておく時間（投稿からの秒数）
  final int pinSeconds;

  /// 帯の塗り（color2 があれば横のグラデーション）
  final Color color;
  final Color? color2;

  /// 帯の上の文字色
  final Color onColor;

  Gradient get gradient => LinearGradient(colors: [color, color2 ?? color]);

  static const _hour = 3600;

  static const all = <SupportTier>[
    SupportTier(level: 1, minPt: 1, pinSeconds: _hour, color: Color(0xFF0284C7), onColor: Colors.white),
    SupportTier(level: 2, minPt: 20, pinSeconds: 3 * _hour, color: Color(0xFF0D9488), onColor: Colors.white),
    SupportTier(level: 3, minPt: 50, pinSeconds: 12 * _hour, color: Color(0xFF059669), onColor: Colors.white),
    SupportTier(level: 4, minPt: 100, pinSeconds: 24 * _hour, color: Color(0xFFFBBF24), onColor: Color(0xFF451A03)),
    SupportTier(level: 5, minPt: 300, pinSeconds: 3 * 24 * _hour, color: Color(0xFFEA580C), onColor: Colors.white),
    SupportTier(level: 6, minPt: 1000, pinSeconds: 7 * 24 * _hour, color: Color(0xFFE11D48), color2: Color(0xFFDC2626), onColor: Colors.white),
  ];

  /// pt から段階を決める。0 以下は null（推しなし）
  static SupportTier? of(int totalPt) {
    if (totalPt <= 0) return null;
    var found = all.first;
    for (final t in all) {
      if (totalPt >= t.minPt) found = t;
    }
    return found;
  }

  static int ptOf(int free, int premium) => (free < 0 ? 0 : free) + (premium < 0 ? 0 : premium) * 10;
}
