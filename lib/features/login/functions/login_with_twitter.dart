import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> loginWithTwitter() async {
  try {
    final twitterProvider = TwitterAuthProvider();

    if (kIsWeb) {
      await FirebaseAuth.instance.signInWithPopup(twitterProvider);
    } else {
      await FirebaseAuth.instance.signInWithProvider(twitterProvider);
    }
  } catch (exception, stackTrace) {
    // Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
