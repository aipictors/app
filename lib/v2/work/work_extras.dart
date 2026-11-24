import 'package:aipictors/v2/community/web_links.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 作品の詳細画面の下回り（Web の app/routes/($lang)._main.posts.$post._index/components と同じ項目）

/// 文の中の URL を切り出す（Web の parseTextWithLinks と同じく http(s):// から空白まで）
List<({String text, bool isUrl})> splitLinks(String text) {
  final re = RegExp(r'https?://[^\s]+');
  final out = <({String text, bool isUrl})>[];
  var last = 0;
  for (final m in re.allMatches(text)) {
    if (m.start > last) out.add((text: text.substring(last, m.start), isUrl: false));
    out.add((text: m.group(0)!, isUrl: true));
    last = m.end;
  }
  if (last < text.length) out.add((text: text.substring(last), isUrl: false));
  return out;
}

/// URL を押せる文（キャプションなど）。選択もできる
class LinkifiedText extends StatefulWidget {
  const LinkifiedText(this.text, {super.key, this.style, this.maxLines});

  final String text;
  final TextStyle? style;
  final int? maxLines;

  @override
  State<LinkifiedText> createState() => _LinkifiedTextState();
}

class _LinkifiedTextState extends State<LinkifiedText> {
  final _recognizers = <TapGestureRecognizer>[];

  @override
  void dispose() {
    for (final r in _recognizers) {
      r.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();
    final parts = splitLinks(widget.text);
    return SelectableText.rich(
      TextSpan(children: [
        for (final p in parts)
          if (p.isUrl)
            TextSpan(
              text: p.text,
              style: TextStyle(color: context.cs.primary),
              recognizer: (TapGestureRecognizer()..onTap = () => WebLinks.open(context, p.text)).also(_recognizers.add),
            )
          else
            TextSpan(text: p.text),
      ]),
      maxLines: widget.maxLines,
      style: widget.style,
    );
  }
}

extension _Also<T> on T {
  T also(void Function(T) f) {
    f(this);
    return this;
  }
}

/// AI 評価の点の段階（Web の toScoreBand と同じ区切り）
({String label, Color color}) aiScoreBand(int score) {
  if (score >= 90) return (label: tr('圧巻', 'Outstanding'), color: const Color(0xFFD946EF));
  if (score >= 80) return (label: tr('とても良い', 'Excellent'), color: const Color(0xFFF59E0B));
  if (score >= 70) return (label: tr('良い', 'Great'), color: const Color(0xFF10B981));
  if (score >= 60) return (label: tr('いい感じ', 'Good'), color: const Color(0xFF0EA5E9));
  return (label: tr('伸びしろあり', 'Room to grow'), color: const Color(0xFF94A3B8));
}

/// 小さな情報のラベル（Web の Badge variant=secondary）
class InfoChip extends StatelessWidget {
  const InfoChip(this.text, {super.key, this.onTap, this.icon});

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final chip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(10)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[Icon(icon, size: 13, color: context.muted), const SizedBox(width: 4)],
        Flexible(child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
        if (onTap != null) ...[const SizedBox(width: 2), Icon(Icons.chevron_right_rounded, size: 14, color: context.muted)],
      ]),
    );
    return onTap == null ? chip : Pressable(onTap: onTap, child: chip);
  }
}

String? styleText(String? style) => switch (style) {
      'ILLUSTRATION' => tr('イラスト', 'Illustration'),
      'REAL' => tr('リアル', 'Real'),
      'SEMI_REAL' => tr('セミリアル', 'SemiReal'),
      _ => null,
    };

String ratingText(String? rating) => switch (rating) {
      'R15' => 'R-15',
      'R18' => 'R-18',
      'R18G' => 'R-18G',
      _ => tr('全年齢', 'All ages'),
    };

/// モデル・対象年齢・スタイル・入賞（Web の WorkArticleBadges）
class WorkBadges extends StatelessWidget {
  const WorkBadges({super.key, required this.work});

  final Map<String, dynamic> work;

