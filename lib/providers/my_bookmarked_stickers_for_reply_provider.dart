import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/client.dart';
import 'package:aipictors/features/sticker/__generated__/my_bookmarked_stickers.data.gql.dart';
import 'package:aipictors/features/sticker/__generated__/my_bookmarked_stickers.req.gql.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_bookmarked_stickers_for_reply_provider.g.dart';

/// ログイン中のユーザのコメント用にブックマークしたスタンプのデータ
/// AutoDisposeFutureProvider<InvalidType>
@riverpod
Future<GMyBookmarkedStickersData?> myBookmarkedStickersForReply(
    MyBookmarkedStickersForReplyRef ref) async {
  // final user = ref.watch(authStateProvider);

  // ログインしていない場合はnullを返す
  // if (user.value == null) {
  //   return null;
  // }

  final client = await createClient();

  final config = ref.watch(configProvider);

  final request = GMyBookmarkedStickersReq((builder) {
    builder
      ..vars.limit = config.graphqlQueryLimit
      ..vars.offset = 0
      ..vars.type = GBookmarkedStickerType.reply;
  });

  final stream = client.request(request).map(toResponseData);

  return await stream.first;
}
