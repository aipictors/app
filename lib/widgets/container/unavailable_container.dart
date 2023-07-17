import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UnavailableContainer extends HookConsumerWidget {
  const UnavailableContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('現在、この機能は使用できません。'.i18n),
          ),
        ],
      ),
    );
  }
}
