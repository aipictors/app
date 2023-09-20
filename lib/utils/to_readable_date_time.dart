import 'package:aipictors/default.i18n.dart';
import 'package:intl/intl.dart';

String toReadableDateTime(int time) {
  final dateFormat = DateFormat('yyyy年MM月dd日H時m分'.i18n);

  return dateFormat.format(
    DateTime.fromMillisecondsSinceEpoch(
      time * 1000,
    ),
  );
}
