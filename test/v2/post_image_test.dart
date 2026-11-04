import 'dart:ui' as ui;

import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

Future<Uint8List> _png(int w, int h) async {
  final recorder = ui.PictureRecorder();
  ui.Canvas(recorder).drawRect(Rect.fromLTWH(0, 0, w.toDouble(), h.toDouble()), Paint()..color = Colors.indigo);
  final image = await recorder.endRecording().toImage(w, h);
  return (await image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}

void main() {
  testWidgets('サムネイルは Web の resizeThumbnail と同じ寸法', (tester) async {
    await tester.runAsync(() async {
      final bytes = await _png(1200, 2400);
      final small = await ImageTools.thumbnail(bytes, 400, 1200);
      expect((small.width, small.height), (400, 800));
      expect(small.mime, 'image/jpeg');
      final tiny = await ImageTools.thumbnail(await _png(100, 100), 400, 1200);
      expect((tiny.width, tiny.height), (100, 100));
      final long = await ImageTools.thumbnail(await _png(400, 4000), 400, 1200);
      expect((long.width, long.height), (120, 1200));
    });
  });

  testWidgets('スタンプは 512x512 の PNG になる', (tester) async {
    await tester.runAsync(() async {
      final bytes = await _png(1000, 600);
      final out = await ImageTools.cropToSquarePng(bytes, const Rect.fromLTWH(200, 0, 600, 600), 512);
      expect(out.mime, 'image/png');
      expect(await ImageTools.sizeOf(out.bytes), (512, 512));
      expect(out.bytes.sublist(1, 4), [0x50, 0x4E, 0x47]);
    });
  });

  test('ハッシュは data URL の文字列を UTF-8 でハッシュする（Web と同じ）', () {
    final bytes = Uint8List.fromList([1, 2, 3]);
    final expected = sha256.convert(utf8.encode('data:image/png;base64,AQID')).toString();
    expect(ImageTools.sha256OfDataUrl(bytes, 'image/png'), expected);
  });

  test('生成情報の読み取り', () {
    final p = GenerationParams.parse('1girl, smile\nNegative prompt: lowres\nSteps: 20, Sampler: Euler a, Seed: 42, Model hash: abc, Model: foo')!;
    expect(p.prompt, '1girl, smile');
    expect(p.negativePrompt, 'lowres');
    expect(p.steps, '20');
    expect(p.sampler, 'Euler a');
    expect(p.seed, '42');
    expect(p.model, 'foo');
    expect(p.modelHash, 'abc');
  });

  test('入力の確認', () {
    final d = PostDraft();
    expect(PostApi.validate(d, const []), 'タイトルを入力してください');
    d.title = 'a';
    expect(PostApi.validate(d, const []), '画像を選択してください');
    d.rating = 'R18';
    expect(PostApi.validate(d, [PostImage.remote('https://x/y.png')]), isNotNull);
    d.rating = 'G';
    expect(PostApi.validate(d, [PostImage.remote('https://x/y.png')]), isNull);
  });

  test('モデルなしの作品は modelId を送らない', () {
    final d = PostApi.draftFrom(EditingWork({'id': '1', 'workModelId': 0, 'createdAt': 1}));
    expect(d.modelId, isNull);
    final e = PostApi.draftFrom(EditingWork({'id': '1', 'workModelId': 116, 'createdAt': 1}));
    expect(e.modelId, '116');
  });
}