  @override
  Widget build(BuildContext context) {
    final w = work;
    final model = w.strOrNull('model');
    final style = styleText(w.strOrNull('style'));
    String rank(String ja, String en, int n) => tr('$ja $n位', '$en #$n');
    void rankings() => context.push('/rankings');
    void aiRankings() => context.push('/ai-rankings');
    final chips = <Widget>[
      if (model != null && model.isNotEmpty) InfoChip(tr('使用モデル: $model', 'Model: $model'), icon: Icons.memory_rounded),
      InfoChip(tr('対象年齢: ${ratingText(w.strOrNull('rating'))}', 'Age: ${ratingText(w.strOrNull('rating'))}')),
      if (style != null) InfoChip(tr('スタイル: $style', 'Style: $style')),
      if (w.boolean('isPromotion')) InfoChip(tr('宣伝作品', 'Promoted')),
      if (w.integer('dailyRanking') > 0) InfoChip(rank('デイリー入賞', 'Daily rank', w.integer('dailyRanking')), icon: Icons.emoji_events_outlined, onTap: rankings),
      if (w.integer('weeklyRanking') > 0) InfoChip(rank('ウィークリー入賞', 'Weekly rank', w.integer('weeklyRanking')), icon: Icons.emoji_events_outlined, onTap: rankings),
      if (w.integer('monthlyRanking') > 0) InfoChip(rank('マンスリー入賞', 'Monthly rank', w.integer('monthlyRanking')), icon: Icons.emoji_events_outlined, onTap: rankings),
      for (final (key, ja, en) in const [
        ('aiDailyRanking', 'AIデイリー入賞', 'AI daily rank'),
        ('aiWeeklyRanking', 'AIウィークリー入賞', 'AI weekly rank'),
        ('aiMonthlyRanking', 'AIマンスリー入賞', 'AI monthly rank'),
      ])
        if ((w.obj(key)?.integer('rank') ?? 0) > 0) InfoChip(rank(ja, en, w.obj(key)!.integer('rank')), icon: Icons.auto_awesome_outlined, onTap: aiRankings),
    ];
    return Wrap(spacing: 6, runSpacing: 6, children: chips);
  }
}

/// 限定公開・予約投稿の帯（Web の PostAccessTypeBanner）。公開中の作品では出さない
class AccessTypeBanner extends StatelessWidget {
  const AccessTypeBanner({super.key, required this.accessType, required this.createdAt});

  final String? accessType;
  final int createdAt;

  @override
  Widget build(BuildContext context) {
    final text = switch (accessType) {
      'PRIVATE' => tr('非公開（アーカイブ）', 'Private (Archived)'),
      'DRAFT' => tr('下書き', 'Draft'),
      'LIMITED' => tr('限定公開（URLを知っているユーザのみ公開）', 'Limited (Only users with the URL can view)'),
      _ => null,
    };
    final scheduled = createdAt * 1000 > DateTime.now().millisecondsSinceEpoch;
    if (text == null && !scheduled) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(12)),
      child: Text([if (scheduled) tr('予約投稿', 'Scheduled post'), ?text].join(' / '), textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
    );
  }
}

/// 前後の作品（Web の WorkPrevNextBar。左が新しい作品、右が古い作品）
class WorkPrevNextBar extends StatelessWidget {
  const WorkPrevNextBar({super.key, this.newer, this.older});

  final Map<String, dynamic>? newer;
  final Map<String, dynamic>? older;

  @override
  Widget build(BuildContext context) {
    if (newer == null && older == null) return const SizedBox.shrink();
    return Row(children: [
      Expanded(child: newer == null ? const SizedBox() : _Neighbor(work: newer!, older: false)),
      const SizedBox(width: 10),
      Expanded(child: older == null ? const SizedBox() : _Neighbor(work: older!, older: true)),
    ]);
  }
}

class _Neighbor extends StatelessWidget {
  const _Neighbor({required this.work, required this.older});

  final Map<String, dynamic> work;
  final bool older;

  @override
  Widget build(BuildContext context) {
    final label = older ? tr('古い作品', 'Older') : tr('新しい作品', 'Newer');
    final children = [
      Icon(older ? Icons.chevron_right_rounded : Icons.chevron_left_rounded, size: 20, color: context.muted),
      const SizedBox(width: 4),
      AppImage(work.strOrNull('smallThumbnailImageURL'), width: 44, height: 44, radius: 8, memCacheWidth: 132),
      const SizedBox(width: 8),
      Expanded(
        child: Column(crossAxisAlignment: older ? CrossAxisAlignment.end : CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(color: context.muted, fontSize: 11)),
          Text(work.str('title'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
        ]),
      ),
    ];
    return Pressable(
      scale: 0.98,
      onTap: () => Nav.work(context, work.str('id')),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(14), border: Border.all(color: context.hairline)),
        child: Row(children: older ? children.reversed.toList() : children),
      ),
    );
  }
}

