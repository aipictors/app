import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// クリエイター報酬（推しの換金）の規約の版。Web の app/lib/creator-rewards.ts と合わせる
const creatorRewardTermsVersion = '2026-11-16';
const _base = 'https://www.aipictors.com';

/// Web の /api/creator-rewards を呼ぶ
class CreatorRewardsApi {
  CreatorRewardsApi._();

  static Future<Map<String, String>> _headers() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token == null) throw const ApiException('ログインしてください');
    return {'authorization': 'Bearer $token', 'content-type': 'application/json'};
  }

  static Map<String, dynamic> _data(http.Response res) {
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final error = json is Map ? json['error'] : null;
    final data = json is Map ? json['data'] : null;
    if (res.statusCode != 200 || error != null || data is! Map<String, dynamic>) {
      throw ApiException(switch (error) {
        'DISABLED' => 'いまは受け付けを止めています',
        'ONBOARDING_NOT_AVAILABLE' => '口座の登録は準備中です。報酬の記録は続いています',
        _ => 'うまくいきませんでした',
      });
    }
    return data;
  }

  static Future<Map<String, dynamic>> summary() async {
    final res = await http.get(Uri.parse('$_base/api/creator-rewards'), headers: await _headers()).timeout(const Duration(seconds: 20));
    return _data(res);
  }

  static Future<Map<String, dynamic>> post(String intent) async {
    final res = await http
        .post(
          Uri.parse('$_base/api/creator-rewards'),
          headers: await _headers(),
          body: jsonEncode({'intent': intent, 'termsVersion': creatorRewardTermsVersion, 'client': 'app'}),
        )
        .timeout(const Duration(seconds: 30));
    return _data(res);
  }
}

String _yen(num v) {
  final s = v.floor().abs().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');
  return '${v < 0 ? '-' : ''}$s円';
}

String _date(Object? sec) {
  if (sec is! num || sec == 0) return '-';
  final d = DateTime.fromMillisecondsSinceEpoch(sec.toInt() * 1000, isUtc: true).add(const Duration(hours: 9));
  return '${d.year}/${d.month}/${d.day}';
}

int _n(Object? v) => v is num ? v.toInt() : 0;

