import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationTaskOptionsContainer extends HookConsumerWidget {
  const GenerationTaskOptionsContainer(
      {super.key, required this.onReuseButtonPressed});

  final Function() onReuseButtonPressed;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        OutlinedButton.icon(
          icon: const Icon(Icons.arrow_back_rounded),
          label: Text('再利用'.i18n),
          onPressed: onReuseButtonPressed,
        ),
        //TODO: Inpaintを実装する
        /*IconButton(
                icon: Icon(Icons.edit_rounded,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: () {},
        ),*/
      ],
    );
  }
}
