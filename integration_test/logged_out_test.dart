import 'package:aipictors/v2/core/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'support/harness.dart';

/// ログアウト状態で起動 → 5 タブ → ログイン画面 → 入力してログイン → ログアウト
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('logged out', (tester) async {
    final qa = Qa(tester);
    await qa.boot();
    // このテストのログインだけは本物を送る（審査用アカウント）
    Api.debugMutationHandler = null;

    await qa.step('起動して下のタブが出る', () async {
      await qa.waitFor(find.byType(NavigationBar), timeout: const Duration(seconds: 90));
      expect(FirebaseAuth.instance.currentUser, isNull);
      await qa.shot('out-home');
    }, timeout: const Duration(seconds: 120));

    for (final (i, name) in const [(0, 'ホーム'), (1, '探す'), (2, '生成'), (3, '通知'), (4, 'マイページ')]) {
      await qa.step('未ログイン: $nameタブ', () async {
        await qa.tab(i);
        await qa.idle(const Duration(seconds: 2));
        await qa.shot('out-tab-$i');
      });
    }

    await qa.step('未ログイン: 作品を開いて戻る', () async {
      await qa.tab(0);
      await qa.tapText('新着');
      final cards = find.byWidgetPredicate((w) => w.runtimeType.toString() == 'WorkCard');
      await qa.waitFor(cards);
      final before = qa.location;
      await qa.tap(cards);
      await qa.idle(const Duration(seconds: 3));
      expect(qa.location, contains('/works/'));
      await qa.shot('out-work');
      await qa.back();
      expect(qa.location, before);
    });

    await qa.step('ログイン画面: 入力欄と各ボタン', () async {
      await qa.open('/login', until: find.text('ログイン'));
      await qa.shot('out-login');
      expect(find.byType(TextField).evaluate().length + find.byType(TextFormField).evaluate().length, greaterThanOrEqualTo(2));
      expect(find.textContaining('Google'), findsWidgets);
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        expect(find.text('Appleでサインイン'), findsOneWidget);
      }
    });

    await qa.step('ログイン画面: 間違いはエラーのまま留まる', () async {
      final fields = find.byType(TextField);
      await tester.enterText(fields.at(0), 'qa-no-such-user');
      await tester.enterText(fields.at(1), 'wrong-password');
      await hideKeyboard(tester);
      await qa.idle();
      await tester.tap(find.widgetWithText(FilledButton, 'ログイン').first, warnIfMissed: false);
      await qa.idle(const Duration(seconds: 6));
      expect(FirebaseAuth.instance.currentUser, isNull);
      expect(qa.location, contains('/login'));
      await qa.shot('out-login-error');
    });

    await qa.step('ログイン画面: 正しい入力でログインできる', () async {
      final fields = find.byType(TextField);
      await tester.enterText(fields.at(0), const String.fromEnvironment('qaLogin'));
      await tester.enterText(fields.at(1), const String.fromEnvironment('qaPassword'));
      await hideKeyboard(tester);
      await qa.idle();
      await tester.tap(find.widgetWithText(FilledButton, 'ログイン').first, warnIfMissed: false);
      final end = DateTime.now().add(const Duration(seconds: 30));
      while (FirebaseAuth.instance.currentUser == null && DateTime.now().isBefore(end)) {
        await qa.idle(const Duration(milliseconds: 500));
      }
      expect(FirebaseAuth.instance.currentUser, isNotNull);
      await qa.idle(const Duration(seconds: 3));
      await qa.shot('out-after-login');
    }, timeout: const Duration(seconds: 60));

    await qa.step('ログアウト: 設定から', () async {
      await qa.goHome();
      await qa.tab(4);
      await qa.tap(find.byTooltip('設定'));
      await qa.scrollTapText('その他の設定・ヘルプ');
      await qa.scrollTo(find.text('ログアウト'));
      await qa.shot('out-settings-logout');
      await qa.tapText('ログアウト');
      // 確認のシートがあれば進める
      await qa.idle();
      final confirm = find.text('ログアウト').hitTestable();
      if (confirm.evaluate().isNotEmpty) await tester.tap(confirm.last, warnIfMissed: false);
      final end = DateTime.now().add(const Duration(seconds: 15));
      while (FirebaseAuth.instance.currentUser != null && DateTime.now().isBefore(end)) {
        await qa.idle(const Duration(milliseconds: 500));
      }
      expect(FirebaseAuth.instance.currentUser, isNull);
      await qa.idle(const Duration(seconds: 2));
      await qa.shot('out-after-logout');
    }, timeout: const Duration(seconds: 90));

    qa.finish();
    expect(qa.failures, isEmpty);
  }, timeout: const Timeout(Duration(minutes: 20)));
}
