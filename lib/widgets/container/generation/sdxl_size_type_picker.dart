import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SDXLSizeTypePicker extends HookConsumerWidget {
  const SDXLSizeTypePicker({
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
            value: GImageGenerationSizeType.SD3_1024_1024,
            child: Text('【正方形】1024x1024'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD3_832_1216,
            child: Text('【縦長】832x1216'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD3_1216_832,
            child: Text('【横長】1216x832'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD3_640_1536,
            child: Text('【超縦長】640x1536'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD3_1536_640,
            child: Text('【超横長】1536x640'.i18n),
          ),
        ],
        onChanged: (value) {
          onSelected(value as GImageGenerationSizeType);
        });
  }
}
