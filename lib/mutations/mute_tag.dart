import 'package:aipictors/graphql/mutations/__generated__/mute_tag.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/mute_tag.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GMuteTagReqBuilder>;

Future<GMuteTagData?> muteTag(Builder b) {
  return mutate(GMuteTagReq(b));
}
