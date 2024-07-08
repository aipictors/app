import 'package:aipictors/providers/image_generation_provider.dart';

void reuseImageGenerationTask(task, ImageGeneration imageGenerationNotifier) {
  imageGenerationNotifier.updateModel(task.model.name);
  imageGenerationNotifier.updatePrompt(task.prompt);
  imageGenerationNotifier.updateNegativePrompt(task.negativePrompt);
  imageGenerationNotifier.updateSeed(task.seed.toInt());
  imageGenerationNotifier.updateSteps(task.steps);
  imageGenerationNotifier.updateScale(task.scale);
  imageGenerationNotifier.updateSampler(task.sampler);
  imageGenerationNotifier.updateSizeType(task.sizeType);
  if (task.vae != 'None') {
    imageGenerationNotifier.updateVae(task.vae!.split('.')[0]);
  } else {
    imageGenerationNotifier.updateVae(task.vae!);
  }
}
