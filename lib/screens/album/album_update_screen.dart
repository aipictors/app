import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アルバム・編集
class AlbumUpdateScreen extends HookConsumerWidget {
  const AlbumUpdateScreen({
    Key? key,
    required this.albumId,
  }) : super(key: key);

  final String albumId;

  @override
  Widget build(context, ref) {
    return const Scaffold();
  }
}
