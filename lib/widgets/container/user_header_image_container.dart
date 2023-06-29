import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserHeaderImageContainer extends HookConsumerWidget {
  const UserHeaderImageContainer({
    Key? key,
    required this.downloadURL,
  }) : super(key: key);

  final String? downloadURL;

  @override
  Widget build(context, ref) {
    if (downloadURL == null) {
      return Container(
        width: double.infinity,
        color: Theme.of(context).primaryColorLight,
      );
    }

    return Image.network(
      downloadURL!,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, event) {
        if (event == null) return child;
        return Container(
          width: double.infinity,
          color: Theme.of(context).primaryColorLight,
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
