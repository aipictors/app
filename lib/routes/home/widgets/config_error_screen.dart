import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定エラー
class ConfigErrorScreen extends HookConsumerWidget {
  const ConfigErrorScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'アプリの起動に失敗しました。'.i18n,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            FilledButton.tonal(
              onPressed: () {
                onRetry(context, ref);
              },
              child: Text('リロード'.i18n),
            )
          ],
        ),
      ),
    );
  }

  onRetry(BuildContext context, WidgetRef ref) async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    final notifier = ref.read(configProvider.notifier);
    notifier.rebuild();
  }
}
