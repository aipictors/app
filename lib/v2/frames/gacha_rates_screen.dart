import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/frames/frame_widgets.dart';
import 'package:aipictors/v2/frames/frames_api.dart';
import 'package:aipictors/v2/frames/gacha_rules.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String _n(int v) => v.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',');

/// 提供割合（確率）とご注意（Web の /gacha/rates）。
/// UUR は取られた枠が抜けるので、いまの割合はサーバー（gachaRates）から読む。読めるまでは「UUR が全部残っている」ときの値を出す。
/// 景品ごとの割合は、サーバーの「取られた UUR」から gacha_rules.dart で計算する（サーバーと同じ計算）。
/// App Store・Google Play の決まりで、ガチャの画面から必ず見られるようにしておく
class GachaRatesScreen extends StatefulWidget {
  const GachaRatesScreen({super.key});

  @override
  State<GachaRatesScreen> createState() => _GachaRatesScreenState();
}

class _GachaRatesScreenState extends State<GachaRatesScreen> {
  GachaRatesSnapshot? _rates;

  @override
  void initState() {
    super.initState();
    FramesApi.rates().then((v) {
      if (mounted) setState(() => _rates = v);
    }).catchError((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final snap = _rates;
    final pool = GachaRules.poolWithout(snap?.takenPrizeIds ?? const {});
    final localNormal = GachaRules.rarityRates(GachaRarity.n, pool);
    final localGuaranteed = GachaRules.rarityRates(GachaRules.tenPullGuarantee, pool);
    final normal = {for (final r in GachaRarity.values) r: snap?.normal[r] ?? localNormal[r]!};
    final guaranteed = {for (final r in GachaRarity.values) r: snap?.guaranteed[r] ?? localGuaranteed[r]!};
    final total = GachaRules.uniquePrizes.length;
    final remaining = snap?.remainingUniquePrizes ?? total;
    final uur = GachaRules.rates[GachaRarity.uur]!;
    final nNow = GachaRules.rates[GachaRarity.n]!;
    const fmt = GachaRules.formatRate;
    final desc = GachaRules.raritiesDesc;
    final shardRarities = desc.where((r) => !r.isUnique).toList();
    final prizes = [...GachaRules.pool]..sort((a, b) => b.rarity.index - a.rarity.index != 0 ? b.rarity.index - a.rarity.index : a.kind.index - b.kind.index);
    final g = GachaRules.tenPullGuarantee.label;
    return Scaffold(
      appBar: AppBar(title: Text(tr('提供割合・ご注意', 'Rates & notes'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s32),
        children: [
          ContentWidth(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              _h(context, tr('料金', 'Prices')),
              _Table(rows: [
                [tr('プレミアムコイン（有償）で 1 回', 'Premium coins (paid), 1 pull'), tr('${_n(GachaRules.premiumSingle)} 枚', _n(GachaRules.premiumSingle))],
                [
                  tr('プレミアムコイン（有償）で 10 連', 'Premium coins (paid), 10 pulls'),
                  tr('${_n(GachaRules.premiumTen)} 枚（1 日 1 回目だけ半額の ${_n(GachaRules.premiumDailyTen)} 枚）', '${_n(GachaRules.premiumTen)} (first of the day: ${_n(GachaRules.premiumDailyTen)})'),
                ],
                [
                  tr('フリーコイン（無償）で 1 回', 'Free coins, 1 pull'),
                  tr('1 日 1 回目 ${GachaRules.freeFirst} 枚、2 回目から ${GachaRules.freeSingle} 枚（1 日 ${GachaRules.freeDailyLimit} 回まで。10 連はありません）', 'First of the day ${GachaRules.freeFirst}, then ${GachaRules.freeSingle} (up to ${GachaRules.freeDailyLimit} a day, no 10x)'),
                ],
              ]),
              _note(context, tr('「1 日」は日本時間の 0:00 で切り替わります。プレミアムコインで引くときはプレミアムコインだけ、フリーコインで引くときはフリーコインだけを使います。', 'A "day" resets at 0:00 JST. Premium pulls use only premium coins; free pulls use only free coins.')),
              _h(context, tr('レア度ごとの提供割合', 'Rates by rarity')),
              _Table(header: [tr('レア度', 'Rarity'), tr('種類', 'Kinds'), tr('通常', 'Normal'), tr('10 連の 10 枠目（確定枠）', '10th of 10x (guaranteed)')], rows: [
                for (final r in desc)
                  [
                    r,
                    r.isUnique ? tr('$remaining 種（全 $total 種）', '$remaining of $total') : tr('${pool.where((p) => p.rarity == r).length} 種', '${pool.where((p) => p.rarity == r).length}'),
                    fmt(normal[r]!),
                    fmt(guaranteed[r]!),
                  ],
              ]),
              _bullets(context, [
                tr('上の表は、いまの UUR の残り数（$remaining / $total）での実際の割合です${snap == null ? '（読み込み中は全部残っているときの値）' : ''}。', 'The table shows the current rates with $remaining of $total UUR left${snap == null ? ' (while loading: all left)' : ''}.'),
                tr('1 回引きと、10 連の 1〜9 枠目は「通常」の割合です。', 'Single pulls and slots 1–9 of a 10x pull use the "Normal" rates.'),
                tr('10 連の 10 枠目は、1〜9 枠目に $g 以上が出ていないときだけ「確定枠」の割合（$g 以上だけ）で抽選します。出ているときは「通常」の割合です。', 'The 10th slot uses the "Guaranteed" rates ($g+ only) only if slots 1–9 had no $g+; otherwise "Normal".'),
                tr('同じレア度の中では、どの景品も同じ割合です。持っているかどうかで割合は変わりません（UUR は下のとおり、取られた枠がなくなります）。', 'Within a rarity every prize has the same rate, whether you own it or not (claimed UUR frames are removed, see below).'),
                tr('抽選は 1 回ずつ独立して、サーバーで行います。表示の割合は小数第 3 位あたりで丸めています。', 'Each pull is independent and drawn on the server. Rates are rounded to about 3 decimals.'),
              ]),
              _h(context, tr('UUR について（世界でひとりだけの枠）', 'About UUR (one of a kind)')),
              _bullets(context, [
                tr('UUR は全 $total 種で、どれも最初に当てた 1 人だけが持てます。誰かが当てた枠はその時点でガチャから抜け、ほかの人には二度と出ません。', 'There are $total UUR frames. Each can be owned by only the first person to pull it; once claimed it leaves the gacha for good.'),
                tr('UUR の割合は 1 回あたり合計 ${fmt(uur)}（10 連の 10 枠目の確定枠も同じ）で、残っている UUR で等分します。いまは $remaining 種が残っていて、1 種あたり ${fmt(snap?.uniquePrizeRate ?? (remaining > 0 ? uur / remaining : 0))} です。',
                    'UUR totals ${fmt(uur)} per pull (also in the guaranteed slot), split evenly among the remaining UUR. $remaining left now, ${fmt(snap?.uniquePrizeRate ?? (remaining > 0 ? uur / remaining : 0))} each.'),
                tr('この ${fmt(uur)} は N の割合から引いています（UUR を入れる前の N は ${fmt(nNow + uur)}、いまは ${fmt(nNow)}）。ほかのレア度の割合は変わりません。$total 種すべてが取られたら UUR は 0% になり、N は ${fmt(nNow + uur)} に戻ります。',
                    'This ${fmt(uur)} is taken from N (N was ${fmt(nNow + uur)}, now ${fmt(nNow)}). Other rarities are unchanged. When all $total are claimed, UUR becomes 0% and N returns to ${fmt(nNow + uur)}.'),
                tr('確定枠では、UUR が残っていれば UUR が ${fmt(uur)}、残りの ${fmt(100 - uur)} を $g 以上で分けます。UUR は $g 以上として数えます。', 'In the guaranteed slot UUR is ${fmt(uur)} while any remain; the other ${fmt(100 - uur)} is split among $g+. UUR counts as $g+.'),
                tr('UUR は交換 pt・かけらでは交換できません（ガチャで当てた人だけのものです）。かぶることもありません。', 'UUR cannot be exchanged for pt or shards (only by pulling), and never duplicates.'),
                tr('同時に引いた人が同じ UUR に当たったときは、先に記録された 1 人のものになり、もう 1 人の枠は UUR を除いて引き直します（10 連でその UUR がただ 1 つの $g 以上だったときは $g 以上で引き直します）。',
                    'If two people pull the same UUR at the same moment, the first recorded wins; the other slot is redrawn without UUR (as $g+ if it was the only $g+ in a 10x pull).'),
                tr('当てた人はふつうの景品と同じように着けられます。ガチャの画面に、当てた人の名前・アイコンと日付が載ります（退会した人は「退会したユーザー」と出ます）。', 'The winner can equip it like any prize. The gacha screen shows the winner\'s name, icon and date ("Deleted user" if they left).'),
              ]),
              _h(context, tr('天井（交換 pt）・かぶり（かけら）', 'Pity (exchange pt) and duplicates (shards)')),
              _bullets(context, [
                tr('1 回引くごとに交換 pt が 1 たまります（10 連は 10、フリーコインで引いても 1）。${GachaRules.exchangePoints} pt で、ラインナップの中からまだ持っていない景品を 1 つ選んでもらえます（UR も選べます。UUR は選べません）。UR が出ても pt は減りません。',
                    'Each pull gives 1 exchange pt (10 for a 10x, 1 for a free pull). With ${GachaRules.exchangePoints} pt you can pick any prize you don\'t own (UR included, UUR excluded). Getting a UR does not reset pt.'),
                tr('すでに持っている景品が出たときは、かけらになります（${shardRarities.map((r) => '${r.label} ${GachaRules.duplicateShards[r]} 個').join('・')}）。かけらで、まだ持っていない景品と交換できます（${shardRarities.map((r) => '${r.label} ${_n(GachaRules.exchangeShards[r]!)} 個').join('・')}）。',
                    'Duplicates become shards (${shardRarities.map((r) => '${r.label} ${GachaRules.duplicateShards[r]}').join(', ')}). Shards can be exchanged for prizes you don\'t own (${shardRarities.map((r) => '${r.label} ${_n(GachaRules.exchangeShards[r]!)}').join(', ')}).'),
                tr('交換 pt とかけらに有効期限はありません。ガチャを終える・ラインナップを入れ替えるときは、扱いを 30 日以上前にお知らせします。', 'Exchange pt and shards never expire. We will announce at least 30 days before ending the gacha or changing the lineup.'),
              ]),
              _h(context, tr('景品ごとの提供割合', 'Rates by prize')),
              _Table(small: true, header: [tr('レア度', 'Rarity'), tr('景品', 'Prize'), tr('種類', 'Type'), tr('通常', 'Normal'), tr('確定枠', 'Guar.')], rows: [
                for (final p in prizes)
                  [
                    p.rarity,
                    p.name + (p.rarity.isUnique && (snap?.takenPrizeIds.contains(p.id) ?? false) ? tr('（獲得済み）', ' (claimed)') : ''),
                    p.kind == GachaPrizeKind.icon ? tr('アイコン枠', 'Avatar') : tr('ヘッダー枠', 'Header'),
                    fmt(GachaRules.prizeRate(p, inPool: pool)),
                    fmt(GachaRules.prizeRate(p, guaranteed: true, inPool: pool)),
                  ],
              ]),
              _h(context, tr('ご注意', 'Notes')),
              _bullets(context, [
                tr('景品は Aipictors のアカウントで使える見た目の飾り（アイコン枠・ヘッダー枠）です。お金や他のサービスのものとの交換、ほかの人への譲渡、払い戻しはできません。', 'Prizes are cosmetic items (avatar and header frames) for your Aipictors account. They cannot be exchanged for money or other services, transferred, or refunded.'),
                tr('引いたあとの取り消し・コインの返却はできません（不具合で景品が付かなかったときは、お問い合わせください）。', 'Pulls cannot be undone and coins are not returned (contact us if a prize was not granted due to a bug).'),
                tr('特定の景品をそろえると別の景品がもらえる仕組みはありません。', 'There is no reward for completing a set of prizes.'),
                tr('購入したプレミアムコインは購入日から 3 か月で失効します。未成年の方は、保護者の方の同意を得てからプレミアムコインを購入してください。', 'Purchased premium coins expire 3 months after purchase. Minors must get a guardian\'s consent before buying.'),
                tr('提供割合・料金・ラインナップを変えるときは、事前にこのページとお知らせでお伝えします。', 'Changes to rates, prices or lineup are announced in advance on this page and in announcements.'),
              ]),
              const SizedBox(height: Ds.s8),
              Wrap(spacing: 4, children: [
                _link(tr('プレミアムコイン規約', 'Premium coin policy'), '/premium-coins/policy'),
                _link(tr('特定商取引法に基づく表記', 'Commercial transactions act'), '/specified-commercial-transaction-act'),
                _link(tr('利用規約', 'Terms of use'), '/terms'),
              ]),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _h(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(top: Ds.s20, bottom: Ds.s8),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
      );

  Widget _note(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(top: Ds.s8),
        child: Text(text, style: TextStyle(color: context.muted, fontSize: 12, height: 1.6)),
      );

  Widget _bullets(BuildContext context, List<String> items) => Padding(
        padding: const EdgeInsets.only(top: Ds.s8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (final t in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('・', style: TextStyle(height: 1.6)),
                Expanded(child: Text(t, style: const TextStyle(fontSize: 13, height: 1.6))),
              ]),
            ),
        ]),
      );

  Widget _link(String label, String path) => TextButton(
        onPressed: () => launchUrl(Uri.parse('${GachaRules.webOrigin}$path'), mode: LaunchMode.inAppBrowserView),
        child: Text(label),
      );
}

/// 罫線つきの表。セルは String か GachaRarity（札で出す）
class _Table extends StatelessWidget {
  const _Table({required this.rows, this.header, this.small = false});

  final List<String>? header;
  final List<List<Object>> rows;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final border = BorderSide(color: context.hairline);
    final fs = small ? 11.0 : 13.0;
    Widget cell(Object v, {bool head = false}) => Padding(
          padding: const EdgeInsets.all(8),
          child: v is GachaRarity
              ? Align(alignment: Alignment.centerLeft, child: RarityBadge(v, small: small))
              : Text(v.toString(), style: TextStyle(fontSize: fs, fontWeight: head ? FontWeight.w700 : FontWeight.w400)),
        );
    final cols = header?.length ?? rows.first.length;
    return Table(
      border: TableBorder(top: border, bottom: border, left: border, right: border, horizontalInside: border, verticalInside: border),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: cols == 2 ? const {0: FlexColumnWidth(1.1), 1: FlexColumnWidth(1)} : null,
      children: [
        if (header != null)
          TableRow(decoration: BoxDecoration(color: context.skeleton), children: [for (final h in header!) cell(h, head: true)]),
        for (final r in rows)
          TableRow(children: [
            for (final (i, c) in r.indexed) cols == 2 && i == 0 ? ColoredBox(color: context.skeleton.withValues(alpha: 0.6), child: cell(c, head: true)) : cell(c),
          ]),
      ],
    );
  }
}
