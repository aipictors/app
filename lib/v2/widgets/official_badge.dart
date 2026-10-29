import 'package:flutter/material.dart';

/// 公式アカウント（運営・モデレーター）の名前の横に出す青いチェック
class OfficialBadge extends StatelessWidget {
  const OfficialBadge({super.key, this.size = 16});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '公式アカウント',
      child: Semantics(
        label: '公式アカウント',
        child: Icon(Icons.verified_rounded, color: const Color(0xFF1D9BF0), size: size),
      ),
    );
  }
}
