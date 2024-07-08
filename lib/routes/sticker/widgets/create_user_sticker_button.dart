import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/routes/sticker/widgets/delete_sticker_dialog.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateUserStickerButton extends HookConsumerWidget {
  const CreateUserStickerButton({
    super.key,
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;

  final Future Function() onPressed;

  @override
  Widget build(context, ref) {
    final isLoading = useState(false);

    return FilledButton.tonal(
      style: FilledButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: isLoading.value
          ? null
          : () async {
              try {
                isLoading.value = true;
                if (isActive) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return DeleteStickerDialog(
                        onAccept: () async {
                          context.pop();
                          await onPressed();
                        },
                        onCancel: () {
                          context.pop();
                        },
                      );
                    },
                  );
                } else {
                  await onPressed();
                }
              } catch (exception) {
                showErrorSnackBar(context, exception);
              }
              isLoading.value = false;
            },
      child: isLoading.value
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(),
            )
          : Text(
              isActive ? 'マイスタンプに追加済み'.i18n : 'マイスタンプに追加'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
    );
  }
}
