import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/repositories/image_generation_repository.dart';
import 'package:aipictors/states/image_generation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_generation_provider.g.dart';

/// 設定
@riverpod
class ImageGeneration extends _$ImageGeneration {
  @override
  ImageGenerationState build() {
    return _refetch();
  }

  ImageGenerationState _refetch() {
    const repository = ImageGenerationRepository();
    return ImageGenerationState(
      count: repository.count,
      type: repository.type,
      model: repository.model,
      vae: repository.vae,
      prompt: repository.prompt,
      negativePrompt: repository.negativePrompt,
      seed: repository.seed,
      steps: repository.steps,
      scale: repository.scale,
      sampler:
          (repository.sampler != '') ? repository.sampler : 'DPM++ 2M Karras',
      sizeType: repository.sizeType,
    );
  }

  Future updateCount(int? value) async {
    const ImageGenerationRepository().updateCount(value);
    state = _refetch();
  }

  Future updateType(GImageGenerationType? value) async {
    const ImageGenerationRepository().updateType(value);
    state = _refetch();
  }

  Future updateModel(String? value) async {
    const ImageGenerationRepository().updateModel(value);
    state = _refetch();
  }

  Future updateVae(String? value) async {
    const ImageGenerationRepository().updateVae(value);
    state = _refetch();
  }

  Future updatePrompt(String? value) async {
    const ImageGenerationRepository().updatePrompt(value);
    state = _refetch();
  }

  Future updateNegativePrompt(String? value) async {
    const ImageGenerationRepository().updateNegativePrompt(value);
    state = _refetch();
  }

  Future updateSeed(int? value) async {
    const ImageGenerationRepository().updateSeed(value);
    state = _refetch();
  }

  Future updateSteps(int? value) async {
    const ImageGenerationRepository().updateSteps(value);
    state = _refetch();
  }

  Future updateScale(int? value) async {
    const ImageGenerationRepository().updateScale(value);
    state = _refetch();
  }

  Future updateSampler(String? value) async {
    const ImageGenerationRepository().updateSampler(value);
    state = _refetch();
  }

  Future updateSizeType(GImageGenerationSizeType? value) async {
    const ImageGenerationRepository().updateSizeType(value);
    state = _refetch();
  }
}
