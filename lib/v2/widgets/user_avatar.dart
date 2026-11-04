import 'dart:math' as math;

import 'package:aipictors/v2/core/css_background.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// ユーザーのアイコン。枠の見た目は Web の UserAvatarWithFrame と同じ。
/// [userId] を渡すと、押したときにその人のプロフィールを開く。
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.url,
    this.frame,
    this.size = 32,
    this.userId,
    this.ring = false,
    this.animated = true,
    this.animateDecoration = false,
  });

  /// [UserSummary] から。[tappable] なら押すとプロフィールへ
  factory UserAvatar.summary(UserSummary user, {Key? key, double size = 32, bool tappable = false, bool ring = false}) => UserAvatar(
        key: key,
        url: user.iconUrl,
        frame: user.avatarFrame,
        size: size,
        userId: tappable && user.id.isNotEmpty ? user.id : null,
        ring: ring,
      );

  /// GraphQL の user の Map から。[tappable] なら押すとプロフィールへ
  factory UserAvatar.json(Map<String, dynamic>? user, {Key? key, double size = 32, bool tappable = false, bool ring = false}) => UserAvatar.summary(
        user == null ? UserSummary.empty : UserSummary.fromJson(user),
        key: key,
        size: size,
        tappable: tappable,
        ring: ring,
      );

  final String? url;
  final AvatarFrame? frame;
  final double size;
  final String? userId;

  /// 枠がない人に、ブランド色の輪を付ける（マイページなど）
  final bool ring;

  /// 枠の背景を動かす（Web の isAnimated）
  final bool animated;

  /// 装飾を動く画像にする。重いのでプロフィールのように 1 つだけ大きく出すところで使う
  final bool animateDecoration;

  @override
  Widget build(BuildContext context) {
    final avatar = _build(context);
    final id = userId;
    if (id == null || id.isEmpty) return avatar;
    return Pressable(onTap: () => Nav.user(context, id), child: avatar);
  }

  Widget _build(BuildContext context) {
    final f = frame;
    if (f == null) {
      if (!ring) return _PlainAvatar(url: url, size: size);
      return _BrandRing(child: _PlainAvatar(url: url, size: size));
    }
    final overlay = f.overlayUrl;
    if (f.isDecoration && overlay != null) {
      return _DecoratedAvatar(url: url, overlayUrl: overlay, size: size, animate: animateDecoration);
    }
    return _FramedAvatar(url: url, frame: f, size: size, animated: animated);
  }
}

class _PlainAvatar extends StatelessWidget {
  const _PlainAvatar({required this.url, required this.size});

  final String? url;
  final double size;

  @override
  Widget build(BuildContext context) {
    final u = url;
    final fallback = Container(
      width: size,
      height: size,
      color: context.skeleton,
      alignment: Alignment.center,
      child: Icon(Icons.person_rounded, size: size * 0.6, color: context.muted),
    );
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: u == null || u.isEmpty
            ? fallback
            : CachedNetworkImage(
                imageUrl: u,
                fit: BoxFit.cover,
                memCacheWidth: (size * 3).round(),
                fadeInDuration: Ds.fast,
                fadeOutDuration: Duration.zero,
                placeholder: (_, __) => Container(color: context.skeleton),
                errorWidget: (_, __, ___) => fallback,
              ),
      ),
    );
  }
}

class _BrandRing extends StatelessWidget {
  const _BrandRing({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(shape: BoxShape.circle, gradient: Ds.brandGradient),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).scaffoldBackgroundColor),
        child: child,
      ),
    );
  }
}

/// アイコンの外にはみ出す装飾。画像はアイコンの 148.4% で中央に重ねる（Web と同じ倍率）
class _DecoratedAvatar extends StatelessWidget {
  const _DecoratedAvatar({required this.url, required this.overlayUrl, required this.size, required this.animate});

  final String? url;
  final String overlayUrl;
  final double size;
  final bool animate;

  static const _scale = 1.484;

