import 'package:aipictors/repositories/translation_repository.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

extension Localization on String {
  static final translations = TranslationRepository.read();

  /// 翻訳する
  /// https://pub.dev/packages/i18n_extension#strings-themselves-are-the-translation-keys
  String get i18n {
    try {
      return localize(this, translations);
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      return this;
    }
  }

  String get i18nEn {
    try {
      return localize(this, translations, locale: 'en');
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      return this;
    }
  }
}
