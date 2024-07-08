import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アルバム・編集
class AlbumUpdateScreen extends HookConsumerWidget {
  const AlbumUpdateScreen({
    super.key,
    required this.albumId,
  });

  final String albumId;

  @override
  Widget build(context, ref) {
    return const Scaffold();
  }
}
