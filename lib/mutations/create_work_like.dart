import 'package:aipictors/graphql/mutations/__generated__/create_work_like.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_work_like.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateWorkLikeReqBuilder>;

Future<GCreateWorkLikeData?> createWorkLike(Builder b) {
  return mutate(GCreateWorkLikeReq(b));
}
