import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// PagedController を受け取る 1 列の一覧（読み足し・空・エラー込み）
class PagedList<T> extends StatefulWidget {
  const PagedList({
    super.key,
    required this.controller,
    required this.itemBuilder,
    this.emptyTitle = 'まだありません',
    this.emptyIcon = Icons.inbox_rounded,
    this.emptyMessage,
    this.padding = const EdgeInsets.only(bottom: 32),
    this.header,
  });

  final PagedController<T> controller;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final String emptyTitle;
  final IconData emptyIcon;
  final String? emptyMessage;
  final EdgeInsets padding;
  final Widget? header;

  @override
  State<PagedList<T>> createState() => _PagedListState<T>();
}

class _PagedListState<T> extends State<PagedList<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.controller.items.isEmpty) widget.controller.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.controller;
    return AppRefresh(
      onRefresh: c.refresh,
      child: ListenableBuilder(
        listenable: c,
        builder: (context, _) {
          final extra = widget.header == null ? 0 : 1;
          if (c.items.isEmpty) {
            return ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
              if (widget.header != null) widget.header!,
              if (c.isLoading)
                const SizedBox(height: 480, child: SkeletonList(count: 6))
              else if (c.error != null)
                StateView.error(c.error!, onRetry: c.refresh)
              else
                StateView.empty(widget.emptyTitle, icon: widget.emptyIcon, message: widget.emptyMessage),
            ]);
          }
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: widget.padding,
            itemCount: c.items.length + extra + 1,
            itemBuilder: (context, i) {
              if (extra == 1 && i == 0) return widget.header!;
              final index = i - extra;
              if (index >= c.items.length) {
                if (c.hasMore && !c.isLoading && c.error == null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                }
                return SizedBox(
                  height: 56,
                  child: c.hasMore && c.error == null ? const Center(child: CircularProgressIndicator.adaptive()) : null,
                );
              }
              return widget.itemBuilder(context, c.items[index]);
            },
          );
        },
      ),
    );
  }
}

String formatYmd(int epochSeconds) {
  final d = DateTime.fromMillisecondsSinceEpoch(epochSeconds * 1000);
  return '${d.year}年${d.month}月${d.day}日';
}
