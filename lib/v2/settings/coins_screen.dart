import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// -----------------------------------------------------------------------------
// 履歴・失効予定の変換（Web の settings.points/utils/coin-ledger.ts と coin-expiry-tab と同じ）
// -----------------------------------------------------------------------------

/// /api/coins/summary の履歴 1 回分の件数（Web と同じ）
const coinLedgerPageSize = 100;

/// 履歴を「もっと見る」で増やす日数
const coinLedgerDaysStep = 7;

/// 失効の一覧は API の都合で最大 50 件まで
const maxExpiringCoinLots = 50;

/// 失効予定を最初に出す件数
const expiringLotsInitialVisible = 8;

const _jstOffset = 9 * 60 * 60;
const _secondsPerDay = 24 * 60 * 60;

/// API の日時（秒・ミリ秒・文字列）を Unix 秒にそろえる
int? coinUnixSeconds(Object? value) {
  int fix(num v) => v > 1000000000000 ? v ~/ 1000 : v.toInt();
  if (value is num) return value.isFinite ? fix(value) : null;
  if (value is String) {
    final s = value.trim();
    if (s.isEmpty) return null;
    if (RegExp(r'^\d+$').hasMatch(s)) return fix(int.parse(s));
    final d = DateTime.tryParse(s);
    return d == null ? null : d.millisecondsSinceEpoch ~/ 1000;
  }
  return null;
}

int _int(Object? v) => v is num ? v.toInt() : int.tryParse(v?.toString() ?? '') ?? 0;

/// コイン履歴の 1 行
class CoinLedgerRow {
  const CoinLedgerRow({required this.id, required this.coinType, required this.delta, required this.kind, this.reason, this.source, required this.createdAt});

  final int id;

  /// FREE / PREMIUM
  final String coinType;
  final int delta;

  /// GRANT / CONSUME / EXPIRE など
  final String kind;
  final String? reason;
  final String? source;

  /// Unix 秒
  final int createdAt;

  static CoinLedgerRow? fromJson(Map<String, dynamic> j) {
    final at = coinUnixSeconds(j['createdAt']);
    if (at == null) return null;
    return CoinLedgerRow(
      id: _int(j['id']),
      coinType: j['coinType'] == 'PREMIUM' ? 'PREMIUM' : 'FREE',
      delta: _int(j['delta']),
      kind: j['kind']?.toString() ?? '',
      reason: j['reason']?.toString(),
      source: j['source']?.toString(),
      createdAt: at,
    );
  }

  static List<CoinLedgerRow> listFrom(Object? rows) {
    if (rows is! List) return const [];
    return rows.whereType<Map<String, dynamic>>().map(fromJson).whereType<CoinLedgerRow>().toList();
  }
}

/// 期限つきのコインのまとまり
class ExpiringCoinLot {
  const ExpiringCoinLot({required this.coinType, required this.amount, required this.expiresAt});

  final String coinType;
  final int amount;
  final int expiresAt;

  static List<ExpiringCoinLot> listFrom(Object? rows) {
    if (rows is! List) return const [];
    final lots = <ExpiringCoinLot>[];
    for (final row in rows.whereType<Map<String, dynamic>>()) {
      final at = coinUnixSeconds(row['expiresAt']);
      if (at == null) continue;
      lots.add(ExpiringCoinLot(coinType: row['coinType'] == 'PREMIUM' ? 'PREMIUM' : 'FREE', amount: _int(row['amount']), expiresAt: at));
    }
    return lots;
  }
}

/// /api/coins/summary?includeLedger=1&includeExpiringLots=1 の中身
class CoinsOverview {
  const CoinsOverview({required this.free, required this.premium, required this.ledger, required this.lots});

  final int free;
  final int premium;
  final List<CoinLedgerRow> ledger;
  final List<ExpiringCoinLot> lots;

  factory CoinsOverview.fromJson(Map<String, dynamic> j) => CoinsOverview(
    free: _int(j['freeBalance']),
    premium: _int(j['premiumBalance']),
    ledger: CoinLedgerRow.listFrom(j['ledger']),
    lots: ExpiringCoinLot.listFrom(j['expiringLots']),
  );
}

