import 'package:aipictors/enums/survey_sex.dart';
import 'package:aipictors/enums/survey_touch_point.dart';
import 'package:aipictors/repositories/survey_repository.dart';
import 'package:aipictors/states/survey_state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'survey_provider.g.dart';

/// 設定
@riverpod
class Survey extends _$Survey {
  @override
  SurveyState build() {
    return _refetch();
  }

  SurveyState _refetch() {
    const repository = SurveyRepository();
    return SurveyState(
      sex: repository.sex,
      touchPoint: repository.touchPoint,
    );
  }

  void updateSex(SurveySex? value) async {
    FirebaseAnalytics.instance.setUserProperty(
      name: 'survey_sex',
      value: value?.value,
    );
    const SurveyRepository().updateSex(value);
    state = _refetch();
  }

  void updateTouchPoint(SurveyTouchPoint? value) async {
    FirebaseAnalytics.instance.setUserProperty(
      name: 'survey_touch_point',
      value: value?.value,
    );
    const SurveyRepository().updateTouchPoint(value);
    state = _refetch();
  }

  void reset() async {
    updateSex(null);
    updateTouchPoint(null);
  }
}
