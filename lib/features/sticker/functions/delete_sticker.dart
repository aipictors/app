import 'package:aipictors/features/sticker/mutations/__generated__/delete_sticker.data.gql.dart';
import 'package:aipictors/features/sticker/mutations/__generated__/delete_sticker.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GDeleteStickerReqBuilder>;

Future<GDeleteStickerData?> deleteSticker(Builder b) {
  return mutate(GDeleteStickerReq(b));
}
