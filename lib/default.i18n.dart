import 'package:aipictors/repositories/translation_repository.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  /// 翻訳する
  /// https://pub.dev/packages/i18n_extension#strings-themselves-are-the-translation-keys
  String get i18n {
    try {
      // 翻訳された文字列を検索する
      final text = localize(this, TranslationRepository.translations);
      // 空の場合は元の文字列を返す
      return text.isNotEmpty ? text : this;
    } catch (exception) {
      // Sentry.captureException(exception, stackTrace: stackTrace);
      return this;
    }
  }
}