/// 作品が入っているシリーズ（Web の WorkAlbumCard）
class WorkAlbumCard extends StatelessWidget {
  const WorkAlbumCard({super.key, required this.album});

  final Map<String, dynamic> album;

  @override
  Widget build(BuildContext context) {
    final description = album.str('description').trim();
    return Pressable(
      scale: 0.99,
      onTap: () => context.push('/albums/${album.str('id')}'),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: context.skeleton, shape: BoxShape.circle),
            child: Icon(Icons.layers_outlined, size: 18, color: context.muted),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Badge2(tr('シリーズ', 'Series'), color: context.cs.primary.withValues(alpha: 0.85)),
              const SizedBox(height: 6),
              Text(album.str('title'), style: const TextStyle(fontWeight: FontWeight.w800)),
              if (description.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 13)),
              ],
            ]),
          ),
          Icon(Icons.chevron_right_rounded, color: context.muted),
        ]),
      ),
    );
  }
}

/// 横に流す作品の列（作者の他の作品・タグのおすすめ）
class TitledWorkRow extends StatelessWidget {
  const TitledWorkRow({super.key, required this.title, required this.works, this.onMore, this.inset = 16});

  final String title;
  final List<WorkSummary> works;
  final VoidCallback? onMore;

  /// 左右の余白（すでに余白のある列の中に置くときは 0）
  final double inset;

  @override
  Widget build(BuildContext context) {
    if (works.isEmpty) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: EdgeInsets.fromLTRB(inset, 16, inset == 0 ? 0 : 8, 8),
        child: Row(children: [
          Expanded(child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.2))),
          if (onMore != null)
            TextButton(
              onPressed: onMore,
              child: Row(mainAxisSize: MainAxisSize.min, children: [Text(tr('すべて見る', 'See all')), const Icon(Icons.chevron_right_rounded, size: 18)]),
            ),
        ]),
      ),
      SizedBox(
        height: 132,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: inset),
          itemCount: works.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, i) {
            final w = works[i];
            return Pressable(
              scale: 0.97,
              onTap: () => Nav.work(context, w.id),
              child: SizedBox(width: 132, child: AppImage(w.imageUrl, radius: 12, memCacheWidth: 300)),
            );
          },
        ),
      ),
    ]);
  }
}

/// 作者にだけ出す、いいねした人の一覧（Web の作品ページのハートを開いた中身）
class LikedUsersPanel extends StatefulWidget {
  const LikedUsersPanel({super.key, required this.workId, required this.likesCount});

  final String workId;
  final int likesCount;

  @override
  State<LikedUsersPanel> createState() => _LikedUsersPanelState();
}

class _LikedUsersPanelState extends State<LikedUsersPanel> {
  bool _open = false;
  List<Map<String, dynamic>>? _users;
  String? _error;

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final data = await Api.query('''
query AppWorkLikedUsers(\$id: ID!) {
  work(id: \$id) { id likedUsers(offset: 0, limit: 120) { $userSummaryFields } }
}''', variables: {'id': widget.workId});
      if (mounted) setState(() => _users = data.obj('work')?.list('likedUsers') ?? const []);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final users = _users;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        borderRadius: Ds.br(10),
        onTap: () {
          setState(() => _open = !_open);
          if (_open && _users == null) _load();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.favorite_border_rounded, size: 16),
            const SizedBox(width: 6),
            Text(tr('いいねした人 ${widget.likesCount}', '${widget.likesCount} likes'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
            Icon(_open ? Icons.expand_less_rounded : Icons.expand_more_rounded, size: 18, color: context.muted),
          ]),
        ),
      ),
      if (_open)
        if (_error != null)
          TextButton(onPressed: _load, child: Text(tr('読み込めませんでした。もう一度', "Couldn't load. Retry")))
        else if (users == null)
          const Padding(padding: EdgeInsets.all(8), child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator.adaptive(strokeWidth: 2)))
        else if (users.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              widget.likesCount > 0 ? tr('匿名いいねのみのため表示できるユーザはいません', 'No non-anonymous likes to display') : tr('まだいいねがありません', 'No likes yet'),
              style: TextStyle(color: context.muted, fontSize: 13),
            ),
          )
        else
          SizedBox(
            height: 78,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final u = users[i];
                return GestureDetector(
                  onTap: () => Nav.user(context, u.str('id')),
                  child: SizedBox(
                    width: 60,
                    child: Column(children: [
                      UserAvatar.json(u, size: 44),
                      const SizedBox(height: 4),
                      Text(u.str('name'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11)),
                    ]),
                  ),
                );
              },
            ),
          ),
    ]);
  }
}

