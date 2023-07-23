import 'package:intl/intl.dart';

String toReadableDate(int time) {
  final dateFormat = DateFormat('yyyy年MM月dd日');

  return dateFormat.format(
    DateTime.fromMillisecondsSinceEpoch(
      time * 1000,
    ),
  );
}
