import 'package:aipictors/v2/community/messages_screen.dart' show mockSend;
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/plans/coin_shop.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// 宣伝枠をプレミアムコインで買う（Web の work-promotion-button.tsx・utils/work-promotion-slot.ts と同じ API・値）。
// 枠は全年齢（全年齢・R15）と R18（R18・R18G）で 1 作品ずつ。アプリは R18 を出さないので全年齢の枠だけ扱う。

/// 宣伝枠の種類（API の WorkPromotionSlot）
enum WorkPromotionSlot { general, sensitive }

/// 作品の対象年齢から使う枠（R18・R18G は R18 の枠）
WorkPromotionSlot workPromotionSlotOf(String? rating) => rating == 'R18' || rating == 'R18G' ? WorkPromotionSlot.sensitive : WorkPromotionSlot.general;

/// アプリで「宣伝する」を出せる作品か（公開中・公開済み・全年齢の枠）
bool canPromoteInApp({required String? rating, required String? accessType, int createdAt = 0, DateTime? now}) {
  if (accessType != 'PUBLIC') return false;
  // 予約投稿（まだ公開されていない）は出さない
  if (createdAt * 1000 > (now ?? DateTime.now()).millisecondsSinceEpoch) return false;
  return workPromotionSlotOf(rating) == WorkPromotionSlot.general;
}

/// いま出ている自分の宣伝（API の ActiveWorkPromotionNode）
class ActiveWorkPromotion {
  const ActiveWorkPromotion({required this.slot, required this.workId, required this.endsAt, this.isPurchased = true});

  final WorkPromotionSlot slot;
  final String workId;

  /// 終わる時刻（UNIX 秒）
  final int endsAt;

  /// コインで買った宣伝（false はプランの宣伝）
  final bool isPurchased;

  static ActiveWorkPromotion fromJson(Map<String, dynamic> j) => ActiveWorkPromotion(
        slot: j.str('slot') == 'SENSITIVE' ? WorkPromotionSlot.sensitive : WorkPromotionSlot.general,
        workId: j.str('workId'),
        endsAt: j.integer('endsAt'),
        isPurchased: j.boolean('isPurchased', true),
      );
}

enum WorkPromotionSlotKind { available, thisWork, otherWork }

/// 枠がこの作品で使えるか（Web の toWorkPromotionSlotState）
class WorkPromotionSlotState {
  const WorkPromotionSlotState._(this.kind, [this.endsAt, this.otherWorkId]);

  static const available = WorkPromotionSlotState._(WorkPromotionSlotKind.available);

  final WorkPromotionSlotKind kind;
  final int? endsAt;

  /// 枠を使っている別の作品
  final String? otherWorkId;

  static WorkPromotionSlotState of({required WorkPromotionSlot slot, required String workId, required List<ActiveWorkPromotion> active}) {
    for (final p in active) {
      if (p.slot != slot) continue;
      return p.workId == workId ? WorkPromotionSlotState._(WorkPromotionSlotKind.thisWork, p.endsAt) : WorkPromotionSlotState._(WorkPromotionSlotKind.otherWork, p.endsAt, p.workId);
    }
    return available;
  }

  @override
  bool operator ==(Object other) => other is WorkPromotionSlotState && other.kind == kind && other.endsAt == endsAt && other.otherWorkId == otherWorkId;

  @override
  int get hashCode => Object.hash(kind, endsAt, otherWorkId);
}

/// 今から買ったときに終わる時刻（UNIX 秒。API と同じく今 + 日数）
int workPromotionEndsAt(DateTime now, int days) => now.millisecondsSinceEpoch ~/ 1000 + days * 86400;

/// 終わる日時（日本時間。Web の toDateTimeText と同じく月・日・時・分）。日本語「11月30日 14:05」、英語「Nov 30, 14:05」
String formatPromotionEnd(int unixSeconds) {
  final d = DateTime.fromMillisecondsSinceEpoch(unixSeconds * 1000, isUtc: true).add(const Duration(hours: 9));
  final hm = '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
  return L10n.isJa ? '${d.month}月${d.day}日 $hm' : '${DateFormat.MMMd('en_US').format(d)}, $hm';
}

