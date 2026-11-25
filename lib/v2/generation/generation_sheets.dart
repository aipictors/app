import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:aipictors/v2/work/moderation.dart';
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
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(tr('閉じる', 'Close'))),
          ],
        ),
      ),
    );
  }
}

/// コインが足りないとき
/// 加入中の人が毎日の上限まで使ったら、上のプラン（ライト → スタンダード、スタンダード → プレミアム）か、
/// プレミアムなら「今日だけ +100枚」のコイン購入を案内する（Web の生成画面と同じ流れ。金額は App Store の値段と食い違うので書かない）
Future<void> showCoinShortageSheet(BuildContext context, {required int need, required int have, String? passType, bool exhausted = false}) {
  final daily = switch (passType) { 'LITE' => 50, 'STANDARD' => 100, 'PREMIUM' => 200, _ => null };
  if (passType == null || daily == null) {
    return showGenSheet(
      context,
      builder: (sheet) => _InfoSheet(
        icon: Icons.toll_rounded,
        gradient: Ds.goldGradient,
        title: tr('コインが足りません', 'Not enough coins'),
        message: tr('この生成には $need コインが必要です（残り $have コイン）。\n無料のコインは毎日付与されます。Aipictors+ に加入すると、毎月たくさんのコインと同時生成などの特典が使えます。', 'This generation needs $need coins (you have $have).\nFree coins are granted every day. Aipictors+ gives you plenty of coins every month, simultaneous generation, and more.'),
        primaryLabel: tr('プランを見る', 'See plans'),
        onPrimary: () {
          Navigator.of(sheet).pop();
          Nav.plans(context);
        },
      ),
    );
  }
  final title = exhausted ? tr('今日の$daily枚を使い切りました', "You've used today's $daily images") : tr('コインが足りません', 'Not enough coins');
  void openPlans(BuildContext sheet) {
    Navigator.of(sheet).pop();
    Nav.plans(context);
  }

  void openCoins(BuildContext sheet) {
    Navigator.of(sheet).pop();
    showCoinShopSheet(context);
  }

  if (passType == 'PREMIUM') {
    return showGenSheet(
      context,
      builder: (sheet) => _InfoSheet(
        icon: Icons.toll_rounded,
        gradient: Ds.goldGradient,
        title: title,
        message: tr('今日もっと作りたい日は、コインを足して続けられます。\n1,000コインで約100枚。余った分も3か月使えます。', 'Want to keep going today? Top up with coins.\n1,000 coins make about 100 images, and leftovers last 3 months.'),
        primaryLabel: tr('今日だけ +100枚（コインを買う）', '+100 images today (buy coins)'),
        onPrimary: () => openCoins(sheet),
      ),
    );
  }
  final isLite = passType == 'LITE';
  final benefits = isLite
      ? [tr('1日100枚（今の2倍）', '100 a day (2x now)'), tr('生成がいちばん先', 'First in the queue'), tr('同時に2本・予約生成', '2 at once · queued runs'), tr('Nano Banana 2・高速モード', 'Nano Banana 2 · fast mode')]
      : [tr('1日200枚（今の2倍）', '200 a day (2x now)'), tr('生成画像の保存 2年（今は1年）', 'Images kept 2 years (now 1)'), tr('モデル登録 毎月150GB（今は60GB）', '150GB of model uploads a month (now 60GB)'), tr('同時に3本まで', 'Up to 3 at once')];
  final planName = isLite ? tr('スタンダード', 'Standard') : tr('プレミアム', 'Premium');
  return showGenSheet(
    context,
    builder: (sheet) => _InfoSheet(
      icon: Icons.workspace_premium_rounded,
      title: title,
      message: tr('$planNameなら、もっと作れます。', 'Create more with $planName.'),
      extra: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final b in benefits)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Icon(Icons.check_circle_rounded, size: 18, color: context.cs.primary),
                  const SizedBox(width: 8),
                  Expanded(child: Text(b, style: context.tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600))),
                ],
              ),
            ),
          if (!isLite) ...[
            const SizedBox(height: 8),
            Center(
              child: TextButton.icon(
                onPressed: () => openCoins(sheet),
                icon: const Icon(Icons.toll_rounded, size: 18),
                label: Text(tr('今日だけ +100枚（コインを買う）', '+100 images today (buy coins)')),
              ),
            ),
          ],
        ],
      ),
      primaryLabel: tr('$planNameにする', 'Switch to $planName'),
      onPrimary: () => openPlans(sheet),
    ),
  );
}

/// プランが必要なとき
Future<void> showPlanRequiredSheet(BuildContext context, String message) {
  return showGenSheet(
    context,
    builder: (sheet) => _InfoSheet(
      icon: Icons.workspace_premium_rounded,
      title: tr('Aipictors+ で使えます', 'Available with Aipictors+'),
      message: message,
      primaryLabel: tr('プランを見る', 'See plans'),
      onPrimary: () {
        Navigator.of(sheet).pop();
        Nav.plans(context);
      },
    ),
  );
}

