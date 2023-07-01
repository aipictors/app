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
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              trailing: const Icon(Icons.chevron_right_rounded),
              title: const Text(
                'アカウント',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                '言語'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/config/language');
              },
            ),
            ListTile(
              trailing: const Icon(Icons.chevron_right_rounded),
              title: const Text(
                'ミュートしたタグ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              onTap: () {
                // context.push('/config/muted_tags');
              },
            ),
            ListTile(
              trailing: const Icon(Icons.chevron_right_rounded),
              title: const Text(
                'ミュートしたユーザ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              onTap: () {
                // context.push('config/muted_users');
              },
            ),
            ListTile(
              trailing: const Icon(Icons.chevron_right_rounded),
              title: const Text(
                'アンケート',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/surveys');
              },
            ),
            ListTile(
              trailing: const Icon(Icons.chevron_right_rounded),
              title: const Text(
                '利用規約',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/terms');
              },
            ),
            ListTile(
              trailing: const Icon(Icons.chevron_right_rounded),
              title: const Text(
                'プライバシーポリシー',
                style: TextStyle(
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
                'バージョン ${DefaultConfig.versionText}',
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
            SwitchListTile(
              title: const Text(
                'ダークモード',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: config.isDarkMode,
              onChanged: (value) {
                final notifier = ref.read(configProvider.notifier);
                notifier.toggleThemeMode();
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const ThemeColorContainer(),
            )
          ],
        ),
      ),
    );
  }
}
