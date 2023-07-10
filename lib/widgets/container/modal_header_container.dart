import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalHeaderContainer extends HookConsumerWidget {
  const ModalHeaderContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final Widget title;

  @override
  Widget build(context, ref) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8 * 2,
        top: 8,
        right: 8,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title,
          IconButton.filledTonal(
            icon: const Icon(Icons.close_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
