import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataNotFoundErrorContainer extends HookConsumerWidget {
  const DataNotFoundErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return const Center(
      child: Text(
        'データがありません。',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
