import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class ModalShareListTile extends HookConsumerWidget {
  const ModalShareListTile({
    super.key,
    required this.titleText,
    required this.shareText,
    required this.onTap,
  });

  final String titleText;

  final String shareText;

  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    return ListTile(
      leading: const Icon(Icons.share_rounded),
      title: Text(
        titleText,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () {
        final box = context.findRenderObject() as RenderBox?;
        Share.share(
          shareText,
          // iPadで動作させるため
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );
        onTap();
      },
    );
  }
}
