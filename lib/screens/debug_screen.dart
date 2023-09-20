import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// デバッグ
class DebugScreen extends HookConsumerWidget {
  const DebugScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('デバッグ'.i18n),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text('projectId'),
              subtitle: Text(Firebase.app().options.projectId),
            ),
            const Divider(),
            ListTile(
              title: const Text('lastFetchStatus'),
              subtitle: Text(config.lastFetchStatus.toString()),
            ),
            ListTile(
              title: const Text('isTutorial'),
              subtitle: Text(config.isTutorial.toString()),
            ),
            ListTile(
              title: const Text('language'),
              subtitle: Text(config.language),
            ),
            ListTile(
              title: const Text('themeMode'),
              subtitle: Text(config.themeMode.toString()),
            ),
            ListTile(
              title: const Text('themeColor'),
              subtitle: Text(config.themeColor.toString()),
            ),
            const Divider(),
            ListTile(
              title: const Text('versionLatest'),
              subtitle: Text(config.versionLatest),
            ),
            ListTile(
              title: const Text('versionSupport'),
              subtitle: Text(config.versionSupport),
            ),
            const Divider(),
            ListTile(
              title: const Text('campaignId'),
              subtitle: Text(config.campaignId.toString()),
            ),
            ListTile(
              title: const Text('campaignImageURL'),
              subtitle: Text(config.campaignImageURL.toString()),
            ),
            ListTile(
              title: const Text('campaignMessage'),
              subtitle: Text(config.campaignMessage.toString()),
            ),
            ListTile(
              title: const Text('campaignTitle'),
              subtitle: Text(config.campaignTitle.toString()),
            ),
            const Divider(),
            ListTile(
              title: const Text('pageDiscordURL'),
              subtitle: Text(config.pageDiscordURL.toString()),
            ),
            ListTile(
              title: const Text('pageGuidelineURL'),
              subtitle: Text(config.pageGuidelineURL.toString()),
            ),
            ListTile(
              title: const Text('pageOrganizationURL'),
              subtitle: Text(config.pageOrganizationURL.toString()),
            ),
            ListTile(
              title: const Text('pagePrivacyURL'),
              subtitle: Text(config.pagePrivacyURL.toString()),
            ),
            ListTile(
              title: const Text('pageRepositoryURL'),
              subtitle: Text(config.pageRepositoryURL.toString()),
            ),
            ListTile(
              title: const Text('pageTermsURL'),
              subtitle: Text(config.pageTermsURL.toString()),
            ),
            ListTile(
              title: const Text('pageThreadsURL'),
              subtitle: Text(config.pageThreadsURL.toString()),
            ),
            ListTile(
              title: const Text('pageTwitterURL'),
              subtitle: Text(config.pageTwitterURL.toString()),
            ),
            ListTile(
              title: const Text('pageTwitterPromptonURL'),
              subtitle: Text(config.pageTwitterPromptonURL.toString()),
            ),
            ListTile(
              title: const Text('pageWikiURL'),
              subtitle: Text(config.pageWikiURL.toString()),
            ),
            ListTile(
              title: const Text('supportEmail'),
              subtitle: Text(config.supportEmail.toString()),
            ),
            const Divider(),
            ListTile(
              title: const Text('featureCreateComment'),
              subtitle: Text(config.featureCreateComment.toString()),
            ),
            ListTile(
              title: const Text('featureCreateFolder'),
              subtitle: Text(config.featureCreateFolder.toString()),
            ),
            ListTile(
              title: const Text('featureCreateSticker'),
              subtitle: Text(config.featureCreateSticker.toString()),
            ),
            ListTile(
              title: const Text('featureCreateWork'),
              subtitle: Text(config.featureCreateWork.toString()),
            ),
            ListTile(
              title: const Text('featureDeleteComment'),
              subtitle: Text(config.featureDeleteComment.toString()),
            ),
            ListTile(
              title: const Text('featureDeleteFolder'),
              subtitle: Text(config.featureDeleteFolder.toString()),
            ),
            ListTile(
              title: const Text('featureDeleteSticker'),
              subtitle: Text(config.featureDeleteSticker.toString()),
            ),
            ListTile(
              title: const Text('featureDeleteWork'),
              subtitle: Text(config.featureDeleteWork.toString()),
            ),
            ListTile(
              title: const Text('featureFollowUser'),
              subtitle: Text(config.featureFollowUser.toString()),
            ),
            ListTile(
              title: const Text('featureLogin'),
              subtitle: Text(config.featureLogin.toString()),
            ),
            ListTile(
              title: const Text('featureMuteTag'),
              subtitle: Text(config.featureMuteTag.toString()),
            ),
            ListTile(
              title: const Text('featureMuteUser'),
              subtitle: Text(config.featureMuteUser.toString()),
            ),
            ListTile(
              title: const Text('featureUpdateComment'),
              subtitle: Text(config.featureUpdateComment.toString()),
            ),
            ListTile(
              title: const Text('featureUpdateFolder'),
              subtitle: Text(config.featureUpdateFolder.toString()),
            ),
            ListTile(
              title: const Text('featureUpdateSticker'),
              subtitle: Text(config.featureUpdateSticker.toString()),
            ),
            ListTile(
              title: const Text('featureUpdateUser'),
              subtitle: Text(config.featureUpdateUser.toString()),
            ),
            ListTile(
              title: const Text('featureUpdateWork'),
              subtitle: Text(config.featureUpdateWork.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
