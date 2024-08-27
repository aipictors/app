import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/post/functions/create_work_comment.dart';
import 'package:aipictors/features/post/functions/create_work_like.dart';
import 'package:aipictors/features/post/widgets/__generated__/work_bottom_app_bar.data.gql.dart';
import 'package:aipictors/features/post/widgets/__generated__/work_comments.req.gql.dart';
import 'package:aipictors/features/post/widgets/about_like_dialog.dart';
import 'package:aipictors/features/post/widgets/work_shortcut_action_stickers.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/utils/show_unavailable_snack_bar.dart';
import 'package:aipictors/utils/to_exception_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkBottomAppBar extends HookConsumerWidget {
  const WorkBottomAppBar({
    super.key,
    required this.work,
  });

  final GWorkBottomAppBar work;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const SizedBox();
    }

    final isLikedInMemory = useState(work.isLiked);

    // final isFoldedInMemory = useState(isFolded);

    final authUserId = ref.watch(authUserIdProvider);

    // TODO: 自分の作品の場合
    if (authUserId.value == work.user.id) {
      return const SizedBox();
    }

    if (authUserId.value == null) {
      return BottomAppBar(
        child: Row(children: [
          FilledButton.tonalIcon(
            onPressed: () {
              onShowLoginDialog(context, ref);
            },
            icon: const Icon(Icons.favorite_rounded),
            label: const Text('いいね'),
          ),
        ]),
      );
    }

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 64,
            child: FilledButton.tonalIcon(
              icon: isLikedInMemory.value
                  ? Icon(
                      Icons.favorite_rounded,
                      color: Theme.of(context).colorScheme.error,
                    )
                  : const Icon(Icons.favorite_outline_rounded),
              label: Text('いいね'.i18n),
              onPressed: () {
                onCreateWorkLike();
                isLikedInMemory.value = !isLikedInMemory.value;
              },
            ),
          ),
          // const SizedBox(width: 16),
          // LikeButton(
          //   isLiked: isFoldedInMemory.value,
          //   likeBuilder: (bool isFolded) {
          //     if (isFoldedInMemory.value) {
          //       return Icon(Icons.folder_rounded,
          //           size: 28, color: Theme.of(context).colorScheme.primary);
          //     }

          //     return const Icon(
          //       Icons.folder_outlined,
          //       size: 28,
          //     );
          //   },
          //   onTap: (isFolded) async {
          //     onAddToFolder(context);
          //     isFoldedInMemory.value = !isFoldedInMemory.value;
          //     return !isFolded;
          //   },
          // ),
          WorkShortcutActionStickers(onSend: (stickerId) async {
            try {
              final request = GWorkCommentsReq((builder) {
                builder.vars.workId = work.id;
              });
              await createWorkComment((builder) {
                return builder
                  ..vars.input.workId = work.id
                  ..vars.input.text = ''
                  ..vars.input.stickerId = stickerId;
              });
              client.value?.requestController.add(request);
            } catch (exception) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(toExceptionMessage(exception))),
                );
            }
          }),
        ],
      ),
    );
  }

  onCreateWorkLike() {
    createWorkLike((builder) {
      return builder..vars.input.workId = work.id;
    });
  }

  /// 作品をブックマークする
  void onAddToFolder(BuildContext context) {
    showUnavailableSnackBar(context);
  }

  /// フォローする
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
