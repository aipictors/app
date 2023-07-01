import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugScreen extends HookConsumerWidget {
  const DebugScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('デバッグ'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text('lastFetchStatus'),
              subtitle: Text(config.lastFetchStatus.toString()),
            ),
            ListTile(
              title: const Text('isFirstTime'),
              subtitle: Text(config.isFirstTime.toString()),
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
            ListTile(
              title: const Text('versionLatest'),
              subtitle: Text(config.versionLatest),
            ),
            ListTile(
              title: const Text('versionSupport'),
              subtitle: Text(config.versionSupport),
            ),
            ListTile(
              title: const Text('isEnabledEmergencyUnavailablePost'),
              subtitle: Text(
                config.isEnabledEmergencyUnavailablePost.toString(),
              ),
            ),
            ListTile(
              title: const Text('isEnabledEmergencyUnavailable'),
              subtitle: Text(config.isEnabledEmergencyUnavailable.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
