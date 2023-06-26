import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileAvatar extends HookConsumerWidget {
  const UserProfileAvatar({
    Key? key,
    required this.downloadURL,
  }) : super(key: key);

  final String downloadURL;

  @override
  Widget build(context, ref) {
    return CircleAvatar(
      radius: 44,
      backgroundColor: Theme.of(context).primaryColorLight,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(downloadURL),
      ),
    );
  }
}