/// 終わる日（バッジ用。日本語「11月30日」、英語「Nov 30」）
String formatPromotionEndDay(int unixSeconds) {
  final d = DateTime.fromMillisecondsSinceEpoch(unixSeconds * 1000, isUtc: true).add(const Duration(hours: 9));
  return L10n.isJa ? '${d.month}月${d.day}日' : DateFormat.MMMd('en_US').format(d);
}

/// 払ったあとの残り。足りなければ null
int? premiumAfterPurchase(int premium, int price) => premium >= price ? premium - price : null;

/// コインで買う宣伝枠の値段と日数（API の workPromotionPlan。読めないときは Web と同じ 500 枚・7 日）
class WorkPromotionPlan {
  const WorkPromotionPlan({this.priceCoins = 500, this.days = 7});

  final int priceCoins;
  final int days;
}

class WorkPromotionStatus {
  const WorkPromotionStatus({required this.plan, required this.active});

  final WorkPromotionPlan plan;
  final List<ActiveWorkPromotion> active;

  ActiveWorkPromotion? activeFor(String workId) {
    for (final p in active) {
      if (p.workId == workId) return p;
    }
    return null;
  }
}

class WorkPromotionApi {
  WorkPromotionApi._();

  static Future<WorkPromotionStatus> status() async {
    final data = await Api.query('''
query AppWorkPromotionStatus {
  workPromotionPlan { priceCoins days }
  viewerActiveWorkPromotions { slot workId endsAt isPurchased }
}''');
    final plan = data.obj('workPromotionPlan');
    return WorkPromotionStatus(
      plan: plan == null ? const WorkPromotionPlan() : WorkPromotionPlan(priceCoins: plan.integer('priceCoins', 500), days: plan.integer('days', 7)),
      active: data.list('viewerActiveWorkPromotions').map(ActiveWorkPromotion.fromJson).toList(),
    );
  }

  /// 宣伝枠を買う（本番のプレミアムコインを使う）。終わる時刻（UNIX 秒）を返す
  static Future<int> purchase(String workId, {required int days}) async {
    // リリースビルド以外では送らない（メッセージの mockSend と同じ。本番のコインを使わない）
    if (mockSend) {
      await Future<void>.delayed(const Duration(milliseconds: 600));
      return workPromotionEndsAt(DateTime.now(), days);
    }
    final data = await Api.mutate('''
mutation AppPurchaseWorkPromotion(\$input: PurchaseWorkPromotionInput!) {
  purchaseWorkPromotion(input: \$input) { slot workId endsAt }
}''', variables: {
      'input': {'workId': workId},
    });
    return data.obj('purchaseWorkPromotion')?.integer('endsAt') ?? workPromotionEndsAt(DateTime.now(), days);
  }
}

/// 宣伝枠の色（Web の PROMOTION_FRAME_CLASS: amber → pink → violet）
const workPromotionGradient = LinearGradient(colors: [Color(0xFFFBBF24), Color(0xFFEC4899), Color(0xFF8B5CF6)]);

/// 宣伝作品のしるし（Web の WorkPromotionMark）
class WorkPromotionMark extends StatelessWidget {
  const WorkPromotionMark({super.key, this.fontSize = 10});

  final double fontSize;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFFBBF24), Color(0xFFEC4899)]),
          borderRadius: Ds.br(4),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 3)],
        ),
        child: Text('PR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: fontSize, height: 1.1)),
      );
}

/// 作品画面の「宣伝中・〇月〇日まで」（作者本人だけ）。押すと宣伝のシート
class WorkPromotionActiveBadge extends StatelessWidget {
  const WorkPromotionActiveBadge({super.key, required this.endsAt, this.onTap});

  final int endsAt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Pressable(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(1.2),
          decoration: BoxDecoration(gradient: workPromotionGradient, borderRadius: Ds.br(20)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(19)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const WorkPromotionMark(),
              const SizedBox(width: 6),
              Text(
                tr('宣伝中・${formatPromotionEndDay(endsAt)}まで', 'Promoted until ${formatPromotionEndDay(endsAt)}'),
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5),
              ),
            ]),
          ),
        ),
      );
}

/// 作品画面の「この作品を宣伝する」（作者本人・公開中・全年齢だけ）
class WorkPromotionEntryTile extends StatelessWidget {
  const WorkPromotionEntryTile({super.key, required this.plan, required this.onTap});

