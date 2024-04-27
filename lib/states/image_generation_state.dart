import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_generation_state.freezed.dart';

@freezed
class ImageGenerationState with _$ImageGenerationState {
  const ImageGenerationState._();

  const factory ImageGenerationState(
      {required int count,
      required GImageGenerationType type,
      required String model,
      required String vae,
      required String prompt,
      required String negativePrompt,
      required int seed,
      required int steps,
      required int scale,
      required String sampler,
      required GImageGenerationSizeType sizeType}) = _ImageGenerationState;
}
