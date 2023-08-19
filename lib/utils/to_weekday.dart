import 'package:aipictors/repositories/config_repository.dart';

String toWeekday(int year, int month, int day) {
  final language = const ConfigRepository().language;
  List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];
  if (language == 'en') {
    weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  }
  final dateTime = DateTime(
    year,
    month,
    day,
  );
  final weekdayIndex = dateTime.weekday;
  return weekdays[weekdayIndex - 1];
}
