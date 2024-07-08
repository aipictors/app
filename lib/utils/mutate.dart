import 'package:aipictors/client.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:ferry/ferry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<TData?> mutate<TData, TVars>(
  OperationRequest<TData, TVars> request,
) async {
  try {
    final client = await createClient();
    final stream = client.request(request).map(toResponseData);
    return stream.first;
  } catch (exception, stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