/// 報酬の明細と参加・口座登録（口座の登録は Stripe の画面をブラウザで開く）
class CreatorRewardsScreen extends StatefulWidget {
  const CreatorRewardsScreen({super.key});

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
    _load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Stripe の画面（ブラウザ）から戻ってきたら口座の状態を取り直す
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _openedStripe) {
      _openedStripe = false;
      _run('refresh');
    }
  }

  Future<void> _load() async {
    try {
      final s = await CreatorRewardsApi.summary();
      if (mounted) setState(() => (_summary = s, _error = null));
    } catch (e) {
      if (mounted) setState(() => _error = e is ApiException ? e.message : '読み込みに失敗しました');
    }
  }

  Future<void> _run(String intent) async {
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
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e is ApiException ? e.message : 'うまくいきませんでした')));
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _summary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('クリエイター報酬', style: TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: s == null
          ? Center(child: _error == null ? const CircularProgressIndicator() : Text(_error!))
          : RefreshIndicator(
              onRefresh: _load,
              child: ContentWidth(child: _body(context, s)),
            ),
    );
  }

  Widget _body(BuildContext context, Map<String, dynamic> s) {
    final c = (s['config'] as Map?) ?? {};
    final profile = s['profile'] as Map?;
    final joined = s['joined'] == true;
    final enabled = c['enabled'] == true;
    final needsNewTerms = profile?['needsNewTerms'] == true;
    final balances = (s['balances'] as Map?) ?? {};
    final earnings = (s['earnings'] as List?) ?? [];
    final payouts = (s['payouts'] as List?) ?? [];
    final muted = TextStyle(color: context.muted, fontSize: 13, height: 1.5);
    Widget pad(Widget child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: Ds.s16, vertical: Ds.s8),
      child: child,
    );

    return ListView(
      padding: const EdgeInsets.only(bottom: 60),
      children: [
        SettingsGroup(
          title: 'しくみ',
          children: [
            pad(
              Text(
                '全年齢（一般・R15）の作品が、有料で購入されたプレミアムコインで推されると、1,000 コインにつき ${_n(c['rateMilliyen'])} 円の報酬が記録され、銀行口座へ振り込まれます。\n'
                '・R18・R18G の作品への推し、無料コイン・おまけのコインは対象外（今までどおりコインで受け取ります）\n'
                '・推されてから ${_n(c['holdDays'])} 日で換金でき、毎月 ${_n(c['closeDay'])} 日に締めて振込\n'
                '・${_yen(_n(c['minYen']))}から、1 か月 ${_yen(_n(c['maxYen']))}まで。振込手数料 ${_yen(_n(c['feeYen']))}\n'
                '・個人の方は源泉徴収（${(_n(c['withholdingPpm']) / 10000).toStringAsFixed(2)}%）を差し引きます',
                style: muted,
              ),
            ),
            SettingsLink(
              icon: Icons.description_outlined,
              label: 'クリエイター報酬規約',
              onTap: () => launchUrl(Uri.parse('$_base/creator-rewards/terms'), mode: LaunchMode.externalApplication),
            ),
          ],
        ),
        if (!enabled) pad(Text('クリエイター報酬はいま受け付けを止めています', style: muted)),
        if (enabled && (!joined || needsNewTerms))
          SettingsGroup(
            title: needsNewTerms ? '規約が更新されました' : '参加する',
            children: [
              pad(Text('参加すると、参加したあとに受け取った対象の推しが報酬として記録されます（コインの残高には入りません）。18 歳以上の方に限ります。', style: muted)),
              CheckboxListTile(
                value: _agreed,
                onChanged: (v) => setState(() => _agreed = v == true),
                title: const Text('クリエイター報酬規約に同意します', style: TextStyle(fontSize: 14)),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              pad(FilledButton(onPressed: _agreed && _busy == null ? () => _run('join') : null, child: Text(needsNewTerms ? '同意して続ける' : '同意して参加する'))),
            ],
          ),
        if (joined)
          SettingsGroup(
            title: '振込先の口座',
            children: [
              if (profile?['payoutReady'] == true) ...[
                pad(
                  Text(
                    '口座の登録が済んでいます。${profile?['taxKind'] == 'INDIVIDUAL'
                        ? '（個人：源泉徴収あり）'
                        : profile?['taxKind'] == 'CORPORATION'
                        ? '（法人：源泉徴収なし）'
                        : ''}',
                    style: muted,
                  ),
                ),
                SettingsLink(icon: Icons.open_in_new_rounded, label: '口座・本人確認を変更（Stripe）', onTap: () => _run('dashboard')),
              ] else if (s['onboardingAvailable'] == true) ...[
                pad(Text('振込には Stripe での本人確認と口座の登録が必要です。登録は Stripe の画面で行い、Aipictors は口座番号を保存しません。', style: muted)),
                pad(
                  FilledButton.icon(
                    onPressed: _busy == null ? () => _run('onboarding') : null,
                    icon: const Icon(Icons.open_in_new_rounded, size: 18),
                    label: Text(profile?['hasAccount'] == true ? 'Stripe で登録を続ける' : 'Stripe で口座を登録する'),
                  ),
                ),
              ] else
                pad(Text('口座の登録は準備中です。開始したらお知らせします。それまでの報酬も記録され、登録後に振り込まれます。', style: muted)),
            ],
          ),
        if (joined || earnings.isNotEmpty) ...[
          SettingsGroup(
            title: '報酬',
            footer: '次の締め: ${_date(s['nextCloseAt'])}',
            children: [
              _row('保留中', _yen(_n(balances['holdingYen']))),
              _row('換金できる', _yen(_n(balances['availableYen']))),
              _row('振込の手続き中', _yen(_n(balances['inPayoutYen']))),
              _row('振込済み', _yen(_n(balances['paidYen']))),
            ],
          ),
          if (payouts.isNotEmpty)
            SettingsGroup(
              title: '振込',
              children: [
                for (final p in payouts.whereType<Map>())
                  pad(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text('${p['period']}', style: const TextStyle(fontWeight: FontWeight.w700)),
                            ),
                            Badge2(_payoutLabel('${p['status']}')),
                          ],
                        ),
                        Text(
                          '報酬 ${_yen(_n(p['grossYen']))} − 源泉 ${_yen(_n(p['withholdingYen']))} − 手数料 ${_yen(_n(p['feeYen']))} = ${_yen(_n(p['netYen']))}'
                          '${p['sentAt'] != null ? '（${_date(p['sentAt'])} 送金）' : ''}',
                          style: muted,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          SettingsGroup(
            title: '明細',
            children: [
              if (earnings.isEmpty) pad(Text('まだ報酬はありません', style: muted)),
              for (final e in earnings.whereType<Map>())
                ListTile(
                  dense: true,
                  title: Text(e['kind'] == 'CLAWBACK' ? '返金による差し引き' : (e['workId'] != null ? '作品への推し' : 'プロフィールへの推し'), style: const TextStyle(fontSize: 14)),
                  subtitle: Text(
                    '${_date(e['createdAt'])} ・ ${_n(e['coins'])}コイン ・ ${_earningLabel('${e['status']}')}'
                    '${e['status'] == 'HOLDING' ? '（${_date(e['availableAt'])} から）' : ''}',
                    style: muted,
                  ),
                  trailing: Text(_yen(_n(e['amountYen'])), style: const TextStyle(fontWeight: FontWeight.w700)),
                ),
            ],
          ),
        ],
        if (joined)
          Center(
            child: TextButton(
              onPressed: _busy == null
                  ? () async {
                      final ok = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('参加をやめると、これからの推しはコインで受け取ります。記録済みの報酬はそのまま振り込まれます。やめますか？'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('キャンセル')),
                            TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('やめる')),
                          ],
                        ),
                      );
                      if (ok == true) _run('leave');
                    }
                  : null,
              child: Text('参加をやめる', style: TextStyle(color: context.muted)),
            ),
          ),
      ],
    );
  }

  Widget _row(String label, String value) => ListTile(
    dense: true,
    title: Text(label, style: const TextStyle(fontSize: 14)),
    trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
  );

  static String _payoutLabel(String s) => switch (s) {
    'AWAITING_APPROVAL' => '確認中',
    'READY' => '振込予定',
    'SENDING' => '送金中',
    'SENT' => '送金済み',
    'FAILED' => '失敗',
    'CANCELED' => '取り消し',
    _ => s,
  };

  static String _earningLabel(String s) => switch (s) {
    'HOLDING' => '保留中',
    'HELD' => '換金できる',
    'IN_PAYOUT' => '手続き中',
    'PAID' => '振込済み',
    'REVERSED' => '取り消し',
    _ => s,
  };
}
