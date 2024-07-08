import 'package:aipictors/graphql/mutations/__generated__/create_sticker.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_sticker.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateStickerReqBuilder>;

Future<GCreateStickerData?> createSticker(Builder b) async {
  return mutate(GCreateStickerReq(b));
}
