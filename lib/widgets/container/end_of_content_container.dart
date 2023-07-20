import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EndOfContentContainer extends HookConsumerWidget {
  const EndOfContentContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    const size = 8.0 * 32;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8 * 8),
      child: Column(children: [
        Text(
          'ここで終わりみたい。'.i18n,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.color,
          ),
          child: CachedNetworkImage(
            width: size,
            height: size,
            imageUrl: config.endOfFeedImageURL,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Container(
                width: size,
                height: size,
                color: Colors.transparent,
              );
            },
            errorWidget: (context, uri, error) {
              return Container(
                width: size,
                height: size,
                color: Colors.transparent,
              );
            },
          ),
        )
      ]),
    );
  }
}
