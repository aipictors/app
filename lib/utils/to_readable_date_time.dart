import 'package:intl/intl.dart';

String toReadableDateTime(int time) {
  final dateFormat = DateFormat('yyyy年MM月dd日H時m分');

  return dateFormat.format(
    DateTime.fromMillisecondsSinceEpoch(
      time * 1000,
    ),
  );
}
