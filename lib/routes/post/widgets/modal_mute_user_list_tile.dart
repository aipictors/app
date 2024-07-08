import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/routes/post/widgets/mute_dialog.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalMuteUserListTile extends HookConsumerWidget {
  const ModalMuteUserListTile({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  final bool isActive;

  final Future Function() onTap;

  @override
  Widget build(context, ref) {
    final state = useState(isActive);

    return ListTile(
      leading: Icon(
        Icons.block_rounded,
        color: state.value ? Theme.of(context).colorScheme.error : null,
      ),
      title: Text(
        state.value ? 'ユーザをミュート中'.i18n : 'ユーザをミュートする'.i18n,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () async {
        try {
          if (!state.value) {
            showDialog(
                context: context,
                builder: (_) {
                  return MuteDialog(
                    onAccept: () async {
                      context.pop();
                      await onTap();
                      state.value = !state.value;
                    },
                    onCancel: () {
                      context.pop();
                    },
                  );
                });
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
}
