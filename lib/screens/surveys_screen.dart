import 'dart:io';

import 'package:aipictors/enums/survey_sex.dart';
import 'package:aipictors/enums/survey_touch_point.dart';
import 'package:aipictors/models/survey_radio_option.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/survey_provider.dart';
import 'package:aipictors/widgets/dialog/survey_reset_dialog.dart';
import 'package:aipictors/widgets/list/survey_radio_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class SurveysScreen extends HookConsumerWidget {
  const SurveysScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final survey = ref.watch(surveyProvider);

    final notifier = ref.read(surveyProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('調査協力'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(config.messageAboutSurvey),
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              initiallyExpanded: survey.sex == null,
              title: const Text('性別はどれに該当しますか？'),
              children: [
                SurveyRadioListTile<SurveySex>(
                  groupValue: survey.sex,
                  options: const [
                    SurveyRadioOption(label: '女性', value: SurveySex.female),
                    SurveyRadioOption(label: '男性', value: SurveySex.male),
                    SurveyRadioOption(label: 'それ以外', value: SurveySex.other),
                  ],
                  onChanged: notifier.updateSex,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              initiallyExpanded: survey.touchPoint == null,
              title: const Text('どこでアプリを知りましたか？'),
              children: [
                SurveyRadioListTile<SurveyTouchPoint>(
                  groupValue: survey.touchPoint,
                  options: [
                    const SurveyRadioOption(
                      label: 'Twitter',
                      value: SurveyTouchPoint.twitter,
                    ),
                    const SurveyRadioOption(
                      label: 'Twitterの広告',
                      value: SurveyTouchPoint.twitterAdvertisement,
                    ),
                    const SurveyRadioOption(
                      label: '知人からの紹介',
                      value: SurveyTouchPoint.friend,
                    ),
                    const SurveyRadioOption(
                      label: 'Google検索',
                      value: SurveyTouchPoint.googleSearch,
                    ),
                    if (Platform.isAndroid)
                      const SurveyRadioOption(
                        label: 'Google Play Store',
                        value: SurveyTouchPoint.googlePlayStore,
                      ),
                    if (Platform.isIOS)
                      const SurveyRadioOption(
                        label: 'App Store',
                        value: SurveyTouchPoint.appStore,
                      ),
                    const SurveyRadioOption(
                      label: 'その他',
                      value: SurveyTouchPoint.other,
                    ),
                  ],
                  onChanged: notifier.updateTouchPoint,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('全ての回答をリセットする'),
              trailing: FilledButton.tonal(
                child: const Text('リセット'),
                onPressed: () {
                  onResetSurvey(context, ref);
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  onResetSurvey(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return SurveyResetDialog(
          onCancel: () {
            context.pop();
          },
          onAccept: () {
            context.pop();
            final notifier = ref.read(surveyProvider.notifier);
            notifier.reset();
          },
        );
      },
    );
  }
}
