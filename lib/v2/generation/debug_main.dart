// 生成画面だけを開く開発用の入口（リリースには含めない）
//
//   flutter build ios --simulator --debug \
//     --dart-define-from-file=dart_defines/production.json \
//     -t lib/v2/generation/debug_main.dart \
//     --dart-define=debugLogin=<login>:<password> \
//     --dart-define=debugTheme=dark \
//     --dart-define=genDebug=models
//
// debugLogin はこのファイルでしか読まない（ログイン情報はコミットしない）。
import 'package:aipictors/config.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/generation/generation_debug.dart';
import 'package:aipictors/v2/generation/generation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _debugLogin = String.fromEnvironment('debugLogin');
const _debugTheme = String.fromEnvironment('debugTheme');
const _genDebug = String.fromEnvironment('genDebug');
const _debugLogout = bool.fromEnvironment('debugLogout');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DefaultConfig.activate();
  await ConfigRepository.activate();

  if (_debugLogout) {
    await FirebaseAuth.instance.signOut();
  } else if (_debugLogin.contains(':') && FirebaseAuth.instance.currentUser == null) {
    final i = _debugLogin.indexOf(':');
    try {
      final data = await Api.mutate(
        r'mutation LoginWithPassword($input: LoginWithPasswordInput!) { loginWithPassword(input: $input) { token } }',
        variables: {
          'input': {'login': _debugLogin.substring(0, i), 'password': _debugLogin.substring(i + 1)},
        },
      );
      final token = data.obj('loginWithPassword')?.strOrNull('token');
      if (token != null) await FirebaseAuth.instance.signInWithCustomToken(token);
    } catch (e) {
      debugPrint('[debug_main] login failed: $e');
    }
  }

  GenDebug.action = _genDebug.isEmpty ? null : _genDebug;
  runApp(const _DebugApp());
}

class _DebugApp extends StatelessWidget {
  const _DebugApp();

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => Scaffold(
            body: const GenerationScreen(),
            bottomNavigationBar: NavigationBar(
              selectedIndex: 2,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home_outlined), label: 'ホーム'),
                NavigationDestination(icon: Icon(Icons.search_rounded), label: '探す'),
                NavigationDestination(icon: Icon(Icons.auto_awesome_rounded), label: '生成'),
                NavigationDestination(icon: Icon(Icons.notifications_none_rounded), label: 'お知らせ'),
                NavigationDestination(icon: Icon(Icons.person_outline_rounded), label: 'マイページ'),
              ],
            ),
          ),
        ),
        GoRoute(path: '/login', builder: (_, __) => const _Placeholder('ログイン')),
        GoRoute(path: '/plans', builder: (_, __) => const _Placeholder('プラン')),
      ],
    );
    ThemeData theme(Brightness b) => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0170C8), brightness: b),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme(Brightness.light),
      darkTheme: theme(Brightness.dark),
      themeMode: _debugTheme == 'dark' ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder(this.title);

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Text('$title（開発用の仮画面）')),
  );
}
