import 'package:flutter/widgets.dart';

/// 言語コードをLocaleに変換する
Locale toLocale(String code) {
  if (code.startsWith('en')) {
    return const Locale('en');
  }

  if (code.startsWith('vi')) {
    return const Locale('vi');
  }

  if (code.startsWith('zh_tw')) {
    return const Locale('zh', 'tw');
  }

  if (code.startsWith('zh_cn')) {
    return const Locale('zh', 'cn');
  }

  return const Locale('ja');
}
