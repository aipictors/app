import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/utils/to_generation_size_type_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SD2SizeTypePicker extends HookConsumerWidget {
  const SD2SizeTypePicker({
    super.key,
    required this.currentValue,
    required this.onSelected,
    this.decoration,
    this.style,
  });

  final GImageGenerationSizeType currentValue;

  final Function(GImageGenerationSizeType sizeType) onSelected;

  final InputDecoration? decoration;

  final TextStyle? style;

  @override
  Widget build(context, ref) {
    const values = [
      GImageGenerationSizeType.SD2_768_768,
      GImageGenerationSizeType.SD2_768_1200,
      GImageGenerationSizeType.SD2_1200_768
    ];
    return Expanded(
      child: DropdownButtonFormField(
        value: currentValue,
        decoration: decoration,
        style: style,
        items: [
          for (final value in values)
            DropdownMenuItem(
              value: value,
              child: Text(toGenerationSizeTypeText(value)),
            ),
        ],
        onChanged: (value) {
          onSelected(value as GImageGenerationSizeType);
        },
      ),
    );
  }
}
