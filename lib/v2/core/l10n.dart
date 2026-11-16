import 'dart:io';

import 'package:aipictors/repositories/config_repository.dart';
import 'package:intl/intl.dart';

/// 表示の言語。日本語のほかは英語で出す（Web の t(ja, en) と同じ考え方）。
/// 決め方: アプリの言語設定（旧設定画面の config_language）→ 端末の言語。テストは日本語
class L10n {
  L10n._();

  /// テスト・開発用に言語を決め打ちする（'ja' / 'en'）
  static String? override;

  static bool? _cached;

  static bool get isJa {
    final o = override;
    if (o != null) return o == 'ja';
    return _cached ??= _detect();
  }

  static bool _detect() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return true;
    final saved = ConfigRepository.instance?.getString('config_language');
    if (saved != null && saved.isNotEmpty) return saved.startsWith('ja');
    return Platform.localeName.toLowerCase().startsWith('ja');
  }
}

/// 日本語と英語のどちらかを返す
String tr(String ja, String en) => L10n.isJa ? ja : en;

String _digits(num v) => v.floor().abs().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');

/// 金額（円）。日本語「1,000円」、英語「¥1,000」
String formatYenL10n(num v) {
  final sign = v < 0 ? '-' : '';
  return L10n.isJa ? '$sign${_digits(v)}円' : '$sign¥${_digits(v)}';
}

/// 数（3 桁区切り）
String formatCount(num v) => '${v < 0 ? '-' : ''}${_digits(v)}';

/// 日付（秒）。日本時間で、日本語「2026/11/25」、英語「Nov 25, 2026」
String formatDateL10n(Object? sec) {
  if (sec is! num || sec == 0) return '-';
  final d = DateTime.fromMillisecondsSinceEpoch(sec.toInt() * 1000, isUtc: true).add(const Duration(hours: 9));
  return L10n.isJa ? '${d.year}/${d.month}/${d.day}' : DateFormat.yMMMd('en_US').format(d);
}
