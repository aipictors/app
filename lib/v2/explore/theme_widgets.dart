import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// お題の色（探すの今日のお題カードと同じ）
const themeGradient = LinearGradient(colors: [Color(0xFFFF8A5B), Color(0xFFFF5C8A), Color(0xFF8B5CF6)]);

const _weekJa = ['月', '火', '水', '木', '金', '土', '日'];
const _weekEn = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _monthEn = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

/// 曜日（月曜始まりの短い名前）
String weekdayLabel(int weekday) => tr(_weekJa[weekday - 1], _weekEn[weekday - 1]);

/// 11/16（日） / Nov 16 (Sun)
String themeDateLabel(DateTime d, {bool year = false}) => tr(
      '${year ? '${d.year}/' : ''}${d.month}/${d.day}（${_weekJa[d.weekday - 1]}）',
      '${_monthEn[d.month - 1]} ${d.day}${year ? ', ${d.year}' : ''} (${_weekEn[d.weekday - 1]})',
    );

/// 2026年11月 / Nov 2026
String themeMonthLabel(DateTime d) => tr('${d.year}年${d.month}月', '${_monthEn[d.month - 1]} ${d.year}');

/// 参加作品の数
String themeWorksCountLabel(int n) => tr('${compactCount(n)}作品', n == 1 ? '1 work' : '${compactCount(n)} works');

/// 代表の作品が無い（または全年齢でない）ときの絵
class ThemeThumbPlaceholder extends StatelessWidget {
  const ThemeThumbPlaceholder({super.key, this.radius = 14, this.iconSize = 30});

  final double radius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: themeGradient, borderRadius: Ds.br(radius)),
      child: Icon(Icons.lightbulb_rounded, color: Colors.white.withValues(alpha: 0.9), size: iconSize),
    );
  }
}

/// 過去のお題の 1 枚（横スクロールの帯・一覧で使う）
class ThemeStripCard extends StatelessWidget {
  const ThemeStripCard({super.key, required this.theme, this.width = 132});

  final DailyTheme theme;
  final double width;

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return SizedBox(
      width: width,
      child: Pressable(
        onTap: () => context.push(t.path),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(fit: StackFit.expand, children: [
              t.thumbnailUrl != null ? AppImage(t.thumbnailUrl, radius: 14, memCacheWidth: 300) : const ThemeThumbPlaceholder(),
              Positioned(
                left: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.55), borderRadius: Ds.br(10)),
                  child: Text(themeDateLabel(t.date), style: const TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w800)),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 6),
          Text(t.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(fontWeight: FontWeight.w800)),
          Row(children: [
            Icon(Icons.photo_library_outlined, size: 12, color: context.muted),
            const SizedBox(width: 3),
            Text(themeWorksCountLabel(t.worksCount), style: context.tt.labelSmall?.copyWith(color: context.muted)),
          ]),
        ]),
      ),
    );
  }
}

/// 今日のお題（グラデーションのカード）
class ThemeTodayCard extends StatelessWidget {
  const ThemeTodayCard({super.key, required this.theme});

  final DailyTheme theme;

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Pressable(
      scale: 0.98,
      onTap: () => context.push(t.path),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          borderRadius: Ds.br(20),
          gradient: themeGradient,
          boxShadow: [BoxShadow(color: const Color(0xFFFF5C8A).withValues(alpha: 0.25), blurRadius: 18, offset: const Offset(0, 8))],
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 1,
              child: t.thumbnailUrl != null
                  ? AppImage(t.thumbnailUrl, radius: 14, memCacheWidth: 240)
                  : Container(
                      decoration: BoxDecoration(color: Colors.white24, borderRadius: Ds.br(14)),
                      child: const Icon(Icons.lightbulb_rounded, color: Colors.white, size: 34),
                    ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: Ds.br(8)),
                  child: Text(tr('今日のお題', "Today's theme"), style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
                ),
                const SizedBox(height: 4),
                Text(t.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
                Text(tr('${compactCount(t.worksCount)}作品が参加中', '${compactCount(t.worksCount)} works'), style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.chevron_right_rounded, color: Colors.white)),
        ]),
      ),
    );
  }
}
