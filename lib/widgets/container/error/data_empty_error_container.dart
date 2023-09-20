import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataEmptyErrorContainer extends HookConsumerWidget {
  const DataEmptyErrorContainer({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(context, ref) {
    return Center(
      child: Text(
        message ?? '何もデータが無いみたい。'.i18n,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
