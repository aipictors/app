import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<GCreateResponseCommentData?> createResponseComment({
  required String text,
  required String commentId,
}) async {
  try {
    final client = await createClient();

    final req = GCreateResponseCommentReq((builder) {
      return builder
        ..vars.input.commentId = commentId
        ..vars.input.text = text;
    });

    final stream = client.request(req).map(toResponseData);

    return stream.first;
  } catch (exception, stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
