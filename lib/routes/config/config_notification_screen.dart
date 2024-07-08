import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_user.req.gql.dart';
import 'package:aipictors/mutations/update_account_fcm_token.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/routes/home/widgets/loading_screen.dart';
import 'package:aipictors/utils/to_exception_message.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// 設定・通知
class ConfigNotificationScreen extends HookConsumerWidget {
  const ConfigNotificationScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    final request = GViewerUserReq();

    if (client.value == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('通知設定'.i18n),
      ),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final fcmToken = response.data?.viewer?.user.fcmToken;
          return ListView(children: [
            ListTile(
              title: Text('通知を受け取る'.i18n),
              subtitle: Text('通知を受け取るかどうかを設定します。'.i18n),
              trailing: Switch(
                value: fcmToken != null,
                onChanged: (value) async {
                  try {
                    if (value == false) {
                      await updateAccountFcmToken((builder) {
                        return builder..vars.input.token = null;
                      });
                      client.value?.requestController.add(request);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text('通知をオフにしました'.i18n)),
                        );
                      return;
                    }
                    final messaging = FirebaseMessaging.instance;
                    await messaging.requestPermission(alert: true, sound: true);
                    final fcmToken =
                        await FirebaseMessaging.instance.getToken();
                    await updateAccountFcmToken((builder) {
                      return builder..vars.input.token = fcmToken;
                    });
                    client.value?.requestController.add(request);
                  } catch (exception, stackTrace) {
                    await Sentry.captureException(
                      exception,
                      stackTrace: stackTrace,
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text(toExceptionMessage(exception))),
                      );
                  }
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
