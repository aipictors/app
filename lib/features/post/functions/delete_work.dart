import 'package:aipictors/graphql/mutations/__generated__/delete_work.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/delete_work.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GDeleteWorkReqBuilder>;

Future<GDeleteWorkData?> deleteWork(Builder b) {
  return mutate(GDeleteWorkReq(b));
}
