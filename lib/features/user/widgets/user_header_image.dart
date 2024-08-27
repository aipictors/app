import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserHeaderImage extends HookConsumerWidget {
  const UserHeaderImage({
    super.key,
    required this.downloadURL,
  });

  final String? downloadURL;

  @override
  Widget build(context, ref) {
    if (downloadURL == null) {
      return Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.primaryContainer,
      );
    }

    return Image.network(
      downloadURL!,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, event) {
        if (event == null) return child;
        return Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.primaryContainer,
        );
      },
      errorBuilder: (context, uri, error) {
        return Container(
          width: double.infinity,
          color: Theme.of(context).disabledColor,
        );
      },
    );
  }
}
