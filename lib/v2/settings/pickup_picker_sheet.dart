import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// ピックアップに選べる数（Web の limit={3}）
const pickupLimit = 3;

/// 自分の作品からピックアップを選ぶシート（Web の SelectCreatedWorksDialog）。決めたら選んだ順の一覧を返す
Future<List<PickupWork>?> showPickupPickerSheet(BuildContext context, {required String userId, required List<PickupWork> selected}) {
  return showModalBottomSheet<List<PickupWork>>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Ds.r28)),
    builder: (_) => _PickupPickerSheet(userId: userId, selected: selected),
  );
}

class _PickupPickerSheet extends StatefulWidget {
  const _PickupPickerSheet({required this.userId, required this.selected});

  final String userId;
  final List<PickupWork> selected;

  @override
  State<_PickupPickerSheet> createState() => _PickupPickerSheetState();
}

class _PickupPickerSheetState extends State<_PickupPickerSheet> {
  late final List<PickupWork> _selected = List.of(widget.selected);
  late final _works = PagedController<PickupWork>(
    fetch: (o, l) => SettingsApi.pickupCandidates(widget.userId, o, l),
    pageSize: 32,
    idOf: (w) => w.id,
  );

  @override
  void initState() {
    super.initState();
    _works.loadMore();
  }

  @override
  void dispose() {
    _works.dispose();
    super.dispose();
  }

  void _toggle(PickupWork w) {
    final i = _selected.indexWhere((s) => s.id == w.id);
    if (i >= 0) {
      setState(() => _selected.removeAt(i));
    } else if (_selected.length >= pickupLimit) {
      context.toast('選択できる作品数は$pickupLimitつまでです', error: true);
      return;
    } else {
      setState(() => _selected.add(w));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s20, Ds.s16, Ds.s8, Ds.s4),
          child: Row(children: [
            const Expanded(child: Text('ピックアップ作品を選ぶ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17))),
            Text('${_selected.length} / $pickupLimit', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700)),
            IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close_rounded)),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Ds.s20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('プロフィールの上の方に出す作品です。押すと選択・解除できます', style: TextStyle(color: context.muted, fontSize: 12.5)),
          ),
        ),
        const SizedBox(height: Ds.s8),
        Expanded(
          child: ListenableBuilder(
            listenable: _works,
            builder: (context, _) {
              final c = _works;
              if (c.isInitialLoading) return const SkeletonGrid();
              if (c.items.isEmpty && c.error != null) return Center(child: StateView.error(c.error!, onRetry: c.refresh));
              if (c.items.isEmpty) return Center(child: StateView.empty('選べる作品がありません', message: '作品を投稿すると、ここから選べます', icon: Icons.push_pin_outlined));
              return NotificationListener<ScrollNotification>(
                onNotification: (n) {
                  if (n.metrics.pixels > n.metrics.maxScrollExtent - 400) c.loadMore();
                  return false;
                },
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s4, Ds.s16, Ds.s16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 160, mainAxisSpacing: Ds.s8, crossAxisSpacing: Ds.s8),
                  itemCount: c.items.length + (c.hasMore ? 1 : 0),
                  itemBuilder: (context, i) {
                    if (i >= c.items.length) return const Center(child: CircularProgressIndicator.adaptive());
                    final w = c.items[i];
                    final order = _selected.indexWhere((s) => s.id == w.id);
                    return PickupTile(work: w, order: order >= 0 ? order + 1 : null, onTap: () => _toggle(w));
                  },
                ),
              );
            },
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s12),
            child: PrimaryButton(label: '決定', onPressed: () => Navigator.of(context).pop(List<PickupWork>.of(_selected))),
          ),
        ),
      ]),
    );
  }
}

/// ピックアップの作品の四角。[order] があれば選んだ順の番号を出す
class PickupTile extends StatelessWidget {
  const PickupTile({super.key, required this.work, this.order, this.onTap, this.onRemove});

  final PickupWork work;
  final int? order;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final selected = order != null;
    return Pressable(
      scale: 0.97,
      onTap: onTap,
      child: Stack(fit: StackFit.expand, children: [
        AppImage(work.thumbnailUrl, radius: 12, memCacheWidth: 360),
        AnimatedContainer(
          duration: Ds.fast,
          decoration: BoxDecoration(
            borderRadius: Ds.br(12),
            border: Border.all(color: selected ? context.cs.primary : Colors.transparent, width: 3),
            color: selected ? context.cs.primary.withValues(alpha: 0.12) : null,
          ),
        ),
        if (selected)
          Positioned(
            right: Ds.s6,
            top: Ds.s6,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: context.cs.primary,
              child: Text('$order', style: TextStyle(color: context.cs.onPrimary, fontWeight: FontWeight.w800, fontSize: 12)),
            ),
          ),
        if (onRemove != null)
          Positioned(
            right: Ds.s4,
            top: Ds.s4,
            child: Pressable(
              onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                child: const Icon(Icons.close_rounded, color: Colors.white, size: 15),
              ),
            ),
          ),
      ]),
    );
  }
}
