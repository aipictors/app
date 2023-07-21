import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationDeletedListTile extends HookConsumerWidget {
  const NotificationDeletedListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return ListTile(
      title: Text(
        'この通知は削除されました。'.i18n,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
