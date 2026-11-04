import 'dart:io';

import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// 開発用（デバッグビルドだけ）。
/// --dart-define=debugLogin=<login>:<password> でログインし、
/// --dart-define=debugTab=<n> で最初のタブ、--dart-define=debugRoute=/works/1 で最初に開く画面を決める。
class DebugBoot {
  DebugBoot._();

  static const _login = String.fromEnvironment('debugLogin');
  /// シミュレーターでは Mac のファイル /tmp/aipictors-debug（1 行目: ルート、2 行目: 画面の中のタブ）で、
  /// 作り直さずに行き先を変えられる（iOS の Platform.environment は空）
  static final List<String> _file = () {
    if (!kDebugMode) return const <String>[];
    try {
      return File('/tmp/aipictors-debug').readAsLinesSync();
    } catch (_) {
      return const <String>[];
    }
  }();

  static String get route {
    if (!kDebugMode) return '';
    if (_file.isNotEmpty && _file.first.isNotEmpty) return _file.first;
    return const String.fromEnvironment('debugRoute');
  }

  static String? get screenTab => _file.length > 1 && _file[1].isNotEmpty ? _file[1] : null;

  static const _tab = String.fromEnvironment('debugTab');

  static bool get hasTab => kDebugMode && _tab.isNotEmpty;

  static bool get active => kDebugMode && (_login.isNotEmpty || _tab.isNotEmpty || route.isNotEmpty);

  static Future<void> run() async {
    if (!kDebugMode) return;
    if (_login.isNotEmpty || _tab.isNotEmpty || route.isNotEmpty) {
      await const ConfigRepository().setEulaCheck(true);
    }
    if (_tab.isNotEmpty) {
      await const ConfigRepository().setHomeTabIndex(int.tryParse(_tab) ?? 0);
    }
    if (_login == 'logout') {
      await FirebaseAuth.instance.signOut();
      return;
    }
    if (_login.isEmpty || FirebaseAuth.instance.currentUser != null) return;
    final i = _login.indexOf(':');
    if (i < 0) return;
    try {
      final data = await Api.mutate(r'mutation DebugLogin($input: LoginWithPasswordInput!) { loginWithPassword(input: $input) { token } }', variables: {
        'input': {'login': _login.substring(0, i), 'password': _login.substring(i + 1)},
      });
      final token = data.obj('loginWithPassword')?.strOrNull('token');
      if (token != null) await FirebaseAuth.instance.signInWithCustomToken(token);
    } catch (e) {
      // ignore: avoid_print
      print('[DebugBoot] login failed: $e');
    }
  }
}
