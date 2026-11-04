import 'package:aipictors/v2/core/design.dart';
import 'package:flutter/material.dart';

/// プロフィールのステータス。Discord のような、アイコンの横の吹き出し（Web の UserProfileStatus と同じ形）。
/// 長い文は 2 行で省略し、押すと全文を出す。[onTap] を渡すと代わりにそれを呼ぶ（自分のページの編集など）。
class StatusBalloon extends StatefulWidget {
  const StatusBalloon(this.text, {super.key, this.onTap, this.maxWidth = 240});

  final String text;
  final VoidCallback? onTap;
  final double maxWidth;

  @override
  State<StatusBalloon> createState() => _StatusBalloonState();
}

class _StatusBalloonState extends State<StatusBalloon> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final color = context.isDark ? const Color(0xFF23252B) : Colors.white;
    final line = context.isDark ? context.cs.onSurface.withValues(alpha: 0.18) : context.hairline;
    final shadow = BoxShadow(color: Colors.black.withValues(alpha: 0.14), blurRadius: 12, offset: const Offset(0, 4));

    Widget dot(double size) => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: line), boxShadow: [shadow]),
        );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Ds.tap();
        if (widget.onTap != null) {
          widget.onTap!();
        } else {
          setState(() => _expanded = !_expanded);
        }
      },
      child: Semantics(
        button: true,
        label: widget.text,
        // 下の丸 2 つの分だけ下に余白を取り、大きい丸は本体の下にもぐらせてつなげる
        child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(left: 4, bottom: -14, child: dot(8)),
              Positioned(left: 16, bottom: -6, child: dot(16)),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: widget.maxWidth),
                child: AnimatedSize(
                  duration: Ds.fast,
                  curve: Ds.curve,
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: Ds.br(24),
                      border: Border.all(color: line),
                      boxShadow: [shadow],
                    ),
                    child: Text(
                      widget.text,
                      maxLines: _expanded ? null : 2,
                      overflow: _expanded ? null : TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 1.375, color: context.cs.onSurface),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
