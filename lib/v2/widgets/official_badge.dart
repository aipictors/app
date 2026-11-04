import 'package:flutter/material.dart';

/// 名前の横に出すマーク（Web の OfficialBadge と同じ）。
/// 公式アカウント（運営）は青いチェック、モデレーターはオレンジのチェック。両方なら公式を出す
class OfficialBadge extends StatelessWidget {
  const OfficialBadge({super.key, this.size = 16, this.isOfficial = true, this.isModerator = false});

  final double size;
  final bool isOfficial;
  final bool isModerator;

  @override
  Widget build(BuildContext context) {
    if (!isOfficial && !isModerator) return const SizedBox.shrink();
    final label = isOfficial ? '公式アカウント' : 'モデレーター';
    return Tooltip(
      message: label,
      child: Semantics(
        label: label,
        child: Icon(Icons.verified_rounded, color: isOfficial ? const Color(0xFF1D9BF0) : const Color(0xFFF97316), size: size),
      ),
    );
  }
}
