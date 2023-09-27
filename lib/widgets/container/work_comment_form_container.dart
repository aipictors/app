import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:aipictors/widgets/container/work_action_stickers_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkCommentFormContainer extends HookConsumerWidget {
  const WorkCommentFormContainer({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final Future<void> Function(String text, String? stickerId) onSubmit;

  @override
  Widget build(context, ref) {
    final currentStickerId = useState<String?>('');

    final isOpenStickers = useState<bool>(false);

    // https://qiita.com/SoarTec-lab/items/809aed85eb4253de8165
    final controller = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8 * 2),
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
              IconButton.filledTonal(
                color: isOpenStickers.value
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  isOpenStickers.value = !isOpenStickers.value;
                },
                icon: const Icon(
                  Icons.add_reaction_rounded,
                ),
              ),
              const SizedBox(width: 8),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () async {
                  try {
                    FocusManager.instance.primaryFocus?.unfocus();
                    final text = controller.text;
                    controller.clear();
                    currentStickerId.value = null;
                    isOpenStickers.value = false;
                    await onSubmit(text, currentStickerId.value);
                  } catch (exception) {
                    showErrorSnackBar(context, exception);
                  }
                },
                child: Text('送信'.i18n),
              ),
            ],
          ),
        ),
        if (isOpenStickers.value) const SizedBox(height: 8),
        if (isOpenStickers.value)
          WorkActionStickersContainer(
            stickerId: currentStickerId.value,
            onChange: (stickerId) {
              currentStickerId.value = stickerId;
            },
          ),
      ],
    );
  }
}
