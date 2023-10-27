import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:aipictors/widgets/dialog/about_follow_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalFollowUserListTile extends HookConsumerWidget {
  const ModalFollowUserListTile({
    Key? key,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;

  final Future Function() onTap;

  @override
  Widget build(context, ref) {
    final authUserId = ref.watch(authUserIdProvider);
    final state = useState(isActive);

    return ListTile(
      leading: state.value
          ? const Icon(Icons.person_remove)
          : const Icon(Icons.person_add),
      title: Text(
        state.value ? 'ユーザのフォローを解除する'.i18n : 'ユーザをフォローする'.i18n,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () async {
        try {
          if (authUserId.value == null) {
            //context.pop();
            return onShowLoginDialog(context, ref);
          } else {
            state.value = !state.value;
            await onTap();
          }
        } catch (exception) {
          showErrorSnackBar(context, exception);
        }
      },
    );
  }

  /// ログインを促すダイアログ
  onShowLoginDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AboutFollowDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () {
            // ログインのページに遷移する
            final notifier = ref.read(homeTabIndexProvider.notifier);
            notifier.toLoginTab();
            context.pop();
            context.pop();
          },
        );
      },
    );
  }
}
