import 'package:aipictors/graphql/mutations/__generated__/create_work.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_work.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateWorkReqBuilder>;

Future<GCreateWorkData?> createWork(Builder b) {
  return mutate(GCreateWorkReq(b));
}
