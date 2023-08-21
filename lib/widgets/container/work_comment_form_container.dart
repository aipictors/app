import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkCommentFormContainer extends HookConsumerWidget {
  const WorkCommentFormContainer({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final Future<void> Function(String text) onSubmit;

  @override
  Widget build(context, ref) {
    // https://qiita.com/SoarTec-lab/items/809aed85eb4253de8165
    final controller = useTextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8 * 2,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'コメントを入力'.i18n,
              ),
            ),
          ),
          const SizedBox(width: 8),
          FilledButton.tonal(
            onPressed: () async {
              try {
                FocusManager.instance.primaryFocus?.unfocus();
                final text = controller.text;
                controller.clear();
                await onSubmit(text);
              } catch (exception) {
                showErrorSnackBar(context, exception);
              }
            },
            child: Text('送信'.i18n),
          ),
        ],
      ),
    );
  }
}
