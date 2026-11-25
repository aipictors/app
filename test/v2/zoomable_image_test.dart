import 'package:aipictors/v2/widgets/zoomable_image.dart';
import 'package:aipictors/v2/work/work_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// 全画面ビューアのピンチ・ダブルタップと、ページ送り・下スワイプで閉じる操作の取り合い
void main() {
  // url が空なら AppImage はネットワークを読まずに灰色の箱を出す
  Future<void> open(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FullscreenImages(images: ['', '', ''], initial: 0))),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  double scale(WidgetTester tester) {
    final viewer = tester.widget<InteractiveViewer>(find.byType(InteractiveViewer).first);
    return viewer.transformationController!.value.getMaxScaleOnAxis();
  }

  double page(WidgetTester tester) => tester.widget<PageView>(find.byType(PageView)).controller!.page!;

  /// 実際の指に近いピンチ: 1 本目を置いてから少し遅れて 2 本目、片方だけを横に動かす
  Future<void> pinchOut(WidgetTester tester, {Offset still = const Offset(150, 400), Offset start = const Offset(230, 400), Offset step = const Offset(8, 0)}) async {
    final a = await tester.startGesture(still, pointer: 1);
    await tester.pump(const Duration(milliseconds: 30));
    final b = await tester.startGesture(start, pointer: 2);
    for (var i = 0; i < 14; i++) {
      await tester.pump(const Duration(milliseconds: 16));
      await b.moveBy(step);
    }
    await a.up();
    await b.up();
    await tester.pumpAndSettle();
  }

  testWidgets('横向きのピンチでページが送られず拡大する', (tester) async {
    await open(tester);
    await pinchOut(tester);
    expect(page(tester), 0);
    expect(scale(tester), greaterThan(1.3));
  });

  testWidgets('縦向きのピンチで閉じずに拡大する', (tester) async {
    await open(tester);
    await pinchOut(tester, still: const Offset(200, 300), start: const Offset(200, 380), step: const Offset(0, 8));
    expect(find.byType(FullscreenImages), findsOneWidget);
    expect(scale(tester), greaterThan(1.3));
  });

  testWidgets('拡大中の横スワイプは移動で、ダブルタップで戻すとまたページを送れる', (tester) async {
    await open(tester);
    // ダブルタップで拡大
    await tester.tapAt(const Offset(200, 400));
    await tester.pump(const Duration(milliseconds: 80));
    await tester.tapAt(const Offset(200, 400));
    await tester.pumpAndSettle();
    expect(scale(tester), greaterThan(2));

    await tester.dragFrom(const Offset(300, 400), const Offset(-250, 0));
    await tester.pumpAndSettle();
    expect(page(tester), 0);
    expect(find.byType(FullscreenImages), findsOneWidget);

    // もう一度ダブルタップで等倍に戻す
    await tester.tapAt(const Offset(200, 400));
    await tester.pump(const Duration(milliseconds: 80));
    await tester.tapAt(const Offset(200, 400));
    await tester.pumpAndSettle();
    expect(scale(tester), closeTo(1, 0.01));

    await tester.dragFrom(const Offset(300, 400), const Offset(-250, 0));
    await tester.pumpAndSettle();
    expect(page(tester), 1);
  });

  testWidgets('ピンチインで等倍に戻すとまたページを送れる', (tester) async {
    await open(tester);
    await pinchOut(tester);
    expect(scale(tester), greaterThan(1.3));
    await pinchOut(tester, still: const Offset(100, 400), start: const Offset(330, 400), step: const Offset(-14, 0));
    expect(scale(tester), closeTo(1, 0.01));
    await tester.dragFrom(const Offset(300, 400), const Offset(-250, 0));
    await tester.pumpAndSettle();
    expect(page(tester), 1);
  });

  // 生成結果ビューア（result_viewer.dart）と同じ組み方: PageView の中で、拡大中はページ送りを止める
  testWidgets('生成結果ビューアの組み方でもピンチが PageView に取られない', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final pages = PageController();
    var zoomed = false;
    var taps = 0;
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) => PageView.builder(
          controller: pages,
          physics: zoomed ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, i) => ZoomableImage(
            onTap: () => taps++,
            onZoomChanged: (z) => setState(() => zoomed = z),
            child: const ColoredBox(color: Colors.grey),
          ),
        ),
      ),
    ));
    await pinchOut(tester);
    expect(pages.page, 0);
    expect(scale(tester), greaterThan(1.3));
    // 拡大中の横ドラッグは移動になる
    await tester.dragFrom(const Offset(300, 400), const Offset(-250, 0));
    await tester.pumpAndSettle();
    expect(pages.page, 0);
    // 1 回のタップは親へ（上下のバーの出し入れ）
    await tester.tapAt(const Offset(200, 400));
    await tester.pump(const Duration(milliseconds: 400)); // ダブルタップを待つ分
    expect(taps, 1);
  });

  testWidgets('等倍なら下スワイプで閉じる', (tester) async {
    await open(tester);
    await tester.flingFrom(const Offset(200, 300), const Offset(0, 300), 1500);
    await tester.pumpAndSettle();
    expect(find.byType(FullscreenImages), findsNothing);
  });
}
