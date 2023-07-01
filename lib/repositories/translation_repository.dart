import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:i18n_extension/i18n_extension.dart';

class TranslationRepository {
  const TranslationRepository();

  // 翻訳データ
  static Translations translations = Translations('ja');

  static Future activate() async {
    final extensionText = await rootBundle.loadString('assets/i18n.json');
    final List<dynamic> jsonTranslations = jsonDecode(extensionText);
    for (final jsonTranslation in jsonTranslations) {
      translations += Map<String, String>.from(jsonTranslation);
    }
  }

  static Translations read() {
    return translations;
  }
}
