import 'package:flutter/widgets.dart';

// 言語コードをLocaleに変換する
Locale toLocale(String language) {
  if (language.startsWith('en')) {
    return const Locale('en');
  }

  if (language.startsWith('vi')) {
    return const Locale('vi');
  }

  if (language.startsWith('zh_tw')) {
    return const Locale('zh', 'tw');
  }

  if (language.startsWith('zh_cn')) {
    return const Locale('zh', 'cn');
  }

  return const Locale('ja');
}
