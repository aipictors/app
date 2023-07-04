import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/create_work_like.data.gql.dart';
import 'package:aipictors/graphql/__generated__/create_work_like.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<GCreateWorkLikeData?> createWorkLike({
  required String workId,
}) async {
  try {
    final client = await createClient();

    final req = GCreateWorkLikeReq((builder) {
      return builder..vars.input.workId = workId;
    });

    final stream = client.request(req).map(toResponseData);

    return stream.first;
  } catch (exception, stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
