import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/stickers/sticker_create_screen.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// デバッグ専用。ピッカーを通さずに投稿の流れを試す
final List<RouteBase> postDebugRoutes = [
  GoRoute(path: '/debug/post-dry', builder: (context, state) => const _DebugPost()),
  GoRoute(path: '/debug/post-live', builder: (context, state) => const _DebugLive()),
  GoRoute(
    path: '/debug/sticker-create',
    builder: (context, state) => FutureBuilder<List<Uint8List>>(
      future: _images(),
      builder: (context, snap) => snap.hasData ? StickerCreateScreen(debugImage: snap.data!.first) : const Scaffold(),
    ),
  ),
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
    try {
      final options = await PostApi.options();
      final reservedAt = DateTime.now().add(const Duration(days: 2));
      final images = [for (final b in await _images()) PostImage.local(await ImageTools.normalize(b))];
      final draft = PostDraft()
        ..title = 'テスト（すぐ削除します）'
        ..caption = 'アプリの動作確認です'
        ..accessType = 'PRIVATE'
        ..isBotGradingEnabled = false
        ..modelId = options.models.first.id
        ..tags = ['動作確認']
        ..reservedAt = reservedAt;
      workId = await PostApi.create(draft, images, onProgress: (_) {});
      _say('createWork OK id=$workId model=${options.models.first.id}');
      final editing = await PostApi.loadForEdit(workId);
      final actual = DateTime.fromMillisecondsSinceEpoch(editing!.json.integer('createdAt') * 1000);
      _say('reservation delta minutes=${actual.difference(reservedAt).inMinutes} workModelId=${editing.json['workModelId']} access=${editing.json.str('accessType')}');
      final updated = PostApi.draftFrom(editing)..title = 'テスト（更新・すぐ削除します）';
      await PostApi.update(editing, updated, editing.imageUrls.reversed.map(PostImage.remote).toList(), onProgress: (_) {});
      final after = await PostApi.loadForEdit(workId);
      _say('updateWork OK swapped=${after!.imageUrls.first == editing.imageUrls.last} access=${after.json.str('accessType')} reservedKept=${after.json.integer('createdAt') == editing.json.integer('createdAt')}');
      // 自分の非公開作品へのコメントで、隠し付きと返信がサーバーに届くか確かめる
      final comment = await Api.mutate('mutation AppDebugComment(\$input: CreateWorkCommentInput!) { createWorkComment(input: \$input) { $commentFields } }', variables: {
        'input': {'workId': workId, 'text': '動作確認のコメント', 'isSensitive': false},
      });
      final parent = comment.obj('createWorkComment')!;
      final reply = await Api.mutate('mutation AppDebugReply(\$input: CreateResponseCommentInput!) { createResponseComment(input: \$input) { $commentFields } }', variables: {
        'input': {'commentId': parent.str('id'), 'text': '隠し付きの返信', 'isSensitive': true},
      });
      final replied = reply.obj('createResponseComment')!;
      _say('comment OK parentSensitive=${parent['isSensitive']} replySensitive=${replied['isSensitive']} replyText=${replied['text']} user=${replied.obj('user') != null}');
      await Api.mutate('mutation AppDebugPlain(\$input: CreateResponseCommentInput!) { createResponseComment(input: \$input) { id } }', variables: {
        'input': {'commentId': parent.str('id'), 'text': '普通の返信', 'isSensitive': false},
      });
      if (const bool.fromEnvironment('liveShowComments') && mounted) {
        showCommentsSheet(context, workId: workId, ownerId: '', ownerName: 'テスト', viewerId: null).ignore();
        await Future<void>.delayed(const Duration(seconds: 25));
        if (mounted) Navigator.of(context).pop();
      }
    } on ApiException catch (e) {
      _say('work FAILED: ${e.message}');
    } catch (e) {
      _say('work FAILED: $e');
    } finally {
      if (workId != null) {
        try {
          await PostApi.delete(workId);
          final left = await Api.query(r'query AppDebugLeft($id: ID!) { work(id: $id) { id } }', variables: {'id': workId});
          _say('deleteWork OK stillThere=${left['work'] != null}');
        } catch (e) {
          _say('deleteWork result id=$workId: $e');
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
