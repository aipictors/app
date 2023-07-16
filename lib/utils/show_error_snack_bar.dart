import 'package:aipictors/utils/to_exception_message.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, Object exception) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(toExceptionMessage(exception)),
    ),
  );
}
