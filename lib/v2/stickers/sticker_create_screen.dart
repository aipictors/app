import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/post/post_form_screen.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/stickers/my_stickers_screen.dart';
import 'package:aipictors/v2/stickers/sticker_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const stickerPixels = 512;

/// 画像を選び、512x512 の PNG に切り抜いてスタンプを作る（Web の add-sticker-dialog）
class StickerCreateScreen extends StatefulWidget {
  const StickerCreateScreen({super.key, this.debugImage});

  final Uint8List? debugImage;

  @override
  State<StickerCreateScreen> createState() => _StickerCreateScreenState();
}

class _StickerCreateScreenState extends State<StickerCreateScreen> {
  final _crop = _CropController();
  final _title = TextEditingController();
  Uint8List? _source;
  bool _isPublic = false;
  String _genre = 'CHARACTER';
  String? _tag;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _source = widget.debugImage;
  }

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    try {
      final files = await pickSystemImages(multiple: false);
      if (files.isEmpty) return;
      final image = await ImageTools.normalize(await files.first.readAsBytes());
      if (mounted) setState(() => _source = image.bytes);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (_) {
      if (mounted) context.toast('写真を開けませんでした', error: true);
    }
  }

  Future<void> _submit() async {
    if (_source == null) {
      context.toast('画像を選択してください', error: true);
      return;
    }
    if (_isPublic && _title.text.trim().isEmpty) {
      context.toast('タイトルを入力してください', error: true);
      return;
    }
    if (_isPublic && _tag == null) {
      context.toast('タグを選択してください', error: true);
      return;
    }
    setState(() => _sending = true);
    try {
      final png = await ImageTools.cropToSquarePng(_source!, _crop.imageRect(), stickerPixels);
      await StickerApi.create(png, isPublic: _isPublic, title: _title.text.trim(), genre: _genre, tag: _tag);
      if (!mounted) return;
      Ds.success();
      if (postDryRun) {
        context.toast('dry run: ${StickerApi.lastDryRunInput?['accessType']} ${png.width}x${png.height} PNG');
        setState(() => _sending = false);
        return;
      }
      context.toast(_isPublic ? 'スタンプを公開しました' : '非公開で作成しました。公開はマイスタンプからできます');
      context.pop(true);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _sending = false);
      context.toast(e.message, error: true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _sending = false);
      context.toast('スタンプの作成に失敗しました', error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('スタンプを作る')),
      body: ContentWidth(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(Ds.s16),
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: Ds.br(16),
                child: _source == null
                    ? Material(
                        color: context.skeleton,
                        child: InkWell(
                          onTap: _pick,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Icon(Icons.add_photo_alternate_outlined, size: 40, color: context.muted),
                            const SizedBox(height: Ds.s8),
                            Text('画像を選ぶ', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700)),
                          ]),
                        ),
                      )
                    : _CropView(key: ValueKey(_source.hashCode), bytes: _source!, controller: _crop),
              ),
            ),
            if (_source != null) ...[
              const SizedBox(height: Ds.s6),
              Row(children: [
                Expanded(child: Text('ドラッグとピンチで範囲を決めます（512×512 の PNG になります）', style: TextStyle(color: context.muted, fontSize: 12))),
                TextButton(onPressed: _pick, child: const Text('選び直す')),
              ]),
            ],
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('誰でも使えるように公開する', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              value: _isPublic,
              onChanged: (v) => setState(() => _isPublic = v),
            ),
            if (_isPublic)
              StickerPublishFields(title: _title, genre: _genre, tag: _tag, onGenre: (g) => setState(() => _genre = g), onTag: (t) => setState(() => _tag = t)),
            const SizedBox(height: Ds.s20),
            PrimaryButton(label: _isPublic ? '公開する' : '作成する', loading: _sending, onPressed: _sending ? null : _submit),
          ],
        ),
      ),
    );
  }
}

class _CropController {
  _CropViewState? _state;

  Rect imageRect() => _state!.imageRect();
}

/// 正方形の枠で切り抜く範囲を決める
class _CropView extends StatefulWidget {
  const _CropView({super.key, required this.bytes, required this.controller});

  final Uint8List bytes;
  final _CropController controller;

  @override
  State<_CropView> createState() => _CropViewState();
}

class _CropViewState extends State<_CropView> {
  final _transform = TransformationController();
  Size? _imageSize;
  double _viewport = 0;
  bool _centered = false;

  @override
  void initState() {
    super.initState();
    widget.controller._state = this;
    _decode();
  }

  @override
  void dispose() {
    _transform.dispose();
    super.dispose();
  }

  Future<void> _decode() async {
    final buffer = await ui.ImmutableBuffer.fromUint8List(widget.bytes);
    final d = await ui.ImageDescriptor.encoded(buffer);
    final size = Size(d.width.toDouble(), d.height.toDouble());
    d.dispose();
    buffer.dispose();
    if (mounted) setState(() => _imageSize = size);
  }

  double get _scale => _viewport / _imageSize!.shortestSide;

  /// 枠の中に見えている範囲（画像のピクセル）
  Rect imageRect() {
    final tl = _transform.toScene(Offset.zero);
    final br = _transform.toScene(Offset(_viewport, _viewport));
    final scale = _scale;
    return Rect.fromPoints(tl / scale, br / scale);
  }

  @override
  Widget build(BuildContext context) {
    final size = _imageSize;
    if (size == null) return const Center(child: CircularProgressIndicator.adaptive());
    return LayoutBuilder(builder: (context, constraints) {
      _viewport = constraints.maxWidth;
      final scale = _scale;
      final childW = size.width * scale;
      final childH = size.height * scale;
      if (!_centered) {
        _centered = true;
        _transform.value = Matrix4.translationValues(-(childW - _viewport) / 2, -(childH - _viewport) / 2, 0);
      }
      return Stack(fit: StackFit.expand, children: [
        CustomPaint(painter: _CheckerPainter(context.skeleton)),
        InteractiveViewer(
          transformationController: _transform,
          constrained: false,
          minScale: 1,
          maxScale: 8,
          child: SizedBox(width: childW, height: childH, child: Image.memory(widget.bytes, fit: BoxFit.fill)),
        ),
        IgnorePointer(child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color: Colors.white70, width: 1.5), borderRadius: Ds.br(16)))),
      ]);
    });
  }
}

/// 透過が分かる市松模様
class _CheckerPainter extends CustomPainter {
  const _CheckerPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const cell = 12.0;
    final paint = Paint()..color = color;
    for (var y = 0; y * cell < size.height; y++) {
      for (var x = y % 2; x * cell < size.width; x += 2) {
        canvas.drawRect(Rect.fromLTWH(x * cell, y * cell, cell, cell), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_CheckerPainter old) => old.color != color;
}
