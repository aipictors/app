import 'dart:async';
import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// アプリの通知の種類ごとのオン・オフ（サーバーの push_preferences。行が無ければ全部オン）
class PushPrefs {
  const PushPrefs({this.generation = true, this.ranking = true, this.digest = true});

  /// 生成が終わったとき
  final bool generation;

  /// 作品がランキングに入ったとき（1 日 1 通まで）
  final bool ranking;

  /// 1 週間の反応のまとめ（日曜の夜・週 1 通）
  final bool digest;

  factory PushPrefs.fromJson(Map json) => PushPrefs(
    generation: json['generation'] != false,
    ranking: json['ranking'] != false,
    digest: json['digest'] != false,
  );
}

/// Push 通知の登録と設定。トークンはサーバーの user_profiles.fcm_token（最後に登録した端末 1 つ）
class Push {
  Push._();

  static const _base = 'https://www.aipictors.com';
  static const _enabledKey = 'push.enabled';
  static const _tokenKey = 'push.token';
  static const _askedAtKey = 'push.generationAskedAt';
  static const _askedCountKey = 'push.generationAskedCount';

  static StreamSubscription<String>? _refresh;

  static Future<Map<String, String>> _headers() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token == null) throw const ApiException('ログインしてください');
    return {'authorization': 'Bearer $token', 'content-type': 'application/json'};
  }

  static Future<PushPrefs> prefs() async {
    final res = await http.get(Uri.parse('$_base/api/push-preferences'), headers: await _headers()).timeout(const Duration(seconds: 15));
    final data = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode != 200 || data is! Map || data['data'] is! Map) throw ApiException(tr('通知の設定を読めませんでした', 'Could not load notification settings'));
    return PushPrefs.fromJson(data['data'] as Map);
  }

  /// 渡した項目だけ変える
  static Future<PushPrefs> savePrefs({bool? generation, bool? ranking, bool? digest}) async {
    final res = await http
        .post(
          Uri.parse('$_base/api/push-preferences'),
          headers: await _headers(),
          body: jsonEncode({'generation': ?generation, 'ranking': ?ranking, 'digest': ?digest}),
        )
        .timeout(const Duration(seconds: 15));
    final data = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode != 200 || data is! Map || data['data'] is! Map) throw ApiException(tr('通知の設定を保存できませんでした', 'Could not save notification settings'));
    return PushPrefs.fromJson(data['data'] as Map);
  }

  /// この端末で通知を受け取る設定にしてある（端末の許可もある）
  static Future<bool> isEnabled() async {
    if (FirebaseAuth.instance.currentUser == null) return false;
    final local = (await SharedPreferences.getInstance()).getBool(_enabledKey) ?? false;
    if (!local) return false;
    final settings = await FirebaseMessaging.instance.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized || settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  /// 端末の許可をもらってトークンを登録する。許可されなかったら false
  static Future<bool> enable() async {
    final messaging = FirebaseMessaging.instance;
    final permission = await messaging.requestPermission(alert: true, sound: true, badge: true);
    if (permission.authorizationStatus == AuthorizationStatus.denied) return false;
    final token = await messaging.getToken();
    if (token == null) throw ApiException(tr('Push通知の登録に失敗しました', 'Could not register for push notifications'));
    await SettingsApi.updateFcmToken(token);
    final store = await SharedPreferences.getInstance();
    await store.setBool(_enabledKey, true);
    await store.setString(_tokenKey, token);
    // 週のまとめはアプリで登録した人だけに送るので、行を作っておく（中身は今のまま）
    unawaited(savePrefs().then((_) {}, onError: (_) {}));
    _listenRefresh();
    return true;
  }

  static Future<void> disable() async {
    await SettingsApi.updateFcmToken(null);
    final store = await SharedPreferences.getInstance();
    await store.setBool(_enabledKey, false);
    await store.remove(_tokenKey);
  }

  /// サーバーにトークンがあるのに、この端末では一度もオンにしていない（前の版のアプリでオンにした人）
  static Future<void> adoptServerState(bool serverHasToken) async {
    final store = await SharedPreferences.getInstance();
    if (serverHasToken && store.getBool(_enabledKey) == null) await store.setBool(_enabledKey, true);
  }

  /// 起動したとき: オンにしてある端末はトークンが変わっていれば登録し直す（FCM のトークンは入れ替わることがある）
  static Future<void> syncOnLaunch() async {
    try {
      final store = await SharedPreferences.getInstance();
      if (store.getBool(_enabledKey) == null && FirebaseAuth.instance.currentUser != null) {
        // 前の版のアプリで「Push通知を受け取る」をオンにした人は、サーバーにトークンがある
        final data = await Api.query(r'query AppPushTokenState { viewer { id user { id fcmToken } } }');
        await store.setBool(_enabledKey, data.obj('viewer')?.obj('user')?.strOrNull('fcmToken') != null);
      }
      if (!await isEnabled()) return;
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null && token != store.getString(_tokenKey)) {
        await SettingsApi.updateFcmToken(token);
        await store.setString(_tokenKey, token);
      }
      _listenRefresh();
    } catch (_) {
      // 次に開いたときにやり直す
    }
  }

  static void _listenRefresh() {
    _refresh ??= FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
      try {
        if (!await isEnabled()) return;
        await SettingsApi.updateFcmToken(token);
        (await SharedPreferences.getInstance()).setString(_tokenKey, token);
      } catch (_) {}
    });
  }

  /// 生成をはじめたとき、通知がオフなら「終わったら知らせる」を一度だけ提案する（断られたら 2 週間あけて、3 回まで）
  static Future<void> offerAfterGeneration(BuildContext context) async {
    try {
      if (await isEnabled()) return;
      final store = await SharedPreferences.getInstance();
      final count = store.getInt(_askedCountKey) ?? 0;
      final askedAt = store.getInt(_askedAtKey) ?? 0;
      if (count >= 3 || DateTime.now().millisecondsSinceEpoch - askedAt < const Duration(days: 14).inMilliseconds) return;
      await store.setInt(_askedCountKey, count + 1);
      await store.setInt(_askedAtKey, DateTime.now().millisecondsSinceEpoch);
      if (!context.mounted) return;
      final ok = await showModalBottomSheet<bool>(
        context: context,
        showDragHandle: true,
        backgroundColor: context.surfaceCard,
        builder: (_) => const _GenerationPushOffer(),
      );
      if (ok != true || !context.mounted) return;
      await enableWithFeedback(context);
    } catch (_) {
      // 提案は出せなくても生成には関係ない
    }
  }

  /// オンにして結果を画面に出す。許可されなかったときは端末の設定へ案内する
  static Future<bool> enableWithFeedback(BuildContext context) async {
    try {
      final ok = await enable();
      if (!context.mounted) return ok;
      context.toast(
        ok ? tr('通知をオンにしました', 'Notifications turned on') : tr('端末の設定で Aipictors の通知を許可してください', 'Allow notifications for Aipictors in your device settings'),
        error: !ok,
      );
      return ok;
    } on ApiException catch (e) {
      if (context.mounted) context.toast(e.message, error: true);
      return false;
    }
  }
}

