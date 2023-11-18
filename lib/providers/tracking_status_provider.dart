import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tracking_status_provider.g.dart';

/// App Tracking Transparency
/// Require that users agree to terms (EULA) and these terms must make it clear that there is no tolerance for objectionable content or abusive users
@riverpod
Future<TrackingStatus> trackingStatus(TrackingStatusRef ref) {
  return AppTrackingTransparency.trackingAuthorizationStatus;
}
