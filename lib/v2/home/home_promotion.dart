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

// ホームの「クリエイターの宣伝」（Web の components/work/work-promotion.tsx の HomePromotionWorksSection と同じ API・件数）。
// アプリは R18 を出さないので全年齢の枠（isSensitive: false）だけ。

/// Web と同じ 6 件
const homePromotionLimit = 6;

const homePromotionQuery = '''
query AppHomePromotionWorks(\$limit: Int!, \$isSensitive: Boolean) {
  promotionWorks(limit: \$limit, isSensitive: \$isSensitive) {
    $workCardFields
    relatedUrl
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

/// ホームの「クリエイターの宣伝」の欄。宣伝中の作品が無ければ何も出さない
class HomePromotionSection extends StatelessWidget {
  const HomePromotionSection({super.key, required this.works});

  final List<PromotionWork> works;

  @override
  Widget build(BuildContext context) {
    if (works.isEmpty) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
        child: Row(children: [
          const Icon(Icons.campaign_rounded, size: 20, color: Ds.pink),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              tr('クリエイターの宣伝', 'From our creators'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.2),
            ),
          ),
          const SizedBox(width: 8),
          const WorkPromotionMark(),
        ]),
      ),
      // Web と同じくスマホは 2 列、広い画面は 3 列
      LayoutBuilder(builder: (context, constraints) {
        final cols = constraints.maxWidth < 560 ? 2 : 3;
        final rows = <Widget>[];
        for (var i = 0; i < works.length; i += cols) {
          final cells = <Widget>[];
          for (var c = 0; c < cols; c++) {
            if (c > 0) cells.add(const SizedBox(width: 10));
            final k = i + c;
            cells.add(Expanded(child: k < works.length ? PromotionWorkCard(item: works[k]) : const SizedBox.shrink()));
          }
          if (rows.isNotEmpty) rows.add(const SizedBox(height: 10));
          rows.add(IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: cells)));
        }
        return Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Column(children: rows));
      }),
    ]);
  }
}

/// 宣伝作品のカード（Web の PromotionWorkCard: 色の枠・4:3 の画像・タイトル・作者・詳しく見る）。
/// 長押しはほかの一覧と同じメニュー（いいね・共有など）
class PromotionWorkCard extends StatefulWidget {
  const PromotionWorkCard({super.key, required this.item});

  final PromotionWork item;

  @override
  State<PromotionWorkCard> createState() => _PromotionWorkCardState();
}

class _PromotionWorkCardState extends State<PromotionWorkCard> {
  @override
  Widget build(BuildContext context) {
    final work = widget.item.work;
    final url = widget.item.relatedUrl;
    return Pressable(
      scale: 0.97,
      onTap: () => Nav.work(context, work.id),
      onLongPress: () => showWorkCardMenu(context, work, onChanged: () {
        if (mounted) setState(() {});
      }),
      child: Container(
        padding: const EdgeInsets.all(1.2),
        decoration: BoxDecoration(gradient: workPromotionGradient, borderRadius: Ds.br(14)),
        child: ClipRRect(
          borderRadius: Ds.br(12.8),
          child: ColoredBox(
            color: context.surfaceCard,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AspectRatio(aspectRatio: 4 / 3, child: AppImage(work.imageUrl, memCacheWidth: 600)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
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
                    if (url != null) ...[
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
            ]),
          ),
        ),
      ),
    );
  }
}
