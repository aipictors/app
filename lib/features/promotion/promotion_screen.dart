import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// プロモーションの詳細
class PromotionScreen extends HookConsumerWidget {
  const PromotionScreen({
    super.key,
    required this.promotionId,
  });

  final String promotionId;

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(title: Text('イベント'.i18n)),
    );
  }
}
