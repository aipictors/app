import 'package:aipictors/enums/survey_sex.dart';
import 'package:aipictors/enums/survey_touch_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_state.freezed.dart';

@freezed
class SurveyState with _$SurveyState {
  const SurveyState._();

  const factory SurveyState({
    required SurveySex? sex,
    required SurveyTouchPoint? touchPoint,
  }) = _SurveyState;
}
