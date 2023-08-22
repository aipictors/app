import 'package:aipictors/config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ライセンス
class LicenseScreen extends HookConsumerWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return LicensePage(
      applicationName: 'Aipictors',
      applicationVersion: DefaultConfig.versionText,
      applicationIcon: const ImageIcon(
        AssetImage('assets/images/aipictors.png'),
        size: 64,
      ),
      applicationLegalese: '2023 Aipictors株式会社',
    );
  }
}
