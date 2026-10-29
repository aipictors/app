import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 新しい画面のデザインの決まりごと
class Ds {
  Ds._();

  // ブランドカラー（ロゴの青と金）
  static const blue = Color(0xFF0170C8);
  static const sky = Color(0xFF3BA7F5);
  static const gold = Color(0xFFE2A21B);
  static const pink = Color(0xFFFF5C8A);
  static const purple = Color(0xFF8B5CF6);

  static const brandGradient = LinearGradient(
    colors: [Color(0xFF0170C8), Color(0xFF6D5DF6), Color(0xFFFF5C8A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const goldGradient = LinearGradient(
    colors: [Color(0xFFFFD36B), Color(0xFFE2A21B), Color(0xFFC77D0A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 余白
  static const s2 = 2.0;
  static const s4 = 4.0;
  static const s6 = 6.0;
  static const s8 = 8.0;
  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;
  static const s32 = 32.0;

  // 角丸
  static const r8 = Radius.circular(8);
  static const r12 = Radius.circular(12);
  static const r16 = Radius.circular(16);
  static const r20 = Radius.circular(20);
  static const r28 = Radius.circular(28);

  static BorderRadius br(double r) => BorderRadius.all(Radius.circular(r));

  static const fast = Duration(milliseconds: 160);
  static const normal = Duration(milliseconds: 260);
  static const slow = Duration(milliseconds: 420);

  static const curve = Curves.easeOutCubic;

  static void tap() => HapticFeedback.selectionClick();

  static void impact() => HapticFeedback.lightImpact();

  static void success() => HapticFeedback.mediumImpact();
}

extension DsContext on BuildContext {
  ColorScheme get cs => Theme.of(this).colorScheme;

  TextTheme get tt => Theme.of(this).textTheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// 画像の下地・スケルトンの色
  Color get skeleton => isDark ? const Color(0xFF23252B) : const Color(0xFFEDEFF3);

  /// カードの面
  Color get surfaceCard => isDark ? const Color(0xFF17191E) : Colors.white;

  /// 区切りの細い線
  Color get hairline => isDark ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.07);

  Color get muted => cs.onSurface.withValues(alpha: 0.58);

  void toast(String message, {IconData? icon, bool error = false}) {
    final messenger = ScaffoldMessenger.maybeOf(this);
    if (messenger == null) return;
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        shape: RoundedRectangleBorder(borderRadius: Ds.br(14)),
        backgroundColor: error ? const Color(0xFFB3261E) : (isDark ? const Color(0xFF2B2E36) : const Color(0xFF1F2329)),
        content: Row(
          children: [
            Icon(icon ?? (error ? Icons.error_outline_rounded : Icons.check_circle_rounded), color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(child: Text(message, style: const TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

/// 数を短く（1.2万 など）
String compactCount(int n) {
  if (n >= 100000000) return '${(n / 100000000).toStringAsFixed(n % 100000000 == 0 ? 0 : 1)}億';
  if (n >= 10000) return '${(n / 10000).toStringAsFixed(n >= 100000 ? 0 : 1)}万';
  return n.toString();
}

/// 「3分前」など
String relativeTime(int unixSeconds) {
  if (unixSeconds <= 0) return '';
  final t = DateTime.fromMillisecondsSinceEpoch(unixSeconds * 1000);
  final d = DateTime.now().difference(t);
  if (d.inSeconds < 60) return 'たった今';
  if (d.inMinutes < 60) return '${d.inMinutes}分前';
  if (d.inHours < 24) return '${d.inHours}時間前';
  if (d.inDays < 7) return '${d.inDays}日前';
  if (t.year == DateTime.now().year) return '${t.month}月${t.day}日';
  return '${t.year}年${t.month}月${t.day}日';
}
