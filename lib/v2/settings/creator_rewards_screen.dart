import 'dart:async';
import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// クリエイター報酬（推しの換金）の規約の版。Web の app/lib/creator-rewards.ts と合わせる
const creatorRewardTermsVersion = '2026-11-16';
const _base = 'https://www.aipictors.com';

/// API のエラーコード（aipictors-api の creator-payouts）を利用者向けの文に
String creatorRewardErrorMessage(String? code) => switch (code) {
  'DISABLED' => tr('いまは受け付けを止めています', 'Currently unavailable'),
  'ONBOARDING_NOT_AVAILABLE' => tr('口座の登録は準備中です。報酬の記録は続いています', 'Bank registration is not open yet. Rewards are still recorded'),
  'SUSPENDED' => tr('いまはご利用いただけません。お問い合わせからご連絡ください', 'Your account cannot use this right now. Please contact us'),
  'NOT_JOINED' => tr('先に参加してください', 'Please join first'),
  'TERMS_OUTDATED' => tr('ルール（規約）が新しくなりました。アプリを最新にして、もう一度同意してください', 'The terms have been updated. Please update the app and agree again'),
  'NO_ACCOUNT' => tr('まだ口座が登録されていません。「口座を登録する」から進めてください', 'No bank account yet. Use "Add bank account" first'),
  'MODE_MISMATCH' || 'UNKNOWN_ACCOUNT' => tr('登録の情報を確認できませんでした。もう一度「口座を登録する」から進めてください', 'We could not check your registration. Please use "Add bank account" again'),
  'Unauthorized' => tr('ログインしてください', 'Please log in'),
  'NETWORK' => tr('通信できませんでした。電波の良いところでお試しください', 'Could not connect. Please check your connection'),
  _ => tr('うまくいきませんでした。時間をおいてもう一度押してください。続くときはお問い合わせからご連絡ください', 'Something went wrong. Please try again later, or contact us if it keeps happening'),
};

/// Web の /api/creator-rewards を呼ぶ
class CreatorRewardsApi {
  CreatorRewardsApi._();

  static Future<Map<String, String>> _headers() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token == null) throw ApiException(creatorRewardErrorMessage('Unauthorized'), code: 'Unauthorized');
    return {'authorization': 'Bearer $token', 'content-type': 'application/json'};
  }

  /// 応答 { error, data } を読む。失敗は ApiException（code に API のエラーコード）
  static Map<String, dynamic> parse(int status, List<int> bodyBytes) {
    Object? json;
    try {
      json = jsonDecode(utf8.decode(bodyBytes));
    } catch (_) {}
    final error = json is Map ? json['error'] : null;
    final data = json is Map ? json['data'] : null;
    if (status != 200 || error != null || data is! Map<String, dynamic>) {
      final code = error?.toString() ?? 'HTTP_$status';
      throw ApiException(creatorRewardErrorMessage(code), code: code);
    }
    return data;
  }

  static Future<Map<String, dynamic>> _send(Future<http.Response> Function(Map<String, String> headers) request) async {
    final headers = await _headers();
    final http.Response res;
    try {
      res = await request(headers);
    } catch (_) {
      throw ApiException(creatorRewardErrorMessage('NETWORK'), code: 'NETWORK');
    }
    return parse(res.statusCode, res.bodyBytes);
  }

  static Future<Map<String, dynamic>> summary() =>
      _send((h) => http.get(Uri.parse('$_base/api/creator-rewards'), headers: h).timeout(const Duration(seconds: 20)));

  static Future<Map<String, dynamic>> post(String intent) => _send(
    (h) => http
        .post(
          Uri.parse('$_base/api/creator-rewards'),
          headers: h,
          body: jsonEncode({'intent': intent, 'termsVersion': creatorRewardTermsVersion, 'client': 'app', 'lang': L10n.isJa ? 'ja' : 'en'}),
        )
        .timeout(const Duration(seconds: 30)),
  );
}

