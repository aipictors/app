import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SD1SizeTypePicker extends HookConsumerWidget {
  const SD1SizeTypePicker({
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
            value: GImageGenerationSizeType.SD1_512_512,
            child: Text('【正方形】768x768(upscale:1.5)'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD1_512_768,
            child: Text('【縦長】768x1152(upscale:1.5)'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD1_768_512,
            child: Text('【横長】1152x768(upscale:1.5)'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD1_384_960,
            child: Text('【超縦長】576x1440(upscale:1.5)'.i18n),
          ),
          DropdownMenuItem(
            value: GImageGenerationSizeType.SD1_960_384,
            child: Text('【超横長】1440x576(upscale:1.5)'.i18n),
          ),
        ],
        onChanged: (value) {
          onSelected(value as GImageGenerationSizeType);
        });
  }
}
