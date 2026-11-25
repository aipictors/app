import 'package:aipictors/v2/core/design.dart';
import 'package:flutter/material.dart';

/// 全画面ビューアの画像。ピンチで拡大縮小、拡大中はドラッグで移動、ダブルタップで拡大/元に戻す。
///
/// [onZoomChanged] は拡大中か、指 2 本以上で触れている間 true。親はその間 PageView のページ送りと
/// 下スワイプで閉じる操作を外す（外さないと片方の指が先に動いたピンチを横・縦のドラッグに取られる）。
class ZoomableImage extends StatefulWidget {
  const ZoomableImage({super.key, required this.child, this.onTap, this.onZoomChanged, this.maxScale = 5});

  final Widget child;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onZoomChanged;
  final double maxScale;

  @override
  State<ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> with SingleTickerProviderStateMixin {
  final _transform = TransformationController();
  late final AnimationController _anim = AnimationController(vsync: this, duration: Ds.normal);
  Animation<Matrix4>? _tween;
  Offset? _doubleTapAt;
  final Set<int> _pointers = {};
  bool _reported = false;

  bool get _zoomed => _transform.value.getMaxScaleOnAxis() > 1.01;

  @override
  void initState() {
    super.initState();
    _anim.addListener(() {
      if (_tween != null) _transform.value = _tween!.value;
    });
    _transform.addListener(_report);
  }

  @override
  void dispose() {
    _transform.dispose();
    _anim.dispose();
    super.dispose();
  }

  void _report() {
    final v = _zoomed || _pointers.length >= 2;
    if (v == _reported) return;
    _reported = v;
    widget.onZoomChanged?.call(v);
  }

  void _toggleZoom() {
    final p = _doubleTapAt ?? Offset.zero;
    // 押したところを中心に 2.5 倍（p - 2.5p = -1.5p ずらす）
    final end = _zoomed
        ? Matrix4.identity()
        : (Matrix4.identity()
            ..translateByDouble(-p.dx * 1.5, -p.dy * 1.5, 0, 1)
            ..scaleByDouble(2.5, 2.5, 1, 1));
    _tween = Matrix4Tween(begin: _transform.value, end: end).animate(CurvedAnimation(parent: _anim, curve: Ds.curve));
    _anim.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    // Listener は取り合いに加わらないので、2 本目の指が触れた時点で親に知らせられる
    return Listener(
      onPointerDown: (e) {
        _pointers.add(e.pointer);
        _report();
      },
      onPointerUp: (e) {
        _pointers.remove(e.pointer);
        _report();
      },
      onPointerCancel: (e) {
        _pointers.remove(e.pointer);
        _report();
      },
      child: GestureDetector(
        onTap: widget.onTap,
        onDoubleTapDown: (d) => _doubleTapAt = d.localPosition,
        onDoubleTap: _toggleZoom,
        child: InteractiveViewer(
          transformationController: _transform,
          minScale: 1,
          maxScale: widget.maxScale,
          onInteractionStart: (_) => _anim.stop(),
          child: SizedBox.expand(child: widget.child),
        ),
      ),
    );
  }
}
