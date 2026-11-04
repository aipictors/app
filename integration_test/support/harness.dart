import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:aipictors/main.dart' as app;
import 'package:aipictors/router.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

/// 実機に近い形で画面を押して回るための道具。
/// 1 回の起動で順に確かめ、途中で失敗しても最後まで進める（結果は `[QA]` の行に出す）
class Qa {
  Qa(this.tester);

  final WidgetTester tester;
  final failures = <String>[];
  final passes = <String>[];
  final mutations = <String>[];
  final _errors = <String>[];
  FlutterExceptionHandler? _savedOnError;

  /// run.sh がこの行を見てスクリーンショットを撮る
  Future<void> shot(String name) async {
    // ignore: avoid_print
    print('[QA] SHOT $name');
    _scanWords(name);
    await idle(const Duration(milliseconds: 1500));
  }

  /// 審査で問題になる言葉が画面にないか（内容はサーバーのものもあるので失敗にはせず記録する）
  void _scanWords(String where) {
    for (final word in const ['Stripe', 'クレジットカード', 'R18', 'R-18', 'Web で購入', 'ブラウザで購入', 'Web版で購入']) {
      if (find.textContaining(word, findRichText: true).evaluate().isNotEmpty) {
        // ignore: avoid_print
        print('[QA] WORD $where: $word');
      }
    }
  }

  /// 実機の戻るキーを押してもらう（Android だけ。run.sh が adb で送る）
  Future<void> hardwareBack() async {
    // ignore: avoid_print
    print('[QA] KEY back');
    await idle(const Duration(seconds: 3));
  }

