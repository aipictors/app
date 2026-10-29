import 'package:aipictors/features/account/mutations/__generated__/withdraw_account.data.gql.dart';
import 'package:aipictors/features/account/mutations/__generated__/withdraw_account.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

/// ログイン中のアカウントを退会する（サーバー側で有料プランも解約される）
Future<GWithdrawAccountData?> withdrawAccount() {
  return mutate(GWithdrawAccountReq());
}
