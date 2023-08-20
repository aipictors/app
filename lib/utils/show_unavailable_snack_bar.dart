import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';

void showUnavailableSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('この機能は使用できないみたい。'.i18n),
    ),
  );
}
