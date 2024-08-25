import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostImage extends HookConsumerWidget {
  const PostImage({
    super.key,
    required this.imageURL,
    required this.thumbnailImagePosition,
    required this.imageAspectRatio,
    this.httpHeaders,
  });

  final String? imageURL;

  final double imageAspectRatio;

  final double? thumbnailImagePosition;

  final Map<String, String>? httpHeaders;

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
      // 正方形にするために、短辺の長さをconstraints.maxWidth(またはHeight)に合わせる
      // 長辺の長さはconstraints.maxWidth(またはHeight)*imageAspectRatioで計算する
      final double shortestSideLength = (imageAspectRatio <= 1.0)
          ? constraints.maxWidth // 縦長画像の短辺は横
          : constraints.maxHeight; // 横長画像の短辺は縦
      final double longestSideLength = (imageAspectRatio <= 1.0)
          ? (constraints.maxHeight / imageAspectRatio)
          : (constraints.maxWidth * imageAspectRatio);

      double thumbnailOffset = 0;
      // 正方形以外はサムネ位置を調整する
      if (imageAspectRatio != 1.0) {
        // サムネ位置が設定されていない場合、-5%して中心に寄せる
        if (thumbnailImagePosition == null) {
          thumbnailOffset = longestSideLength * (-5 / 100);
        } else {
          thumbnailOffset = longestSideLength * (thumbnailImagePosition! / 100);
        }
      }

      return FittedBox(
        fit: BoxFit.cover,
        alignment: Alignment.topLeft,
        // 画像が枠からはみ出さないようにclipBehaviorを指定。負荷が高ければClip.hardEdgeでいいかもしれない
        clipBehavior: Clip.antiAlias,
        child: Transform.translate(
          offset: (imageAspectRatio <= 1.0)
              ? Offset(0, thumbnailOffset)
              : Offset(thumbnailOffset, 0),
          child: SizedBox(
            width: (imageAspectRatio <= 1.0)
                ? shortestSideLength
                : longestSideLength,
            height: (imageAspectRatio >= 1.0)
                ? shortestSideLength
                : longestSideLength,
            child: CachedNetworkImage(
              imageUrl: imageURL!,
              httpHeaders: httpHeaders,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Container(
                  // サイズ指定が必要なので、double.infinityではなくMediaQueryを使用する
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
        ),
      );
    });
  }
}
