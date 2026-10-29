// 探す・検索・タグ・ランキング・ユーザーの画面だけを動かす開発用の入口。
//
// flutter build ios --simulator --debug -t lib/v2/explore/debug_main.dart \
//   --dart-define-from-file=dart_defines/production.json \
//   --dart-define=debugPage=explore|search:<text>|tag:<name>|ranking|user:<id>|followers:<id> \
//   [--dart-define=debugTheme=dark] [--dart-define=debugLogin=<login>:<password>]
import 'dart:io';

import 'package:aipictors/config.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/repositories/hive_repository.dart';
import 'package:aipictors/utils/extend_theme.dart';
import 'package:aipictors/utils/to_dark_color_scheme.dart';
import 'package:aipictors/utils/to_light_color_scheme.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/explore/explore_screen.dart';
import 'package:aipictors/v2/user/user_list_screen.dart';
import 'package:aipictors/v2/user/user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

// シミュレーターではアプリの tmp/explore_debug.txt（page=... / theme=... / login=... の行）でも切り替えられる。
// ビルドし直さなくてよい（ファイルは起動時に読んで消す）
final Map<String, String> _file = _readDebugFile();
final _page = _file['page'] ?? const String.fromEnvironment('debugPage', defaultValue: 'explore');
final _theme = _file['theme'] ?? const String.fromEnvironment('debugTheme', defaultValue: 'system');
final _login = _file['login'] ?? const String.fromEnvironment('debugLogin');

Map<String, String> _readDebugFile() {
  try {
    final f = File('${Directory.systemTemp.path}/explore_debug.txt');
    if (!f.existsSync()) return const {};
    final out = <String, String>{};
    for (final line in f.readAsLinesSync()) {
      final i = line.indexOf('=');
      if (i > 0) out[line.substring(0, i).trim()] = line.substring(i + 1).trim();
    }
    f.deleteSync();
    return out;
  } catch (_) {
    return const {};
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('[debug] page=$_page theme=$_theme login=${_login.isNotEmpty} tmp=${Directory.systemTemp.path}');
  await Firebase.initializeApp();
  await DefaultConfig.activate();
  await ConfigRepository.activate();
  await HiveRepository.activate();
  await _signIn();
  runApp(const _DebugApp());
}

Future<void> _signIn() async {
  final auth = FirebaseAuth.instance;
  if (_login.isEmpty) {
    if (auth.currentUser != null) await auth.signOut();
    return;
  }
  final i = _login.indexOf(':');
  if (i < 0) return;
  try {
    final data = await Api.mutate(r'''
mutation LoginWithPassword($input: LoginWithPasswordInput!) {
  loginWithPassword(input: $input) {
    token
  }
}''', variables: {
      'input': {'login': _login.substring(0, i), 'password': _login.substring(i + 1)},
    });
    final token = data.obj('loginWithPassword')?.strOrNull('token');
    if (token != null) await auth.signInWithCustomToken(token);
  } catch (e) {
    debugPrint('[debug] login failed: $e');
  }
}

String _initialLocation() {
  final i = _page.indexOf(':');
  final kind = i < 0 ? _page : _page.substring(0, i);
  final arg = i < 0 ? '' : Uri.encodeComponent(_page.substring(i + 1));
  switch (kind) {
    case 'search':
      return '/search/$arg';
    case 'tag':
      return '/tags/$arg';
    case 'ranking':
      return '/rankings';
    case 'user':
      return '/users/$arg';
    case 'followers':
      return '/debug/followers/$arg';
    default:
      return '/';
  }
}

final _router = GoRouter(
  initialLocation: _initialLocation(),
  routes: [
    GoRoute(path: '/', builder: (_, __) => const ExploreScreen()),
    GoRoute(path: '/search/:text', builder: (_, s) => SearchResultScreen(text: s.pathParameters['text'] ?? '')),
    GoRoute(path: '/tags/:tag', builder: (_, s) => TagScreen(name: s.pathParameters['tag'] ?? '')),
    GoRoute(path: '/rankings', builder: (_, __) => const RankingScreen()),
    GoRoute(path: '/users/:user', builder: (_, s) => UserScreen(userId: s.pathParameters['user'] ?? '')),
    GoRoute(path: '/debug/followers/:user', builder: (_, s) => UserListScreen(userId: s.pathParameters['user'] ?? '', name: 'フォロー一覧')),
    GoRoute(path: '/works/:id', builder: (_, s) => _Placeholder('作品 ${s.pathParameters['id']}')),
    GoRoute(path: '/login', builder: (_, __) => const _Placeholder('ログイン')),
    GoRoute(path: '/config/profile', builder: (_, __) => const _Placeholder('プロフィール編集')),
  ],
  errorBuilder: (_, s) => _Placeholder(s.uri.toString()),
);

class _DebugApp extends StatelessWidget {
  const _DebugApp();

  @override
  Widget build(BuildContext context) {
    final light = ThemeData(
      useMaterial3: true,
      colorScheme: toLightColorScheme(defaultThemeColor: DefaultConfig.defaultThemeColor, themeColor: null, lightDynamic: null),
    );
    final dark = ThemeData(
      useMaterial3: true,
      colorScheme: toDarkColorScheme(defaultThemeColor: DefaultConfig.defaultThemeColor, themeColor: null, darkDynamic: null),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Aipictors (explore debug)',
      theme: extendThemeData(light),
      darkTheme: extendThemeData(dark),
      themeMode: _theme == 'dark' ? ThemeMode.dark : (_theme == 'light' ? ThemeMode.light : ThemeMode.system),
      locale: const Locale('ja'),
      supportedLocales: const [Locale('ja'), Locale('en')],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routerConfig: _router,
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder(this.label);

  final String label;

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(label)), body: Center(child: Text(label)));
}
