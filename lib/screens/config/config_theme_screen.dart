import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigThemeScreen extends HookConsumerWidget {
  const ConfigThemeScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('テーマ設定'.i18n),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('オフ'.i18n),
            trailing: !config.themeMediumLayout
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateThemeMediumLayout(false);
            },
          ),
          ListTile(
            title: Text('タブレット向けUIを使用する'.i18n),
            subtitle: Text('一部の画面でタブレット向けのレイアウトが適用されます。'.i18n),
            trailing: config.themeMediumLayout
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateThemeMediumLayout(true);
            },
          ),
        ],
      ),
    );
  }
}
