import 'package:aipictors/repositories/translation_repository.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

extension Localization on String {
  /// 翻訳する
  /// https://pub.dev/packages/i18n_extension#strings-themselves-are-the-translation-keys
  String get i18n {
    try {
      final text = localize(this, TranslationRepository.translations);
      return text.isNotEmpty ? text : this;
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      return this;
    }
  }
}
