import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/viewer_notifications.data.gql.dart';
import 'package:aipictors/graphql/__generated__/viewer_notifications.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_viewer_notifications_provider.g.dart';

@riverpod
Future<GViewerNotificationsData?> queryViewerNotifications(
  QueryViewerNotificationsRef ref,
) async {
  ref.keepAlive();
  final client = await createClient();
  final req = GViewerNotificationsReq((builder) {
    return builder
      ..vars.offset = 0
      ..vars.limit = 64;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
