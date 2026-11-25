import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 自分が通報したコメント（TikTok のように、通報したらその人の画面ではすぐ畳む。端末ごとに保存）
/// 運営の判断とは別で、「表示」を押せば見られる。Web の use-reported-comment と同じ動き
class ReportedComments {
  static const _key = 'v2.reportedCommentIds';
  static const _max = 300;

  static final ids = ValueNotifier<Set<String>>(<String>{});
  static bool _loaded = false;

  static Future<void> ensureLoaded() async {
    if (_loaded) return;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      ids.value = {...ids.value, ...?prefs.getStringList(_key)};
    } catch (_) {
      // 読めないときは今の起動で通報した分だけ畳む
    }
  }

  static Future<void> add(String commentId) async {
    final next = [commentId, ...ids.value.where((id) => id != commentId)].take(_max).toList();
    ids.value = next.toSet();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_key, next);
    } catch (_) {
      // 保存に失敗しても、この起動の間は畳んだままにする
    }
  }
}
