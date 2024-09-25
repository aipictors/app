import 'package:aipictors/client.dart';
import 'package:aipictors/features/generation/widgets/__generated__/viewer_image_generation_status.data.gql.dart';
import 'package:aipictors/features/generation/widgets/__generated__/viewer_image_generation_status.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewer_image_generation_status_provider.g.dart';

/// ログイン中のユーザ画像生成ののデータ
/// AutoDisposeFutureProvider<InvalidType>
@riverpod
class ViewerImageGenerationStatus extends _$ViewerImageGenerationStatus {
  @override
  Future<GViewerImageGenerationStatusData?> build() async {
    autoRefresh();
    return await fetch();
  }

  Future<GViewerImageGenerationStatusData?> fetch() async {
    final client = await createClient();

    final request = GViewerImageGenerationStatusReq((builder) {
      builder.fetchPolicy = FetchPolicy.NoCache;
    });

    final stream = client.request(request).map(toResponseData);

    return await stream.first;
  }

  void refresh() async {
    state = AsyncValue.data(await fetch());
  }

  void autoRefresh() {
    //todo: 更新間隔を調整する
    Stream.periodic(const Duration(seconds: 10)).listen((_) async {
      state = AsyncValue.data(await fetch());
    });
  }
}
