import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationScaleInput extends HookConsumerWidget {
  const GenerationScaleInput({
    super.key,
    required this.currentScale,
    required this.onChanged,
  });

  final int currentScale;

  final Function(int seed) onChanged;

  @override
  Widget build(context, ref) {
    final scaleController =
        useTextEditingController(text: currentScale.toString());
    useEffect(() {
      scaleController.text = currentScale.toString();
      return null;
    }, [currentScale]);

    return Row(
      children: [
        Text(
          'Scale'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: scaleController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              onChanged(int.parse(value));
            },
            decoration: InputDecoration(hintText: 'Scale'.i18n),
          ),
        ),
      ],
    );
  }
}
