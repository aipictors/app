import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataNotFoundErrorContainer extends HookConsumerWidget {
  const DataNotFoundErrorContainer({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(context, ref) {
    return Center(
      child: Text(
        message ?? 'データが無いみたい。',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
