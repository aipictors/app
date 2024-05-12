import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/generation_model_version.dart';
import 'package:aipictors/widgets/container/generation/sd1_size_type_picker.dart';
import 'package:aipictors/widgets/container/generation/sd2_size_type_picker.dart';
import 'package:aipictors/widgets/container/generation/sdxl_size_type_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: デコレーションを追加する
class GenerationSizeTypePicker extends HookConsumerWidget {
  const GenerationSizeTypePicker({
    super.key,
    required this.modelVersion,
    required this.currentSizeType,
    required this.onSelected,
  });

  final GenerationModelVersion modelVersion;

  final GImageGenerationSizeType currentSizeType;

  final Function(GImageGenerationSizeType sizeType) onSelected;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        Text(
          'サイズ '.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (modelVersion == GenerationModelVersion.SD1)
          SD1SizeTypePicker(
            currentValue: (currentSizeType.name.contains('SD1'))
                ? currentSizeType
                : GImageGenerationSizeType.SD1_512_768,
            onSelected: (value) {
              onSelected(value);
            },
          ),
        if (modelVersion == GenerationModelVersion.SD2)
          SD2SizeTypePicker(
            currentValue: (currentSizeType.name.contains('SD2'))
                ? currentSizeType
                : GImageGenerationSizeType.SD2_768_1200,
            onSelected: (value) {
              onSelected(value);
            },
          ),
        if (modelVersion == GenerationModelVersion.SDXL)
          SDXLSizeTypePicker(
            currentValue: (currentSizeType.name.contains('SD3'))
                ? currentSizeType
                : GImageGenerationSizeType.SD3_832_1216,
            onSelected: (value) {
              onSelected(value);
            },
          ),
      ],
    );
  }
}
