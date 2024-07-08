import 'package:aipictors/graphql/mutations/__generated__/report_album.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/report_album.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GReportAlbumReqBuilder>;

Future<GReportAlbumData?> reportAlbum(Builder b) {
  return mutate(GReportAlbumReq(b));
}
