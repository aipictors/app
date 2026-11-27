import 'package:aipictors/v2/community/web_links.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:aipictors/v2/work/work_promotion.dart';
import 'package:flutter/material.dart';

// ホームの「おすすめ作品」（Web の components/work/work-promotion.tsx の HomePromotionWorksSection と同じ）。
// 宣伝中の作品を先頭に PR の印付きで並べ、残りをおすすめ作品（PR の印も宣伝の枠も付けない）で埋めて、
// 「段の数 × 列数」ぴったりにする（空きマスを出さない）。アプリは R18 を出さないので全年齢の枠（isSensitive: false）だけ。

/// Web と同じ 6 件
const homePromotionLimit = 6;

/// 段の数（宣伝が多くて入りきらないときだけ段を増やす。Web と同じ）
const homePicksRows = 2;

const homePromotionQuery = '''
query AppHomePromotionWorks(\$limit: Int!, \$isSensitive: Boolean) {
  promotionWorks(limit: \$limit, isSensitive: \$isSensitive) {
    $workCardFields
    relatedUrl
  }
}''';

/// 宣伝の後ろに並べるおすすめ作品（Web のトップのおすすめと同じ recommendedFeedWorks）
const homePicksFillQuery = '''
query AppHomePicksFillWorks(\$limit: Int!, \$ratings: [Rating!]) {
  recommendedFeedWorks(offset: 0, limit: \$limit, ratings: \$ratings) {
    $workCardFields
  }
}''';

/// 「詳しく見る」を出せる URL か（Web の isValidUrl と同じ: http/https で始まる）
bool isPromotionLinkUrl(String? url) => url != null && RegExp(r'^https?://').hasMatch(url);

/// 宣伝作品と、作者が付けた関連リンク
class PromotionWork {
  const PromotionWork({required this.work, this.relatedUrl});

  final WorkSummary work;
  final String? relatedUrl;
}

/// API の並び（新しい順）のまま読む。R18 などアプリで出さない作品は除く
List<PromotionWork> promotionWorksFrom(List<Map<String, dynamic>> items) {
  final urls = {for (final j in items) j.str('id'): j.strOrNull('relatedUrl')};
  return WorkSummary.listFrom(items).map((w) {
    final url = urls[w.id]?.trim();
    return PromotionWork(work: w, relatedUrl: isPromotionLinkUrl(url) ? url : null);
  }).toList();
}

Future<List<PromotionWork>> fetchHomePromotionWorks() async {
  final data = await Api.query(homePromotionQuery, variables: {'limit': homePromotionLimit, 'isSensitive': false}, cacheFor: const Duration(minutes: 3));
  return promotionWorksFrom(data.list('promotionWorks'));
}

/// 宣伝の後ろに並べるおすすめ作品（3 列 × 2 段ぶん＋アプリで出さない作品で外れる分の余り）
Future<List<WorkSummary>> fetchHomePicksFillWorks() async {
  final data = await Api.query(homePicksFillQuery, variables: {'limit': 12, 'ratings': appRatings}, cacheFor: const Duration(minutes: 3));
  return WorkSummary.listFrom(data.list('recommendedFeedWorks'));
}

/// 宣伝 promotionCount 件の後ろにおすすめ fillCount 件を cols 列で並べるとき、何件並べれば段がぴったり埋まるか。
/// 宣伝は隠さない（入りきらなければ段を増やす）。おすすめが足りなければ段を減らす（Web の toHomePicksLayout と同じ）
int homePicksTotal(int promotionCount, int fillCount, int cols) {
  final promotionRows = (promotionCount + cols - 1) ~/ cols;
  final total = (promotionRows > homePicksRows ? promotionRows : homePicksRows) * cols;
  final available = promotionCount + fillCount;
  if (total <= available) return total;
  final filled = (available ~/ cols) * cols;
  return filled > promotionRows * cols ? filled : promotionRows * cols;
}

/// ホームの「おすすめ作品」の欄。宣伝が先頭（PR の印付き）、残りはおすすめ作品。どちらも無ければ何も出さない
class HomePromotionSection extends StatelessWidget {
  const HomePromotionSection({super.key, required this.works, this.fillWorks = const []});

  final List<PromotionWork> works;

  /// 宣伝の後ろに並べるおすすめ作品（宣伝と同じ作品はここで除く）
  final List<WorkSummary> fillWorks;

