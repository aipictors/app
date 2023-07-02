import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/user.data.gql.dart';
import 'package:aipictors/graphql/__generated__/user.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_user_provider.g.dart';

@riverpod
Future<GUserData?> queryUser(QueryUserRef ref, String id) async {
  final client = await createClient();
  final req = GUserReq((builder) {
    return builder..vars.userId = id;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
