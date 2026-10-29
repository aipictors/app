import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 下から出るシートの共通の見た目
Future<T?> showGenSheet<T>(BuildContext context, {required WidgetBuilder builder, bool expand = false, double initialSize = 0.9}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: !expand,
    backgroundColor: context.surfaceCard,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    constraints: const BoxConstraints(maxWidth: 720),
    builder: (context) {
      if (!expand) return builder(context);
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialSize,
        minChildSize: 0.4,
        maxChildSize: 1,
        builder: (context, controller) => PrimaryScrollController(controller: controller, child: builder(context)),
      );
    },
  );
}

/// シート上部のつまみ
class SheetHandle extends StatelessWidget {
  const SheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 6),
        width: 40,
        height: 5,
        decoration: BoxDecoration(color: context.hairline, borderRadius: Ds.br(3)),
      ),
    );
  }
}

/// アイコン・見出し・本文・ボタンだけの案内シート
class _InfoSheet extends StatelessWidget {
  const _InfoSheet({
    required this.icon,
    required this.title,
    required this.message,
    required this.primaryLabel,
    required this.onPrimary,
    this.gradient = Ds.brandGradient,
    this.extra,
  });

  final IconData icon;
  final String title;
  final String message;
  final String primaryLabel;
  final VoidCallback onPrimary;
  final Gradient gradient;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 4, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: gradient),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.tt.bodyMedium?.copyWith(color: context.muted, height: 1.6),
            ),
            if (extra != null) ...[const SizedBox(height: 16), extra!],
            const SizedBox(height: 24),
            GradientButton(label: primaryLabel, gradient: gradient, onPressed: onPrimary),
            const SizedBox(height: 8),
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('閉じる')),
          ],
        ),
      ),
    );
  }
}

/// コインが足りないとき
Future<void> showCoinShortageSheet(BuildContext context, {required int need, required int have}) {
  return showGenSheet(
    context,
    builder: (sheet) => _InfoSheet(
      icon: Icons.toll_rounded,
      gradient: Ds.goldGradient,
      title: 'コインが足りません',
      message: 'この生成には $need コインが必要です（残り $have コイン）。\n無料のコインは毎日付与されます。Aipictors+ に加入すると、毎月たくさんのコインと同時生成などの特典が使えます。',
      primaryLabel: 'プランを見る',
      onPrimary: () {
        Navigator.of(sheet).pop();
        Nav.plans(context);
      },
    ),
  );
}

/// プランが必要なとき
Future<void> showPlanRequiredSheet(BuildContext context, String message) {
  return showGenSheet(
    context,
    builder: (sheet) => _InfoSheet(
      icon: Icons.workspace_premium_rounded,
      title: 'Aipictors+ で使えます',
      message: message,
      primaryLabel: 'プランを見る',
      onPrimary: () {
        Navigator.of(sheet).pop();
        Nav.plans(context);
      },
    ),
  );
}

/// 本人確認が必要なとき（アプリでは確認できないので Web へ）
Future<void> showVerificationSheet(BuildContext context) {
  return showGenSheet(
    context,
    builder: (sheet) => _InfoSheet(
      icon: Icons.verified_user_rounded,
      title: '本人確認をお願いします',
      message: '無料プランで続けて生成するには、本人確認（LINE 連携）が必要です。Web の生成画面で確認を済ませると、アプリでもそのまま生成できます。\nAipictors+ に加入している場合は確認は不要です。',
      primaryLabel: 'Web で本人確認する',
      onPrimary: () {
        Navigator.of(sheet).pop();
        launchUrl(Uri.parse('https://www.aipictors.com/generation'), mode: LaunchMode.externalApplication);
      },
      extra: OutlinedButton(
        onPressed: () {
          Navigator.of(sheet).pop();
          Nav.plans(context);
        },
        child: const Text('プランを見る'),
      ),
    ),
  );
}

