import 'package:aipictors/widgets/container/data_not_found_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UnexpectedErrorScreen extends HookConsumerWidget {
  const UnexpectedErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return const Scaffold(
      body: DataNotFoundErrorContainer(),
    );
  }
}
