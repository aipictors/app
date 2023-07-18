import 'package:aipictors/graphql/mutations/__generated__/mute_user.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/mute_user.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GMuteUserReqBuilder>;

Future<GMuteUserData?> muteUser(Builder b) {
  return mutate(GMuteUserReq(b));
}
