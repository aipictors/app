import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PromptsContainer extends HookConsumerWidget {
  const PromptsContainer(
      {super.key, required this.prompts, required this.onPressed});

  final String prompts;

  final Function(String prompt) onPressed;

  @override
  Widget build(context, ref) {
    final promptLength = prompts.split(',').length - 1;
    final hasLastComma = (prompts[prompts.length - 1] == ',') ? true : false;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.outlineVariant)),
      child: Wrap(
          alignment: WrapAlignment.center,
          children: prompts.split(',').asMap().entries.map((entry) {
            final index = entry.key;
            final prompt = entry.value;
            return TextButton(
              onPressed: () {
                onPressed(prompt);
              },
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 4, right: 4, top: 0, bottom: 0)),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: prompt,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                if ((index != promptLength) ||
                    (index == promptLength && hasLastComma))
                  TextSpan(
                      text: ',',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.outlineVariant))
              ])),
            );
          }).toList()),
    );
  }
}