  Future<void> boot() async {
    _savedOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      final text = details.exceptionAsString();
      // 画像の読み込み失敗は通信の話なので数えない
      if (text.contains('NetworkImageLoadException') || text.contains('HttpException') || text.contains('Connection')) return;
      _errors.add(text.split('\n').take(3).join(' / '));
      // ignore: avoid_print
      print('[QA] FLUTTER-ERROR ${text.split('\n').first}');
    };
    runZonedGuarded(() {
      app.main();
    }, (error, stack) {
      final text = '$error';
      if (text.contains('SocketException') || text.contains('NetworkImageLoadException') || text.contains('ClientException')) return;
      _errors.add('async: ${text.split('\n').first}');
      // ignore: avoid_print
      print('[QA] ASYNC-ERROR ${text.split('\n').first} @ ${stack.toString().split('\n').where((l) => l.contains('package:aipictors')).take(2).join(' | ')}');
    });
    // 起動時の処理（DebugBoot のログイン）は本物を通し、タブが出てから止める
    await waitFor(find.byType(NavigationBar), timeout: const Duration(seconds: 120));
    protectMutations();
  }

  /// 本番を変えないように mutation は記録するだけ
  void protectMutations() {
    Api.debugMutationHandler = (document, variables) async {
      final name = RegExp(r'mutation\s+(\w+)').firstMatch(document)?.group(1) ?? document;
      mutations.add(name);
      // ignore: avoid_print
      print('[QA] MUTATION(mock) $name');
      return mutationResult(name, variables);
    };
  }

  /// mutation の結果。既定は空（読む画面はエラーの扱いになる）
  Map<String, dynamic> Function(String name, Map<String, dynamic>? variables) mutationResult = (_, __) => const {};

  void finish() {
    Api.debugMutationHandler = null;
    FlutterError.onError = _savedOnError;
    // ignore: avoid_print
    print('[QA] RESULT pass=${passes.length} fail=${failures.length}');
    for (final f in failures) {
      // ignore: avoid_print
      print('[QA] FAILED $f');
    }
  }

  /// 1 つの確認。例外と画面のエラーを失敗として記録して次へ進む
  Future<void> step(String name, Future<void> Function() body, {Duration timeout = const Duration(seconds: 120)}) async {
    _errors.clear();
    String? failure;
    try {
      await body().timeout(timeout);
    } catch (e) {
      failure = e.toString().split('\n').take(4).join(' ').replaceAll(RegExp(r'\s+'), ' ');
    }
    await idle(const Duration(milliseconds: 300));
    if (find.byType(ErrorWidget).evaluate().isNotEmpty) failure ??= '赤い画面（ErrorWidget）';
    if (_errors.isNotEmpty) failure ??= _errors.first;
    if (failure == null) {
      passes.add(name);
      // ignore: avoid_print
      print('[QA] PASS $name');
    } else {
      final short = failure.length > 240 ? failure.substring(0, 240) : failure;
      failures.add('$name: $short');
      // ignore: avoid_print
      print('[QA] FAIL $name: $short');
      await shot('fail-${failures.length}');
    }
  }

  /// pumpAndSettle は読み込みの動きで終わらないので時間で進める
  Future<void> idle([Duration duration = const Duration(milliseconds: 600)]) async {
    final end = DateTime.now().add(duration);
    while (DateTime.now().isBefore(end)) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> waitFor(Finder finder, {Duration timeout = const Duration(seconds: 30), String? why}) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump(const Duration(milliseconds: 150));
      if (finder.evaluate().isNotEmpty) return;
    }
    throw TestFailure('見つからない: ${why ?? finder.describeMatch(Plurality.many)}');
  }

  Future<void> waitGone(Finder finder, {Duration timeout = const Duration(seconds: 20)}) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump(const Duration(milliseconds: 150));
      if (finder.evaluate().isEmpty) return;
    }
    throw TestFailure('消えない: ${finder.describeMatch(Plurality.many)}');
  }

  /// 実際のポインターイベントで押す
  Future<void> tap(Finder finder, {String? why}) async {
    await waitFor(finder, why: why);
    final target = finder.first;
    await tester.ensureVisible(target);
    await idle(const Duration(milliseconds: 250));
    await tester.tap(target, warnIfMissed: false);
    await idle();
  }

  Future<void> tapText(String text) => tap(find.text(text), why: text);

  Finder navTab(int index) => find.descendant(of: find.byType(NavigationBar), matching: find.byType(NavigationDestination)).at(index);

  Future<void> tab(int index) async {
    await waitFor(find.byType(NavigationBar));
    await tester.tap(navTab(index));
    await idle(const Duration(seconds: 1));
  }

  /// スクロールして探す
  Future<void> scrollTo(Finder finder, {int maxDrags = 25, double delta = 400}) async {
    for (var i = 0; i < maxDrags; i++) {
      await tester.pump(const Duration(milliseconds: 120));
      if (finder.evaluate().isNotEmpty) {
        await tester.ensureVisible(finder.first);
        await idle(const Duration(milliseconds: 250));
        return;
      }
      final scrollables = find.byWidgetPredicate((w) => w is Scrollable && w.axisDirection == AxisDirection.down).hitTestable();
      if (scrollables.evaluate().isEmpty) break;
      await tester.drag(scrollables.first, Offset(0, -delta), warnIfMissed: false);
      await idle(const Duration(milliseconds: 350));
    }
    await waitFor(finder, timeout: const Duration(seconds: 3));
  }

  Future<void> scrollTapText(String text) async {
    await scrollTo(find.text(text));
    await tap(find.text(text));
  }

  /// いま一番上にある画面のパス（push した画面も含む）
  /// 横にスクロールするタブを、見えるところまで動かして押す
  Future<void> tapPill(String label, {bool leftward = false}) async {
    final pill = find.textContaining(label);
    for (var i = 0; i < 10 && pill.hitTestable().evaluate().isEmpty; i++) {
      final horizontal = find.byWidgetPredicate((w) => w is Scrollable && w.axisDirection == AxisDirection.right).hitTestable();
      await tester.drag(horizontal.first, Offset(leftward ? 220 : -220, 0), warnIfMissed: false);
      await idle(const Duration(milliseconds: 400));
    }
    await tester.tap(pill.hitTestable().first, warnIfMissed: false);
    await idle();
  }

  String get location {
    final config = routerConfig.routerDelegate.currentConfiguration;
    final last = config.matches.isEmpty ? null : config.last;
    return last is ImperativeRouteMatch ? last.matches.uri.toString() : config.uri.toString();
  }

  /// ルートを積んで表示まで待つ（中身のボタンは実際に押す）
  Future<void> open(String route, {Finder? until, Duration wait = const Duration(seconds: 3)}) async {
    unawaited(routerConfig.push(route));
    await idle(wait);
    if (until != null) await waitFor(until);
    expectNoError(route);
  }

  /// 読み込みに失敗した画面（StateView.error）がないか
  void expectNoError(String where) {
    final retry = find.text('再読み込み');
    if (retry.evaluate().isNotEmpty) throw TestFailure('$where: 読み込みエラーの表示');
  }

  /// AppBar の戻るを押す。無ければルーターで戻す
  Future<void> back() async {
    final button = find.byType(BackButton).hitTestable();
    final close = find.byType(CloseButton).hitTestable();
    if (button.evaluate().isNotEmpty) {
      await tester.tap(button.last, warnIfMissed: false);
    } else if (close.evaluate().isNotEmpty) {
      await tester.tap(close.last, warnIfMissed: false);
    } else {
      routerConfig.pop();
    }
    await idle(const Duration(milliseconds: 800));
  }

  /// OS の戻る操作と同じ経路（popRoute）
  Future<void> systemBack() async {
    await tester.binding.handlePopRoute();
    await idle(const Duration(milliseconds: 800));
  }

  /// シート・ダイアログをメニューの外で閉じる
  Future<void> dismissSheet() async {
    final navigator = tester.state<NavigatorState>(find.byType(Navigator).last);
    navigator.pop();
    await idle(const Duration(milliseconds: 500));
  }

  /// ルートの積み上げをホームまで戻す
  Future<void> goHome() async {
    routerConfig.go('/');
    await idle(const Duration(seconds: 1));
  }
}

/// 写真ピッカーの代わり。[pending] の画像を選んだことにする
class FakeImagePicker extends ImagePickerPlatform {
  List<Uint8List> pending = [];
  int calls = 0;

  List<XFile> _take() {
    calls++;
    final files = [for (var i = 0; i < pending.length; i++) XFile.fromData(pending[i], name: 'qa$i.png', mimeType: 'image/png', length: pending[i].length)];
    return files;
  }

  @override
  Future<List<XFile>> getMultiImageWithOptions({MultiImagePickerOptions options = const MultiImagePickerOptions()}) async => _take();

  @override
  Future<XFile?> getImageFromSource({required ImageSource source, ImagePickerOptions options = const ImagePickerOptions()}) async {
    final files = _take();
    return files.isEmpty ? null : files.first;
  }
}

/// テスト用の画像（PNG）
Future<Uint8List> syntheticPng(int width, int height, Color color) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.drawRect(Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()), Paint()..color = color);
  canvas.drawCircle(Offset(width / 2, height / 2), width / 4, Paint()..color = Colors.white);
  final image = await recorder.endRecording().toImage(width, height);
  final png = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return png!.buffer.asUint8List();
}

bool get isAndroid => Platform.isAndroid;

/// キーボードを閉じる（ボタンがキーボードの裏に隠れないように）
Future<void> hideKeyboard(WidgetTester tester) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
  await tester.pump(const Duration(milliseconds: 500));
}