List<(String, String)> get _userModelReportReasons => [
  ('COPYRIGHT', tr('著作権の侵害', 'Copyright infringement')),
  ('REAL_PERSON', tr('実在の人物を扱っている', 'Depicts a real person')),
  ('ILLEGAL', tr('違法・不適切な内容', 'Illegal or inappropriate content')),
  ('WRONG_RATING', tr('年齢制限の設定が正しくない', 'Wrong age rating')),
  ('BROKEN', tr('動かない・壊れている', 'Does not work / broken')),
  ('SPAM', tr('宣伝・スパム', 'Advertising / spam')),
  ('OTHER', tr('その他', 'Other')),
];

/// みんなのモデルの通報・作者のブロック。作者をブロックしたら true
Future<bool> showUserModelActions(BuildContext context, UserModel model) async {
  final action = await showGenSheet<String>(
    context,
    builder: (sheet) => SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.flag_outlined),
            title: Text(tr('このモデルを通報する', 'Report this model')),
            onTap: () => Navigator.of(sheet).pop('report'),
          ),
          if (model.authorId != null)
            ListTile(
              leading: const Icon(Icons.block_rounded),
              title: Text(tr('${model.authorName ?? '作者'}さんをブロックする', 'Block ${model.authorName ?? 'creator'}')),
              onTap: () => Navigator.of(sheet).pop('block'),
            ),
        ],
      ),
    ),
  );
  if (!context.mounted) return false;
  if (action == 'block') return blockUser(context, model.authorId!, model.authorName ?? tr('作者', 'Creator'));
  if (action != 'report') return false;
  final reason = await showGenSheet<String>(
    context,
    builder: (sheet) => SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(tr('通報の理由', 'Reason for report'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            ),
            for (final r in _userModelReportReasons) ListTile(title: Text(r.$2), onTap: () => Navigator.of(sheet).pop(r.$1)),
          ],
        ),
      ),
    ),
  );
  if (reason == null || !context.mounted) return false;
  try {
    await GenApi.reportUserModel(model.id, reason: reason);
    if (context.mounted) context.toast(tr('通報しました。ご協力ありがとうございます', 'Reported. Thank you for your help.'), icon: Icons.flag_rounded);
  } on ApiException catch (e) {
    if (context.mounted) context.toast(e.message, error: true);
  }
  return false;
}

/// コインの履歴
Future<void> showCoinHistorySheet(BuildContext context) {
  return showGenSheet(context, expand: true, initialSize: 0.8, builder: (_) => const _CoinHistorySheet());
}

class _CoinHistorySheet extends StatefulWidget {
  const _CoinHistorySheet();

  @override
  State<_CoinHistorySheet> createState() => _CoinHistorySheetState();
}

