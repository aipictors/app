import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/widgets/official_badge.dart';
import 'package:flutter/material.dart';

/// 名前と、その横のマーク（公式・モデレーター）・レベル。
/// 名前は長ければ省略する。幅が決まった場所（Row の Expanded の中など）に置く。
class UserNameRow extends StatelessWidget {
  const UserNameRow({
    super.key,
    required this.name,
    this.isOfficial = false,
    this.isModerator = false,
    this.level,
    this.style,
    this.badgeSize = 16,
    this.maxLines = 1,
  });

  factory UserNameRow.summary(UserSummary user, {Key? key, TextStyle? style, double badgeSize = 16, int? level}) => UserNameRow(
        key: key,
        name: user.name,
        isOfficial: user.isOfficial,
        isModerator: user.isModerator,
        level: level,
        style: style,
        badgeSize: badgeSize,
      );

  /// GraphQL の user の Map から
  factory UserNameRow.json(Map<String, dynamic>? user, {Key? key, TextStyle? style, double badgeSize = 16, String fallbackName = '退会したユーザー'}) {
    if (user == null) return UserNameRow(key: key, name: fallbackName, style: style, badgeSize: badgeSize);
    final summary = UserSummary.fromJson(user);
    return UserNameRow.summary(summary, key: key, style: style, badgeSize: badgeSize);
  }

  final String name;
  final bool isOfficial;
  final bool isModerator;

  /// API にレベルが増えたら渡す。null なら出さない
  final int? level;
  final TextStyle? style;
  final double badgeSize;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final showBadge = isOfficial || isModerator;
    final lv = level;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Text(name, maxLines: maxLines, overflow: TextOverflow.ellipsis, style: style)),
        if (showBadge) ...[
          const SizedBox(width: Ds.s4),
          OfficialBadge(size: badgeSize, isOfficial: isOfficial, isModerator: isModerator),
        ],
        if (lv != null) ...[
          const SizedBox(width: Ds.s4),
          _LevelBadge(level: lv, size: badgeSize),
        ],
      ],
    );
  }
}

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({required this.level, required this.size});

  final int level;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(gradient: Ds.goldGradient, borderRadius: Ds.br(size / 2)),
      child: Text(
        'Lv.$level',
        style: TextStyle(color: Colors.white, fontSize: size * 0.65, fontWeight: FontWeight.w800),
      ),
    );
  }
}
