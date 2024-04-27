import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/repositories/image_generation_repository.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationPromptInputField extends HookConsumerWidget {
  const GenerationPromptInputField({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);
    const generationRepository = ImageGenerationRepository();
    if (client.value == null) {
      return const LoadingContainer();
    }
    final promptController = useTextEditingController();
    final negativePromptController = useTextEditingController();
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: TextField(
            controller: promptController,
            maxLines: null,
            expands: true,
            onChanged: (value) {
              generationRepository.updatePrompt(value);
            },
            decoration: InputDecoration(
              filled: true,
              hintText: 'プロンプト'.i18n,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: TextField(
            controller: negativePromptController,
            maxLines: null,
            expands: true,
            onChanged: (value) {
              generationRepository.updateNegativePrompt(value);
            },
            decoration: InputDecoration(
              filled: true,
              hintText: 'ネガティブプロンプト'.i18n,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
