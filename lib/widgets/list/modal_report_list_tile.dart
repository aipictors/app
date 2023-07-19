import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalReportListTile extends HookConsumerWidget {
  const ModalReportListTile({
    Key? key,
    required this.titleText,
    required this.onTap,
  }) : super(key: key);

  final String titleText;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      leading: const Icon(Icons.gpp_maybe_rounded),
      title: Text(
        titleText,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
