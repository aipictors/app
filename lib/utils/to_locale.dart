import 'package:flutter/widgets.dart';

/// 言語コードをLocaleに変換する
Locale toLocale(String code) {
  // 英語
  if (code.startsWith('en')) {
    return const Locale('en');
  }

  // ベトナム語
  if (code.startsWith('vi')) {
    return const Locale('vi');
  }

  // 簡体字
  if (code.startsWith('zh_tw')) {
    return const Locale('zh', 'tw');
  }

  // 繁体字
  if (code.startsWith('zh_cn')) {
    return const Locale('zh', 'cn');
  }

  // フランス語
  if (code.startsWith('fr')) {
    return const Locale('fr');
  }

  // イタリア語
  if (code.startsWith('it')) {
    return const Locale('it');
  }

  return const Locale('ja');
}