/// AI 評価（Web の AiEvaluationDisplay。公開か作者本人のときだけ）
class AiEvaluationCard extends StatefulWidget {
  const AiEvaluationCard({super.key, required this.work, required this.isOwner});

  final Map<String, dynamic> work;
  final bool isOwner;

  @override
  State<AiEvaluationCard> createState() => _AiEvaluationCardState();
}

class _AiEvaluationCardState extends State<AiEvaluationCard> {
  bool _expanded = false;
  bool _retried = false;

  Map<String, dynamic> get w => widget.work;

  Future<void> _retry() async {
    try {
      await Api.mutate(r'mutation AppRetryWorkBotGrading($workId: ID!) { retryWorkBotGrading(workId: $workId) }', variables: {'workId': w.str('id')});
      if (mounted) setState(() => _retried = true);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canView = w.boolean('isBotGradingEnabled') && (w.boolean('isBotGradingPublic') || widget.isOwner);
    if (!canView) return const SizedBox.shrink();
    final e = w.obj('botEvaluation');
    final status = _retried ? 'PENDING' : w.strOrNull('botEvaluationStatus');
    Widget note(IconData icon, String title, String body, {Widget? trailing}) => Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
          child: Row(children: [
            Icon(icon, size: 20, color: context.muted),
            const SizedBox(width: 10),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                Text(body, style: TextStyle(color: context.muted, fontSize: 12)),
              ]),
            ),
            ?trailing,
          ]),
        );
    if (e == null) {
      if (status == 'REFUSED') return const SizedBox.shrink();
      if (status == 'FAILED') {
        if (!widget.isOwner) return const SizedBox.shrink();
        return note(
          Icons.warning_amber_rounded,
          tr('この作品はAI評価できませんでした', 'This work could not be evaluated'),
          tr('内容によっては評価できないことがあります', 'Some content cannot be evaluated'),
          trailing: TextButton(onPressed: _retry, child: Text(tr('もう一度', 'Retry'))),
        );
      }
      if (!w.boolean('isBotGradingPublic') && widget.isOwner) {
        return note(Icons.visibility_off_outlined, tr('AI評価は非公開設定です', 'AI evaluation is set to private'), tr('他のユーザーには表示されません', 'Not visible to other users'));
      }
      return note(Icons.hourglass_top_rounded, tr('AI評価を生成中です', 'AI evaluation is being generated'), tr('混み合っているときは数分かかることがあります', 'This can take a few minutes when busy'));
    }
    final quality = <(String, int?)>[
      (tr('構図', 'Composition'), e['compositionScore'] as int?),
      (tr('色彩', 'Color'), e['colorScore'] as int?),
      (tr('細部', 'Detail'), e['detailScore'] as int?),
      (tr('美しさ', 'Beauty'), e['beautyScore'] as int?),
      (tr('独創性', 'Originality'), e['originalityScore'] as int?),
      (tr('一貫性', 'Consistency'), e['consistencyScore'] as int?),
    ].where((s) => s.$2 != null).map((s) => (s.$1, s.$2!)).toList();
    final style = <(String, int?)>[
      (tr('可愛さ', 'Cuteness'), e['cutenessScore'] as int?),
      (tr('かっこよさ', 'Coolness'), e['coolnessScore'] as int?),
    ].where((s) => s.$2 != null).map((s) => (s.$1, s.$2!)).toList();
    final comment = e.strOrNull('comment');
    if (quality.isEmpty && style.isEmpty && (comment == null || comment.isEmpty)) return const SizedBox.shrink();
    final overall = e['overallScore'] as int?;
    final band = overall == null ? null : aiScoreBand(overall);
    final strengths = [...quality]..sort((a, b) => b.$2.compareTo(a.$2));
    final name = (e.strOrNull('personality') ?? w.strOrNull('botEvaluationPersonality')) == 'pictor_chan' ? tr('ぴくたーちゃん', 'Pictor-chan') : 'AI';
    Widget bar((String, int) s) => Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Row(children: [
            SizedBox(width: 76, child: Text(s.$1, style: TextStyle(fontSize: 12, color: context.muted))),
            Expanded(
              child: ClipRRect(
                borderRadius: Ds.br(4),
                child: LinearProgressIndicator(value: (s.$2 / 100).clamp(0, 1), minHeight: 6, backgroundColor: context.skeleton, color: aiScoreBand(s.$2).color),
              ),
            ),
            SizedBox(width: 32, child: Text('${s.$2}', textAlign: TextAlign.right, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
          ]),
        );
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          if (overall != null)
            SizedBox(
              width: 52,
              height: 52,
              child: Stack(alignment: Alignment.center, children: [
                CircularProgressIndicator(value: overall / 100, strokeWidth: 5, color: band!.color, backgroundColor: context.skeleton),
                Text('$overall', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              ]),
            )
          else
            Icon(Icons.auto_awesome_rounded, color: context.cs.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(tr('AI評価', 'AI evaluation'), style: TextStyle(color: context.muted, fontSize: 12)),
              if (band != null) Text(band.label, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: band.color)),
              if (strengths.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Wrap(spacing: 4, runSpacing: 4, children: [
                    for (final s in strengths.take(2)) Badge2(tr('${s.$1}が光る', 'Strong ${s.$1.toLowerCase()}'), color: context.muted.withValues(alpha: 0.6)),
                  ]),
                ),
            ]),
          ),
        ]),
        if (comment != null && comment.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
          const SizedBox(height: 2),
          Text(comment, style: const TextStyle(fontSize: 13.5, height: 1.5)),
        ],
        if (quality.isNotEmpty || style.isNotEmpty) ...[
          const SizedBox(height: 6),
          Center(
            child: TextButton.icon(
              onPressed: () => setState(() => _expanded = !_expanded),
              icon: Icon(_expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded, size: 18),
              label: Text(_expanded ? tr('項目ごとの点を閉じる', 'Hide scores') : tr('項目ごとの点を見る', 'View scores')),
            ),
          ),
          if (_expanded) ...[
            for (final s in quality) bar(s),
            if (style.isNotEmpty) ...[const SizedBox(height: 6), Divider(height: 1, color: context.hairline), for (final s in style) bar(s)],
          ],
        ],
      ]),
    );
  }
}

