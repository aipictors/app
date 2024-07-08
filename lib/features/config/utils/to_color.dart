import 'package:flutter/material.dart';

Color? toColor(String? text) {
  if (text == 'blue') {
    return Colors.blue;
  }
  if (text == 'green') {
    return Colors.green;
  }
  if (text == 'red') {
    return Colors.red;
  }
  if (text == 'yellow') {
    return Colors.yellow;
  }
  if (text == 'purple') {
    return Colors.purple;
  }
  return null;
}
