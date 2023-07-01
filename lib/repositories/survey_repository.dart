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
    if (value == 'male') {
      return SurveySex.female;
    }
    if (value == 'female') {
      return SurveySex.female;
    }
    return SurveySex.other;
  }

  Future<void> updateSex(SurveySex value) async {
    await instance!.setString('survey_sex', value.toString());
  }
}