  final WorkPromotionPlan plan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: Ds.br(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: 10),
            decoration: BoxDecoration(borderRadius: Ds.br(12), border: Border.all(color: context.hairline)),
            child: Row(children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(gradient: workPromotionGradient, shape: BoxShape.circle),
                child: const Icon(Icons.campaign_rounded, color: Colors.white, size: 18),
              ),
              const SizedBox(width: Ds.s12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(tr('この作品を宣伝する', 'Promote this work'), style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(
                    tr('プレミアムコイン${formatCount(plan.priceCoins)}枚で${plan.days}日間・プランなしでOK', '${formatCount(plan.priceCoins)} premium coins for ${plan.days} days · no plan needed'),
                    style: TextStyle(color: context.muted, fontSize: 12),
                  ),
                ]),
              ),
              Icon(Icons.chevron_right_rounded, color: context.muted),
            ]),
          ),
        ),
      );
}

/// 見本・確認用に状態を差し替える（デバッグの画面だけ）
class WorkPromotionSample {
  const WorkPromotionSample({required this.status, required this.balance});

  final WorkPromotionStatus status;
  final CoinSummary balance;
}

/// 宣伝のシートを開く。買えたら終わる時刻（UNIX 秒）を返す
Future<int?> showWorkPromotionSheet(
  BuildContext context, {
  required String workId,
  required String title,
  String? imageUrl,
  required String userName,
  String? userIconUrl,
  WorkPromotionSample? sample,
}) async {
  if (!Nav.requireLogin(context)) return null;
  int? purchased;
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (_) => WorkPromotionSheet(
      workId: workId,
      title: title,
      imageUrl: imageUrl,
      userName: userName,
      userIconUrl: userIconUrl,
      sample: sample,
      onPurchased: (endsAt) => purchased = endsAt,
    ),
  );
  return purchased;
}

/// 宣伝のシートの中身（[showWorkPromotionSheet] から開く。sample を渡すと API を読まずに表示だけ確かめられる）
class WorkPromotionSheet extends StatefulWidget {
  const WorkPromotionSheet({
    super.key,
    required this.workId,
    required this.title,
    required this.imageUrl,
    required this.userName,
    required this.userIconUrl,
    required this.sample,
    required this.onPurchased,
  });

  final String workId;
  final String title;
  final String? imageUrl;
  final String userName;
  final String? userIconUrl;
  final WorkPromotionSample? sample;
  final ValueChanged<int> onPurchased;

  @override
  State<WorkPromotionSheet> createState() => _WorkPromotionSheetState();
}

class _WorkPromotionSheetState extends State<WorkPromotionSheet> {
  WorkPromotionStatus? _status;
  CoinSummary? _balance;
  String? _error;
  bool _buying = false;

