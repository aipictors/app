import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 作品一覧の並べ方（端末ごとに保存。Web の一覧の表示切り替えと同じ考え方）
class GridLayout {
  static const _key = 'v2.gridSquare';

  /// true のとき、一覧の画像を正方形にそろえる（false は元の画像の比率で石垣状に並べる）
  static final square = ValueNotifier<bool>(false);

  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      square.value = prefs.getBool(_key) ?? false;
    } catch (_) {
      // 読めないときは元の比率のまま
    }
  }

  static Future<void> setSquare(bool value) async {
    square.value = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_key, value);
    } catch (_) {
      // 保存に失敗しても、この起動の間は切り替わったままにする
    }
  }

  static Future<void> toggle() => setSquare(!square.value);
}
