import 'package:aipictors/models/survey_radio_option.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SurveyRadioListTile<T> extends HookConsumerWidget {
  const SurveyRadioListTile({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.options,
  });

  final T? groupValue;

  final void Function(T?) onChanged;

  final List<SurveyRadioOption<T>> options;

  @override
  Widget build(context, ref) {
    return Column(children: [
      for (final option in options)
        RadioListTile<T>(
          title: Text(option.label),
          value: option.value,
          groupValue: groupValue,
          onChanged: (value) {
            onChanged(value);
          },
        ),
    ]);
  }
}