  /// 買えたときの終わる時刻（成功の表示に切り替える）
  int? _doneEndsAt;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final sample = widget.sample;
    if (sample != null) {
      setState(() {
        _status = sample.status;
        _balance = sample.balance;
      });
      return;
    }
    setState(() => _error = null);
    try {
      final results = await Future.wait([WorkPromotionApi.status(), Coins.summary()]);
      if (!mounted) return;
      setState(() {
        _status = results[0] as WorkPromotionStatus;
        _balance = results[1] as CoinSummary;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } catch (_) {
      if (mounted) setState(() => _error = tr('読み込めませんでした', "Couldn't load"));
    }
  }

  /// コインを買ったあとに残高だけ取り直す
  Future<void> _reloadBalance() async {
    if (widget.sample != null) return;
    try {
      final b = await Coins.summary();
      if (mounted) setState(() => _balance = b);
    } catch (_) {}
  }

  Future<void> _buyCoins() async {
    await showCoinShopSheet(context);
    if (mounted) await _reloadBalance();
  }

  Future<void> _purchase(WorkPromotionPlan plan, int premium) async {
    final after = premiumAfterPurchase(premium, plan.priceCoins) ?? 0;
    final endsAt = workPromotionEndsAt(DateTime.now(), plan.days);
    final ok = await showConfirmSheet(
      context,
      title: tr('プレミアムコインを${formatCount(plan.priceCoins)}枚使います', 'Use ${formatCount(plan.priceCoins)} premium coins?'),
      message: tr(
        '有償のプレミアムコインで支払います（無料コインは使えません）。\n${formatPromotionEnd(endsAt)}ごろまで宣伝され、残りは${formatCount(after)}枚になります。\n一度始めると取り消せず、コインは戻りません。',
        'Paid premium coins will be used (free coins can\'t be used).\nPromoted until about ${formatPromotionEnd(endsAt)}; ${formatCount(after)} coins will remain.\nOnce started, it can\'t be canceled or refunded.',
      ),
      confirmLabel: tr('宣伝を始める', 'Start promotion'),
    );
    if (!ok || !mounted) return;
    setState(() => _buying = true);
    try {
      final result = await WorkPromotionApi.purchase(widget.workId, days: plan.days);
      if (!mounted) return;
      Ds.impact();
      widget.onPurchased(result);
      setState(() {
        _doneEndsAt = result;
        _balance = CoinSummary(free: _balance?.free ?? 0, premium: after);
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.message.contains('プレミアムコインが足りません')) {
        // 別の端末で使ったなど。残高を取り直して、その場で買えるようにする
        await _reloadBalance();
        if (mounted) context.toast(tr('プレミアムコインが足りません', 'Not enough premium coins'), error: true);
        return;
      }
      context.toast(e.message, error: true);
      await _load();
    } finally {
      if (mounted) setState(() => _buying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = _status;
    final balance = _balance;
    Widget body;
    if (_doneEndsAt != null) {
      body = _done(context, _doneEndsAt!);
    } else if (_error != null) {
      body = StateView.error(_error!, onRetry: _load);
    } else if (status == null || balance == null) {
      body = const Padding(
        padding: EdgeInsets.symmetric(vertical: Ds.s20),
        child: Column(children: [Skeleton(height: 150, radius: 12), SizedBox(height: Ds.s12), Skeleton(height: 56, radius: 12), SizedBox(height: Ds.s12), Skeleton(height: 52, radius: 26)]),
      );
    } else {
      body = _content(context, status, balance);
    }
    return ContentWidth(
      maxWidth: 560,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s16 + MediaQuery.paddingOf(context).bottom),
        child: AnimatedSwitcher(duration: Ds.normal, child: KeyedSubtree(key: ValueKey(_doneEndsAt != null), child: body)),
      ),
    );
  }

  Widget _content(BuildContext context, WorkPromotionStatus status, CoinSummary balance) {
    final plan = status.plan;
    final state = WorkPromotionSlotState.of(slot: WorkPromotionSlot.general, workId: widget.workId, active: status.active);
    final after = premiumAfterPurchase(balance.premium, plan.priceCoins);
    final endsAt = workPromotionEndsAt(DateTime.now(), plan.days);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(gradient: workPromotionGradient, shape: BoxShape.circle),
          child: const Icon(Icons.campaign_rounded, color: Colors.white),
        ),
        const SizedBox(width: Ds.s12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(tr('この作品を宣伝する', 'Promote this work'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            Text(
              tr('プレミアムコイン${formatCount(plan.priceCoins)}枚で、今から${plan.days}日間。プランに入っていなくても使えます', '${formatCount(plan.priceCoins)} premium coins for ${plan.days} days from now. No plan needed'),
              style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.4),
            ),
          ]),
        ),
      ]),
      const SizedBox(height: Ds.s16),
      Text(tr('宣伝するとこう表示されます', 'How it will appear'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
      const SizedBox(height: Ds.s8),
      _Preview(title: widget.title, imageUrl: widget.imageUrl, userName: widget.userName, userIconUrl: widget.userIconUrl),
      const SizedBox(height: Ds.s16),
      if (state.kind == WorkPromotionSlotKind.thisWork) ...[
        _notice(context, Icons.check_circle_rounded, tr('この作品は宣伝中です（${formatPromotionEnd(state.endsAt!)} まで）', 'This work is being promoted until ${formatPromotionEnd(state.endsAt!)}'), highlight: true),
        const SizedBox(height: Ds.s12),
        SecondaryButton(label: tr('閉じる', 'Close'), onPressed: () => Navigator.pop(context)),
      ] else if (state.kind == WorkPromotionSlotKind.otherWork) ...[
        _notice(
          context,
          Icons.info_outline_rounded,
          tr('全年齢の枠は別の作品で使っています（${formatPromotionEnd(state.endsAt!)} まで）。終わってから出せます',
              'Your all-ages slot is in use until ${formatPromotionEnd(state.endsAt!)}. You can promote another work after it ends'),
        ),
        const SizedBox(height: Ds.s12),
        SecondaryButton(
          label: tr('宣伝中の作品を見る', 'See the promoted work'),
          icon: Icons.open_in_new_rounded,
          onPressed: () {
            Navigator.pop(context);
            Nav.work(context, state.otherWorkId!);
          },
        ),
      ] else ...[
        _row(context, Icons.schedule_rounded, tr('期間', 'Period'), tr('今から ${formatPromotionEnd(endsAt)} まで（${plan.days}日間）', 'Now until ${formatPromotionEnd(endsAt)} (${plan.days} days)')),
        const SizedBox(height: Ds.s8),
        _balanceRow(context, balance.premium, plan.priceCoins, after),
        const SizedBox(height: Ds.s12),
        Text(
          tr(
            '・無料コインは使えません（プレミアムコイン＝有償のみ）\n・宣伝できるのは全年齢で1作品ずつ。終わると次の作品を出せます\n・一度始めると取り消せず、コインは戻りません',
            '• Free coins can\'t be used (paid premium coins only)\n• One all-ages work at a time. You can promote another when it ends\n• Once started, it can\'t be canceled or refunded',
          ),
          style: TextStyle(color: context.muted, fontSize: 12, height: 1.6),
        ),
        const SizedBox(height: Ds.s16),
        if (after == null) ...[
          Text(
            tr('プレミアムコインがあと${formatCount(plan.priceCoins - balance.premium)}枚足りません', '${formatCount(plan.priceCoins - balance.premium)} more premium coins needed'),
            textAlign: TextAlign.center,
            style: TextStyle(color: context.cs.error, fontWeight: FontWeight.w700, fontSize: 13),
          ),
          const SizedBox(height: Ds.s8),
          GradientButton(label: tr('プレミアムコインを買う', 'Buy premium coins'), icon: Icons.diamond_rounded, onPressed: _buyCoins),
          const SizedBox(height: Ds.s6),
          Text(
            tr('買ったあとはこの画面に戻って、そのまま宣伝できます', 'After buying, come back here to continue'),
            textAlign: TextAlign.center,
            style: TextStyle(color: context.muted, fontSize: 11.5),
          ),
        ] else
          GradientButton(
            label: tr('${formatCount(plan.priceCoins)}枚で${plan.days}日間宣伝する', 'Promote for ${plan.days} days (${formatCount(plan.priceCoins)} coins)'),
            icon: Icons.campaign_rounded,
            gradient: workPromotionGradient,
            loading: _buying,
            onPressed: _buying ? null : () => _purchase(plan, balance.premium),
          ),
      ],
    ]);
  }

  Widget _done(BuildContext context, int endsAt) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Ds.s12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(gradient: workPromotionGradient, shape: BoxShape.circle),
              child: const Icon(Icons.celebration_rounded, color: Colors.white, size: 36),
            ),
          ),
          const SizedBox(height: Ds.s16),
          Text(tr('宣伝を始めました', 'Your work is now promoted'), textAlign: TextAlign.center, style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: Ds.s8),
          Text(
            tr('${formatPromotionEnd(endsAt)} まで、ホームの「おすすめ作品」の先頭に PR の印付きで表示されます', 'Shown first in Recommended works on the home page, with a PR mark, until ${formatPromotionEnd(endsAt)}'),
            textAlign: TextAlign.center,
            style: TextStyle(color: context.muted, height: 1.5),
          ),
          const SizedBox(height: Ds.s12),
          Center(child: WorkPromotionActiveBadge(endsAt: endsAt)),
          if (_balance != null) ...[
            const SizedBox(height: Ds.s12),
            Text(
              tr('プレミアムコインの残り ${formatCount(_balance!.premium)} 枚', '${formatCount(_balance!.premium)} premium coins left'),
              textAlign: TextAlign.center,
              style: TextStyle(color: context.muted, fontSize: 12),
            ),
          ],
          const SizedBox(height: Ds.s20),
          PrimaryButton(label: tr('閉じる', 'Close'), onPressed: () => Navigator.pop(context)),
        ]),
      );

  Widget _notice(BuildContext context, IconData icon, String text, {bool highlight = false}) => Container(
        padding: const EdgeInsets.all(Ds.s12),
        decoration: BoxDecoration(
          color: highlight ? Ds.pink.withValues(alpha: 0.08) : context.skeleton.withValues(alpha: 0.7),
          borderRadius: Ds.br(12),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, size: 18, color: highlight ? Ds.pink : context.muted),
          const SizedBox(width: Ds.s8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13.5, height: 1.45))),
        ]),
      );

  Widget _row(BuildContext context, IconData icon, String label, String value) => Container(
        padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: 10),
        decoration: BoxDecoration(borderRadius: Ds.br(12), border: Border.all(color: context.hairline)),
        child: Row(children: [
          Icon(icon, size: 18, color: context.muted),
          const SizedBox(width: Ds.s8),
          Text(label, style: TextStyle(color: context.muted, fontSize: 13)),
          const SizedBox(width: Ds.s12),
          Expanded(child: Text(value, textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5))),
        ]),
      );

  /// 残高 → 払ったあとの残高
  Widget _balanceRow(BuildContext context, int premium, int price, int? after) => Container(
        padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: 10),
        decoration: BoxDecoration(borderRadius: Ds.br(12), border: Border.all(color: after == null ? context.cs.error.withValues(alpha: 0.6) : context.hairline)),
        child: Row(children: [
          const Icon(Icons.diamond_rounded, size: 18, color: Ds.purple),
          const SizedBox(width: Ds.s8),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(tr('プレミアムコイン（有償）', 'Premium coins (paid)'), style: TextStyle(color: context.muted, fontSize: 13)),
              Text(tr('支払い ${formatCount(price)} 枚', 'Pay ${formatCount(price)}'), style: TextStyle(color: context.muted, fontSize: 11.5)),
            ]),
          ),
          Text(formatCount(premium), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: Icon(Icons.arrow_forward_rounded, size: 16, color: context.muted)),
          Text(
            after == null ? '—' : formatCount(after),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: after == null ? context.cs.error : Ds.pink),
          ),
          Text(tr(' 枚', ''), style: TextStyle(color: context.muted, fontSize: 12)),
        ]),
      );
}

