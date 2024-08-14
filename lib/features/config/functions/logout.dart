import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

Future logout() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (exception, stackTrace) {
    // Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
