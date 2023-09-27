import 'package:aipictors/default.i18n.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定・通知
class ConfigNotificationScreen extends HookConsumerWidget {
  const ConfigNotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知設定'.i18n),
      ),
      body: ListView(children: [
        ListTile(
          title: Text('通知を受け取る'.i18n),
          subtitle: Text('通知を受け取るかどうかを設定します。'.i18n),
          trailing: Switch(
            value: true,
            onChanged: (value) async {
              final messaging = FirebaseMessaging.instance;
              await messaging.requestPermission(alert: true, sound: true);
              final fcmToken = await FirebaseMessaging.instance.getToken();
              print(fcmToken);
            },
          ),
        ),
      ]),
    );
  }
}
