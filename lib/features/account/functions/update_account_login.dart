import 'package:aipictors/features/account/mutations/__generated__/update_account_login.data.gql.dart';
import 'package:aipictors/features/account/mutations/__generated__/update_account_login.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateAccountLoginReqBuilder>;

Future<GUpdateAccountLoginData?> updateAccountLogin(Builder b) {
  return mutate(GUpdateAccountLoginReq(b));
}
