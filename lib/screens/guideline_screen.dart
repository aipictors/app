import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// ガイドライン
class GuidelineScreen extends HookConsumerWidget {
  const GuidelineScreen({super.key});

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final controller = WebViewController()
      ..loadRequest(config.pageGuidelineURL)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    return Scaffold(
      appBar: AppBar(title: Text('ガイドライン'.i18n)),
      body: Builder(builder: (context) {
        return WebViewWidget(controller: controller);
      }),
    );
  }
}
