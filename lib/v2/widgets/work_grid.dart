import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/grid_layout.dart';
import 'package:aipictors/v2/core/list_like_count.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/official_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:share_plus/share_plus.dart';

/// 作品カード（画像・タイトル・作者・いいね数）。長押しでいいね・共有などのメニュー
class WorkCard extends StatefulWidget {
  const WorkCard({super.key, required this.work, this.showUser = true, this.onTap});

  final WorkSummary work;
  final bool showUser;
  final VoidCallback? onTap;

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  WorkSummary get work => widget.work;
  bool get showUser => widget.showUser;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      scale: 0.97,
      onTap: widget.onTap ?? () => Nav.work(context, work.id),
      onLongPress: () => showWorkCardMenu(context, work, onChanged: () {
        if (mounted) setState(() {});
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: GridLayout.square,
            builder: (context, square, child) => ClipRRect(
              borderRadius: Ds.br(14),
              child: AspectRatio(
                // 正方形にそろえる設定のときは 1:1 で切り取る（ヘッダーの表示切り替え）
                aspectRatio: square ? 1 : work.aspect,
                child: child,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppImage(work.imageUrl, memCacheWidth: 600),
                Positioned(
                  left: 6,
                  top: 6,
                  child: Wrap(spacing: 4, children: [
                    if (work.rating == 'R15') const Badge2('R15', color: Color(0xCCE2A21B)),
                    if (work.isVideo) Badge2(tr('動画', 'Video'), icon: Icons.play_arrow_rounded),
                    if (work.isNovel) Badge2(tr('小説', 'Novel'), icon: Icons.menu_book_rounded),
                    // コメント数（Web の作品カードと同じ）
                    if (work.commentsCount > 0) Badge2(compactCount(work.commentsCount), icon: Icons.chat_bubble_rounded),
                  ]),
                ),
                // Aipictors で生成・プロンプト公開の印（Web の WorkMediaBadge）
                if (work.isGeneration || work.isPromptPublic)
                  Positioned(left: 6, bottom: 6, child: _MediaMark(generation: work.isGeneration)),
                if (work.subWorksCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Badge2('${work.subWorksCount + 1}', icon: Icons.collections_rounded),
                  ),
                Positioned(
                  right: 6,
                  bottom: 6,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: ListLikeCount.hidden,
                    builder: (context, hidden, _) => hidden ? const SizedBox.shrink() : _LikePill(work: work),
                  ),
                ),
              ],
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
                UserAvatar.summary(work.user, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    work.user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.tt.bodySmall?.copyWith(color: context.muted),
                  ),
                ),
                if (work.user.isOfficial || work.user.isModerator) ...[const SizedBox(width: 2), OfficialBadge(size: 13, isOfficial: work.user.isOfficial, isModerator: work.user.isModerator)],
              ]),
            ),
          ],
        ],
      ),
    );
  }
}

/// 生成作品（✦）・プロンプト公開（P）の小さな丸
class _MediaMark extends StatelessWidget {
  const _MediaMark({required this.generation});

  final bool generation;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: generation ? tr('Aipictors生成作品', 'Generated on Aipictors') : tr('プロンプト公開作品', 'Prompt available'),
      child: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: generation ? const LinearGradient(colors: [Ds.purple, Ds.pink]) : null,
          color: generation ? null : const Color(0xCC2563EB),
        ),
        child: generation
            ? const Icon(Icons.auto_awesome_rounded, size: 12, color: Colors.white)
            : const Text('P', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
      ),
    );
  }
}

