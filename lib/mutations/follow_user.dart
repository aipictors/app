import 'package:aipictors/graphql/mutations/__generated__/follow_user.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/follow_user.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GFollowUserReqBuilder>;

Future<GFollowUserData?> followUser(Builder b) {
  return mutate(GFollowUserReq(b));
}
