import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/user/user_screen.dart';
import 'package:aipictors/providers/auth_user_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// マイページ
class ViewerScreen extends HookConsumerWidget {
  const ViewerScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final authUserId = ref.watch(authUserIdProvider);

    if (authUserId.value == null) {
      return const LoadingScreen();
    }

    return UserScreen(userId: authUserId.value!);
  }
}
