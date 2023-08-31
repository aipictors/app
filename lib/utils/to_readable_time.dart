import 'package:intl/intl.dart';

String toReadableTime(int time) {
  final dateFormat = DateFormat('MM月dd日H時m分');

  return dateFormat.format(
    DateTime.fromMillisecondsSinceEpoch(
      time * 1000,
    ),
  );
}