/// 開発用の見本（参加済み・口座の登録待ち／登録済み）。デバッグビルドだけ
Map<String, dynamic>? creatorRewardsDebugSample(String? tab) {
  if (!kDebugMode || tab == null || !tab.startsWith('sample:')) return null;
  final ready = tab == 'sample:ready';
  return {
    'config': {'enabled': true, 'rateMilliyen': 500, 'holdDays': 7, 'closeDays': [10, 25], 'minYen': 3000, 'maxYen': 100000, 'feeYen': 500, 'withholdingPpm': 102100, 'newAccountDays': 30, 'newAccountMaxYen': 30000},
    'joined': true,
    'onboardingAvailable': true,
    'profile': {'payoutReady': ready, 'hasAccount': ready, 'taxKind': ready ? 'INDIVIDUAL' : null, 'needsNewTerms': false},
    'balances': {'holdingYen': 1250, 'availableYen': 4000, 'inPayoutYen': 0, 'paidYen': ready ? 3092 : 0},
    'nextCloseAt': 1795575600,
    'earnings': [
      {'id': 3, 'kind': 'SUPPORT', 'workId': '1', 'coins': 2500, 'amountYen': 1250, 'status': 'HOLDING', 'createdAt': 1795100000, 'availableAt': 1795704800},
      {'id': 2, 'kind': 'REQUEST', 'coins': 8000, 'amountYen': 4000, 'status': 'HELD', 'createdAt': 1794500000, 'expectedCloseAt': 1795575600},
    ],
    'payouts': ready
        ? [
            {'id': 'cp_1', 'period': '2026-11-10', 'status': 'SENT', 'grossYen': 4000, 'withholdingYen': 408, 'feeYen': 500, 'netYen': 3092, 'sentAt': 1794800000},
          ]
        : [],
  };
}

int _n(Object? v) => v is num ? v.toInt() : 0;

/// 締めの日（[10, 25]）。古い API は closeDay だけ
List<int> creatorRewardCloseDays(Map c) {
  final days = c['closeDays'];
  if (days is List && days.isNotEmpty) return days.map(_n).toList();
  return [_n(c['closeDay'])];
}

/// いまどこまで進んでいるか（1: 参加する → 2: 口座を登録する → 3: あとは待つだけ）
int creatorRewardStep(Map<String, dynamic> s) {
  if (s['joined'] != true) return 1;
  return (s['profile'] as Map?)?['payoutReady'] == true ? 3 : 2;
}

/// 収益の受け取り（推しの換金）。Web の /settings/creator-rewards と同じ考え方で、専門用語を使わず
/// しくみの図・残高 4 つ・受け取りまでの 3 ステップ・明細、細かい条件はたたむ。口座の登録は Stripe の画面をブラウザで開く
class CreatorRewardsScreen extends StatefulWidget {
  const CreatorRewardsScreen({super.key, this.debugSummary});

  /// テスト・表示の確認用: API を読まずにこの内容で出す
  final Map<String, dynamic>? debugSummary;

  @override
  State<CreatorRewardsScreen> createState() => _CreatorRewardsScreenState();
}

