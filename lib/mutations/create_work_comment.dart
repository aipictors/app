import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<GCreateWorkCommentData?> createWorkComment({
  required String workId,
  required String text,
}) async {
  try {
    final client = await createClient();

    final req = GCreateWorkCommentReq((builder) {
      return builder
        ..vars.input.workId = workId
        ..vars.input.text = text;
    });

    final stream = client.request(req).map(toResponseData);

    return stream.first;
  } catch (exception, stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
