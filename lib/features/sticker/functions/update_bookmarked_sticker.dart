import 'package:aipictors/features/sticker/mutations/__generated__/update_bookmarked_sticker.data.gql.dart';
import 'package:aipictors/features/sticker/mutations/__generated__/update_bookmarked_sticker.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateBookmarkedStickerReqBuilder>;

Future<GUpdateBookmarkedStickerData?> updateBookmarkedSticker(Builder b) {
  return mutate(GUpdateBookmarkedStickerReq(b));
}
