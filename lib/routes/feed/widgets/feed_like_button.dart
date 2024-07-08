import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/routes/post/widgets/about_like_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';

class FeedLikeButton extends HookConsumerWidget {
  const FeedLikeButton({
    super.key,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  final int count;

  final bool isActive;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    final isActiveInMemory = useState(isActive);

    final authUserId = ref.watch(authUserIdProvider);

    useEffect(() {
      isActiveInMemory.value = isActive;
      return null;
    }, [isActive]);

    return Row(children: [
      if (authUserId.value != null)
        LikeButton(
          isLiked: isActiveInMemory.value,
          likeBuilder: (isLiked) {
            if (isActiveInMemory.value) {
              return Icon(Icons.favorite_rounded,
                  size: 28, color: Theme.of(context).colorScheme.error);
            }
            return const Icon(Icons.favorite_outline_rounded, size: 28);
          },
          onTap: (isLiked) async {
            onTap();
            isActiveInMemory.value = !isActiveInMemory.value;
            return !isLiked;
          },
        ),
      if (authUserId.value == null)
        IconButton(
          icon: const Icon(Icons.favorite_outline_rounded, size: 28),
          onPressed: () {
            onShowLoginDialog(context, ref);
          },
        ),
      const SizedBox(width: 4),
      // 桁上がり時にUIがズレないように、あらかじめ3桁分の幅を確保しておく
      ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 25),
        child: Text(count.toString()),
      )
    ]);
  }

  onShowLoginDialog(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AboutLikeDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () {
            // ホームのログインタブに移動する
            Navigator.of(context).popUntil((route) => route.isFirst);
            final notifier = ref.read(homeTabIndexProvider.notifier);
            notifier.toLoginTab();
          },
        );
      },
    );
  }
}
