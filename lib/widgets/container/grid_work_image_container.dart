import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridWorkImageContainer extends HookConsumerWidget {
  const GridWorkImageContainer({
    Key? key,
    required this.downloadURL,
  }) : super(key: key);

  final String downloadURL;

  @override
  Widget build(context, ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        downloadURL,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, event) {
          if (event == null) return child;
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).primaryColorLight,
          );
        },
        errorBuilder: (context, uri, error) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).disabledColor,
          );
        },
      ),
    );
  }
}