enum CoinLedgerFilter { all, received, used, expired }

DateTime _jst(int seconds) => DateTime.fromMillisecondsSinceEpoch((seconds + _jstOffset) * 1000, isUtc: true);

String _pad(int v) => v.toString().padLeft(2, '0');

/// JST の日付キー（YYYY-MM-DD）
String jstDateKey(int seconds) {
  final d = _jst(seconds);
  return '${d.year}-${_pad(d.month)}-${_pad(d.day)}';
}

String formatJstTime(int seconds) {
  final d = _jst(seconds);
  return '${_pad(d.hour)}:${_pad(d.minute)}';
}

String _shortDate(DateTime d, DateTime now) => d.year == now.year ? '${d.month}/${d.day}' : '${d.year}/${d.month}/${d.day}';

/// 履歴の日付の見出し（今日・昨日、去年以前は年つき）
String formatLedgerDay(int seconds, int nowSeconds) {
  final key = jstDateKey(seconds);
  if (key == jstDateKey(nowSeconds)) return tr('今日', 'Today');
  if (key == jstDateKey(nowSeconds - _secondsPerDay)) return tr('昨日', 'Yesterday');
  final d = _jst(seconds);
  final i = d.weekday % 7;
  final weekday = tr(const ['日', '月', '火', '水', '木', '金', '土'][i], const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][i]);
  return '${_shortDate(d, _jst(nowSeconds))} ($weekday)';
}

/// 失効日時。日付が変わる瞬間（00:00）は「その前の日の 24:00」として出す
String formatCoinExpiry(int expiresAt, int nowSeconds) {
  final midnight = (expiresAt + _jstOffset) % _secondsPerDay == 0;
  final dateSeconds = midnight ? expiresAt - 1 : expiresAt;
  final key = jstDateKey(dateSeconds);
  final time = midnight ? '24:00' : formatJstTime(expiresAt);
  if (key == jstDateKey(nowSeconds)) return '${tr('今日', 'Today')} $time';
  if (key == jstDateKey(nowSeconds + _secondsPerDay)) return '${tr('明日', 'Tomorrow')} $time';
  return '${_shortDate(_jst(dateSeconds), _jst(nowSeconds))} $time';
}

final _dailyGrant = RegExp(r'^(FREE|LITE|STANDARD|PREMIUM) (?:daily|initial) generation coin grant$');
final _ascii = RegExp(r'^[ -~]+$');

/// 履歴の 1 行の見出し。内部の識別子をそのまま見せない
String coinLedgerLabel(CoinLedgerRow row) {
  final reason = row.reason ?? '';
  final source = row.source ?? '';
  if (row.kind == 'EXPIRE') return tr('有効期限切れ', 'Expired');
  if (reason == 'ADMIN_BULK_ADJUST') return tr('運営による調整', 'Adjusted by the team');
  if (reason == 'image-generation:cancel-refund') return tr('生成キャンセルの返却', 'Refund for canceled generation');
  if (reason.startsWith('image-generation:')) {
    final type = reason.substring('image-generation:'.length);
    if (type.startsWith('reserved:')) return tr('画像生成（予約）', 'Image generation (reserved)');
    if (type == 'image_to_image' || type == 'inpainting' || type == 'img2img') return tr('画像修正', 'Image modification');
    if (type == 'flux') return tr('画像生成（FLUX）', 'Image generation (FLUX)');
    if (type == 'gemini-2.5-flash-image') return tr('画像生成（Gemini Nano Banana）', 'Image generation (Gemini Nano Banana)');
    if (type == 'gemini-3.1-flash-image-preview') return tr('画像生成（Gemini Nano Banana 2）', 'Image generation (Gemini Nano Banana 2)');
    return tr('画像生成', 'Image generation');
  }
  // 受け取った側の行も同じ理由で入るので、増えた行は「推してもらった」。
  // 作品への推しは終了したので、過去のコメント・作品経由の推し（work-comment-support）もユーザーへの推しとして出す
  if (reason == 'coin support' || reason == 'work-comment-support' || source.startsWith('profile-support:') || source.startsWith('work-comment:')) {
    return row.delta > 0 ? tr('推してもらった', 'Received support') : tr('ユーザーを推した', 'Supported a user');
  }
  if (reason == 'coin support received') return tr('推してもらった', 'Received support');
  if (reason == 'support rollback refund') return tr('推しの取り消しで返却', 'Refund for canceled support');
  if (reason == 'premium-coin-purchase' || reason == 'premium-coin-webhook-backfill' || reason == 'Stripe checkout completed') {
    return tr('プレミアムコインを購入', 'Purchased premium coins');
  }
  final daily = _dailyGrant.firstMatch(reason);
  if (daily != null) {
    final plan = daily.group(1)!;
    return plan == 'FREE' ? tr('毎日のコイン', 'Daily coins') : tr('毎日のコイン（$plan）', 'Daily coins ($plan)');
  }
  // 実績の報酬やキャンペーンは、理由がそのまま読める日本語で入っている
  if (reason.isNotEmpty && !_ascii.hasMatch(reason)) return reason;
  if (row.kind == 'CONSUME') return tr('コインを使用', 'Coins used');
  return tr('コインを受け取り', 'Coins received');
}

