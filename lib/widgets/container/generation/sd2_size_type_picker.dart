import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SD2SizeTypePicker extends HookConsumerWidget {
  const SD2SizeTypePicker({
    super.key,
    required this.currentValue,
    required this.onSelected,
  });

  final GImageGenerationSizeType currentValue;

  final Function(GImageGenerationSizeType sizeType) onSelected;

  @override
  Widget build(context, ref) {
    return DropdownButton(
        value: currentValue,
        items: [
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD2_768_768,
            child: Text('【正方形】768x768'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD2_768_1200,
            child: Text('【縦長】768x1200'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD2_1200_768,
            child: Text('【横長】1200x768'.i18n),
          ),
        ],
        onChanged: (value) {
          onSelected(value as GImageGenerationSizeType);
        });
  }
}
