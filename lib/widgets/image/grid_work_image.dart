import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GridWorkImage extends HookConsumerWidget {
  const GridWorkImage({
    super.key,
    required this.imageURL,
    //TODO: requiredにする
    this.thumbnailImagePosition,
    this.imageAspectRatio,
  });

  final String? imageURL;

  final int? thumbnailImagePosition;

  final double? imageAspectRatio;

  @override
  Widget build(context, ref) {
    if (imageURL == null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).disabledColor,
      );
    }

    return LayoutBuilder(builder: (context, constraints) {
      // thumbnailImagePositionはパーセントで渡されるので、Offsetに変換する
      final double thumbnailOffset =
          constraints.maxWidth * ((thumbnailImagePosition ?? 0) / 100);

      return FittedBox(
        fit: BoxFit.cover,
        // offsetは縦長画像の場合は一番上、横長画像の場合は一番左になる
        alignment: ((imageAspectRatio ?? 0) <= 1.0)
            ? Alignment.topCenter
            : Alignment.topLeft,
        // 画像が枠からはみ出さないようにclipBehaviorを指定。負荷が高ければClip.hardEdgeでいいかもしれない
        clipBehavior: Clip.antiAlias,
        child: Transform.translate(
          offset: ((imageAspectRatio ?? 0) <= 1.0)
              ? Offset(0, thumbnailOffset)
              : Offset(thumbnailOffset, 0),
          child: CachedNetworkImage(
            imageUrl: imageURL!,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Container(
                // double.infinityはエラーになってしまうので、MediaQueryを使用する
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).colorScheme.primaryContainer,
              );
            },
            errorWidget: (context, uri, error) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).disabledColor,
              );
            },
          ),
        ),
      );
    });
  }
}
