import 'package:aipictors/graphql/mutations/__generated__/create_album_work.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_album_work.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateAlbumWorkReqBuilder>;

Future<GCreateAlbumWorkData?> createAlbumWork(Builder b) {
  return mutate(GCreateAlbumWorkReq(b));
}
