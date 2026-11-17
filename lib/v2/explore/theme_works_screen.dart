import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/theme_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';

/// その日のお題に参加している作品（/themes/年/月/日）。前後の日へ移れて、並び（人気・新着・閲覧数・コメント）を選べる
class ThemeWorksScreen extends StatefulWidget {
  const ThemeWorksScreen({super.key, required this.year, required this.month, required this.day});

  final int year;
  final int month;
  final int day;

  @override
  State<ThemeWorksScreen> createState() => _ThemeWorksScreenState();
}

class _ThemeWorksScreenState extends State<ThemeWorksScreen> {
  late DateTime _date = DateTime(widget.year, widget.month, widget.day);
  DailyTheme? _theme;
  bool _loading = true;
  String? _error;
  // 選んだ並びは日を移っても保つ。開発用: /tmp/aipictors-debug の 2 行目が sort:<n> ならその並びで開く（表示の確認用）
  int _sort = DebugBoot.screenTab?.startsWith('sort:') == true ? (int.tryParse(DebugBoot.screenTab!.substring(5)) ?? 0).clamp(0, themeSorts.length - 1) : 0;
  PagedController<WorkSummary>? _c;

  DateTime get _today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final date = _date;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final t = await ExploreApi.themeOn(date.year, date.month, date.day);
      if (!mounted || date != _date) return;
      final old = _c;
      setState(() {
        _theme = t;
        _loading = false;
        _c = t == null ? null : _make(t.id);
      });
      if (old != null) WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
    } on ApiException catch (e) {
      if (mounted && date == _date) {
        setState(() {
          _loading = false;
          _error = e.message;
        });
      }
    }
  }

  PagedController<WorkSummary> _make(String id) {
    final sort = themeSorts[_sort];
    return PagedController(idOf: (w) => w.id, fetch: (o, l) => ExploreApi.themeWorks(id, sort, o, l));
  }

  void _shift(int days) {
    final next = DateTime(_date.year, _date.month, _date.day + days);
    if (next.isAfter(_today)) return;
    setState(() => _date = next);
    _load();
  }

  void _setSort(int i) {
    final t = _theme;
    if (i == _sort || t == null) return;
    final old = _c;
    setState(() {
      _sort = i;
      _c = _make(t.id);
    });
    if (old != null) WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
  }

  Future<void> _refresh() async {
    Api.clearCache();
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = _theme;
    final c = _c;
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: _refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(t?.title ?? tr('お題', 'Theme'), style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
            SliverToBoxAdapter(child: _hero(t)),
            if (_error != null)
              SliverFillRemaining(hasScrollBody: false, child: StateView.error(_error!, onRetry: _load))
            else if (_loading)
              const SkeletonGrid(sliver: true)
            else if (t == null || c == null)
              SliverFillRemaining(
                hasScrollBody: false,
                child: StateView.empty(tr('この日のお題はありません', 'No theme on this day'), icon: Icons.event_busy_rounded),
              )
            else ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 16, 8),
                  child: Row(children: [
                    Icon(Icons.sort_rounded, size: 18, color: context.muted),
                    const SizedBox(width: 6),
                    Text(tr('並べ替え', 'Sort by'), style: context.tt.labelLarge?.copyWith(color: context.muted, fontWeight: FontWeight.w700)),
                  ]),
                ),
              ),
              SliverToBoxAdapter(child: PillTabs(labels: themeSorts.map((s) => s.label).toList(), index: _sort, onChanged: _setSort)),
              const SliverToBoxAdapter(child: SizedBox(height: Ds.s8)),
              SliverPagedWorks(
                key: ValueKey('${t.id}-$_sort'),
                controller: c,
                emptyTitle: tr('まだ作品がありません', 'No works yet'),
                emptyMessage: tr('お題に参加した作品がここに並びます', 'Works for this theme will appear here'),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: Ds.s32)),
            ],
          ],
        ),
      ),
    );
  }

  /// 日付（前後の日へ）・お題名・作品数・ひとこと
  Widget _hero(DailyTheme? t) {
    final isToday = _date == _today;
    final canNext = _date.isBefore(_today);
    const white = Colors.white;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: Ds.br(20),
          gradient: themeGradient,
          boxShadow: [BoxShadow(color: const Color(0xFFFF5C8A).withValues(alpha: 0.22), blurRadius: 16, offset: const Offset(0, 6))],
        ),
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            IconButton(tooltip: tr('前の日', 'Previous day'), onPressed: () => _shift(-1), icon: const Icon(Icons.chevron_left_rounded, color: white)),
            Expanded(
              child: Column(children: [
                Text(themeDateLabel(_date, year: true), style: const TextStyle(color: white, fontSize: 13, fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration: BoxDecoration(color: white.withValues(alpha: 0.25), borderRadius: Ds.br(8)),
                  child: Text(isToday ? tr('今日のお題', "Today's theme") : tr('過去のお題', 'Past theme'), style: const TextStyle(color: white, fontSize: 10.5, fontWeight: FontWeight.w800)),
                ),
              ]),
            ),
            IconButton(
              tooltip: tr('次の日', 'Next day'),
              onPressed: canNext ? () => _shift(1) : null,
              icon: Icon(Icons.chevron_right_rounded, color: canNext ? white : white.withValues(alpha: 0.3)),
            ),
          ]),
          const SizedBox(height: 6),
          if (_loading && t == null)
            const Center(child: SizedBox(height: 28, width: 28, child: CircularProgressIndicator(strokeWidth: 2.5, color: white)))
          else if (t != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(t.title, textAlign: TextAlign.center, style: const TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.w900, height: 1.2)),
            ),
            const SizedBox(height: 4),
            Text(
              isToday ? tr('${compactCount(t.worksCount)}作品が参加中', '${compactCount(t.worksCount)} works so far') : themeWorksCountLabel(t.worksCount),
              textAlign: TextAlign.center,
              style: TextStyle(color: white.withValues(alpha: 0.92), fontSize: 13, fontWeight: FontWeight.w700),
            ),
            if (t.note != null) ...[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                // 長いひとことは 3 行まで。英語表示では自動で英語にする（作品の説明と同じ）
                child: AutoTranslatedText(
                  t.note!,
                  showLabel: false,
                  builder: (context, text) => Text(text, maxLines: 3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: white.withValues(alpha: 0.92), fontSize: 12.5, height: 1.45)),
                ),
              ),
            ],
            if (t.proposerName != null) ...[
              const SizedBox(height: 4),
              Text(tr('提案: ${t.proposerName}さん', 'Suggested by ${t.proposerName}'), textAlign: TextAlign.center, style: TextStyle(color: white.withValues(alpha: 0.8), fontSize: 11.5, fontWeight: FontWeight.w600)),
            ],
          ],
        ]),
      ),
    );
  }
}
