import 'package:intl/intl.dart';

String toReadableNumber(int n) {
  final formatter = NumberFormat('#,###.0');
  return formatter.format(n);
}
