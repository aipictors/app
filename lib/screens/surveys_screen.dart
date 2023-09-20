import 'dart:io';

import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/enums/survey_sex.dart';
import 'package:aipictors/enums/survey_touch_point.dart';
import 'package:aipictors/models/survey_radio_option.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/survey_provider.dart';
import 'package:aipictors/widgets/dialog/survey_reset_dialog.dart';
import 'package:aipictors/widgets/list_tile/survey_radio_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 調査協力
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
        title: Text('調査協力'.i18n),
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
              title: Text('性別はどれに該当しますか？'.i18n),
              children: [
                SurveyRadioListTile<SurveySex>(
                  groupValue: survey.sex,
                  options: [
                    SurveyRadioOption(
                        label: '女性'.i18n, value: SurveySex.female),
                    SurveyRadioOption(label: '男性'.i18n, value: SurveySex.male),
                    SurveyRadioOption(
                        label: 'それ以外'.i18n, value: SurveySex.other),
                  ],
                  onChanged: notifier.updateSex,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              initiallyExpanded: survey.touchPoint == null,
              title: Text('どこでアプリを知りましたか？'.i18n),
              children: [
                SurveyRadioListTile<SurveyTouchPoint>(
                  groupValue: survey.touchPoint,
                  options: [
                    SurveyRadioOption(
                      label: 'Twitter'.i18n,
                      value: SurveyTouchPoint.twitter,
                    ),
                    SurveyRadioOption(
                      label: 'Twitterの広告'.i18n,
                      value: SurveyTouchPoint.twitterAdvertisement,
                    ),
                    SurveyRadioOption(
                      label: '知人からの紹介'.i18n,
                      value: SurveyTouchPoint.friend,
                    ),
                    SurveyRadioOption(
                      label: 'Google検索'.i18n,
                      value: SurveyTouchPoint.googleSearch,
                    ),
                    if (Platform.isAndroid)
                      SurveyRadioOption(
                        label: 'Google Play Store'.i18n,
                        value: SurveyTouchPoint.googlePlayStore,
                      ),
                    if (Platform.isIOS)
                      SurveyRadioOption(
                        label: 'App Store'.i18n,
                        value: SurveyTouchPoint.appStore,
                      ),
                    SurveyRadioOption(
                      label: 'その他'.i18n,
                      value: SurveyTouchPoint.other,
                    ),
                  ],
                  onChanged: notifier.updateTouchPoint,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text('全ての回答をリセットする'.i18n),
              trailing: FilledButton.tonal(
                child: Text('リセット'.i18n),
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