bool matchesCoinLedgerFilter(CoinLedgerRow row, CoinLedgerFilter filter) => switch (filter) {
  CoinLedgerFilter.all => true,
  CoinLedgerFilter.expired => row.kind == 'EXPIRE',
  CoinLedgerFilter.used => row.kind == 'CONSUME',
  CoinLedgerFilter.received => row.kind != 'EXPIRE' && row.kind != 'CONSUME',
};

/// 最初のページと続きを合わせ、id の重複を除いて新しい順に
List<CoinLedgerRow> mergeCoinLedger(List<CoinLedgerRow> first, List<CoinLedgerRow> older) {
  final seen = <int>{};
  final rows = [...first, ...older].where((r) => seen.add(r.id)).toList();
  rows.sort((a, b) => b.createdAt != a.createdAt ? b.createdAt.compareTo(a.createdAt) : b.id.compareTo(a.id));
  return rows;
}

/// 同じ内容が続く行をまとめた 1 行
class CoinLedgerGroup {
  final String key;
  final String coinType;
  final String kind;
  final String label;
  int count = 1;
  int delta;
  int firstAt;
  final int lastAt;

  CoinLedgerGroup._(this.key, this.coinType, this.kind, this.label, this.delta, this.firstAt, this.lastAt);

  factory CoinLedgerGroup.of(CoinLedgerRow row) =>
      CoinLedgerGroup._(row.id.toString(), row.coinType, row.kind, coinLedgerLabel(row), row.delta, row.createdAt, row.createdAt);
}

class CoinLedgerDay {
  CoinLedgerDay(this.dateKey, this.at);

  final String dateKey;
  final int at;
  final List<CoinLedgerGroup> groups = [];
}

/// 日付ごとに分け、同じ内容が続く行は 1 行にまとめる（連続で生成すると同じ行が何十も並ぶため）。rows は新しい順
List<CoinLedgerDay> groupCoinLedgerByDay(List<CoinLedgerRow> rows) {
  final days = <CoinLedgerDay>[];
  for (final row in rows) {
    final key = jstDateKey(row.createdAt);
    if (days.isEmpty || days.last.dateKey != key) days.add(CoinLedgerDay(key, row.createdAt));
    final day = days.last;
    final label = coinLedgerLabel(row);
    final last = day.groups.isEmpty ? null : day.groups.last;
    if (last != null && last.coinType == row.coinType && last.kind == row.kind && last.label == label) {
      last.count += 1;
      last.delta += row.delta;
      last.firstAt = row.createdAt;
      continue;
    }
    day.groups.add(CoinLedgerGroup.of(row));
  }
  return days;
}

/// 今日もらった・使った・失効した枚数（プレミアムも含む）
({int received, int used, int expired}) todayCoinLedgerStats(List<CoinLedgerRow> rows, int nowSeconds) {
  final today = jstDateKey(nowSeconds);
  var received = 0, used = 0, expired = 0;
  for (final row in rows) {
    if (jstDateKey(row.createdAt) != today) continue;
    if (row.kind == 'CONSUME') {
      used += row.delta.abs();
    } else if (row.kind == 'EXPIRE') {
      expired += row.delta.abs();
    } else if (row.delta > 0) {
      received += row.delta;
    }
  }
  return (received: received, used: used, expired: expired);
}

