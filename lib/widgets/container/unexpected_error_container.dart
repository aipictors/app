import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UnexpectedErrorContainer extends HookConsumerWidget {
  const UnexpectedErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return const Center(
      child: Text(
        "予期しないエラーが発生しました。",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
