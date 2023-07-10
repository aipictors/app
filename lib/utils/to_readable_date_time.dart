import 'package:intl/intl.dart';

String toReadableDateTime(int time) {
  final dateFormat = DateFormat('yyyy年MM月dd時Hm分');

  return dateFormat.format(
    DateTime.fromMillisecondsSinceEpoch(
      time * 1000,
    ),
  );
}
