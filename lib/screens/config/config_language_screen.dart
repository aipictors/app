import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_locale.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i18n_extension/i18n_widget.dart';

class ConfigLanguageScreen extends HookConsumerWidget {
  const ConfigLanguageScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('言語切り替え'.i18n),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('日本語'),
            trailing: config.language == 'ja'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateLanguage('ja');
              I18n.of(context).locale = toLocale('ja');
            },
          ),
          ListTile(
            title: const Text('English'),
            trailing: config.language == 'en'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateLanguage('en');
              I18n.of(context).locale = toLocale('en');
            },
          ),
        ],
      ),
    );
  }
}
