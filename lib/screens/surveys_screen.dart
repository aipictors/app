import 'package:aipictors/enums/survey_sex.dart';
import 'package:aipictors/providers/survey_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SurveysScreen extends HookConsumerWidget {
  const SurveysScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final survey = ref.watch(surveyProvider);

    final notifier = ref.read(surveyProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('アンケート'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('あなたの性別を教えてください'),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text('女性'),
                          Radio<SurveySex>(
                            value: SurveySex.female,
                            groupValue: survey.sex,
                            onChanged: (value) {
                              notifier.updateSex(value);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          const Text('男性'),
                          Radio<SurveySex>(
                            value: SurveySex.male,
                            groupValue: survey.sex,
                            onChanged: (value) {
                              notifier.updateSex(value);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          const Text('それ以外'),
                          Radio<SurveySex>(
                            value: SurveySex.other,
                            groupValue: survey.sex,
                            onChanged: (value) {
                              notifier.updateSex(value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
