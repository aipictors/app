import 'dart:async';

import 'package:aipictors/features/generation/widgets/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/providers/viewer_image_generation_status_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewer_image_generation_status_stream_provider.g.dart';

/// ログイン中のユーザ画像生成のデータを定期的に返す
/// AutoDisposeFutureProvider<InvalidType>
@riverpod
Stream<GViewerImageGenerationStatusData?> viewerImageGenerationStatusStream(
    ViewerImageGenerationStatusStreamRef ref) async* {
  while (true) {
    final status =
        await ref.refresh(viewerImageGenerationStatusProvider.future);
    yield status;
    await Future.delayed(const Duration(seconds: 10));
  }
}
