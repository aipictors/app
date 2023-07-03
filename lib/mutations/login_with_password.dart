import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/login.data.gql.dart';
import 'package:aipictors/graphql/__generated__/login.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<GLoginWithPasswordData?> loginWithPassword({
  required String login,
  required String password,
}) async {
  try {
    final client = await createClient();

    final req = GLoginWithPasswordReq((builder) {
      return builder
        ..vars.input.login = login
        ..vars.input.password = password;
    });

    final stream = client.request(req).map(toResponseData);

    final data = await stream.first;

    if (data == null) {
      throw PlatformException(code: 'ERROR', message: 'ログインに失敗しました');
    }

    final token = data.loginWithPassword.token;

    await FirebaseAuth.instance.signInWithCustomToken(token);

    return data;
  } catch (exception, stackTrace) {
    Sentry.captureException(exception, stackTrace: stackTrace);
    rethrow;
  }
}
