import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 作品一覧のいいね数を出すかどうか（端末ごとに保存。Web の「一覧のいいね数」と同じ設定）
class ListLikeCount {
  static const _key = 'v2.hideListLikeCounts';

  /// true のとき、一覧の ♡ と数を出さない。作品画面・ランキングは対象外
  static final hidden = ValueNotifier<bool>(false);

  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      hidden.value = prefs.getBool(_key) ?? false;
    } catch (_) {
      // 読めないときは表示のまま
    }
  }

  static Future<void> setHidden(bool value) async {
    hidden.value = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_key, value);
    } catch (_) {
      // 保存に失敗しても、この起動の間は切り替わったままにする
    }
  }
}
