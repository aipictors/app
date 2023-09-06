import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_locale.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i18n_extension/i18n_widget.dart';

/// 設定・言語
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
          ListTile(
            title: const Text('Tiếng Việt'),
            trailing: config.language == 'vi'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateLanguage('vi');
              I18n.of(context).locale = toLocale('vi');
            },
          ),
          ListTile(
            title: const Text('简体中文'),
            trailing: config.language == 'zh_cn'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateLanguage('zh_cn');
              I18n.of(context).locale = toLocale('zh_cn');
            },
          ),
          ListTile(
            title: const Text('繁体中文'),
            trailing: config.language == 'zh_tw'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateLanguage('zh_tw');
              I18n.of(context).locale = toLocale('zh_tw');
            },
          ),
          ListTile(
            title: const Text('Italiano'),
            trailing: config.language == 'it'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateLanguage('it');
              I18n.of(context).locale = toLocale('it');
            },
          ),
          ListTile(
            title: const Text('Français'),
            trailing: config.language == 'fr'
                ? const Icon(Icons.check_rounded)
                : null,
            onTap: () {
              final notifier = ref.read(configProvider.notifier);
              notifier.updateLanguage('fr');
              I18n.of(context).locale = toLocale('fr');
            },
          ),
        ],
      ),
    );
  }
}