/// 期限の早い順。同じ時刻はフリーを先に
List<ExpiringCoinLot> sortExpiringLots(List<ExpiringCoinLot> lots) {
  int rank(ExpiringCoinLot l) => l.coinType == 'FREE' ? 0 : 1;
  return [...lots]..sort((a, b) => a.expiresAt != b.expiresAt ? a.expiresAt.compareTo(b.expiresAt) : rank(a).compareTo(rank(b)));
}

/// 残高のうち一覧に出ない分（期限なし）。一覧が上限まであるときは正しく出せないので 0
({int free, int premium}) noExpiryCoins(List<ExpiringCoinLot> lots, {required int freeBalance, required int premiumBalance}) {
  if (lots.length >= maxExpiringCoinLots) return (free: 0, premium: 0);
  int sum(String type) => lots.where((l) => l.coinType == type).fold(0, (t, l) => t + l.amount);
  final free = freeBalance - sum('FREE');
  final premium = premiumBalance - sum('PREMIUM');
  return (free: free < 0 ? 0 : free, premium: premium < 0 ? 0 : premium);
}

/// 残高カードの下の一言（次に失効する分、なければ期限なし／もらい方）
String coinBalanceNote(List<ExpiringCoinLot> lots, String coinType, int balance, int nowSeconds) {
  final next = sortExpiringLots(lots.where((l) => l.coinType == coinType).toList());
  if (next.isNotEmpty) {
    final lot = next.first;
    final when = formatCoinExpiry(lot.expiresAt, nowSeconds);
    return tr('$when に ${formatCount(lot.amount)} 枚失効', '${formatCount(lot.amount)} expire $when');
  }
  if (balance > 0) return tr('有効期限なし', 'No expiry');
  return coinType == 'FREE' ? tr('毎日もらえます', 'Granted daily') : tr('購入から3か月有効', 'Valid for 3 months');
}

// -----------------------------------------------------------------------------
// 画面
// -----------------------------------------------------------------------------

int _now() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

Widget _coinIcon(String coinType, {double size = 20}) => coinType == 'PREMIUM'
    ? Icon(Icons.diamond_rounded, size: size, color: Ds.purple)
    : Icon(Icons.monetization_on_rounded, size: size, color: Ds.gold);

/// コイン（Web の /settings/points と同じ表示）。残高・履歴・失効予定・推し。購入と換金は置かない
class CoinsScreen extends StatefulWidget {
  const CoinsScreen({super.key, this.initialTab});

  /// history / expiry / support
  final String? initialTab;

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  static const _tabs = ['history', 'expiry', 'support'];

  late int _tab = _tabs.indexOf(widget.initialTab ?? '').clamp(0, _tabs.length - 1);

  CoinsOverview? _data;
  String? _error;

  // 履歴
  CoinLedgerFilter _filter = CoinLedgerFilter.all;
  List<CoinLedgerRow> _older = [];
  int _visibleDays = coinLedgerDaysStep;
  bool _hasMoreRows = false;
  bool _loadingMore = false;

  // 失効予定
  bool _expiryExpanded = false;

  // 推し
  Map<String, dynamic>? _support;
  bool _supportError = false;
  bool _supportRequested = false;

  bool get _loggedIn => FirebaseAuth.instance.currentUser != null;

  @override
  void initState() {
    super.initState();
    _load();
    if (_tabs[_tab] == 'support') _loadSupport();
  }

