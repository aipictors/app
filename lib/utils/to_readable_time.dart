import 'package:aipictors/default.i18n.dart';
import 'package:intl/intl.dart';

String toReadableTime(int time) {
  final dateFormat = DateFormat('MM月dd日HH時mm分'.i18n);

  return dateFormat.format(
    DateTime.fromMillisecondsSinceEpoch(
      time * 1000,
    ),
  );
}
