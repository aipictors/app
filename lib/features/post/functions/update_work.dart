import 'package:aipictors/graphql/mutations/__generated__/update_work.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/update_work.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateWorkReqBuilder>;

Future<GUpdateWorkData?> updateWork(Builder b) {
  return mutate(GUpdateWorkReq(b));
}
