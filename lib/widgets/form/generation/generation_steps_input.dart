import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationStepsInput extends HookConsumerWidget {
  const GenerationStepsInput({
    super.key,
    required this.currentSteps,
    required this.onChanged,
  });

  final int currentSteps;

  final Function(int seed) onChanged;

  @override
  Widget build(context, ref) {
    final controller = useTextEditingController(text: currentSteps.toString());

    final focusNode = useFocusNode();
    useEffect(() {
      // 入力中にカーソルが最後尾へ移動しないように、入力欄にフォーカスがある時は何もしない
      if (focusNode.hasFocus) {
        return null;
      }
      controller.text = currentSteps.toString();
      return null;
    }, [currentSteps]);

    return Row(
      children: [
        Text(
          'Steps'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              onChanged(int.parse(value));
            },
            validator: (value) {
              if (value == null || value == '') {
                return 'Stepは空にできません'.i18n;
              }
              if (int.parse(value) < 1 || 25 < int.parse(value)) {
                return 'Stepは1から25の範囲内に設定してください'.i18n;
              }
              return null;
            },
            decoration: InputDecoration(hintText: 'Steps'.i18n),
          ),
        ),
      ],
    );
  }
}
