import 'package:aipictors/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewerScreen extends HookConsumerWidget {
  const ViewerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    const userId = '3293';

    return const UserScreen(userId: userId);
  }
}
