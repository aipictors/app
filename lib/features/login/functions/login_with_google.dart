import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> loginWithGoogle() async {
  try {
    if (kIsWeb) {
      final provider = GoogleAuthProvider();
      await FirebaseAuth.instance.signInWithPopup(provider);
      return;
    }

    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Google sign-in was aborted by the user.',
      );
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (exception, stackTrace) {
    // Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
