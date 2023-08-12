import 'package:aipictors/config.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/mutations/logout.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/repositories/hive_repository.dart';
import 'package:aipictors/widgets/container/theme_color_container.dart';
import 'package:aipictors/widgets/dialog/about_discord_dialog.dart';
import 'package:aipictors/widgets/dialog/about_twitter_dialog.dart';
import 'package:aipictors/widgets/dialog/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// 設定
class ConfigScreen extends HookConsumerWidget {
  const ConfigScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final authState = ref.watch(authStateProvider);

    return Scaffold(
      key: const PageStorageKey('config'),
      appBar: AppBar(
        title: Text('その他'.i18n),
      ),
      body: ListView(
        children: [
          if (authState.value != null)
            ListTile(
              leading: const Icon(Icons.wysiwyg_rounded),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                'マイページ'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/viewer');
              },
            ),
          if (authState.value != null)
            ListTile(
              leading: const Icon(Icons.image_rounded),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                '作品'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/viewer/works');
              },
            ),
          if (authState.value != null)
            ListTile(
              leading: const Icon(Icons.folder_rounded),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                'シリーズ'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/viewer/albums');
              },
            ),
          if (authState.value != null)
            ListTile(
              leading: const Icon(Icons.block_rounded),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                'ミュートしたタグ'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/config/muted_tags');
              },
            ),
          if (authState.value != null)
            ListTile(
              leading: const Icon(Icons.block_rounded),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                'ミュートしたユーザ'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/config/muted_users');
              },
            ),
          if (authState.value != null) const Divider(),
          if (authState.value != null)
            ListTile(
              leading: const Icon(Icons.person_rounded),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                'アカウント'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/account');
              },
            ),
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
            leading: const Icon(Icons.favorite_rounded),
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              '調査協力'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.push('/surveys');
            },
          ),
          if (config.isDebugMode)
            ListTile(
              leading: const Icon(Icons.code_rounded),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: Text(
                'デバッグモード'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.push('/debug');
              },
            ),
          ListTile(
            leading: const Icon(Icons.delete_rounded),
            title: Text(
              'キャッシュクリア'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              onClearCache(context);
            },
          ),
          if (authState.value != null)
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: Text(
                'ログアウト'.i18n,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                onShowLogoutDialog(context, ref);
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
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.push('/privacy');
            },
          ),
          ListTile(
            trailing: const Icon(Icons.open_in_new_rounded),
            title: Text(
              'ディスコに参加する'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              onShowDiscordDialog(context, ref);
            },
          ),
          ListTile(
            trailing: const Icon(Icons.open_in_new_rounded),
            title: Text(
              'ツイッターをフォローする'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              onShowTwitterDialog(context, ref);
            },
          ),
          const Divider(),
          ListTile(
            trailing: const Icon(Icons.chevron_right_rounded),
            title: Text(
              'テーマ設定'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.push('/config/theme');
            },
          ),
          SwitchListTile(
            title: Text(
              'システムカラーモード'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            value: config.isSystemColorMode,
            onChanged: (value) {
              final notifier = ref.read(configProvider.notifier);
              notifier.toggleSystemColorThemeMode();
            },
          ),
          if (!config.isSystemColorMode)
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
          if (!config.isSystemColorMode) const SizedBox(height: 8),
          if (!config.isSystemColorMode)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const ThemeColorContainer(),
            ),
          if (!config.isSystemColorMode) const SizedBox(height: 12),
          const Divider(),
          ListTile(
            title: Text(
              '${'バージョン'.i18n} ${DefaultConfig.versionText}',
            ),
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('クリップボードにコピーしました。'.i18n)),
              );
              final data = ClipboardData(text: DefaultConfig.versionText);
              Clipboard.setData(data);
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  onShowDiscordDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AboutDiscordDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () {
            context.pop();
            onOpenDiscord(context, ref);
          },
        );
      },
    );
  }

  onShowTwitterDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AboutTwitterDialog(
          onCancel: () {
            context.pop();
          },
          onOpen: () {
            context.pop();
            onOpenTwitter(context, ref);
          },
          onOpenPrompton: () {
            context.pop();
            onOpenTwitterPrompton(context, ref);
          },
        );
      },
    );
  }

  Future onOpenDiscord(BuildContext context, WidgetRef ref) async {
    final config = ref.read(configProvider);
    final isAvailable = await canLaunchUrl(config.pageDiscordURL);
    if (!isAvailable) return;
    await launchUrl(
      config.pageDiscordURL,
      mode: LaunchMode.externalApplication,
    );
  }

  Future onOpenTwitter(BuildContext context, WidgetRef ref) async {
    final config = ref.read(configProvider);
    final isAvailable = await canLaunchUrl(config.pageTwitterURL);
    if (!isAvailable) return;
    await launchUrl(
      config.pageTwitterURL,
      mode: LaunchMode.externalApplication,
    );
  }

  Future onOpenTwitterPrompton(BuildContext context, WidgetRef ref) async {
    final config = ref.read(configProvider);
    final isAvailable = await canLaunchUrl(config.pageTwitterPromptonURL);
    if (!isAvailable) return;
    await launchUrl(
      config.pageTwitterPromptonURL,
      mode: LaunchMode.externalApplication,
    );
  }

  Future onShowLogoutDialog(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return LogoutDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () {
            context.pop();
            onLogout(context);
          },
        );
      },
    );
  }

  Future onLogout(BuildContext context) async {
    logout();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('ログアウトしました。')),
      );
  }

  Future onClearCache(BuildContext context) async {
    HiveRepository.clear();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('キャッシュを削除しました。')),
      );
  }
}
