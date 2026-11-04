import 'dart:convert';
import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/stickers/sticker_create_screen.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:aipictors/v2/work/work_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// デバッグ専用。ピッカーを通さずに投稿の流れを試す
final List<RouteBase> postDebugRoutes = [
  GoRoute(path: '/debug/post-dry', builder: (context, state) => const _DebugPost()),
  GoRoute(path: '/debug/post-live', builder: (context, state) => const _DebugLive()),
  GoRoute(path: '/debug/tour', builder: (context, state) => const _DebugTour()),
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

/// 画面を順に開く（スクリーンショット用）
class _DebugTour extends StatefulWidget {
  const _DebugTour();

  @override
  State<_DebugTour> createState() => _DebugTourState();
}

class _DebugTourState extends State<_DebugTour> {
  @override
  void initState() {
    super.initState();
    _run();
  }

  /// 画面の座標に指を置く操作を送る（本物のジェスチャーと同じ経路を通す）
  void _pointer(int id, PointerEvent Function(int id) make) => GestureBinding.instance.handlePointerEvent(make(id));

  Future<void> _tap(Offset at) async {
    _pointer(1, (id) => PointerDownEvent(pointer: id, position: at));
    await Future<void>.delayed(const Duration(milliseconds: 60));
    _pointer(1, (id) => PointerUpEvent(pointer: id, position: at));
  }

  Future<void> _pinch(Offset center) async {
    var a = center - const Offset(30, 0);
    var b = center + const Offset(30, 0);
    _pointer(1, (id) => PointerDownEvent(pointer: id, position: a));
    _pointer(2, (id) => PointerDownEvent(pointer: id, position: b));
    for (var i = 0; i < 20; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 16));
      a -= const Offset(6, 0);
      b += const Offset(6, 0);
      final (pa, pb) = (a, b);
      _pointer(1, (id) => PointerMoveEvent(pointer: id, position: pa, delta: const Offset(-6, 0)));
      _pointer(2, (id) => PointerMoveEvent(pointer: id, position: pb, delta: const Offset(6, 0)));
    }
    final (pa, pb) = (a, b);
    _pointer(1, (id) => PointerUpEvent(pointer: id, position: pa));
    _pointer(2, (id) => PointerUpEvent(pointer: id, position: pb));
  }

  ScrollableState? _firstVertical() {
    ScrollableState? found;
    void visit(Element e) {
      if (e is StatefulElement && e.state is ScrollableState) {
        final p = (e.state as ScrollableState).position;
        if (p.axis == Axis.vertical && p.hasContentDimensions && p.maxScrollExtent > 500) found = e.state as ScrollableState;
      }
      e.visitChildren(visit);
    }

    WidgetsBinding.instance.rootElement?.visitChildren(visit);
    return found;
  }

  Future<void> _run() async {
    const step = Duration(seconds: 9);
    final data = await Api.query(r'query AppDebugMulti { works(offset: 0, limit: 40, where: { ratings: [G], isFeatured: true }) { id subWorksCount description } }');
    final multi = data.list('works').where((w) => w.integer('subWorksCount') > 0 && w.str('description').isNotEmpty).map((w) => w.str('id')).firstOrNull ?? data.list('works').first.str('id');
    if (!mounted) return;
    // 0: 作品のキャプション
    context.push('/works/$multi');
    await Future<void>.delayed(step);
    _firstVertical()?.position.jumpTo(620);
    await Future<void>.delayed(step);
    // 1: 全画面でピンチ拡大
    final work = await Api.query(r'query AppDebugImages($id: ID!) { work(id: $id) { imageURL subWorks { imageUrl } } }', variables: {'id': multi});
    final w = work.obj('work')!;
    if (!mounted) return;
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (_) => FullscreenImages(images: [w.str('imageURL'), ...w.list('subWorks').map((s) => s.str('imageUrl'))], initial: 0),
    ));
    await Future<void>.delayed(const Duration(seconds: 5));
    await _pinch(const Offset(220, 480));
    await Future<void>.delayed(step);
    if (!mounted) return;
    Navigator.of(context, rootNavigator: true).pop();
    // 2: 推しコインの内訳
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (_) => const SupportPicker(balance: CoinSummary(free: 120, premium: 8), free: 30, premium: 3, anonymous: false),
    ).ignore();
    await Future<void>.delayed(step);
    if (!mounted) return;
    Navigator.of(context, rootNavigator: true).pop();
    // 3: 写真ピッカーを開く
    context.push('/works/create');
    await Future<void>.delayed(const Duration(seconds: 5));
    await _tap(const Offset(70, 233));
  }

  @override
  Widget build(BuildContext context) => const Scaffold();
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
    await _novel();
    _say('done');
  }

  /// 小説は本文を Markdown でアップロードする。非公開で作って読み戻し、消す
  Future<void> _novel() async {
    String? id;
    try {
      final images = [PostImage.local(await ImageTools.normalize((await _images()).first))];
      final draft = PostDraft()
        ..title = 'テスト小説（すぐ削除します）'
        ..accessType = 'PRIVATE'
        ..workType = 'NOVEL'
        ..body = '# 見出し\n本文です'
        ..isBotGradingEnabled = false;
      id = await PostApi.create(draft, images, onProgress: (_) {});
      final e = await PostApi.loadForEdit(id);
      final body = e?.mdUrl == null ? null : await http.get(Uri.parse(e!.mdUrl!));
      _say('novel OK id=$id type=${e?.json.str('type')} md=${body?.statusCode} sent=${utf8.encode(draft.body).length} got=${body?.bodyBytes.length} head=${body == null ? null : utf8.decode(body.bodyBytes, allowMalformed: true).characters.take(30)}');
    } on ApiException catch (e) {
      _say('novel FAILED: ${e.message}');
    } finally {
      if (id != null) {
        await PostApi.delete(id);
        final left = await Api.query(r'query AppDebugLeft($id: ID!) { work(id: $id) { id } }', variables: {'id': id});
        _say('novel delete stillThere=${left['work'] != null}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('post live')),
      body: Padding(padding: const EdgeInsets.all(Ds.s16), child: Text(_log.join('\n'))),
    );
  }
}
