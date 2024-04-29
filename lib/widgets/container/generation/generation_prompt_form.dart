import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationPromptInputField extends HookConsumerWidget {
  const GenerationPromptInputField({
    super.key,
    required this.onPromptChanged,
    required this.onNegativePromptChanged,
  });

  final Function(String prompt) onPromptChanged;

  final Function(String negativePrompt) onNegativePromptChanged;

  @override
  Widget build(context, ref) {
    final promptController = useTextEditingController();

    final negativePromptController = useTextEditingController();

    return Column(
      children: [
        TextField(
          controller: promptController,
          maxLines: null,
          onChanged: (value) {
            onPromptChanged(value);
          },
          decoration: InputDecoration(
            hintText: 'プロンプト'.i18n,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: negativePromptController,
          maxLines: null,
          onChanged: (value) {
            onNegativePromptChanged(value);
          },
          decoration: InputDecoration(
            hintText: 'ネガティブプロンプト'.i18n,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        )
      ],
    );
  }
}