/// 作品カードの長押しメニュー（いいね・共有・リンクのコピー・作者のページ）
Future<void> showWorkCardMenu(BuildContext context, WorkSummary work, {VoidCallback? onChanged}) {
  final url = 'https://www.aipictors.com/posts/${work.id}';
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    useSafeArea: true,
    builder: (sheet) => SafeArea(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Row(children: [
            AppImage(work.imageUrl, width: 48, height: 48, radius: 10, memCacheWidth: 150),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(work.title.isEmpty ? tr('無題', 'Untitled') : work.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: sheet.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
                Text(work.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: sheet.tt.bodySmall?.copyWith(color: sheet.muted)),
              ]),
            ),
          ]),
        ),
        ListTile(
          leading: Icon(work.isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded, color: work.isLiked ? Ds.pink : null),
          title: Text(work.isLiked ? tr('いいねを取り消す', 'Remove like') : tr('いいね', 'Like')),
          onTap: () {
            Navigator.pop(sheet);
            _toggleLike(context, work, onChanged);
          },
        ),
        ListTile(
          leading: const Icon(Icons.ios_share_rounded),
          title: Text(tr('共有', 'Share')),
          onTap: () {
            Navigator.pop(sheet);
            // iPad は共有シートの位置を渡さないと開けない
            final box = context.findRenderObject() as RenderBox?;
            Share.share('${work.title} / ${work.user.name}\n$url', sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size);
          },
        ),
        ListTile(
          leading: const Icon(Icons.link_rounded),
          title: Text(tr('リンクをコピー', 'Copy link')),
          onTap: () {
            Navigator.pop(sheet);
            Clipboard.setData(ClipboardData(text: url));
            context.toast(tr('リンクをコピーしました', 'Link copied'), icon: Icons.check_rounded);
          },
        ),
        if (work.user.id.isNotEmpty)
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: Text(tr('作者のページを見る', "View creator's page")),
            onTap: () {
              Navigator.pop(sheet);
              Nav.user(context, work.user.id);
            },
          ),
        const SizedBox(height: 8),
      ]),
    ),
  );
}

/// カードからのいいね（Web の作品カードのいいねボタンと同じ mutation）
Future<void> _toggleLike(BuildContext context, WorkSummary work, VoidCallback? onChanged) async {
  if (!Nav.requireLogin(context)) return;
  final liked = !work.isLiked;
  work.isLiked = liked;
  work.likesCount += liked ? 1 : -1;
  onChanged?.call();
  Ds.impact();
  try {
    await Api.mutate(
      liked
          ? r'mutation AppLikeWork($input: CreateWorkLikeInput!) { createWorkLike(input: $input) { id } }'
          : r'mutation AppUnlikeWork($input: DeleteWorkLikeInput!) { deleteWorkLike(input: $input) { id } }',
      variables: {
        'input': {'workId': work.id},
      },
    );
  } on ApiException catch (e) {
    work.isLiked = !liked;
    work.likesCount += liked ? -1 : 1;
    onChanged?.call();
    if (context.mounted) context.toast(e.message, error: true);
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

int gridColumns(BuildContext context) => gridColumnsFor(MediaQuery.sizeOf(context).width);

/// 幅から列数を決める。普通のスマホは 2 列のまま、広い画面は 1 列およそ 200pt で増やす（最大 6 列）
int gridColumnsFor(double width) {
  if (width < 560) return 2;
  return (width / 200).floor().clamp(3, 6);
}

/// PagedController を受け取って、石垣状に並べる Sliver 群（読み込み・空・エラー・続き読み込みも込み）
class SliverPagedWorks extends StatelessWidget {
  const SliverPagedWorks({
    super.key,
    required this.controller,
    this.emptyTitle,
    this.emptyMessage,
    this.emptyIcon = Icons.image_search_rounded,
    this.showUser = true,
  });

  final PagedController<WorkSummary> controller;
  final String? emptyTitle;
  final String? emptyMessage;
  final IconData emptyIcon;
  final bool showUser;

  @override
  Widget build(BuildContext context) {
    // 実際に使える幅で列数を決める（折りたたみの開閉や余白のある画面でも合うように）
    return SliverLayoutBuilder(
      builder: (context, constraints) => ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final c = controller;
        final cols = gridColumnsFor(constraints.crossAxisExtent);
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
            child: StateView(icon: emptyIcon, title: emptyTitle ?? tr('作品がありません', 'No works'), message: emptyMessage),
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
                        ? TextButton.icon(onPressed: c.loadMore, icon: const Icon(Icons.refresh_rounded), label: Text(tr('続きを読み込む', 'Load more')))
                        : !c.hasMore
                            ? Text(tr('ここまでです', "That's all"), style: TextStyle(color: context.muted, fontSize: 12))
                            : const SizedBox(height: 24),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ]);
      },
      ),
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
