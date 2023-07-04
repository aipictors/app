import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:i18n_extension/i18n_extension.dart';

/// 翻訳データを管理する
@immutable
class TranslationRepository {
  const TranslationRepository();

  /// 翻訳データ
  static var translations = Translations('ja');

  /// 初期化する
  static Future activate() async {
    final extensionText = await rootBundle.loadString('assets/i18n.json');
    final List jsonTranslations = jsonDecode(extensionText);
    for (final jsonTranslation in jsonTranslations) {
      translations += Map<String, String>.from(jsonTranslation);
    }
  }
}
