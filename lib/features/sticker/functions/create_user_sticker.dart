import 'package:aipictors/graphql/mutations/__generated__/create_user_sticker.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_user_sticker.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateUserStickerReqBuilder>;

Future<GCreateUserStickerData?> createUserSticker(Builder b) {
  return mutate(GCreateUserStickerReq(b));
}
