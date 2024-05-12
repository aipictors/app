import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/utils/to_generation_size_type_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SD1SizeTypePicker extends HookConsumerWidget {
  const SD1SizeTypePicker({
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
      GImageGenerationSizeType.SD1_512_512,
      GImageGenerationSizeType.SD1_512_768,
      GImageGenerationSizeType.SD1_768_512,
      GImageGenerationSizeType.SD1_384_960,
      GImageGenerationSizeType.SD1_960_384
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
