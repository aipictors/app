import 'package:flutter/material.dart';

@immutable
class SurveyRadioOption<T> {
  const SurveyRadioOption({
    required this.value,
    required this.label,
  });

  final T value;

  final String label;
}
