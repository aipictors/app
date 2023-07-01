import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UnexpectedErrorContainer extends HookConsumerWidget {
  const UnexpectedErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '予期しないエラーが発生しました。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 360),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              config.messageUnexpectedErrorA,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