/// 画像生成の利用規約（同意すると true）
Future<bool> showTermsSheet(BuildContext context, {required Future<String?> Function() onAgree}) async {
  final agreed = await showGenSheet<bool>(context, expand: true, initialSize: 0.92, builder: (sheet) => _TermsSheet(onAgree: onAgree));
  return agreed == true;
}

class _TermsSheet extends StatefulWidget {
  const _TermsSheet({required this.onAgree});

  final Future<String?> Function() onAgree;

  @override
  State<_TermsSheet> createState() => _TermsSheetState();
}

class _TermsSheetState extends State<_TermsSheet> {
  bool _checked = false;
  bool _sending = false;

  /// Web の利用規約（app/assets/terms.md）の「生成機能では、以下の利用は禁止されております。」の節
  static const _points = [
    (Icons.gavel_rounded, '法的な観点より性器または性器を連想する部位（スジの表現を含む）、性器結合部位及び挿入部位、アヌス結合部位及び挿入部位の無修正画像（AIにより当該部位に修正がされたものを含む）の生成を行わないで下さい。イラスト・リアルに関わらず無修正画像は禁止です。'),
    (Icons.person_off_rounded, '複数アカウントでの生成利用は禁止です。'),
    (Icons.block_rounded, '児童ポルノと誤認される恐れのある画像の生成は禁止です。リアルな作風で、18歳未満に見える性的表現を含んだ生成は禁止です。'),
    (Icons.school_rounded, '性的描写を含むリアルな作風で、学生服や、背景が学校であるなど、児童ポルノと疑われる可能性がある表現を含んだ生成は禁止です。'),
    (Icons.info_outline_rounded, '性的表現には、水着、肌の露出の多い衣装、えっちなポーズ、精液等の描写も含まれます。'),
    (Icons.edit_note_rounded, 'AIにより上記の禁止事項が生成されないようにプロンプトを指定いただくようお願いいたします。性的な描写を含む可能性が高く心配な場合は、イラスト系のモデルをご利用下さい。'),
    (Icons.fact_check_rounded, '生成結果は手動削除されたもの含めすべてチェックされ、不適切な利用が確認された場合は利用を停止させていただきます。'),
  ];

  Future<void> _agree() async {
    setState(() => _sending = true);
    final error = await widget.onAgree();
    if (!mounted) return;
    setState(() => _sending = false);
    if (error != null) {
      context.toast(error, error: true);
      return;
    }
    Ds.success();
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SheetHandle(),
        Expanded(
          child: ListView(
            controller: PrimaryScrollController.of(context),
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              ShaderMask(
                shaderCallback: (r) => Ds.brandGradient.createShader(r),
                child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 44),
              ),
              const SizedBox(height: 12),
              Text(
                '画像生成の利用規約',
                textAlign: TextAlign.center,
                style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                '生成機能では、以下の利用は禁止されております',
                textAlign: TextAlign.center,
                style: context.tt.bodyMedium?.copyWith(color: context.muted),
              ),
              const SizedBox(height: 20),
              for (final p in _points)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(16)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(p.$1, color: context.cs.primary, size: 22),
                      const SizedBox(width: 12),
                      Expanded(child: Text(p.$2, style: context.tt.bodyMedium?.copyWith(height: 1.55))),
                    ],
                  ),
                ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse('https://www.aipictors.com/generation/terms'), mode: LaunchMode.inAppBrowserView),
                  icon: const Icon(Icons.open_in_new_rounded, size: 18),
                  label: const Text('利用規約の全文を読む'),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Pressable(
                  onTap: () => setState(() => _checked = !_checked),
                  child: Row(
                    children: [
                      Checkbox(value: _checked, onChanged: (v) => setState(() => _checked = v ?? false)),
                      const Expanded(child: Text('利用規約を読み、同意します')),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                GradientButton(label: '同意して生成をはじめる', icon: Icons.check_rounded, loading: _sending, onPressed: _checked ? _agree : null),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
