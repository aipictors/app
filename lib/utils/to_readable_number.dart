import 'package:intl/intl.dart';

String toReadableNumber(int n) {
  if (n < 1000) {
    return n.toString();
  }
  final formatter = NumberFormat('#,###');
  return formatter.format(n);
}
