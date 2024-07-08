import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/features/generation/utils/to_generation_size_type_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SDXLSizeTypePicker extends HookConsumerWidget {
  const SDXLSizeTypePicker({
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
      GImageGenerationSizeType.SD3_1024_1024,
      GImageGenerationSizeType.SD3_832_1216,
      GImageGenerationSizeType.SD3_1216_832,
      GImageGenerationSizeType.SD3_640_1536,
      GImageGenerationSizeType.SD3_1536_640,
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
