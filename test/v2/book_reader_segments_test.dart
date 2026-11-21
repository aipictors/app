import 'dart:ui';

import 'package:aipictors/v2/work/book_reader_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('2 画面の端末（Surface Duo）のヒンジで左右に分ける', () {
    final segments = readerSegments(
      size: const Size(1114, 720),
      left: 0,
      right: 0,
      features: const [
        DisplayFeature(bounds: Rect.fromLTWH(540, 0, 34, 720), type: DisplayFeatureType.hinge, state: DisplayFeatureState.postureFlat),
      ],
    );
    expect(segments, [
      {'x': 0, 'y': 0, 'width': 540, 'height': 720},
      {'x': 574, 'y': 0, 'width': 540, 'height': 720},
    ]);
  });

  test('折りたたみ端末の縦の折り目は幅 0 の見開きにする', () {
    final segments = readerSegments(
      size: const Size(884, 1000),
      left: 0,
      right: 0,
      features: const [
        DisplayFeature(bounds: Rect.fromLTWH(442, 0, 0, 1000), type: DisplayFeatureType.fold, state: DisplayFeatureState.postureHalfOpened),
      ],
    );
    expect(segments?.first['width'], 442);
    expect(segments?.last['x'], 442);
  });

  test('左の余白（横向きのノッチ）の分だけずらす', () {
    final segments = readerSegments(
      size: const Size(1114, 720),
      left: 40,
      right: 0,
      features: const [
        DisplayFeature(bounds: Rect.fromLTWH(540, 0, 34, 720), type: DisplayFeatureType.hinge, state: DisplayFeatureState.postureFlat),
      ],
    );
    expect(segments?.first['width'], 500);
    expect(segments?.last['x'], 534);
    expect(segments?.last['width'], 1074 - 534);
  });

  test('横の折り目（上下に分ける）・ノッチ・ヒンジ無しは分けない', () {
    expect(
      readerSegments(
        size: const Size(800, 1200),
        left: 0,
        right: 0,
        features: const [
          DisplayFeature(bounds: Rect.fromLTWH(0, 600, 800, 0), type: DisplayFeatureType.fold, state: DisplayFeatureState.postureHalfOpened),
          DisplayFeature(bounds: Rect.fromLTWH(350, 0, 100, 30), type: DisplayFeatureType.cutout, state: DisplayFeatureState.unknown),
        ],
      ),
      isNull,
    );
    expect(readerSegments(size: const Size(400, 800), left: 0, right: 0, features: const []), isNull);
  });
}
