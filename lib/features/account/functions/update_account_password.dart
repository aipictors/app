import 'package:aipictors/features/account/mutations/__generated__/update_account_password.data.gql.dart';
import 'package:aipictors/features/account/mutations/__generated__/update_account_password.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateAccountPasswordReqBuilder>;

Future<GUpdateAccountPasswordData?> updateAccountPassword(Builder b) {
  return mutate(GUpdateAccountPasswordReq(b));
}
