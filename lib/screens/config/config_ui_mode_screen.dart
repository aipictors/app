import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigUIModeScreen extends HookConsumerWidget {
  const ConfigUIModeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('UIモード切り替え'.i18n),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('自動'.i18n),
            trailing: config.uiMode == 'Auto'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateUIMode('Auto');
            },
          ),
          ListTile(
            title: Text('コンパクト（スマートフォン向け）'.i18n),
            trailing: config.uiMode == 'Compact'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateUIMode('Compact');
            },
          ),
          ListTile(
            title: Text('ミディアム（タブレット向け）'.i18n),
            trailing: config.uiMode == 'Medium'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateUIMode('Medium');
            },
          ),
        ],
      ),
    );
  }
}
