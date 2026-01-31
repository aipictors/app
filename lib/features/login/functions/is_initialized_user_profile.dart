import 'package:aipictors/features/login/mutations/__generated__/is_initialized_user_profile.data.gql.dart';
import 'package:aipictors/features/login/mutations/__generated__/is_initialized_user_profile.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

Future<bool> isInitializedUserProfile() async {
  final GIsInitializedUserProfileData? data =
      await mutate(GIsInitializedUserProfileReq());
  return data?.isInitializedUserProfile ?? false;
}
