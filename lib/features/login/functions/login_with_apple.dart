import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Apple から受け取った名前。Apple は初回のサインインでしか名前を返さないので、
/// プロフィール初期設定の入力欄に入れて、もう一度入力しなくて済むようにする
String? appleSignInDisplayName;

String _randomNonce() {
  final random = Random.secure();
  return base64UrlEncode(List.generate(32, (_) => random.nextInt(256)));
}

Future<void> loginWithApple() async {
  final rawNonce = _randomNonce();

  final AuthorizationCredentialAppleID apple;
  try {
    apple = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: sha256.convert(utf8.encode(rawNonce)).toString(),
    );
  } on SignInWithAppleAuthorizationException catch (exception) {
    if (exception.code == AuthorizationErrorCode.canceled) {
      throw FirebaseAuthException(code: 'user-cancelled');
    }
    rethrow;
  }

  final credential = OAuthProvider('apple.com').credential(
    idToken: apple.identityToken,
    rawNonce: rawNonce,
    accessToken: apple.authorizationCode,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);

  final name = [apple.familyName, apple.givenName]
      .whereType<String>()
      .where((part) => part.isNotEmpty)
      .join(' ');
  if (name.isNotEmpty) appleSignInDisplayName = name;
}

/// Apple でログインしているかどうか
bool isAppleUser() {
  final user = FirebaseAuth.instance.currentUser;
  return user?.providerData.any((item) => item.providerId == 'apple.com') ??
      false;
}

/// 退会するときに Apple のトークンを取り消す（App Store の要件）。
/// Apple の画面を閉じたときは false を返す。取り消しに失敗しても退会は止めない
Future<bool> revokeAppleToken() async {
  try {
    final apple = await SignInWithApple.getAppleIDCredential(scopes: const []);
    await FirebaseAuth.instance
        .revokeTokenWithAuthorizationCode(apple.authorizationCode);
  } on SignInWithAppleAuthorizationException catch (exception) {
    if (exception.code == AuthorizationErrorCode.canceled) return false;
  } catch (_) {
    // 退会そのものは続ける
  }
  return true;
}
