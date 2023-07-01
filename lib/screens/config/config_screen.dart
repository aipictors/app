import 'package:aipictors/config.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/container/theme_color_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigScreen extends HookConsumerWidget {
  const ConfigScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '設定',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              'アカウント'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.image_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              '作品'.i18n,
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            onTap: () {
              // context.push('/config/muted_tags');
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              'シリーズ'.i18n,
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            onTap: () {
              // context.push('/config/muted_tags');
            },
          ),
          ListTile(
            leading: const Icon(Icons.block_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              'ミュートしたタグ'.i18n,
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            onTap: () {
              // context.push('/config/muted_tags');
            },
          ),
          ListTile(
            leading: const Icon(Icons.block_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              'ミュートしたユーザ'.i18n,
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            onTap: () {
              // context.push('config/muted_users');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.translate_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              '言語切り替え'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.push('/config/language');
            },
          ),
          ListTile(
            leading: const Icon(Icons.interests_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              '調査協力'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.push('/surveys');
            },
          ),
          const Divider(),
          ListTile(
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              '利用規約'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.push('/terms');
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              'プライバシーポリシー'.i18n,
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            onTap: () {
              // context.push('/privacy');
            },
          ),
          ListTile(
            title: Text(
              '${'バージョン'.i18n} ${DefaultConfig.versionText}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('クリップボードにコピーしました。')),
              );
              final data = ClipboardData(text: DefaultConfig.versionText);
              Clipboard.setData(data);
            },
          ),
          const Divider(),
          SwitchListTile(
            title: Text(
              'ダークモード'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            value: config.isDarkMode,
            onChanged: (value) {
              final notifier = ref.read(configProvider.notifier);
              notifier.toggleThemeMode();
            },
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const ThemeColorContainer(),
          ),
          const SizedBox(height: 12),
          const Divider(),
          AboutListTile(
            applicationName: DefaultConfig.appName,
            applicationVersion: DefaultConfig.version,
            applicationIcon: const Icon(Icons.flutter_dash_rounded),
            aboutBoxChildren: const [
              Text('Aipictorsをダウンロードいただきありがとうございます。'),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
