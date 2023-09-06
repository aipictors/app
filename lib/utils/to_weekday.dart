import 'package:aipictors/repositories/config_repository.dart';

/// 週に変換する
String toWeekday(int year, int month, int day) {
  final language = const ConfigRepository().language;

  List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];

  if (language == 'en') {
    weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  }

  if (language == 'vi') {
    weekdays = [
      'Thứ 2',
      'Thứ 3',
      'Thứ 4',
      'Thứ 5',
      'Thứ 6',
      'Thứ 7',
      'Chủ nhật'
    ];
  }

  if (language == 'zh_cn') {
    weekdays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
  }

  if (language == 'zh_tw') {
    weekdays = ['週一', '週二', '週三', '週四', '週五', '週六', '週日'];
  }

  if (language == 'fr') {
    weekdays = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
  }

  if (language == 'it') {
    weekdays = ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'];
  }

  final dateTime = DateTime(
    year,
    month,
    day,
  );

  final weekdayIndex = dateTime.weekday;

  return weekdays[weekdayIndex - 1];
}