class _CreatorRewardsScreenState extends State<CreatorRewardsScreen> with WidgetsBindingObserver {
  Map<String, dynamic>? _summary;
  String? _error;
  String? _busy;
  bool _agreed = false;
  bool _openedStripe = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // 開発用: /tmp/aipictors-debug の 2 行目が sample:joined / sample:ready なら見本の内容で出す（本番のデータは変えない）
    final sample = widget.debugSummary ?? creatorRewardsDebugSample(DebugBoot.screenTab);
    if (sample != null) {
      _summary = sample;
    } else {
      _load();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // 登録の画面（ブラウザ）から戻ってきたら口座の状態を取り直す
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _openedStripe && _busy == null) {
      _openedStripe = false;
      _run('refresh', quiet: true);
    }
  }

  Future<void> _load() async {
    try {
      final s = await CreatorRewardsApi.summary();
      if (mounted) setState(() => (_summary = s, _error = null));
    } catch (e) {
      if (mounted) setState(() => _error = e is ApiException ? e.message : tr('読み込みに失敗しました', 'Failed to load'));
    }
  }

  Future<void> _run(String intent, {bool quiet = false}) async {
    setState(() => _busy = intent);
    try {
      final data = await CreatorRewardsApi.post(intent);
      final url = data['url'];
      if (url is String) {
        _openedStripe = true;
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        await _load();
      }
    } catch (e) {
      // 戻ってきたときの取り直しは失敗しても画面を読み直すだけ（口座がまだ無いなど）
      if (quiet) {
        await _load();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e is ApiException ? e.message : creatorRewardErrorMessage(null))));
      }
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  void _openTerms() => launchUrl(Uri.parse('$_base${L10n.isJa ? '' : '/en'}/creator-rewards/terms'), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    final s = _summary;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('収益の受け取り', 'Rewards payout'), style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: s == null
          ? (_error == null
                ? const Center(child: CircularProgressIndicator())
                : StateView.error(_error!, onRetry: () {
                    setState(() => _error = null);
                    _load();
                  }))
          : RefreshIndicator(
              onRefresh: _load,
              child: ContentWidth(child: _body(context, s)),
            ),
    );
  }

  Widget _card({required Widget child, Color? border, Gradient? gradient}) => Container(
    margin: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 0),
    padding: const EdgeInsets.all(Ds.s16),
    decoration: BoxDecoration(
      color: gradient == null ? context.surfaceCard : null,
      gradient: gradient,
      borderRadius: Ds.br(20),
      border: Border.all(color: border ?? context.hairline),
    ),
    child: child,
  );

  Widget _body(BuildContext context, Map<String, dynamic> s) {
    final c = (s['config'] as Map?) ?? {};
    final joined = s['joined'] == true;
    final enabled = c['enabled'] == true;
    final balances = (s['balances'] as Map?) ?? {};
    final earnings = (s['earnings'] as List?) ?? [];
    final payouts = (s['payouts'] as List?) ?? [];
    final muted = TextStyle(color: context.muted, fontSize: 13, height: 1.55);
    final closeDays = creatorRewardCloseDays(c);
    final step = creatorRewardStep(s);
    const green = Color(0xFF059669);

    return ListView(
      padding: const EdgeInsets.only(bottom: 60),
      children: [
        // しくみを一言で
        _card(
          border: green.withValues(alpha: 0.3),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [green.withValues(alpha: 0.12), Ds.sky.withValues(alpha: 0.05), Colors.transparent],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.payments_outlined, size: 16, color: green),
                  const SizedBox(width: 6),
                  Text(tr('収益の受け取り', 'Rewards payout'), style: const TextStyle(color: green, fontWeight: FontWeight.w700, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                tr('推してもらったコインが、お金になって振り込まれます', 'Support you receive turns into money in your bank'),
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 19, height: 1.35),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                decoration: BoxDecoration(color: context.cs.surface.withValues(alpha: 0.8), borderRadius: Ds.br(14)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _figure(Icons.monetization_on_rounded, Ds.gold, formatCount(1000), tr('買ったコインで推される', 'purchased coins'), null),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.arrow_forward_rounded, color: context.muted),
                    ),
                    _figure(Icons.account_balance_rounded, green, formatYenL10n(_n(c['rateMilliyen'])), tr('あなたの口座へ', 'to your bank'), green),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                tr(
                  '対象は全年齢（一般・R15）の作品への推しで、ファンがお金を払って買ったコインの分です。無料でもらったコインやR18の作品への推しは、今までどおりコインで受け取ります。',
                  'Covers supports on all-ages (G / R15) works paid with coins fans bought. Free coins and supports on R18 works are received as coins as before.',
                ),
                style: muted.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        // 海外の人へ: 振込は日本の銀行口座だけ
        if (!L10n.isJa)
          _card(
            border: Ds.gold.withValues(alpha: 0.45),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.public_rounded, size: 20, color: Ds.gold),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Payouts are currently available only to bank accounts in Japan (Japanese ID is needed to register). '
                    'If you cannot register one, please do not join: supports you receive stay as coins, which you can use in Aipictors.',
                    style: muted,
                  ),
                ),
              ],
            ),
          ),
        if (!enabled) _card(child: Text(tr('いまは受け付けを止めています', 'Creator rewards are currently paused'), style: muted)),
        // 受け取れるお金
        if (joined || earnings.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 0),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.1,
              children: [
                _balance(tr('確認期間中', 'Checking'), _n(balances['holdingYen']), hint: tr('推されてから${_n(c['holdDays'])}日', '${_n(c['holdDays'])} days')),
                _balance(
                  tr('次の振込に入る', 'Next payout'),
                  _n(balances['availableYen']),
                  hint: tr('${formatDateL10n(s['nextCloseAt'])} に締め', 'Closes ${formatDateL10n(s['nextCloseAt'])}'),
                  accent: true,
                ),
                _balance(tr('振込の準備中', 'Processing'), _n(balances['inPayoutYen'])),
                _balance(tr('これまでに振込', 'Paid so far'), _n(balances['paidYen'])),
              ],
            ),
          ),
        // 3 つのステップ
        if (enabled)
          _card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr('受け取りまでの 3 ステップ', '3 steps to get paid'), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                const SizedBox(height: 14),
                _StepItem(n: 1, state: step > 1 ? _StepState.done : _StepState.current, title: tr('参加する（無料）', 'Join (free)'), child: _joinStep(s, step, muted)),
                _StepItem(
                  n: 2,
                  state: step > 2 ? _StepState.done : (step == 2 ? _StepState.current : _StepState.todo),
                  title: tr('お金を受け取る口座を登録する', 'Add the bank account to receive money'),
                  child: _bankStep(s, step, muted),
                ),
                _StepItem(
                  n: 3,
                  state: step == 3 ? _StepState.current : _StepState.todo,
                  title: tr('あとは待つだけ', 'Then just wait'),
                  last: true,
                  child: Text(
                    tr('毎月 ${closeDays.join(' 日・')} 日にまとめて、自動で口座に振り込みます。手続きはいりません。', 'Paid automatically on day ${closeDays.join(' and ')} of each month. Nothing else to do.'),
                    style: muted,
                  ),
                ),
              ],
            ),
          ),
        if (joined || earnings.isNotEmpty) ...[
          if (payouts.isNotEmpty) _payoutList(payouts, muted),
          _earningList(earnings, muted),
        ],
        // くわしい条件（たたんでおく）
        _card(child: _faq(c, closeDays, muted)),
        if (joined)
          Padding(
            padding: const EdgeInsets.only(top: Ds.s8),
            child: Center(
              child: TextButton(
                onPressed: _busy == null ? _confirmLeave : null,
                child: Text(tr('参加をやめる', 'Leave the program'), style: TextStyle(color: context.muted)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _figure(IconData icon, Color color, String value, String label, Color? valueColor) => Flexible(
    child: Column(
      children: [
        Icon(icon, size: 30, color: color),
        const SizedBox(height: 2),
        Text(value, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: valueColor)),
        Text(label, textAlign: TextAlign.center, style: TextStyle(color: context.muted, fontSize: 11)),
      ],
    ),
  );

  Widget _balance(String label, int yen, {String? hint, bool accent = false}) {
    const green = Color(0xFF059669);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: accent ? green.withValues(alpha: 0.06) : context.surfaceCard,
        borderRadius: Ds.br(14),
        border: Border.all(color: accent ? green.withValues(alpha: 0.4) : context.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 12)),
          Text(formatYenL10n(yen), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
          if (hint != null) Text(hint, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 10.5)),
        ],
      ),
    );
  }

  Widget? _joinStep(Map<String, dynamic> s, int step, TextStyle muted) {
    final profile = s['profile'] as Map?;
    final needsNewTerms = profile?['needsNewTerms'] == true;
    if (step != 1 && !needsNewTerms) return Text(tr('参加しています', 'You have joined'), style: muted);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          needsNewTerms
              ? tr('ルール（規約）が新しくなりました。確認して同意してください。', 'The terms have been updated. Please review and agree.')
              : tr('参加したあとにもらった推しから、お金として記録されます。18歳以上の方が対象です。', 'Supports you receive after joining are recorded as money. You must be 18 or older.'),
          style: muted,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(color: context.cs.onSurface.withValues(alpha: 0.04), borderRadius: Ds.br(12)),
          child: CheckboxListTile(
            value: _agreed,
            onChanged: (v) => setState(() => _agreed = v == true),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: const EdgeInsets.only(right: 8),
            title: Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GestureDetector(
                      onTap: _openTerms,
                      child: Text(
                        tr('ルール（クリエイター報酬規約）', 'the Creator Rewards Terms'),
                        style: const TextStyle(color: Ds.blue, decoration: TextDecoration.underline, fontSize: 14),
                      ),
                    ),
                  ),
                  TextSpan(text: tr(' を読んで同意します', ' — I have read and agree')),
                ],
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          label: needsNewTerms ? tr('同意して続ける', 'Agree and continue') : tr('同意して参加する', 'Agree and join'),
          loading: _busy == 'join',
          onPressed: _agreed && _busy == null ? () => _run('join') : null,
        ),
      ],
    );
  }

  Widget? _bankStep(Map<String, dynamic> s, int step, TextStyle muted) {
    final profile = s['profile'] as Map?;
    if (step == 3) {
      final kind = profile?['taxKind'];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('登録が済んでいます', 'Your bank account is registered') +
                (kind == 'INDIVIDUAL'
                    ? tr('（個人）', ' (individual)')
                    : kind == 'CORPORATION'
                    ? tr('（法人）', ' (company)')
                    : ''),
            style: muted,
          ),
          const SizedBox(height: 6),
          SecondaryButton(
            label: tr('口座や登録内容を変える', 'Change bank account or details'),
            icon: Icons.open_in_new_rounded,
            expand: false,
            height: 40,
            loading: _busy == 'dashboard',
            onPressed: _busy == null ? () => _run('dashboard') : null,
          ),
        ],
      );
    }
    if (step != 2) return null;
    if (s['onboardingAvailable'] != true) {
      return Text(
        tr('口座の登録はもうすぐ始まります。それまでの分もきちんと記録され、登録したあとに振り込まれます。', 'Bank registration opens soon. Rewards until then are recorded and paid after you register.'),
        style: muted,
      );
    }
    final needsMore = ((profile?['requirements'] as Map?)?['disabledReason'] ?? '').toString().isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (needsMore) ...[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: context.cs.error.withValues(alpha: 0.08), borderRadius: Ds.br(12)),
            child: Text(
              tr('登録の途中です。下のボタンから続きを入力してください。', "Registration isn't finished. Continue with the button below."),
              style: TextStyle(color: context.cs.error, fontSize: 13),
            ),
          ),
          const SizedBox(height: 8),
        ],
        Text(tr('ボタンを押すと入力の画面に進みます。5〜10分ほどで終わります。', 'The button opens a form. It takes about 5–10 minutes.'), style: muted),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: context.cs.onSurface.withValues(alpha: 0.04), borderRadius: Ds.br(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr('用意するもの', 'What you need'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
              const SizedBox(height: 6),
              _need(Icons.smartphone_rounded, tr('スマホ（電話番号に確認のメッセージが届きます）', 'Your phone (for a text message code)')),
              _need(Icons.account_balance_outlined, tr('銀行口座（通帳かキャッシュカードがあると安心）', 'A bank account in Japan')),
              _need(Icons.badge_outlined, tr('本人確認の書類（運転免許証・マイナンバーカードなど）', "Japanese ID (driver's license, My Number card, etc.)")),
            ],
          ),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          label: profile?['hasAccount'] == true ? tr('口座の登録を続ける', 'Continue registration') : tr('口座を登録する', 'Add bank account'),
          icon: Icons.chevron_right_rounded,
          loading: _busy == 'onboarding',
          onPressed: _busy == null ? () => _run('onboarding') : null,
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.verified_user_outlined, size: 16, color: Color(0xFF059669)),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                tr(
                  '入力の画面は、世界中で使われている送金サービス「Stripe（ストライプ）」の安全なページです。英語のロゴが出ても大丈夫です。口座番号は Aipictors には保存されません。',
                  'The form is a secure page by Stripe, a payment service used worldwide. Aipictors never stores your bank number.',
                ),
                style: muted.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _need(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: context.muted),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 13, height: 1.4))),
      ],
    ),
  );

  Widget _payoutList(List payouts, TextStyle muted) => _card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr('振込の記録', 'Payouts'), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
        for (final p in payouts.whereType<Map>()) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text('${p['period']}', style: const TextStyle(fontWeight: FontWeight.w700)),
              ),
              Badge2(creatorPayoutStatusLabel('${p['status']}')),
            ],
          ),
          _kv(tr('報酬', 'Rewards'), formatYenL10n(_n(p['grossYen'])), muted),
          _kv(tr('所得税（源泉徴収）', 'Withholding tax'), '-${formatYenL10n(_n(p['withholdingYen']))}', muted),
          _kv(tr('振込手数料', 'Fee'), '-${formatYenL10n(_n(p['feeYen']))}', muted),
          _kv(tr('振込額', 'Net'), formatYenL10n(_n(p['netYen'])), const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
          if (p['sentAt'] != null) Text('${tr('送金日', 'Sent')}: ${formatDateL10n(p['sentAt'])}', style: muted.copyWith(fontSize: 12)),
        ],
      ],
    ),
  );

  Widget _kv(String k, String v, TextStyle style) => Row(
    children: [
      Expanded(child: Text(k, style: style.copyWith(fontSize: 12.5))),
      Text(v, style: style.copyWith(fontSize: 12.5)),
    ],
  );

  Widget _earningList(List earnings, TextStyle muted) => _card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr('もらった推しの明細', 'Rewards history'), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
        const SizedBox(height: 6),
        if (earnings.isEmpty) Text(tr('まだ報酬はありません', 'No rewards yet'), style: muted),
        for (final e in earnings.whereType<Map>())
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: creatorEarningTitle(e)),
                            TextSpan(text: '  ${formatCount(_n(e['coins']))} ${tr('コイン', 'coins')}', style: muted.copyWith(fontSize: 12)),
                          ],
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        formatDateL10n(e['createdAt']) +
                            (e['status'] == 'HOLDING'
                                ? tr(' ・ ${formatDateL10n(e['availableAt'])} に確認期間が終わります', ' · available from ${formatDateL10n(e['availableAt'])}')
                                : '') +
                            (e['expectedCloseAt'] is num
                                ? tr(' ・ 振込予定 ${formatDateL10n(e['expectedCloseAt'])}（最短）', ' · payout ${formatDateL10n(e['expectedCloseAt'])} (earliest)')
                                : ''),
                        style: muted.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(formatYenL10n(_n(e['amountYen'])), style: const TextStyle(fontWeight: FontWeight.w800)),
                    Text(creatorEarningStatusLabel('${e['status']}'), style: muted.copyWith(fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
      ],
    ),
  );

  Widget _faq(Map c, List<int> closeDays, TextStyle muted) {
    final hold = _n(c['holdDays']);
    final newMax = _n(c['newAccountMaxYen']);
    final newDays = _n(c['newAccountDays']);
    final ppm = (_n(c['withholdingPpm']) / 10000).toStringAsFixed(2);
    Widget item(String q, String a) => Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(q, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
          const SizedBox(height: 2),
          Text(a, style: muted),
        ],
      ),
    );
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Text(tr('くわしい条件・よくある質問', 'Details & FAQ'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
        children: [
          item(
            tr('いつ振り込まれますか？', 'When am I paid?'),
            tr('推されてから $hold 日の確認期間のあと、毎月 ${closeDays.join(' 日・')} 日にまとめて振り込みます。', 'After a $hold-day check period, on day ${closeDays.join(' and ')} of each month.'),
          ),
          item(
            tr('いくらから振り込まれますか？', 'Is there a minimum?'),
            tr(
                  '${formatYenL10n(_n(c['minYen']))} 以上たまったら振り込みます（それまでは次回に持ち越し）。1か月 ${formatYenL10n(_n(c['maxYen']))} までです。',
                  'Paid once you have ${formatYenL10n(_n(c['minYen']))} or more (otherwise carried over). Up to ${formatYenL10n(_n(c['maxYen']))} per month.',
                ) +
                (newMax > 0 && newDays > 0
                    ? tr('口座を登録してから $newDays 日のあいだは、1回 ${formatYenL10n(newMax)} までです。', ' For the first $newDays days after registering, up to ${formatYenL10n(newMax)} per payout.')
                    : ''),
          ),
          item(
            tr('差し引かれるお金はありますか？', 'Are there deductions?'),
            tr(
              '振込のたびに手数料 ${formatYenL10n(_n(c['feeYen']))} がかかります。個人の方は、法律で決まった所得税（$ppm%）を差し引き、Aipictors が代わりに国へ納めます（源泉徴収）。',
              'A ${formatYenL10n(_n(c['feeYen']))} fee per payout. For individuals, $ppm% income tax is withheld and paid to the government by us.',
            ),
          ),
          item(
            tr('日本の外に住んでいても受け取れますか？', 'Can I get paid if I live outside Japan?'),
            tr(
              'いまは日本の銀行口座への振込だけです。登録できないときは参加しないでください。推しは今までどおりコインで受け取れます。',
              'Not yet. Payouts go only to bank accounts in Japan. If you cannot register one, please do not join; supports stay as coins.',
            ),
          ),
          item(
            tr('口座の情報は安全ですか？', 'Is my bank info safe?'),
            tr(
              '口座や本人確認の情報は、世界中のネットショップで使われている送金サービス Stripe が管理します。Aipictors は口座番号を保存しません。',
              'Your bank and ID details are kept by Stripe, a payment service used by online shops worldwide. Aipictors never stores your bank number.',
            ),
          ),
          item(
            tr('コインの残高はどうなりますか？', 'What about my coin balance?'),
            tr(
              'お金として記録された分は、コインの残高には入りません。対象外の推しは、今までどおりコインで受け取ります。',
              'Amounts recorded as money are not added to your coins. Other supports are received as coins as before.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextButton.icon(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: _openTerms,
              icon: const Icon(Icons.description_outlined, size: 18),
              label: Text(tr('クリエイター報酬規約（ルールの全文）', 'Creator Rewards Terms (full text)')),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmLeave() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          tr('参加をやめると、これからの推しはコインで受け取ります。記録済みのお金はそのまま振り込まれます。やめますか？', 'After leaving, future supports are received as coins. Recorded rewards are still paid. Leave?'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(tr('キャンセル', 'Cancel'))),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(tr('やめる', 'Leave'))),
        ],
      ),
    );
    if (ok == true) unawaited(_run('leave'));
  }
}