  Future<void> _load() async {
    if (!_loggedIn) return;
    setState(() => _error = null);
    try {
      final json = await GenApi.webGet('/api/coins/summary?includeLedger=1&includeExpiringLots=1&includeLedgerLimit=$coinLedgerPageSize');
      if (json == null) throw ApiException(tr('残高を読み込めませんでした', 'Could not load your balance'));
      final data = CoinsOverview.fromJson(json);
      if (!mounted) return;
      setState(() {
        _data = data;
        // 取り直したら、続きの読み込みも最初からにする
        _older = [];
        _visibleDays = coinLedgerDaysStep;
        _hasMoreRows = data.ledger.length >= coinLedgerPageSize;
      });
    } catch (e) {
      if (mounted) setState(() => _error = e is ApiException ? e.message : tr('残高を読み込めませんでした', 'Could not load your balance'));
    }
  }

  Future<void> _loadSupport() async {
    _supportRequested = true;
    setState(() => _supportError = false);
    try {
      final id = await UserApi.viewerId();
      if (id == null) throw const ApiException('');
      final data = await GenApi.webGet('/api/coins/support/summary/${Uri.encodeComponent(id)}');
      if (data == null) throw const ApiException('');
      if (mounted) setState(() => _support = data);
    } catch (_) {
      if (mounted) setState(() => _supportError = true);
    }
  }

  Future<void> _refresh() async {
    await Future.wait([_load(), if (_supportRequested) _loadSupport()]);
  }

  Future<void> _loadMore(bool hasHiddenDays) async {
    if (hasHiddenDays) {
      setState(() => _visibleDays += coinLedgerDaysStep);
      return;
    }
    final first = _data?.ledger ?? const <CoinLedgerRow>[];
    setState(() => _loadingMore = true);
    try {
      final offset = first.length + _older.length;
      final json = await GenApi.webGet('/api/coins/summary?includeLedger=1&includeLedgerLimit=$coinLedgerPageSize&includeLedgerOffset=$offset');
      final next = CoinLedgerRow.listFrom(json?['ledger']);
      if (!mounted) return;
      setState(() {
        _older = [..._older, ...next];
        _hasMoreRows = next.length >= coinLedgerPageSize;
        _visibleDays += coinLedgerDaysStep;
      });
    } catch (_) {
      if (mounted) context.toast(tr('履歴を読み込めませんでした', 'Could not load history'), error: true);
    } finally {
      if (mounted) setState(() => _loadingMore = false);
    }
  }

