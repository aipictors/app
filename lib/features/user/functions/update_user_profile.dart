import 'package:aipictors/graphql/mutations/__generated__/update_user_profile.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/update_user_profile.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GUpdateUserProfileReqBuilder>;

Future<GUpdateUserProfileData?> updateUserProfile(Builder b) {
  return mutate(GUpdateUserProfileReq(b));
}
