import 'dart:async';
import 'dart:io';

import 'package:aipictors/default.i18n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:gql_exec/gql_exec.dart';

String toExceptionMessage(dynamic exception) {
  // ignore: avoid_print
  print(exception);

  // Firebase Auth
  if (exception is FirebaseAuthException) {
    switch (exception.code) {
      case 'invalid-credential':
        // Common with X(Twitter) when consumer key/secret or callback URL is wrong.
        return '認証情報が無効です。Xログインの場合、FirebaseのTwitterプロバイダ設定（API Key/Secret）と、X Developer PortalのCallback URL（/__/auth/handler）が正しいか確認してください。'.i18n;
      case 'web-user-interaction-failure':
      case 'user-interaction-failed':
        return '認証画面の操作に失敗しました（途中で閉じた/ブロックされた可能性）。もう一度お試しください。'.i18n;
      case 'user-cancelled':
      case 'cancelled':
        return '認証がキャンセルされました。'.i18n;
      case 'account-exists-with-different-credential':
        return '同じメールアドレスの別ログイン方法のアカウントが既に存在します。別の方法でログインして連携してください。'.i18n;
      default:
        if (exception.message != null && exception.message!.isNotEmpty) {
          // Firebase SDK messages can be arbitrary (often English) and should not be treated as i18n keys.
          return exception.message!;
        }
        return 'ログインに失敗しました（_CODE_）。'.i18n.replaceAll('_CODE_', exception.code);
    }
  }

  // Network / TLS
  if (exception is TimeoutException) {
    return '通信がタイムアウトしました。'.i18n;
  }
  if (exception is SocketException) {
    return 'ネットワークに接続できませんでした。'.i18n;
  }
  if (exception is HandshakeException || exception is TlsException) {
    return '安全な通信の確立に失敗しました。'.i18n;
  }
  if (exception is FormatException) {
    return 'サーバーから不正な応答が返されました。'.i18n;
  }

  // アプリ内のエラー
  if (exception is PlatformException && exception.message != null) {
    return '${exception.message}'.i18n;
  }

  if (exception is GraphQLError) {
    return exception.message;
  }

  return '不明なエラーが発生しました。'.i18n;
}
