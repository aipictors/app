import 'package:aipictors/graphql/mutations/__generated__/delete_user_sticker.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/delete_user_sticker.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GDeleteUserStickerReqBuilder>;

Future<GDeleteUserStickerData?> deleteUserSticker(Builder b) {
  return mutate(GDeleteUserStickerReq(b));
}
