import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';

/// アップデート
class UpdateScreen extends HookConsumerWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(context, ref) {
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
              'アップデートしてね！'.i18n,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              '新しいバージョンのアプリが公開されています。ストアからアップデートをお願いします。'.i18n,
            ),
            const SizedBox(height: 40),
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                onOpenAppStore(context, ref);
              },
              child: Text('ストアに移動する'.i18n),
            ),
          ]),
        ),
      ),
    );
  }

  Future onOpenAppStore(BuildContext context, WidgetRef ref) async {
    final config = ref.read(configProvider);
    // final isAvailable = await canLaunchUrl(config.pageAppStoreURL);
    // if (!isAvailable) return;
    // await launchUrl(
    //   config.pageAppStoreURL,
    //   mode: LaunchMode.externalApplication,
    // );
  }
}