  @override
  Widget build(BuildContext context) {
    final overlaySize = size * _scale;
    final offset = (size - overlaySize) / 2;
    final reduce = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _PlainAvatar(url: url, size: size),
          Positioned(
            left: offset,
            top: offset,
            width: overlaySize,
            height: overlaySize,
            child: IgnorePointer(
              child: CachedNetworkImage(
                imageUrl: animate && !reduce ? AvatarFrame.animatedDecorationUrl(overlayUrl) : overlayUrl,
                fit: BoxFit.contain,
                memCacheWidth: (overlaySize * 3).round(),
                fadeInDuration: Ds.fast,
                fadeOutDuration: Duration.zero,
                errorWidget: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 色の枠。padding の分だけアイコンが内側に小さくなる
class _FramedAvatar extends StatelessWidget {
  const _FramedAvatar({required this.url, required this.frame, required this.size, required this.animated});

  final String? url;
  final AvatarFrame frame;
  final double size;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    final padding = math.max(0, frame.borderPadding).toDouble();
    final inner = math.max(0.0, size - padding * 2);
    final reduce = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    final motion = animated && !reduce;
    final background = Theme.of(context).scaffoldBackgroundColor;
    final css = CssBackground.parse(frame.backgroundStyle);
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Color(0x140F172A), blurRadius: 10, offset: Offset(0, 1))],
      ),
      child: ClipOval(
        child: Stack(
          children: [
            if (!css.isEmpty)
              Positioned.fill(
                child: RepaintBoundary(child: _FrameBackground(css: css, frameType: frame.frameType, size: size, animated: motion)),
              ),
            if (motion && frame.hasGloss) Positioned.fill(child: RepaintBoundary(child: _FrameGloss(size: size))),
            if (frame.overlayUrl != null)
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: frame.overlayUrl!,
                  fit: BoxFit.cover,
                  fadeInDuration: Ds.fast,
                  fadeOutDuration: Duration.zero,
                  errorWidget: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            Center(
              child: Container(
                width: inner,
                height: inner,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: background,
                  border: Border.all(color: background.withValues(alpha: 0.4)),
                ),
                child: _PlainAvatar(url: url, size: inner),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 枠の背景。Web の background-size（箱より大きく描いて左上に置く）とアニメーションに合わせる
class _FrameBackground extends StatefulWidget {
  const _FrameBackground({required this.css, required this.frameType, required this.size, required this.animated});

  final CssBackground css;
  final String frameType;
  final double size;
  final bool animated;

  @override
  State<_FrameBackground> createState() => _FrameBackgroundState();
}

class _FrameBackgroundState extends State<_FrameBackground> with SingleTickerProviderStateMixin {
  AnimationController? _c;

  Duration? get _duration {
    if (!widget.animated) return null;
    switch (widget.frameType) {
      case AvatarFrame.typeRainbow:
        return const Duration(seconds: 12);
      case AvatarFrame.typeAurora:
        return const Duration(seconds: 10);
      case AvatarFrame.typeStarlight:
        return const Duration(milliseconds: 4800);
    }
    return null;
  }

  double get _sizeFactor {
    switch (widget.frameType) {
      case AvatarFrame.typeAurora:
      case AvatarFrame.typeStarlight:
        return 2.2;
      case AvatarFrame.typePearl:
        return 2.0;
    }
    return 1.8;
  }

  @override
  void initState() {
    super.initState();
    _syncController();
  }

  @override
  void didUpdateWidget(covariant _FrameBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animated != widget.animated || oldWidget.frameType != widget.frameType) {
      _syncController();
    }
  }

  void _syncController() {
    final d = _duration;
    if (d == null) {
      _c?.stop();
      return;
    }
    final c = _c ??= AnimationController(vsync: this);
    c.duration = d;
    c.repeat();
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  /// 0 → 1 → 0 を ease-in-out で
  double _pingPong(double t) {
    final half = t < 0.5 ? t * 2 : (1 - t) * 2;
    return Curves.easeInOut.transform(half);
  }

  Widget _layer({double posX = 0, double posY = 0}) {
    final side = widget.size * _sizeFactor;
    final room = widget.size - side;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: room * posX,
          top: room * posY,
          width: side,
          height: side,
          child: Stack(
            fit: StackFit.expand,
            children: [for (final layer in widget.css.layers) DecoratedBox(decoration: layer.decoration)],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = _c;
    if (c == null || _duration == null) return _layer();
    return AnimatedBuilder(
      animation: c,
      builder: (context, _) {
        final t = c.value;
        switch (widget.frameType) {
          case AvatarFrame.typeRainbow:
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(t * math.pi * 2)
                ..scaleByDouble(1.02 + 0.02 * (t < 0.5 ? t * 2 : (1 - t) * 2), 1.02 + 0.02 * (t < 0.5 ? t * 2 : (1 - t) * 2), 1, 1),
              child: _layer(),
            );
          case AvatarFrame.typeAurora:
            final p = _pingPong(t);
            return _layer(posX: p, posY: 0.3 + 0.4 * p);
          case AvatarFrame.typeStarlight:
            return Opacity(opacity: 0.72 + 0.28 * _pingPong(t), child: _layer());
        }
        return _layer();
      },
    );
  }
}

/// 枠の上をゆっくり横切る光
class _FrameGloss extends StatefulWidget {
  const _FrameGloss({required this.size});

  final double size;

  @override
  State<_FrameGloss> createState() => _FrameGlossState();
}

class _FrameGlossState extends State<_FrameGloss> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 5400))..repeat();

  static const _gradient = LinearGradient(
    begin: Alignment(-1.2, -0.5),
    end: Alignment(1.2, 0.5),
    colors: [Color(0x00FFFFFF), Color(0x14FFFFFF), Color(0x57FFFFFF), Color(0x14FFFFFF), Color(0x00FFFFFF)],
    stops: [0.24, 0.38, 0.48, 0.58, 0.72],
  );

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  double _opacity(double t) {
    if (t < 0.15) return 0.18 * (t / 0.15);
    if (t < 0.45) return 0.18 + 0.12 * ((t - 0.15) / 0.3);
    return 0.3 * (1 - (t - 0.45) / 0.55);
  }

  @override
  Widget build(BuildContext context) {
    final inset = widget.size * 0.08;
    final side = widget.size - inset * 2;
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_c.value);
        final dx = (-1.2 + 2.8 * t) * side;
        return Opacity(
          opacity: _opacity(_c.value).clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(dx, 0),
            child: Transform.rotate(angle: 18 * math.pi / 180, child: child),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(inset),
        child: const DecoratedBox(decoration: BoxDecoration(shape: BoxShape.circle, gradient: _gradient)),
      ),
    );
  }
}
