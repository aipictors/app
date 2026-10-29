import 'package:aipictors/v2/core/design.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// ネット画像（ふわっと出す・失敗時はアイコン）
class AppImage extends StatelessWidget {
  const AppImage(
    this.url, {
    super.key,
    this.fit = BoxFit.cover,
    this.radius = 0,
    this.width,
    this.height,
    this.memCacheWidth,
  });

  final String? url;
  final BoxFit fit;
  final double radius;
  final double? width;
  final double? height;
  final int? memCacheWidth;

  @override
  Widget build(BuildContext context) {
    final u = url;
    Widget child;
    if (u == null || u.isEmpty) {
      child = Container(color: context.skeleton);
    } else {
      child = CachedNetworkImage(
        imageUrl: u,
        fit: fit,
        width: width,
        height: height,
        memCacheWidth: memCacheWidth,
        fadeInDuration: Ds.normal,
        fadeOutDuration: Duration.zero,
        placeholder: (_, __) => Container(color: context.skeleton),
        errorWidget: (_, __, ___) => Container(
          color: context.skeleton,
          alignment: Alignment.center,
          child: Icon(Icons.image_not_supported_outlined, color: context.muted, size: 22),
        ),
      );
    }
    if (radius <= 0) return child;
    return ClipRRect(borderRadius: Ds.br(radius), child: child);
  }
}

class Avatar extends StatelessWidget {
  const Avatar(this.url, {super.key, this.size = 32, this.ring = false});

  final String? url;
  final double size;
  final bool ring;

  @override
  Widget build(BuildContext context) {
    final image = ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: url == null || url!.isEmpty
            ? Container(
                color: context.skeleton,
                child: Icon(Icons.person_rounded, size: size * 0.6, color: context.muted),
              )
            : AppImage(url, memCacheWidth: (size * 3).round()),
      ),
    );
    if (!ring) return image;
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(shape: BoxShape.circle, gradient: Ds.brandGradient),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).scaffoldBackgroundColor),
        child: image,
      ),
    );
  }
}

/// 押すと少し縮むラッパー
class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.scale = 0.96,
    this.haptic = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double scale;
  final bool haptic;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _down = false;

  void _set(bool v) {
    if (_down != v) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.onTap == null ? null : (_) => _set(true),
      onTapCancel: () => _set(false),
      onTapUp: (_) => _set(false),
      onTap: widget.onTap == null
          ? null
          : () {
              if (widget.haptic) Ds.tap();
              widget.onTap!();
            },
      onLongPress: widget.onLongPress,
      child: AnimatedScale(
        scale: _down ? widget.scale : 1,
        duration: Ds.fast,
        curve: Ds.curve,
        child: widget.child,
      ),
    );
  }
}

/// 読み込み中のきらっとする箱
class Skeleton extends StatefulWidget {
  const Skeleton({super.key, this.width, this.height, this.radius = 12});

  final double? width;
  final double? height;
  final double radius;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1300))..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = context.skeleton;
    final hi = context.isDark ? const Color(0xFF2E3138) : const Color(0xFFF7F8FA);
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        final t = _c.value * 3 - 1;
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: Ds.br(widget.radius),
            gradient: LinearGradient(
              begin: Alignment(t - 1, -0.3),
              end: Alignment(t + 1, 0.3),
              colors: [base, hi, base],
            ),
          ),
        );
      },
    );
  }
}

/// 空・エラーのときの表示
class StateView extends StatelessWidget {
  const StateView({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    this.compact = false,
  });

  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool compact;

  factory StateView.error(String message, {VoidCallback? onRetry}) => StateView(
        icon: Icons.cloud_off_rounded,
        title: 'うまく読み込めませんでした',
        message: message,
        actionLabel: onRetry == null ? null : 'もう一度読み込む',
        onAction: onRetry,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: compact ? 24 : 56),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.cs.primary.withValues(alpha: 0.1),
            ),
            child: Icon(icon, size: 34, color: context.cs.primary),
          ),
          const SizedBox(height: 16),
          Text(title, textAlign: TextAlign.center, style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          if (message != null) ...[
            const SizedBox(height: 8),
            Text(message!, textAlign: TextAlign.center, style: context.tt.bodyMedium?.copyWith(color: context.muted, height: 1.5)),
          ],
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: 20),
            FilledButton.tonal(onPressed: onAction, child: Text(actionLabel!)),
          ],
        ],
      ),
    );
  }
}

/// グラデーションの主ボタン
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.loading = false,
    this.gradient = Ds.brandGradient,
    this.height = 52,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool loading;
  final Gradient gradient;
  final double height;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !loading;
    return Pressable(
      onTap: enabled ? onPressed : null,
      child: AnimatedOpacity(
        duration: Ds.fast,
        opacity: enabled ? 1 : 0.5,
        child: Container(
          height: height,
          width: expand ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: Ds.br(height / 2),
            boxShadow: [
              BoxShadow(color: const Color(0xFF6D5DF6).withValues(alpha: 0.28), blurRadius: 18, offset: const Offset(0, 8)),
            ],
          ),
          child: Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loading)
                const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
              else ...[
                if (icon != null) ...[Icon(icon, color: Colors.white, size: 20), const SizedBox(width: 8)],
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// 見出し（右に「すべて見る」）
class SectionHeader extends StatelessWidget {
  const SectionHeader(this.title, {super.key, this.icon, this.trailing, this.onMore});

  final String title;
  final IconData? icon;
  final String? trailing;
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 8, 10),
      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, size: 20, color: context.cs.primary), const SizedBox(width: 6)],
          Expanded(child: Text(title, style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.2))),
          if (onMore != null)
            TextButton(
              onPressed: onMore,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(trailing ?? 'すべて見る'),
                const Icon(Icons.chevron_right_rounded, size: 18),
              ]),
            ),
        ],
      ),
    );
  }
}

/// 丸いタブ（横スクロール）
class PillTabs extends StatelessWidget {
  const PillTabs({super.key, required this.labels, required this.index, required this.onChanged, this.padding = const EdgeInsets.symmetric(horizontal: 16)});

  final List<String> labels;
  final int index;
  final ValueChanged<int> onChanged;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: labels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final selected = i == index;
          return Pressable(
            onTap: () => onChanged(i),
            child: AnimatedContainer(
              duration: Ds.normal,
              curve: Ds.curve,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: Ds.br(19),
                color: selected ? context.cs.onSurface : context.skeleton,
              ),
              child: Text(
                labels[i],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: selected ? context.cs.surface : context.cs.onSurface.withValues(alpha: 0.75),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 小さなラベル（R15・動画 など）
class Badge2 extends StatelessWidget {
  const Badge2(this.text, {super.key, this.icon, this.color});

  final String text;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color ?? Colors.black.withValues(alpha: 0.55),
        borderRadius: Ds.br(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 12, color: Colors.white), const SizedBox(width: 3)],
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

/// ログインが必要なときの案内
class LoginRequiredView extends StatelessWidget {
  const LoginRequiredView({super.key, required this.title, required this.message, required this.onLogin, this.icon = Icons.lock_person_rounded});

  final String title;
  final String message;
  final VoidCallback onLogin;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback: (r) => Ds.brandGradient.createShader(r),
              child: Icon(icon, size: 64, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(title, textAlign: TextAlign.center, style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center, style: context.tt.bodyMedium?.copyWith(color: context.muted, height: 1.6)),
            const SizedBox(height: 24),
            GradientButton(label: 'ログイン・新規登録', icon: Icons.login_rounded, onPressed: onLogin),
          ],
        ),
      ),
    );
  }
}