  @override
  Widget build(BuildContext context) {
    final promotionIds = {for (final p in works) p.work.id};
    final fills = fillWorks.where((w) => !promotionIds.contains(w.id)).toList();
    if (works.isEmpty && fills.isEmpty) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            tr('おすすめ作品', 'Recommended works'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.2),
          ),
          if (works.isNotEmpty) ...[
            const SizedBox(height: 4),
            Row(children: [
              const WorkPromotionMark(),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  tr('の付いた作品はクリエイターの宣伝です', 'marks works promoted by their creators'),
                  style: context.tt.bodySmall?.copyWith(color: context.muted),
                ),
              ),
            ]),
          ],
        ]),
      ),
      // Web と同じくスマホは 2 列、広い画面は 3 列
      LayoutBuilder(builder: (context, constraints) {
        final cols = constraints.maxWidth < 560 ? 2 : 3;
        final total = homePicksTotal(works.length, fills.length, cols);
        final rows = <Widget>[];
        for (var i = 0; i < total; i += cols) {
          final cells = <Widget>[];
          for (var c = 0; c < cols; c++) {
            if (c > 0) cells.add(const SizedBox(width: 10));
            final k = i + c;
            final Widget cell;
            if (k < works.length) {
              cell = PromotionWorkCard(item: works[k]);
            } else if (k - works.length < fills.length) {
              cell = PromotionWorkCard(item: PromotionWork(work: fills[k - works.length]), isPlain: true);
            } else {
              cell = const SizedBox.shrink();
            }
            cells.add(Expanded(child: cell));
          }
          if (rows.isNotEmpty) rows.add(const SizedBox(height: 10));
          rows.add(IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: cells)));
        }
        return Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Column(children: rows));
      }),
    ]);
  }
}

/// 「おすすめ作品」のカード（Web の PromotionWorkCard: 4:3 の画像・タイトル・作者）。
/// 宣伝の作品は色の枠・PR の印・詳しく見る、isPlain（宣伝ではないおすすめ）は枠も印も付けない。
/// 長押しはほかの一覧と同じメニュー（いいね・共有など）
class PromotionWorkCard extends StatefulWidget {
  const PromotionWorkCard({super.key, required this.item, this.isPlain = false});

  final PromotionWork item;

  /// 宣伝ではないおすすめ作品
  final bool isPlain;

  @override
  State<PromotionWorkCard> createState() => _PromotionWorkCardState();
}

class _PromotionWorkCardState extends State<PromotionWorkCard> {
  @override
  Widget build(BuildContext context) {
    final work = widget.item.work;
    final url = widget.item.relatedUrl;
    final plain = widget.isPlain;
    final content = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AspectRatio(
        aspectRatio: 4 / 3,
        child: Stack(fit: StackFit.expand, children: [
          // 宣伝ではないおすすめは、ほかの一覧のカードと同じく角を丸めた画像だけ
          AppImage(work.imageUrl, memCacheWidth: 600, radius: plain ? 12 : 0),
          if (!plain) const Positioned(left: 6, top: 6, child: WorkPromotionMark()),
        ]),
      ),
      Expanded(
        child: Padding(
          padding: plain ? const EdgeInsets.only(top: 6) : const EdgeInsets.fromLTRB(10, 8, 10, 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              work.title.isEmpty ? tr('無題', 'Untitled') : work.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.tt.bodyMedium?.copyWith(fontWeight: FontWeight.w700, height: 1.25),
            ),
            const SizedBox(height: 6),
            Row(children: [
              UserAvatar.summary(work.user, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(work.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.bodySmall?.copyWith(color: context.muted)),
              ),
            ]),
            if (url != null && !plain) ...[
              const Spacer(),
              const SizedBox(height: 6),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => WebLinks.open(context, url),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(tr('詳しく見る', 'Learn more'), style: const TextStyle(color: Ds.pink, fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 3),
                  const Icon(Icons.open_in_new_rounded, size: 12, color: Ds.pink),
                ]),
              ),
            ],
          ]),
        ),
      ),
    ]);
    return Pressable(
      scale: 0.97,
      onTap: () => Nav.work(context, work.id),
      onLongPress: () => showWorkCardMenu(context, work, onChanged: () {
        if (mounted) setState(() {});
      }),
      child: plain
          ? content
          : Container(
              padding: const EdgeInsets.all(1.2),
              decoration: BoxDecoration(gradient: workPromotionGradient, borderRadius: Ds.br(14)),
              child: ClipRRect(
                borderRadius: Ds.br(12.8),
                child: ColoredBox(color: context.surfaceCard, child: content),
              ),
            ),
    );
  }
}
