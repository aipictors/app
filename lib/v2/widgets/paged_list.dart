import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// [PagedController] の縦一覧。読み込み中・空・エラー・引っ張って更新・読み足しまで面倒を見る
class PagedList<T> extends StatefulWidget {
  const PagedList({
    super.key,
    required this.controller,
    required this.itemBuilder,
    required this.emptyTitle,
    this.emptyMessage,
    this.emptyIcon = Icons.inbox_rounded,
    this.header,
    this.padding = const EdgeInsets.only(bottom: 80),
    this.separated = true,
  });

  final PagedController<T> controller;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final String emptyTitle;
  final String? emptyMessage;
  final IconData emptyIcon;
  final Widget? header;
  final EdgeInsets padding;
  final bool separated;

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
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        final head = widget.header;
        if (c.isInitialLoading) return const SkeletonList(count: 8);
        if (c.items.isEmpty && c.error != null) return Center(child: StateView.error(c.error!, onRetry: c.refresh));
        final offset = head == null ? 0 : 1;
        if (c.items.isEmpty) {
          return AppRefresh(
            onRefresh: c.refresh,
            child: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
              if (head != null) head,
              const SizedBox(height: 60),
              StateView.empty(widget.emptyTitle, message: widget.emptyMessage, icon: widget.emptyIcon),
            ]),
          );
        }
        return AppRefresh(
          onRefresh: c.refresh,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            padding: widget.padding,
            itemCount: offset + c.items.length + (c.hasMore ? 1 : 0),
            separatorBuilder: (context, i) => widget.separated && i >= offset ? Divider(height: 1, color: context.hairline) : const SizedBox.shrink(),
            itemBuilder: (context, i) {
              if (head != null && i == 0) return head;
              final index = i - offset;
              if (index >= c.items.length) {
                if (c.error != null) return StateView.error(c.error!, onRetry: c.loadMore);
                if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                return const Padding(padding: EdgeInsets.all(Ds.s16), child: Center(child: CircularProgressIndicator.adaptive()));
              }
              return widget.itemBuilder(context, c.items[index]);
            },
          ),
        );
      },
    );
  }
}
