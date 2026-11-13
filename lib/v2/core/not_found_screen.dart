import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// 行き先がアプリに無いとき（古いリンク・通知・まだアプリに無い画面）に出す。
/// ここで RootScreen を返すと、すでに開いている RootScreen と key がぶつかって画面が壊れる
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.location});

  /// 開こうとした行き先（例: /novels）
  final String location;

  bool get _canOpenWeb => location.startsWith('/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StateView(
              icon: Icons.explore_off_rounded,
              title: 'このページはアプリにありません',
              message: 'アプリでまだ見られない画面です。ブラウザで開くか、ホームに戻ってください。',
              actionLabel: _canOpenWeb ? 'ブラウザで開く' : null,
              onAction: _canOpenWeb
                  ? () => launchUrl(
                        Uri.parse('https://www.aipictors.com$location'),
                        mode: LaunchMode.externalApplication,
                      )
                  : null,
            ),
            TextButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/');
                }
              },
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
