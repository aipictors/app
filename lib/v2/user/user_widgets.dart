import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// フォローボタン（押した瞬間に見た目を変え、失敗したら戻す）
class FollowButton extends StatefulWidget {
  const FollowButton({
    super.key,
    required this.userId,
    required this.isFollowing,
    this.onChanged,
    this.compact = false,
    this.expand = false,
  });

  final String userId;
  final bool isFollowing;
  final ValueChanged<bool>? onChanged;
  final bool compact;
  final bool expand;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  late bool _following = widget.isFollowing;
  bool _busy = false;

  @override
  void didUpdateWidget(covariant FollowButton old) {
    super.didUpdateWidget(old);
    if (old.isFollowing != widget.isFollowing && !_busy) _following = widget.isFollowing;
  }

  Future<void> _toggle() async {
    if (_busy) return;
    if (!Nav.requireLogin(context)) return;
    final next = !_following;
    if (!next) {
      final ok = await showModalBottomSheet<bool>(
        context: context,
        showDragHandle: true,
        builder: (context) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('フォローを解除しますか？', style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: context.cs.error, foregroundColor: context.cs.onError, minimumSize: const Size.fromHeight(48)),
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('フォローを解除'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('キャンセル')),
              ),
            ]),
          ),
        ),
      );
      if (ok != true || !mounted) return;
    }
    Ds.impact();
    setState(() {
      _following = next;
      _busy = true;
    });
    widget.onChanged?.call(next);
    try {
      await UserApi.follow(widget.userId, next);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _following = !next);
      widget.onChanged?.call(!next);
      context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = widget.compact ? 34.0 : 42.0;
    final child = AnimatedSwitcher(
      duration: Ds.fast,
      child: Row(
        key: ValueKey(_following),
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(_following ? Icons.check_rounded : Icons.person_add_alt_1_rounded, size: widget.compact ? 16 : 18, color: _following ? context.cs.onSurface : Colors.white),
          const SizedBox(width: 6),
          Text(
            _following ? 'フォロー中' : 'フォローする',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: widget.compact ? 13 : 15, color: _following ? context.cs.onSurface : Colors.white),
          ),
        ],
      ),
    );
    return Pressable(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: Ds.normal,
        curve: Ds.curve,
        height: h,
        width: widget.expand ? double.infinity : null,
        padding: EdgeInsets.symmetric(horizontal: widget.compact ? 14 : 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: Ds.br(h / 2),
          gradient: _following ? null : Ds.brandGradient,
          color: _following ? context.skeleton : null,
          border: _following ? Border.all(color: context.hairline) : null,
        ),
        child: child,
      ),
    );
  }
}

/// ユーザーの 1 行（アイコン・名前・自己紹介・フォロー・最近の作品）
class UserRowTile extends StatelessWidget {
  const UserRowTile({super.key, required this.user, this.viewerId});

  final UserRowData user;
  final String? viewerId;

  @override
  Widget build(BuildContext context) {
    final isSelf = viewerId != null && viewerId == user.id;
    return Pressable(
      scale: 0.98,
      onTap: () => Nav.user(context, user.id),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.surfaceCard,
          borderRadius: Ds.br(18),
          border: Border.all(color: context.hairline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Avatar(user.iconUrl, size: 48),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text('@${user.login}', maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(color: context.muted)),
                ]),
              ),
              if (!isSelf) ...[
                const SizedBox(width: 8),
                FollowButton(userId: user.id, isFollowing: user.isFollowee, compact: true, onChanged: (v) => user.isFollowee = v),
              ],
            ]),
            if (user.biography.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(user.biography, maxLines: 2, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(color: context.muted, height: 1.45)),
            ],
            if (user.works.isNotEmpty) ...[
              const SizedBox(height: 10),
              Row(children: [
                for (var i = 0; i < 4; i++) ...[
                  if (i > 0) const SizedBox(width: 6),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: i < user.works.length
                          ? Pressable(
                              onTap: () => Nav.work(context, user.works[i].id),
                              child: AppImage(user.works[i].imageUrl, radius: 10, memCacheWidth: 300),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ]),
            ],
          ],
        ),
      ),
    );
  }
}

/// ユーザーの行のスケルトン
class UserRowSkeleton extends StatelessWidget {
  const UserRowSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline)),
      child: Column(children: [
        const Row(children: [
          Skeleton(width: 48, height: 48, radius: 24),
          SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Skeleton(width: 120, height: 14, radius: 6),
              SizedBox(height: 6),
              Skeleton(width: 80, height: 10, radius: 5),
            ]),
          ),
          Skeleton(width: 96, height: 34, radius: 17),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          for (var i = 0; i < 4; i++) ...[
            if (i > 0) const SizedBox(width: 6),
            const Expanded(child: AspectRatio(aspectRatio: 1, child: Skeleton(radius: 10))),
          ],
        ]),
      ]),
    );
  }
}

/// PagedController<UserRowData> を並べる Sliver（読み込み・空・エラー・続き読み込みも込み）
class SliverPagedUsers extends StatelessWidget {
  const SliverPagedUsers({
    super.key,
    required this.controller,
    this.viewerId,
    this.emptyTitle = 'ユーザーがいません',
    this.emptyMessage,
  });

  final PagedController<UserRowData> controller;
  final String? viewerId;
  final String emptyTitle;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final c = controller;
        if (c.items.isEmpty && c.hasMore && c.error == null) {
          if (!c.isLoading) WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
          return SliverList.builder(itemCount: 6, itemBuilder: (_, __) => const UserRowSkeleton());
        }
        if (c.items.isEmpty && c.error != null) {
          return SliverToBoxAdapter(child: StateView.error(c.error!, onRetry: c.refresh));
        }
        if (c.items.isEmpty) {
          return SliverToBoxAdapter(
            child: StateView(icon: Icons.people_outline_rounded, title: emptyTitle, message: emptyMessage),
          );
        }
        final width = MediaQuery.sizeOf(context).width;
        final side = width > 760 ? (width - 720) / 2 : 0.0;
        Widget tile(int i) {
          if (i >= c.items.length - 4 && c.hasMore && !c.isLoading && c.error == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) => c.loadMore());
          }
          return UserRowTile(user: c.items[i], viewerId: viewerId);
        }

        return SliverMainAxisGroup(slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 6)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: side),
            sliver: SliverList.builder(itemCount: c.items.length, itemBuilder: (_, i) => tile(i)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: c.isLoading
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5))
                    : c.error != null
                        ? TextButton.icon(onPressed: c.loadMore, icon: const Icon(Icons.refresh_rounded), label: const Text('続きを読み込む'))
                        : const SizedBox(height: 24),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 60)),
        ]);
      },
    );
  }
}