  void _selectTab(int i) {
    setState(() => _tab = i);
    if (_tabs[i] == 'support' && !_supportRequested) _loadSupport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('コイン', 'Coins'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: !_loggedIn
          ? StateView.empty(
              tr('ログインしてください', 'Please log in'),
              icon: Icons.monetization_on_outlined,
              actionLabel: tr('ログイン', 'Log in'),
              onAction: () => Nav.login(context),
            )
          : _data == null && _error != null
          ? StateView.error(_error!, onRetry: _load)
          : AppRefresh(
              onRefresh: _refresh,
              child: ListView(
                padding: const EdgeInsets.only(bottom: Ds.s32),
                children: [
                  ContentWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _balanceCard(context),
                        const SizedBox(height: Ds.s16),
                        PillTabs(labels: [tr('履歴', 'History'), tr('有効期限', 'Expiry'), tr('推し', 'Support')], index: _tab, onChanged: _selectTab),
                        const SizedBox(height: Ds.s16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Ds.s16),
                          child: switch (_tabs[_tab]) {
                            'expiry' => _expiryTab(context),
                            'support' => _supportTab(context),
                            _ => _historyTab(context),
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  BoxDecoration _box(BuildContext context, {double radius = 14}) =>
      BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(radius), border: Border.all(color: context.hairline));

  Widget _small(BuildContext context, String text) => Text(text, style: TextStyle(color: context.muted, fontSize: 12));

  Widget _note(BuildContext context, String text) => Text(text, style: TextStyle(color: context.muted, fontSize: 13, height: 1.6));

  Widget _empty(BuildContext context, String text) => Container(
    padding: const EdgeInsets.symmetric(vertical: 40),
    alignment: Alignment.center,
    decoration: BoxDecoration(borderRadius: Ds.br(14), border: Border.all(color: context.hairline)),
    child: Text(text, style: TextStyle(color: context.muted, fontSize: 13)),
  );

  /// 縦に並べ、間に細い線を引いた枠
  Widget _rows(BuildContext context, List<Widget> children) => Container(
    decoration: _box(context),
    clipBehavior: Clip.antiAlias,
    child: Column(children: [
      for (var i = 0; i < children.length; i++) ...[
        children[i],
        if (i != children.length - 1) Divider(height: 1, color: context.hairline),
      ],
    ]),
  );

  Widget _amountRow(BuildContext context, {required String coinType, required Widget label, required String amount, Color? color, FontWeight weight = FontWeight.w700, VoidCallback? onTap}) {
    final row = Padding(
      padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: 10),
      child: Row(children: [
        _coinIcon(coinType),
        const SizedBox(width: Ds.s12),
        Expanded(child: label),
        const SizedBox(width: Ds.s8),
        Text(amount, style: TextStyle(fontWeight: weight, fontSize: 14, color: color, fontFeatures: const [FontFeature.tabularFigures()])),
      ]),
    );
    return onTap == null ? row : InkWell(onTap: onTap, child: row);
  }

  // 残高 ----------------------------------------------------------------------

  Widget _balanceCard(BuildContext context) {
    final d = _data;
    final now = _now();
    Widget tile(String coinType, String label, int balance) => Padding(
      padding: const EdgeInsets.all(Ds.s16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          _coinIcon(coinType),
          const SizedBox(width: Ds.s6),
          Flexible(child: Text(label, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
        ]),
        SizedBox(
          height: 44,
          child: Align(
            alignment: Alignment.centerLeft,
            child: d != null
                ? FittedBox(child: Text(formatCount(balance), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 30, fontFeatures: [FontFeature.tabularFigures()])))
                : const Skeleton(width: 80, height: 30, radius: 8),
          ),
        ),
        SizedBox(
          height: 18,
          child: d != null
              ? Text(coinBalanceNote(d.lots, coinType, balance, now), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 12))
              : const Align(alignment: Alignment.centerLeft, child: Skeleton(width: 96, height: 12, radius: 6)),
        ),
      ]),
    );
    return Container(
      margin: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 0),
      decoration: _box(context, radius: 18),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(child: tile('FREE', tr('フリーコイン', 'Free coins'), d?.free ?? 0)),
          VerticalDivider(width: 1, color: context.hairline),
          Expanded(child: tile('PREMIUM', tr('プレミアムコイン', 'Premium coins'), d?.premium ?? 0)),
        ]),
      ),
    );
  }

  // 履歴 ----------------------------------------------------------------------

  Widget _historyTab(BuildContext context) {
    final first = _data?.ledger;
    final now = _now();
    final rows = mergeCoinLedger(first ?? const [], _older);
    final days = groupCoinLedgerByDay(rows.where((r) => matchesCoinLedgerFilter(r, _filter)).toList());
    final stats = todayCoinLedgerStats(rows, now);
    final visible = days.take(_visibleDays).toList();
    final hasHiddenDays = days.length > _visibleDays;
    final filters = {
      CoinLedgerFilter.all: tr('すべて', 'All'),
      CoinLedgerFilter.received: tr('もらった', 'Received'),
      CoinLedgerFilter.used: tr('使った', 'Used'),
      CoinLedgerFilter.expired: tr('失効', 'Expired'),
    };
    final today = [(tr('もらった', 'Received'), stats.received), (tr('使った', 'Used'), stats.used), (tr('失効', 'Expired'), stats.expired)];

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(padding: const EdgeInsets.only(bottom: Ds.s8), child: _small(context, tr('今日のコイン', 'Today'))),
      Container(
        decoration: _box(context),
        child: IntrinsicHeight(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            for (var i = 0; i < today.length; i++) ...[
              if (i > 0) VerticalDivider(width: 1, color: context.hairline),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: Ds.s8),
                  child: Column(children: [
                    _small(context, today[i].$1),
                    const SizedBox(height: Ds.s2),
                    SizedBox(
                      height: 26,
                      child: Center(
                        child: first != null
                            ? Text(formatCount(today[i].$2), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, fontFeatures: [FontFeature.tabularFigures()]))
                            : const Skeleton(width: 40, height: 18, radius: 6),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ]),
        ),
      ),
      const SizedBox(height: Ds.s16),
      PillTabs(
        padding: EdgeInsets.zero,
        labels: filters.values.toList(),
        index: _filter.index,
        onChanged: (i) => setState(() {
          _filter = CoinLedgerFilter.values[i];
          _visibleDays = coinLedgerDaysStep;
        }),
      ),
      const SizedBox(height: Ds.s16),
      if (first == null)
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Skeleton(width: 64, height: 14, radius: 6),
          for (var i = 0; i < 3; i++) ...[const SizedBox(height: Ds.s8), const Skeleton(height: 56)],
        ])
      else if (visible.isEmpty)
        _empty(context, _filter == CoinLedgerFilter.all ? tr('まだ履歴はありません', 'No history yet') : tr('該当する履歴はありません', 'Nothing to show'))
      else
        for (final day in visible) ...[
          Padding(padding: const EdgeInsets.only(bottom: Ds.s6, left: Ds.s2), child: _small(context, formatLedgerDay(day.at, now))),
          _rows(context, [for (final g in day.groups) _ledgerRow(context, g)]),
          const SizedBox(height: Ds.s16),
        ],
      if (first != null && (hasHiddenDays || _hasMoreRows))
        SecondaryButton(label: tr('もっと見る', 'Show more'), loading: _loadingMore, onPressed: () => _loadMore(hasHiddenDays)),
    ]);
  }

  Widget _ledgerRow(BuildContext context, CoinLedgerGroup g) {
    final sign = g.delta > 0 ? '+' : g.delta < 0 ? '−' : '';
    final expired = g.kind == 'EXPIRE';
    return _amountRow(
      context,
      coinType: g.coinType,
      label: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text.rich(TextSpan(children: [
          TextSpan(text: g.label),
          if (g.count > 1) TextSpan(text: '  ×${g.count}', style: TextStyle(color: context.muted, fontSize: 12)),
        ]), style: const TextStyle(fontSize: 14, height: 1.35)),
        Text(g.count > 1 ? '${formatJstTime(g.firstAt)} 〜 ${formatJstTime(g.lastAt)}' : formatJstTime(g.lastAt), style: TextStyle(color: context.muted, fontSize: 12)),
      ]),
      amount: '$sign${formatCount(g.delta.abs())}',
      color: expired ? context.muted : g.delta > 0 ? Ds.gold : null,
      weight: expired ? FontWeight.w400 : FontWeight.w700,
    );
  }

  // 失効予定 ------------------------------------------------------------------

  Widget _expiryTab(BuildContext context) {
    final d = _data;
    if (d == null) return const Column(children: [Skeleton(height: 48), SizedBox(height: Ds.s8), Skeleton(height: 48)]);
    final now = _now();
    final lots = sortExpiringLots(d.lots);
    final visible = _expiryExpanded ? lots : lots.take(expiringLotsInitialVisible).toList();
    final hidden = lots.skip(expiringLotsInitialVisible).fold(0, (t, l) => t + l.amount);
    final noExpiry = noExpiryCoins(lots, freeBalance: d.free, premiumBalance: d.premium);
    final muted = TextStyle(color: context.muted, fontSize: 14);

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _note(
        context,
        tr(
          '生成ではフリーコインから先に使い、同じ種類の中では期限の近いものから減ります。毎日のフリーコインは当日24:00まで、購入したプレミアムコインは3か月有効です。',
          'Generation uses free coins first, and within each type the coins closest to expiry go first. Daily free coins last until 24:00 that day, and purchased premium coins last 3 months.',
        ),
      ),
      const SizedBox(height: Ds.s16),
      if (lots.isEmpty && noExpiry.free == 0 && noExpiry.premium == 0)
        _empty(context, tr('失効予定のコインはありません', 'No coins are scheduled to expire'))
      else
        _rows(context, [
          for (final lot in visible)
            _amountRow(
              context,
              coinType: lot.coinType,
              label: Text.rich(TextSpan(children: [
                TextSpan(text: formatCoinExpiry(lot.expiresAt, now)),
                TextSpan(text: tr(' まで', ''), style: TextStyle(color: context.muted)),
              ]), style: const TextStyle(fontSize: 14)),
              amount: formatCount(lot.amount),
            ),
          if (noExpiry.free > 0) _amountRow(context, coinType: 'FREE', label: Text(tr('有効期限なし', 'No expiry'), style: muted), amount: formatCount(noExpiry.free)),
          if (noExpiry.premium > 0)
            _amountRow(context, coinType: 'PREMIUM', label: Text(tr('有効期限なし（推してもらった分など）', 'No expiry (received as support, etc.)'), style: muted), amount: formatCount(noExpiry.premium)),
        ]),
      if (!_expiryExpanded && lots.length > expiringLotsInitialVisible) ...[
        const SizedBox(height: Ds.s16),
        SecondaryButton(
          label: tr('もっと見る（${formatCount(hidden)} 枚）', 'Show more (${formatCount(hidden)} coins)'),
          onPressed: () => setState(() => _expiryExpanded = true),
        ),
      ],
    ]);
  }

  // 推し ----------------------------------------------------------------------

  Widget _supportTab(BuildContext context) {
    final s = _support;
    int? rank(String key) {
      final v = s?[key];
      return v is num && v > 0 ? v.toInt() : null;
    }

    final items = [
      (tr('今週 推した', 'Given this week'), 'weeklySentPt', 'weeklySentRank'),
      (tr('今週 推された', 'Received this week'), 'weeklyReceivedPt', 'weeklyReceivedRank'),
      (tr('累計 推した', 'Given in total'), 'cumulativeSentPt', 'cumulativeSentRank'),
      (tr('累計 推された', 'Received in total'), 'cumulativeReceivedPt', 'cumulativeReceivedRank'),
    ];

    Widget cell((String, String, String) item) => Padding(
      padding: const EdgeInsets.all(Ds.s12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _small(context, item.$1),
        const SizedBox(height: Ds.s4),
        if (s != null) ...[
          Text.rich(TextSpan(children: [
            TextSpan(text: formatCount(_int(s[item.$2])), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
            TextSpan(text: ' pt', style: TextStyle(color: context.muted, fontSize: 12)),
          ]), style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()])),
          const SizedBox(height: Ds.s2),
          _small(context, switch (rank(item.$3)) {
            final r? => tr('${formatCount(r)} 位', 'Rank ${formatCount(r)}'),
            null => tr('順位なし', 'Not ranked'),
          }),
        ] else ...[
          const Skeleton(width: 64, height: 22, radius: 6),
          const SizedBox(height: Ds.s6),
          const Skeleton(width: 40, height: 12, radius: 6),
        ],
      ]),
    );

    Widget pair(int a) => IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(child: cell(items[a])),
        VerticalDivider(width: 1, color: context.hairline),
        Expanded(child: cell(items[a + 1])),
      ]),
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _note(
        context,
        tr(
          'コインでユーザーを推すと pt になります。フリーコインは 1 枚 1pt、プレミアムコインは 1 枚 10pt です。週間の集計は月曜に切り替わります。',
          'Supporting users with coins earns pt: 1pt per free coin and 10pt per premium coin. Weekly totals reset on Monday.',
        ),
      ),
      const SizedBox(height: Ds.s16),
      if (_supportError)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: Ds.s8),
          decoration: _box(context),
          child: Row(children: [
            Expanded(child: Text(tr('読み込めませんでした', 'Could not load'), style: TextStyle(color: context.cs.error, fontSize: 14))),
            SecondaryButton(label: tr('再読み込み', 'Retry'), expand: false, height: 36, onPressed: _loadSupport),
          ]),
        )
      else
        _rows(context, [pair(0), pair(2)]),
      const SizedBox(height: Ds.s16),
      _rows(context, [
        SettingsLink(icon: Icons.emoji_events_outlined, label: tr('推しランキング・貢献度ランキング', 'Support and contribution rankings'), onTap: () => context.push('/coin-rankings')),
        SettingsLink(icon: Icons.card_giftcard_rounded, label: tr('推してくれた人・受け取った履歴', 'Your supporters and received history'), onTap: () => context.push('/settings/support-received')),
      ]),
    ]);
  }
}
