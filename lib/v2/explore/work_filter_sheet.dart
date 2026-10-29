import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:flutter/material.dart';

/// 並び順のピルと「絞り込み」ボタンの行
class WorkFilterBar extends StatelessWidget {
  const WorkFilterBar({super.key, required this.filter, required this.onChanged, this.sorts = WorkSort.values});

  final WorkFilter filter;
  final ValueChanged<WorkFilter> onChanged;
  final List<WorkSort> sorts;

  @override
  Widget build(BuildContext context) {
    final active = filter.activeCount;
    return SizedBox(
      height: 38,
      child: Row(children: [
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 8),
            itemCount: sorts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final s = sorts[i];
              final sel = s == filter.sort;
              return _Pill(label: s.label, selected: sel, onTap: () => onChanged(filter.copyWith(sort: s)));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: _Pill(
            label: active > 0 ? '絞り込み $active' : '絞り込み',
            icon: Icons.tune_rounded,
            selected: active > 0,
            accent: true,
            onTap: () async {
              final f = await showWorkFilterSheet(context, filter);
              if (f != null) onChanged(f);
            },
          ),
        ),
      ]),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.selected, required this.onTap, this.icon, this.accent = false});

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? (accent ? context.cs.primary : context.cs.onSurface) : context.skeleton;
    final fg = selected ? (accent ? context.cs.onPrimary : context.cs.surface) : context.cs.onSurface.withValues(alpha: 0.75);
    return GestureDetector(
      onTap: () {
        Ds.tap();
        onTap();
      },
      child: AnimatedContainer(
        duration: Ds.normal,
        curve: Ds.curve,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: bg, borderRadius: Ds.br(19)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 16, color: fg), const SizedBox(width: 4)],
          Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: fg)),
        ]),
      ),
    );
  }
}

/// 種類・年齢区分・画風・プロンプトの絞り込み
Future<WorkFilter?> showWorkFilterSheet(BuildContext context, WorkFilter initial) {
  return showModalBottomSheet<WorkFilter>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      var f = initial;
      return StatefulBuilder(builder: (context, set) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(child: Text('絞り込み', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900))),
                TextButton(onPressed: () => set(() => f = WorkFilter(sort: f.sort)), child: const Text('リセット')),
              ]),
              const SizedBox(height: 12),
              ChoiceRow<WorkSort>(title: '並び順', values: WorkSort.values, labelOf: (v) => v.label, selected: f.sort, onChanged: (v) => set(() => f = f.copyWith(sort: v))),
              ChoiceRow<WorkKind>(title: '作品の種類', values: WorkKind.values, labelOf: (v) => v.label, selected: f.kind, onChanged: (v) => set(() => f = f.copyWith(kind: v))),
              ChoiceRow<RatingFilter>(title: '年齢区分', values: RatingFilter.values, labelOf: (v) => v.label, selected: f.rating, onChanged: (v) => set(() => f = f.copyWith(rating: v))),
              ChoiceRow<StyleFilter>(title: '画風', values: StyleFilter.values, labelOf: (v) => v.label, selected: f.style, onChanged: (v) => set(() => f = f.copyWith(style: v))),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('プロンプトが見られる作品だけ', style: TextStyle(fontWeight: FontWeight.w700)),
                value: f.withPrompt,
                onChanged: (v) => set(() => f = f.copyWith(withPrompt: v)),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(50), shape: RoundedRectangleBorder(borderRadius: Ds.br(25))),
                  onPressed: () => Navigator.pop(context, f),
                  child: const Text('この条件で表示', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                ),
              ),
            ]),
          ),
        );
      });
    },
  );
}
