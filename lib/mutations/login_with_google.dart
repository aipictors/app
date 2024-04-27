import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> loginWithGoogle() async {
  try {
    final googleProvider = GoogleAuthProvider();

    if (kIsWeb) {
      await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else {
      await FirebaseAuth.instance.signInWithProvider(googleProvider);
    }
  } catch (exception, stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
