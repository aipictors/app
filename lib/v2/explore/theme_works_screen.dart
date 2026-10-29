import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';

/// 今日のお題に参加している作品
class ThemeWorksScreen extends StatefulWidget {
  const ThemeWorksScreen({super.key, required this.theme});

  final DailyTheme theme;

  @override
  State<ThemeWorksScreen> createState() => _ThemeWorksScreenState();
}

class _ThemeWorksScreenState extends State<ThemeWorksScreen> {
  static const _sorts = [WorkSort.likes, WorkSort.latest];
  int _sort = 0;
  late PagedController<WorkSummary> _c = _make();

  PagedController<WorkSummary> _make() => PagedController(
        idOf: (w) => w.id,
        fetch: (o, l) => ExploreApi.themeWorks(widget.theme.id, _sorts[_sort], o, l),
      );

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.theme;
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: _c.refresh,
        child: CustomScrollView(slivers: [
          SliverAppBar.large(
            title: Text(t.title, style: const TextStyle(fontWeight: FontWeight.w900)),
            flexibleSpace: null,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Row(children: [
                const Badge2('今日のお題', icon: Icons.lightbulb_rounded, color: Ds.pink),
                const SizedBox(width: 8),
                Text('${t.dateText.replaceAll('-', '/')}・${compactCount(t.worksCount)}作品', style: context.tt.bodySmall?.copyWith(color: context.muted)),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: PillTabs(
              labels: _sorts.map((s) => s.label).toList(),
              index: _sort,
              onChanged: (i) {
                if (i == _sort) return;
                final old = _c;
                setState(() {
                  _sort = i;
                  _c = _make();
                });
                WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
              },
            ),
          ),
          SliverPagedWorks(key: ValueKey(_sort), controller: _c, emptyTitle: 'まだ作品がありません', emptyMessage: 'お題に参加した作品がここに並びます'),
        ]),
      ),
    );
  }
}
