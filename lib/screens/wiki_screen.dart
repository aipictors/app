import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// ガイドライン
class WikiScreen extends HookConsumerWidget {
  const WikiScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final controller = WebViewController()
      ..loadRequest(config.pageWikiURL)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    return Scaffold(
      appBar: AppBar(title: const Text('Wiki')),
      body: Builder(builder: (context) {
        return WebViewWidget(controller: controller);
      }),
    );
  }
}
