import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageGeneratingContainer extends HookConsumerWidget {
  const ImageGeneratingContainer({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Center(
      child: Text(
        '生成中'.i18n,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
