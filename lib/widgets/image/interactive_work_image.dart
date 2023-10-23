import 'package:aipictors/widgets/dialog/interactive_image_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InteractiveWorkImage extends HookConsumerWidget {
  const InteractiveWorkImage({
    Key? key,
    required this.downloadURL,
  }) : super(key: key);

  final String downloadURL;

  @override
  Widget build(context, ref) {
    return GestureDetector(
      child: SizedBox(
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: downloadURL,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        showGeneralDialog(
          barrierColor: Colors.black87,
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return InteractiveImageDialog(downloadURL);
          },
        );
      },
    );
  }
}