/// 明細の行の名前（推し・有料リクエスト・返金の差し引き）
String creatorEarningTitle(Map e) {
  if (e['kind'] == 'CLAWBACK') return tr('返金による差し引き', 'Refund deduction');
  if (e['kind'] == 'REQUEST') return tr('有料リクエスト', 'Paid request');
  if (e['kind'] == 'ADJUSTMENT') return tr('調整', 'Adjustment');
  return e['workId'] != null ? tr('作品への推し', 'Support on work') : tr('プロフィールへの推し', 'Profile support');
}

String creatorPayoutStatusLabel(String s) => switch (s) {
  'AWAITING_APPROVAL' => tr('確認中', 'Under review'),
  'READY' => tr('振込予定', 'Scheduled'),
  'SENDING' => tr('送金中', 'Sending'),
  'SENT' => tr('送金済み', 'Sent'),
  'FAILED' => tr('失敗', 'Failed'),
  'CANCELED' => tr('取り消し', 'Canceled'),
  _ => s,
};

String creatorEarningStatusLabel(String s) => switch (s) {
  'HOLDING' => tr('確認期間中', 'Checking'),
  'HELD' => tr('次の振込に入る', 'Next payout'),
  'IN_PAYOUT' => tr('振込の準備中', 'Processing'),
  'PAID' => tr('振込済み', 'Paid'),
  'REVERSED' => tr('取り消し', 'Reversed'),
  _ => s,
};

enum _StepState { done, current, todo }

class _StepItem extends StatelessWidget {
  const _StepItem({required this.n, required this.state, required this.title, this.child, this.last = false});

  final int n;
  final _StepState state;
  final String title;
  final Widget? child;
  final bool last;

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF059669);
    final (bg, fg) = switch (state) {
      _StepState.done => (green, Colors.white),
      _StepState.current => (context.cs.primary, context.cs.onPrimary),
      _StepState.todo => (context.cs.onSurface.withValues(alpha: 0.08), context.muted),
    };
    return Padding(
      padding: EdgeInsets.only(bottom: last ? 0 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
              boxShadow: state == _StepState.current ? [BoxShadow(color: context.cs.primary.withValues(alpha: 0.25), spreadRadius: 4)] : null,
            ),
            child: state == _StepState.done
                ? const Icon(Icons.check_rounded, size: 17, color: Colors.white)
                : Text('$n', style: TextStyle(color: fg, fontWeight: FontWeight.w800, fontSize: 13)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5, color: state == _StepState.todo ? context.muted : null),
                  ),
                  if (state != _StepState.todo && child != null) ...[const SizedBox(height: 6), child!],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
