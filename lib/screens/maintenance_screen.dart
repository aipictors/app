import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// メンテナンス
class MaintenanceScreen extends HookConsumerWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 40,
          right: 40,
        ),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'メンテナンス中'.i18n,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(config.messageMaintenance),
            const SizedBox(height: 40),
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                onOpenDiscord(context, ref);
              },
              child: Text('ディスコで確認する'.i18n),
            ),
          ]),
        ),
      ),
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
}
