import 'package:aipictors/graphql/mutations/__generated__/report_sticker.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/report_sticker.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GReportStickerReqBuilder>;

Future<GReportStickerData?> reportSticker(Builder b) {
  return mutate(GReportStickerReq(b));
}
