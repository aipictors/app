import 'package:aipictors/default.i18n.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

Future<String> getDeviceInfo() async {
  final deviceInfo = switch (defaultTargetPlatform) {
    TargetPlatform.android =>
      getAndroidInfo(await DeviceInfoPlugin().androidInfo),
    TargetPlatform.iOS => getIosInfo(await DeviceInfoPlugin().iosInfo),
    _ => {
        'OS': 'Unsupported Platform',
        'version': 'Unknown',
        'model': 'Unknown'
      }
  };
  return 'OS:${deviceInfo['platform']} ${deviceInfo['version']}, ${'端末'.i18n}:${deviceInfo['model']}';
}

getAndroidInfo(AndroidDeviceInfo deviceInfo) {
  return {
    'platform': 'Android',
    'version': '${deviceInfo.version.release}, Build:${deviceInfo.id}',
    'model': deviceInfo.model,
  };
}

getIosInfo(IosDeviceInfo deviceInfo) {
  return {
    'platform': deviceInfo.systemName,
    'version': deviceInfo.systemVersion,
    'model': deviceInfo.utsname.machine
  };
}
