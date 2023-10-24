import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/viewer_user.data.gql.dart';
import 'package:aipictors/graphql/__generated__/viewer_user.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewer_provider.g.dart';

/// ログイン中のユーザのデータ
/// AutoDisposeFutureProvider<InvalidType>
@riverpod
Future<GViewerUserData?> viewer(ViewerRef ref) async {
  // final user = ref.watch(authStateProvider);

  // ログインしていない場合はnullを返す
  // if (user.value == null) {
  //   return null;
  // }

  final client = await createClient();

  final request = GViewerUserReq();

  final stream = client.request(request).map(toResponseData);

  return await stream.first;
}
