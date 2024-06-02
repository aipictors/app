import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationSeedInput extends HookConsumerWidget {
  const GenerationSeedInput({
    super.key,
    required this.currentSeed,
    required this.onChanged,
  });

  final int currentSeed;

  final Function(int seed) onChanged;

  @override
  Widget build(context, ref) {
    final controller = useTextEditingController(text: currentSeed.toString());

    final focusNode = useFocusNode();

    useEffect(() {
      // 入力中にカーソルが最後尾へ移動しないように、入力欄にフォーカスがある時は何もしない
      if (focusNode.hasFocus) {
        return null;
      }
      controller.text = currentSeed.toString();
      return null;
    }, [currentSeed]);

    return Row(
      children: [
        Text(
          'Seed '.i18n,
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
                return 'Seedは空にできません'.i18n;
              }
              return null;
            },
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            decoration: InputDecoration(
              hintText: 'Seed'.i18n,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              onChanged(-1);
            },
            icon: const Icon(Icons.casino_rounded))
      ],
    );
  }
}
