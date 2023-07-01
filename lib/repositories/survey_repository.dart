import 'package:aipictors/enums/survey_sex.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ローカルストレージ
class SurveyRepository {
  const SurveyRepository();

  static SharedPreferences? instance;

  static activate() async {
    instance = await SharedPreferences.getInstance();
  }

  /// 性別
  SurveySex get sex {
    final value = instance!.getString('survey_sex');
    if (value == SurveySex.female.value) {
      return SurveySex.female;
    }
    if (value == SurveySex.male.value) {
      return SurveySex.male;
    }
    return SurveySex.other;
  }

  Future updateSex(SurveySex? value) async {
    if (value == null) {
      await instance!.remove('survey_sex');
      return;
    }
    await instance!.setString('survey_sex', value.value);
  }
}
