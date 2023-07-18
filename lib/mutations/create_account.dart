import 'package:aipictors/graphql/mutations/__generated__/create_account.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_account.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateAccountReqBuilder>;

Future<GCreateAccountData?> createAccount(Builder b) async {
  return mutate(GCreateAccountReq(b));
}
