import 'package:aipictors/features/tag/mutations/__generated__/mute_tag.data.gql.dart';
import 'package:aipictors/features/tag/mutations/__generated__/mute_tag.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GMuteTagReqBuilder>;

Future<GMuteTagData?> muteTag(Builder b) {
  return mutate(GMuteTagReq(b));
}
