import 'package:aipictors/enums/survey_sex.dart';
import 'package:aipictors/enums/survey_touch_point.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ローカルストレージ
class SurveyRepository {
  const SurveyRepository();

  static SharedPreferences? instance;

  static activate() async {
    instance = await SharedPreferences.getInstance();
  }

  /// 性別
  SurveySex? get sex {
    final value = instance!.getString('survey_sex');
    if (value == null) {
      return null;
    }
    return SurveySex.fromText(value);
  }

  Future updateSex(SurveySex? value) async {
    if (value == null) {
      await instance!.remove('survey_sex');
      return;
    }
    await instance!.setString('survey_sex', value.value);
  }

  /// タッチポイント
  SurveyTouchPoint? get touchPoint {
    final value = instance!.getString('survey_touch_point');
    if (value == null) {
      return null;
    }
    return SurveyTouchPoint.fromText(value);
  }

  Future updateTouchPoint(SurveyTouchPoint? value) async {
    if (value == null) {
      await instance!.remove('survey_touch_point');
      return;
    }
    await instance!.setString('survey_touch_point', value.value);
  }
}