/// タグを足す（作者が「タグの編集を許可」した作品だけ。Web の WorkTagInput と同じ updateWorkTags）
Future<List<String>?> showAddTagsSheet(BuildContext context, {required String workId, required List<String> tags}) {
  return showModalBottomSheet<List<String>>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (_) => _AddTagsSheet(workId: workId, tags: tags),
  );
}

class _AddTagsSheet extends StatefulWidget {
  const _AddTagsSheet({required this.workId, required this.tags});

  final String workId;
  final List<String> tags;

  @override
  State<_AddTagsSheet> createState() => _AddTagsSheetState();
}

class _AddTagsSheetState extends State<_AddTagsSheet> {
  final _text = TextEditingController();
  final _added = <String>[];
  bool _saving = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void _add() {
    final t = _text.text.trim().replaceFirst(RegExp('^#'), '');
    _text.clear();
    if (t.isEmpty || widget.tags.contains(t) || _added.contains(t)) return;
    setState(() => _added.add(t));
  }

  Future<void> _save() async {
    _add();
    if (_added.isEmpty) return;
    final tags = [...widget.tags, ..._added];
    setState(() => _saving = true);
    try {
      await Api.mutate(r'mutation AppUpdateWorkTags($input: UpdateWorkTagsInput!) { updateWorkTags(input: $input) { id } }', variables: {
        'input': {'id': widget.workId, 'tags': tags},
      });
      if (!mounted) return;
      context.toast(tr('タグを保存しました', 'Tags saved'));
      Navigator.pop(context, tags);
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => _saving = false);
        context.toast(e.message, error: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.viewInsetsOf(context).bottom),
      child: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(tr('タグを追加', 'Add tags'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(tr('この作品は作者がタグの追加を許可しています', 'The creator allows others to add tags to this work'), style: TextStyle(color: context.muted, fontSize: 12)),
          const SizedBox(height: 12),
          if (_added.isNotEmpty) ...[
            Wrap(spacing: 6, runSpacing: 6, children: [
              for (final t in _added) InputChip(label: Text('#$t'), onDeleted: () => setState(() => _added.remove(t))),
            ]),
            const SizedBox(height: 8),
          ],
          TextField(
            controller: _text,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(hintText: tr('追加するタグを入力', 'Enter tags to add'), prefixText: '#'),
            onSubmitted: (_) => _add(),
          ),
          const SizedBox(height: 12),
          PrimaryButton(label: tr('保存', 'Save'), onPressed: _saving ? null : _save),
        ]),
      ),
    );
  }
}
