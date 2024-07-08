import 'package:aipictors/client.dart';
import 'package:aipictors/features/viewer/queries/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/features/viewer/queries/__generated__/viewer_image_generation_status.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewer_image_generation_status_provider.g.dart';

/// ログイン中のユーザ画像生成ののデータ
/// AutoDisposeFutureProvider<InvalidType>
@riverpod
Future<GViewerImageGenerationStatusData?> viewerImageGenerationStatus(
    ViewerImageGenerationStatusRef ref) async {
  // final user = ref.watch(authStateProvider);

  // ログインしていない場合はnullを返す
  // if (user.value == null) {
  //   return null;
  // }

  final client = await createClient();

  final request = GViewerImageGenerationStatusReq((builder) {
    builder.fetchPolicy = FetchPolicy.NetworkOnly;
  });

  final stream = client.request(request).map(toResponseData);

  return await stream.first;
}
