import 'dart:ui';

import 'package:aipictors/widgets/container/user_header_image_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserAppBar extends HookConsumerWidget {
  const UserAppBar({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.userName,
    required this.headerImageURL,
  }) : super(key: key);

  final String userName;

  final bool innerBoxIsScrolled;

  final String headerImageURL;

  @override
  Widget build(context, ref) {
    return SliverAppBar(
      title: innerBoxIsScrolled
          ? Text(
              userName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      pinned: true,
      leading: IconButton.filledTonal(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
      expandedHeight: 128,
      stretch: true,
      flexibleSpace: ClipRRect(
        child: TweenAnimationBuilder<double>(
          tween: Tween(
            begin: 0,
            end: innerBoxIsScrolled ? 16 : 0,
          ),
          duration: const Duration(milliseconds: 128),
          builder: (_, value, child) {
            return ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: value,
                sigmaY: value,
              ),
              child: child,
            );
          },
          child: UserHeaderImageContainer(
            downloadURL: headerImageURL,
          ),
        ),
      ),
    );
  }
}