/// 宣伝されたときの見え方（Web の PromotionWorkCard と作品ページの宣伝の帯・一覧の PR のしるし）
class _Preview extends StatelessWidget {
  const _Preview({required this.title, required this.imageUrl, required this.userName, required this.userIconUrl});

  final String title;
  final String? imageUrl;
  final String userName;
  final String? userIconUrl;

  @override
  Widget build(BuildContext context) {
    Widget caption(String text) => Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(text, maxLines: 2, style: TextStyle(color: context.muted, fontSize: 11)),
        );
    final card = Container(
      padding: const EdgeInsets.all(1.2),
      decoration: BoxDecoration(gradient: workPromotionGradient, borderRadius: Ds.br(12)),
      child: ClipRRect(
        borderRadius: Ds.br(10.8),
        child: ColoredBox(
          color: context.surfaceCard,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AspectRatio(aspectRatio: 4 / 3, child: AppImage(imageUrl, memCacheWidth: 400)),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title.isEmpty ? tr('作品のタイトル', 'Your title') : title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5)),
                const SizedBox(height: 4),
                Row(children: [
                  UserAvatar(url: userIconUrl, size: 16),
                  const SizedBox(width: 4),
                  Expanded(child: Text(userName, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11))),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
    final thumb = Stack(children: [
      AppImage(imageUrl, width: 64, height: 64, radius: 8, memCacheWidth: 192),
      const Positioned(left: 4, top: 4, child: WorkPromotionMark(fontSize: 9)),
    ]);
    final band = Container(
      padding: const EdgeInsets.all(1.2),
      decoration: BoxDecoration(gradient: workPromotionGradient, borderRadius: Ds.br(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(8.8)),
        child: Row(children: [
          const WorkPromotionMark(fontSize: 9),
          const SizedBox(width: 6),
          Expanded(child: Text(tr('$userNameさんの宣伝作品です', 'Promoted by $userName'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11.5))),
        ]),
      ),
    );
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        flex: 5,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [card, caption(tr('ホームの「おすすめ作品」の先頭に PR 付きで', 'First in Recommended works, with a PR mark'))]),
      ),
      const SizedBox(width: Ds.s12),
      Expanded(
        flex: 6,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          band,
          caption(tr('作品ページに宣伝の帯', 'A promotion banner on the work page')),
          const SizedBox(height: Ds.s12),
          thumb,
          caption(tr('一覧のサムネイルに PR のしるし', 'A PR mark on thumbnails')),
        ]),
      ),
    ]);
  }
}
