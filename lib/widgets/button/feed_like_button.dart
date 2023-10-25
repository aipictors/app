import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/widgets/dialog/about_like_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedLikeButton extends HookConsumerWidget {
  const FeedLikeButton({
    Key? key,
    required this.count,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

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
      IconButton(
        icon: isActiveInMemory.value
            ? Icon(
                Icons.favorite_rounded,
                size: 28,
                color: Theme.of(context).colorScheme.error,
              )
            : const Icon(Icons.favorite_outline_rounded, size: 28),
        onPressed: () {
          if (authUserId.value == null) {
            onShowLoginDialog(context, ref);
          } else {
            onTap();
            isActiveInMemory.value = !isActiveInMemory.value;
          }
        },
      ),
      Text(count.toString())
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
            context.pop();
            context.push('/login');
          },
        );
      },
    );
  }
}
