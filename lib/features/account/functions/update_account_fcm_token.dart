import 'package:aipictors/graphql/mutations/__generated__/update_account_fcm_token.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/update_account_fcm_token.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateAccountFcmTokenReqBuilder>;

Future<GUpdateAccountFcmTokenData?> updateAccountFcmToken(Builder b) {
  return mutate(GUpdateAccountFcmTokenReq(b));
}