class _CoinHistorySheetState extends State<_CoinHistorySheet> {
  static const _limit = 30;
  final List<CoinLedgerItem> _items = [];
  bool _loading = true;
  bool _hasMore = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final page = await GenApi.coinLedger(offset: _items.length, limit: _limit);
      if (!mounted) return;
      setState(() {
        _items.addAll(page);
        _hasMore = page.length >= _limit;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } catch (_) {
      if (mounted) setState(() => _error = tr('コインの履歴を読み込めませんでした', 'Could not load coin history'));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    String two(int v) => v.toString().padLeft(2, '0');
    return Column(
      children: [
        const SheetHandle(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(tr('コインの履歴', 'Coin history'), style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
          ),
        ),
        Expanded(
          child: _items.isEmpty && _loading
              ? const SkeletonList()
              : _items.isEmpty && _error != null
              ? StateView.error(_error!, onRetry: _load)
              : _items.isEmpty
              ? StateView(icon: Icons.receipt_long_rounded, title: tr('まだ履歴はありません', 'No history yet'), message: tr('生成するとここに記録されます', 'Your generations will be recorded here'))
              : ListView.builder(
                  controller: PrimaryScrollController.of(context),
                  itemCount: _items.length + (_hasMore ? 1 : 0),
                  itemBuilder: (context, i) {
                    if (i == _items.length) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextButton(onPressed: _loading ? null : _load, child: Text(tr('続きを読み込む', 'Load more'))),
                      );
                    }
                    final row = _items[i];
                    final d = DateTime.fromMillisecondsSinceEpoch(row.createdAt * 1000);
                    final minus = row.amount < 0;
                    final amount = row.amount.abs();
                    return ListTile(
                      dense: true,
                      title: Text(row.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                      subtitle: Text([if (row.detail.isNotEmpty) row.detail, '${d.month}/${d.day} ${two(d.hour)}:${two(d.minute)}'].join(' ・ ')),
                      trailing: Text(
                        '${minus ? '-' : '+'}$amount',
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: minus ? context.muted : Ds.gold),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

/// 今週の Gemini の枠を使い切ったとき
Future<void> showGeminiLimitSheet(BuildContext context, {required int coinCost, required int premium, required bool isPaid}) {
  return showGenSheet(
    context,
    builder: (sheet) => _InfoSheet(
      icon: Icons.auto_awesome_rounded,
      title: tr('今週の Gemini の枠を使い切りました', 'You have used this week’s Gemini allowance'),
      message: tr('毎日のフリーコインから Gemini に使える量には週の枠があります。月曜0時に枠が戻ります。\n今すぐ作るときは、1枚につきプレミアムコイン$coinCost枚を使います（残り$premium枚）。', 'There is a weekly limit on how much of your daily free coins can be used for Gemini. It resets Monday 0:00 JST.\nTo generate now, each image costs $coinCost premium coins ($premium left).'),
      primaryLabel: tr('プランを見る', 'See plans'),
      onPrimary: () {
        Navigator.of(sheet).pop();
        Nav.plans(context);
      },
    ),
  );
}

/// 本人確認が必要なとき。Web の生成画面にはプランの案内があるのでリンクは置かず、文章で案内する
Future<void> showVerificationSheet(BuildContext context) {
  return showGenSheet(
    context,
    builder: (sheet) => _InfoSheet(
      icon: Icons.verified_user_rounded,
      title: tr('本人確認をお願いします', 'Verification required'),
      message: tr('無料プランで続けて生成するには、本人確認（LINE 連携）が必要です。本人確認はアプリの中ではできません。パソコンなどのブラウザで Aipictors にログインして済ませると、アプリでも続けて生成できます。', 'To keep generating on the free plan, you need to verify your identity (LINE link). This cannot be done in the app. Log in to Aipictors in a web browser on a computer or similar to complete it, then you can keep generating in the app.'),
      primaryLabel: tr('閉じる', 'Close'),
      onPrimary: () => Navigator.of(sheet).pop(),
      extra: OutlinedButton(
        onPressed: () {
          Navigator.of(sheet).pop();
          Nav.plans(context);
        },
        child: Text(tr('プランを見る', 'See plans')),
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
  static List<(IconData, String)> get _points => [
    (Icons.gavel_rounded, tr('法的な観点より性器または性器を連想する部位（スジの表現を含む）、性器結合部位及び挿入部位、アヌス結合部位及び挿入部位の無修正画像（AIにより当該部位に修正がされたものを含む）の生成を行わないで下さい。イラスト・リアルに関わらず無修正画像は禁止です。', 'For legal reasons, do not generate uncensored images of genitals or parts suggestive of genitals (including slit depictions), genital penetration, or anal penetration (including images where AI has altered these areas). Uncensored images are prohibited for both illustrations and realistic styles.')),
    (Icons.person_off_rounded, tr('複数アカウントでの生成利用は禁止です。', 'Using generation from multiple accounts is prohibited.')),
    (Icons.block_rounded, tr('児童ポルノと誤認される恐れのある画像の生成は禁止です。リアルな作風で、18歳未満に見える性的表現を含んだ生成は禁止です。', 'Generating images that could be mistaken for child pornography is prohibited. Realistic images with sexual content depicting people who appear under 18 are prohibited.')),
    (Icons.school_rounded, tr('性的描写を含むリアルな作風で、学生服や、背景が学校であるなど、児童ポルノと疑われる可能性がある表現を含んだ生成は禁止です。', 'Realistic images with sexual content that could be suspected as child pornography, such as school uniforms or school backgrounds, are prohibited.')),
    (Icons.info_outline_rounded, tr('性的表現には、水着、肌の露出の多い衣装、えっちなポーズ、精液等の描写も含まれます。', 'Sexual content includes swimsuits, revealing outfits, suggestive poses, depictions of semen, and similar.')),
    (Icons.edit_note_rounded, tr('AIにより上記の禁止事項が生成されないようにプロンプトを指定いただくようお願いいたします。性的な描写を含む可能性が高く心配な場合は、イラスト系のモデルをご利用下さい。', 'Please write your prompts so the AI does not generate any of the prohibited content above. If you are worried your images may include sexual content, please use an illustration model.')),
    (Icons.fact_check_rounded, tr('生成結果は手動削除されたもの含めすべてチェックされ、不適切な利用が確認された場合は利用を停止させていただきます。', 'All generated images, including manually deleted ones, are reviewed. If inappropriate use is found, your access will be suspended.')),
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
                tr('画像生成の利用規約', 'Image generation terms'),
                textAlign: TextAlign.center,
                style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                tr('生成機能では、以下の利用は禁止されております', 'The following uses of the generator are prohibited'),
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
                  label: Text(tr('利用規約の全文を読む', 'Read the full terms')),
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
                      Expanded(child: Text(tr('利用規約を読み、同意します', 'I have read and agree to the terms'))),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                GradientButton(label: tr('同意して生成をはじめる', 'Agree and start generating'), icon: Icons.check_rounded, loading: _sending, onPressed: _checked ? _agree : null),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
