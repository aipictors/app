import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// タグ名から決まる色（サムネイルが無いときの背景）
List<Color> tagColors(String name) {
  const palettes = [
    [Color(0xFF0170C8), Color(0xFF3BA7F5)],
    [Color(0xFF6D5DF6), Color(0xFFB07CFF)],
    [Color(0xFFFF5C8A), Color(0xFFFF9A6B)],
    [Color(0xFF12B886), Color(0xFF63E6BE)],
    [Color(0xFFE2A21B), Color(0xFFFFD36B)],
    [Color(0xFF1098AD), Color(0xFF66D9E8)],
  ];
  final h = name.codeUnits.fold<int>(0, (a, b) => (a * 31 + b) & 0x7fffffff);
  return palettes[h % palettes.length];
}

/// 写真つきのタグのカード
class TagCard extends StatelessWidget {
  const TagCard({super.key, required this.tag, required this.onTap, this.width = 132, this.height = 88});

  final TagSummary tag;
  final VoidCallback onTap;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = tagColors(tag.name);
    return Pressable(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: Ds.br(16),
          child: Stack(fit: StackFit.expand, children: [
            DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight))),
            if (tag.thumbnailUrl != null) AppImage(tag.thumbnailUrl, memCacheWidth: 360),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00000000), Color(0xB3000000)],
                  stops: [0.35, 1],
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 8,
              child: Text(
                '#${tag.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14, shadows: [Shadow(blurRadius: 6, color: Colors.black45)]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

/// 色つきの小さなタグのチップ
class TagChip extends StatelessWidget {
  const TagChip({super.key, required this.name, required this.onTap, this.icon});

  final String name;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final c = tagColors(name).first;
    return Pressable(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: c.withValues(alpha: context.isDark ? 0.22 : 0.1),
          borderRadius: Ds.br(20),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon ?? Icons.tag_rounded, size: 15, color: context.isDark ? Color.lerp(c, Colors.white, 0.4) : c),
          const SizedBox(width: 4),
          Text(name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: context.isDark ? Color.lerp(c, Colors.white, 0.55) : Color.lerp(c, Colors.black, 0.25))),
        ]),
      ),
    );
  }
}

/// 押すと検索画面が開く大きな丸い検索欄
class SearchPill extends StatelessWidget {
  const SearchPill({super.key, required this.onTap, this.text, this.hint = '作品・タグ・ユーザーを検索', this.height = 50});

  final VoidCallback onTap;
  final String? text;
  final String hint;
  final double height;

  @override
  Widget build(BuildContext context) {
    final hasText = text != null && text!.isNotEmpty;
    return Pressable(
      scale: 0.98,
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.isDark ? const Color(0xFF1E2127) : const Color(0xFFF1F3F7),
          borderRadius: Ds.br(height / 2),
          border: Border.all(color: context.hairline),
        ),
        child: Row(children: [
          Icon(Icons.search_rounded, color: hasText ? context.cs.onSurface : context.muted),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              hasText ? text! : hint,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: hasText ? FontWeight.w700 : FontWeight.w500,
                color: hasText ? context.cs.onSurface : context.muted,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

/// 金・銀・銅のメダル（4 位以下は数字）
class RankBadge extends StatelessWidget {
  const RankBadge({super.key, required this.rank, this.size = 30});

  final int rank;
  final double size;

  static const _medals = [
    [Color(0xFFFFE08A), Color(0xFFE2A21B)],
    [Color(0xFFF1F3F5), Color(0xFF9AA5B1)],
    [Color(0xFFF4C29A), Color(0xFFB4693A)],
  ];

  @override
  Widget build(BuildContext context) {
    if (rank >= 1 && rank <= 3) {
      final c = _medals[rank - 1];
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: c, begin: Alignment.topLeft, end: Alignment.bottomRight),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [BoxShadow(color: c.last.withValues(alpha: 0.45), blurRadius: 8, offset: const Offset(0, 3))],
        ),
        child: Text('$rank', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: size * 0.46, shadows: const [Shadow(blurRadius: 3, color: Colors.black26)])),
      );
    }
    return Container(
      height: size * 0.8,
      constraints: BoxConstraints(minWidth: size * 0.8),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: Ds.br(size)),
      child: Text('$rank', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: size * 0.4)),
    );
  }
}

/// 下から出る選択肢の行
class ChoiceRow<T> extends StatelessWidget {
  const ChoiceRow({super.key, required this.title, required this.values, required this.labelOf, required this.selected, required this.onChanged});

  final String title;
  final List<T> values;
  final String Function(T) labelOf;
  final T selected;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: context.tt.labelLarge?.copyWith(color: context.muted, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final v in values)
            ChoiceChip(
              label: Text(labelOf(v)),
              selected: v == selected,
              showCheckmark: false,
              shape: RoundedRectangleBorder(borderRadius: Ds.br(18)),
              labelStyle: TextStyle(fontWeight: FontWeight.w700, color: v == selected ? context.cs.surface : context.cs.onSurface),
              selectedColor: context.cs.onSurface,
              backgroundColor: context.skeleton,
              side: BorderSide.none,
              onSelected: (_) => onChanged(v),
            ),
        ]),
      ]),
    );
  }
}
