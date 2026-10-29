import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// 作品カード（画像・タイトル・作者・いいね数）
class WorkCard extends StatelessWidget {
  const WorkCard({super.key, required this.work, this.showUser = true, this.onTap});

  final WorkSummary work;
  final bool showUser;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      scale: 0.97,
      onTap: onTap ?? () => Nav.work(context, work.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: Ds.br(14),
            child: AspectRatio(
              aspectRatio: work.aspect,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(work.imageUrl, memCacheWidth: 600),
                  Positioned(
                    left: 6,
                    top: 6,
                    child: Wrap(spacing: 4, children: [
                      if (work.rating == 'R15') const Badge2('R15', color: Color(0xCCE2A21B)),
                      if (work.isVideo) const Badge2('動画', icon: Icons.play_arrow_rounded),
                      if (work.isNovel) const Badge2('小説', icon: Icons.menu_book_rounded),
                    ]),
                  ),
                  if (work.subWorksCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Badge2('${work.subWorksCount + 1}', icon: Icons.collections_rounded),
                    ),
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: _LikePill(work: work),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          if (work.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                work.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.tt.bodyMedium?.copyWith(fontWeight: FontWeight.w700, height: 1.2),
              ),
            ),
          if (showUser) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(children: [
                Avatar(work.user.iconUrl, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    work.user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.tt.bodySmall?.copyWith(color: context.muted),
                  ),
                ),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}

class _LikePill extends StatelessWidget {
  const _LikePill({required this.work});

  final WorkSummary work;

  @override
  Widget build(BuildContext context) {
    if (work.likesCount <= 0 && !work.isLiked) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.5), borderRadius: Ds.br(10)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(work.isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded, size: 12, color: work.isLiked ? Ds.pink : Colors.white),
        const SizedBox(width: 3),
        Text(compactCount(work.likesCount), style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}

int gridColumns(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  if (w >= 1100) return 5;
  if (w >= 800) return 4;
  if (w >= 560) return 3;
  return 2;
}

/// PagedController を受け取って、石垣状に並べる Sliver 群（読み込み・空・エラー・続き読み込みも込み）
class SliverPagedWorks extends StatelessWidget {
  const SliverPagedWorks({
    super.key,
    required this.controller,
    this.emptyTitle = '作品がありません',
    this.emptyMessage,
    this.emptyIcon = Icons.image_search_rounded,
    this.showUser = true,
  });

  final PagedController<WorkSummary> controller;
  final String emptyTitle;
  final String? emptyMessage;
  final IconData emptyIcon;
  final bool showUser;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final c = controller;
        final cols = gridColumns(context);
        if (c.isInitialLoading || (c.items.isEmpty && c.hasMore && c.error == null)) {
          if (!c.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
          }
          return SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: cols,
              mainAxisSpacing: 14,
              crossAxisSpacing: 10,
              childCount: cols * 4,
              itemBuilder: (context, i) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(height: [220.0, 160.0, 260.0, 190.0][i % 4], radius: 14),
                  const SizedBox(height: 8),
                  const Skeleton(height: 12, width: 110, radius: 6),
                ],
              ),
            ),
          );
        }
        if (c.items.isEmpty && c.error != null) {
          return SliverToBoxAdapter(child: StateView.error(c.error!, onRetry: c.refresh));
        }
        if (c.items.isEmpty) {
          return SliverToBoxAdapter(
            child: StateView(icon: emptyIcon, title: emptyTitle, message: emptyMessage),
          );
        }
        return SliverMainAxisGroup(slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: cols,
              mainAxisSpacing: 14,
              crossAxisSpacing: 10,
              childCount: c.items.length,
              itemBuilder: (context, i) {
                if (i >= c.items.length - 8 && c.hasMore && !c.isLoading && c.error == null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
                }
                return WorkCard(work: c.items[i], showUser: showUser);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: c.isLoading
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5))
                    : c.error != null
                        ? TextButton.icon(onPressed: c.loadMore, icon: const Icon(Icons.refresh_rounded), label: const Text('続きを読み込む'))
                        : !c.hasMore
                            ? Text('ここまでです', style: TextStyle(color: context.muted, fontSize: 12))
                            : const SizedBox(height: 24),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ]);
      },
    );
  }
}

/// 横スクロールの作品の列
class WorkStrip extends StatelessWidget {
  const WorkStrip({super.key, required this.works, this.height = 210});

  final List<WorkSummary> works;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: works.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final w = works[i];
          return SizedBox(
            width: height * 0.72,
            child: Pressable(
              onTap: () => Nav.work(context, w.id),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: AppImage(w.imageUrl, radius: 14, memCacheWidth: 450, width: double.infinity),
                ),
                const SizedBox(height: 6),
                Text(w.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(fontWeight: FontWeight.w700)),
                Text(w.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.labelSmall?.copyWith(color: context.muted)),
              ]),
            ),
          );
        },
      ),
    );
  }
}