/// 生成をはじめたときの提案（アプリを閉じても生成は続く・終わったら知らせる）
class _GenerationPushOffer extends StatelessWidget {
  const _GenerationPushOffer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s16),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(gradient: Ds.brandGradient, shape: BoxShape.circle),
              child: const Icon(Icons.notifications_active_rounded, color: Colors.white, size: 32),
            ),
          ),
          const SizedBox(height: Ds.s16),
          Text(
            tr('生成が終わったら通知でお知らせします', 'Get notified when your images are ready'),
            textAlign: TextAlign.center,
            style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: Ds.s8),
          Text(
            tr(
              'アプリを閉じても生成は続きます。できあがったら通知でお知らせするので、待たずにほかのことをしていて大丈夫です。',
              'Generation keeps running even if you close the app. We will let you know when your images are ready.',
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: context.muted, height: 1.5),
          ),
          const SizedBox(height: Ds.s8),
          Text(
            tr('ランキング入りや 1 週間の反応のまとめもお届けします（設定でいつでも変えられます）', 'We also send ranking news and a weekly summary (you can change this anytime in settings).'),
            textAlign: TextAlign.center,
            style: TextStyle(color: context.muted, fontSize: 12),
          ),
          const SizedBox(height: Ds.s20),
          GradientButton(label: tr('通知を受け取る', 'Turn on notifications'), onPressed: () => Navigator.pop(context, true)),
          const SizedBox(height: Ds.s8),
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(tr('あとで', 'Not now'))),
        ]),
      ),
    );
  }
}
