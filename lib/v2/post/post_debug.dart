import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/stickers/sticker_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// デバッグ専用。ピッカーを通さずに投稿の流れを試す
final List<RouteBase> postDebugRoutes = [
  GoRoute(path: '/debug/post-dry', builder: (context, state) => const _DebugPost()),
  GoRoute(path: '/debug/post-live', builder: (context, state) => const _DebugLive()),
];

Future<Uint8List> _synthetic(int width, int height, Color a, Color b) async {
  final recorder = ui.PictureRecorder();
  final rect = Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble());
  ui.Canvas(recorder).drawRect(rect, Paint()..shader = LinearGradient(colors: [a, b]).createShader(rect));
  final image = await recorder.endRecording().toImage(width, height);
  final png = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return png!.buffer.asUint8List();
}

Future<List<Uint8List>> _images() async => [
      await _synthetic(900, 1200, Colors.indigo, Colors.pink),
      await _synthetic(1200, 800, Colors.teal, Colors.amber),
    ];

class _DebugPost extends StatelessWidget {
  const _DebugPost();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Uint8List>>(
      future: _images(),
      builder: (context, snap) {
        if (!snap.hasData) return const Scaffold();
        return PostFormScreen(debugImages: snap.data, debugAutoSubmit: true);
      },
    );
  }
}

/// 審査用アカウントで非公開の作品とスタンプを実際に作って消し、結果をログに出す
class _DebugLive extends StatefulWidget {
  const _DebugLive();

  @override
  State<_DebugLive> createState() => _DebugLiveState();
}

class _DebugLiveState extends State<_DebugLive> {
  final List<String> _log = [];

  @override
  void initState() {
    super.initState();
    _run();
  }

  void _say(String s) {
    debugPrint('[post live] $s');
    if (mounted) setState(() => _log.add(s));
  }

  Future<void> _run() async {
    String? workId;
    String? stickerId;
    try {
      final reservedAt = DateTime.now().add(const Duration(days: 2));
      final images = [for (final b in await _images()) PostImage.local(await ImageTools.normalize(b))];
      final draft = PostDraft()
        ..title = 'テスト（すぐ削除します）'
        ..caption = 'アプリの動作確認です'
        ..accessType = 'PRIVATE'
        ..isBotGradingEnabled = false
        ..isCommentEditable = false
        ..isTagEditable = false
        ..tags = ['動作確認']
        ..reservedAt = reservedAt;
      workId = await PostApi.create(draft, images, onProgress: (_) {});
      _say('createWork OK id=$workId');
      final editing = await PostApi.loadForEdit(workId);
      final actual = DateTime.fromMillisecondsSinceEpoch(editing!.json.integer('createdAt') * 1000);
      _say('reservation delta minutes=${actual.difference(reservedAt).inMinutes}');
      _say('loadForEdit OK images=${editing.imageUrls.length} access=${editing.json.str('accessType')}');
      final updated = PostApi.draftFrom(editing)..title = 'テスト（更新・すぐ削除します）';
      await PostApi.update(editing, updated, editing.imageUrls.reversed.map(PostImage.remote).toList(), onProgress: (_) {});
      final after = await PostApi.loadForEdit(workId);
      _say('updateWork OK title=${after!.json.str('title')} first=${after.imageUrls.first == editing.imageUrls.last} reorderImages=${after.imageUrls.length}');
    } on ApiException catch (e) {
      _say('work FAILED: ${e.message}');
    } catch (e) {
      _say('work FAILED: $e');
    } finally {
      if (workId != null) {
        try {
          await PostApi.delete(workId);
          _say('deleteWork OK');
        } catch (e) {
          _say('deleteWork FAILED id=$workId: $e');
        }
      }
    }
    try {
      final token = await Uploader.token();
      final png = await ImageTools.cropToSquarePng((await _images()).first, const Rect.fromLTWH(0, 0, 900, 900), 512);
      final url = await Uploader.image(png.bytes, png.mime, token);
      final data = await Api.mutate(r'mutation AppDebugSticker($input: CreateStickerInput!) { createSticker(input: $input) { id accessType } }', variables: {
        'input': {'title': null, 'genre': null, 'categories': null, 'imageUrl': url, 'accessType': 'PRIVATE'},
      });
      stickerId = data.obj('createSticker')!.str('id');
      _say('createSticker OK id=$stickerId access=${data.obj('createSticker')!.str('accessType')}');
      await StickerApi.addToMine(stickerId);
      _say('createUserSticker OK');
      await StickerApi.update(stickerId, access: 'PRIVATE', title: 'テスト');
      _say('updateSticker OK');
    } on ApiException catch (e) {
      _say('sticker FAILED: ${e.message}');
    } finally {
      if (stickerId != null) {
        try {
          await StickerApi.deleteOwn(stickerId);
          final mine = await StickerApi.mine('PRIVATE_CREATED', 0, 64);
          final left = await Api.query(r'query AppDebugSticker($id: ID!) { sticker(id: $id) { id isDeleted } }', variables: {'id': stickerId});
          _say('deleteSticker OK inMine=${mine.any((s) => s.id == stickerId)} sticker=${left['sticker']}');
        } catch (e) {
          _say('deleteSticker FAILED id=$stickerId: $e');
        }
      }
    }
    _say('done');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('post live')),
      body: Padding(padding: const EdgeInsets.all(Ds.s16), child: Text(_log.join('\n'))),
    );
  }
}
