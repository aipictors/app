import 'package:aipictors/features/sticker/mutations/__generated__/update_sticker.data.gql.dart';
import 'package:aipictors/features/sticker/mutations/__generated__/update_sticker.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateStickerReqBuilder>;

Future<GUpdateStickerData?> updateSticker(Builder b) {
  return mutate(GUpdateStickerReq(b));
}
