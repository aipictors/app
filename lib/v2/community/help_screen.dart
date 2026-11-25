import 'dart:convert';

import 'package:aipictors/v2/community/web_links.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// 日本語と英語の組（Web の HelpText）
class HelpText {
  const HelpText(this.ja, this.en);

  factory HelpText.fromJson(Object? j) {
    final m = j is Map ? j : const {};
    return HelpText('${m['ja'] ?? ''}', '${m['en'] ?? ''}');
  }

  final String ja;
  final String en;

  String get text => tr(ja, en);
}

class HelpBubble {
  const HelpBubble(this.text, this.at);

  final HelpText text;

  /// tl / tr / bl / br / tc（コマの四隅と上の中央）
  final String at;
}

class HelpPanel {
  const HelpPanel({required this.image, required this.caption, required this.captionAtBottom, required this.bubbles});

  factory HelpPanel.fromJson(Map<String, dynamic> j) => HelpPanel(
        image: '${j['image']}',
        caption: HelpText.fromJson(j['caption']),
        captionAtBottom: j['captionAt'] == 'bottom',
        bubbles: [for (final b in (j['bubbles'] as List? ?? const [])) HelpBubble(HelpText.fromJson(b), '${(b as Map)['at']}')],
      );

  final String image;
  final HelpText caption;
  final bool captionAtBottom;
  final List<HelpBubble> bubbles;
}

class HelpSection {
  const HelpSection({
    required this.id,
    required this.group,
    required this.emoji,
    required this.title,
    required this.mangaTitle,
    required this.lead,
    required this.panels,
    required this.points,
    required this.links,
    required this.faqs,
    required this.isNew,
  });

  factory HelpSection.fromJson(Map<String, dynamic> j) {
    List<Map<String, dynamic>> list(String k) => [for (final e in (j[k] as List? ?? const [])) Map<String, dynamic>.from(e as Map)];
    return HelpSection(
      id: '${j['id']}',
      group: '${j['group']}',
      emoji: '${j['emoji']}',
      title: HelpText.fromJson(j['title']),
      mangaTitle: HelpText.fromJson(j['mangaTitle']),
      lead: HelpText.fromJson(j['lead']),
      panels: list('panels').map(HelpPanel.fromJson).toList(),
      points: [for (final p in (j['points'] as List? ?? const [])) HelpText.fromJson(p)],
      links: [for (final l in list('links')) (to: '${l['to']}', label: HelpText.fromJson(l['label']))],
      faqs: [for (final f in list('faqs')) (q: HelpText.fromJson(f['q']), a: HelpText.fromJson(f['a']))],
      isNew: j['isNew'] == true,
    );
  }

  final String id;
  final String group;
  final String emoji;
  final HelpText title;
  final HelpText mangaTitle;
  final HelpText lead;
  final List<HelpPanel> panels;
  final List<HelpText> points;
  final List<({String to, HelpText label})> links;
  final List<({HelpText q, HelpText a})> faqs;
  final bool isNew;
}

class HelpGuide {
  const HelpGuide(this.groups, this.sections);

  /// 章のデータは Web の help-sections.ts の HELP_GROUPS / HELP_SECTIONS を JSON にしたもの
  /// （アプリでは別の支払い方法の案内を除く）
  static Future<HelpGuide> load() async {
    final j = jsonDecode(await rootBundle.loadString('assets/docs/help_guide.json')) as Map<String, dynamic>;
    return HelpGuide(
      [for (final g in (j['groups'] as List)) (id: '${(g as Map)['id']}', label: HelpText.fromJson(g['label']))],
      [for (final s in (j['sections'] as List)) HelpSection.fromJson(Map<String, dynamic>.from(s as Map))],
    );
  }

  final List<({String id, HelpText label})> groups;
  final List<HelpSection> sections;
}

/// 4 コマの絵。Web と同じ URL から読む（public/images/help-manga。アプリに入れると 3MB 以上増える）
String helpMangaImageUrl(String image) => 'https://www.aipictors.com/images/help-manga/$image.webp';

/// Web のリンク先のうち、アプリに同じ画面があるもの
const _inAppPaths = {
  '/posts': '/new-works',
  '/new/image': '/works/create',
  '/new/text': '/works/create/text',
  '/contact': '/support/chat',
};

const _sameInApp = {
  '/settings/profile',
  '/settings/notification',
  '/settings/points',
  '/settings/creator-rewards',
  '/settings/sticker',
  '/settings/blocked/users',
  '/settings/muted/users',
  '/my/likes',
  '/my/bookmarks',
  '/rankings',
  '/coin-rankings',
  '/requests',
  '/stickers',
  '/events',
  '/tags',
  '/search',
  '/guideline',
};

/// 使い方ガイド（Web の /help）。章ごとにぴくたーちゃんの 4 コマ・ポイント・リンク、最後によくある質問
class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final _future = HelpGuide.load();
  final _scroll = ScrollController();
  final Map<String, GlobalKey> _keys = {};

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  /// 目次から章へ。一覧は見える分だけ作るので、章ができるまで送ってから合わせる
  Future<void> _jump(String id) async {
    final key = _keys[id];
    if (key == null) return;
    _scroll.jumpTo(0);
    await WidgetsBinding.instance.endOfFrame;
    while (key.currentContext == null && _scroll.offset < _scroll.position.maxScrollExtent) {
      _scroll.jumpTo((_scroll.offset + _scroll.position.viewportDimension).clamp(0, _scroll.position.maxScrollExtent));
      await WidgetsBinding.instance.endOfFrame;
    }
    final ctx = key.currentContext;
    if (ctx != null && ctx.mounted) await Scrollable.ensureVisible(ctx, duration: Ds.normal, curve: Ds.curve);
  }

  void _open(String to) {
    final path = _inAppPaths[to] ?? (_sameInApp.contains(to) ? to : null);
    if (path != null) {
      context.push(path);
    } else if (to.startsWith('/generation/')) {
      // 生成の規約などは Web で開く（WebLinks は /generation 以下を生成のタブにする）
      launchUrl(Uri.parse('https://www.aipictors.com$to'), mode: LaunchMode.externalApplication);
    } else {
      WebLinks.open(context, to);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('使い方ガイド', 'User Guide'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: FutureBuilder<HelpGuide>(
        future: _future,
        builder: (context, snap) {
          final guide = snap.data;
          if (guide == null) return const SkeletonList(avatarSize: 0);
          final faqs = guide.sections.expand((s) => s.faqs).toList();
          return ListView(
            controller: _scroll,
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s32),
            children: [
              ContentWidth(child: _hero(context, guide)),
              const SizedBox(height: Ds.s20),
              ContentWidth(child: _toc(context, guide)),
              for (final s in guide.sections)
                ContentWidth(
                  key: _keys.putIfAbsent(s.id, GlobalKey.new),
                  child: Padding(padding: const EdgeInsets.only(top: Ds.s32), child: _HelpSectionView(section: s, onOpen: _open)),
                ),
              const SizedBox(height: Ds.s32),
              ContentWidth(child: _faq(context, faqs)),
              const SizedBox(height: Ds.s24),
              ContentWidth(child: _stillHaveQuestions(context)),
            ],
          );
        },
      ),
    );
  }

  Widget _hero(BuildContext context, HelpGuide guide) {
    final cs = context.cs;
    final newSections = guide.sections.where((s) => s.isNew).toList();
    return Container(
      padding: const EdgeInsets.all(Ds.s16),
      decoration: BoxDecoration(
        borderRadius: Ds.br(24),
        gradient: LinearGradient(colors: [cs.primaryContainer.withValues(alpha: 0.6), cs.tertiaryContainer.withValues(alpha: 0.6)]),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(tr('ぴくたーちゃんの4コマでわかる', 'Explained with Pictor-chan comics'), style: TextStyle(color: cs.primary, fontSize: 12.5, fontWeight: FontWeight.w700)),
        const SizedBox(height: Ds.s4),
        Text(tr('Aipictors 使い方ガイド', 'Aipictors User Guide'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.25)),
        const SizedBox(height: Ds.s8),
        Text(
          tr(
            '作品の見方・投稿・AI 画像生成から、コインでの推し、クリエイター報酬（換金）、有料リクエスト、宣伝枠まで。Aipictors のすべての機能を、公式キャラクターぴくたーちゃんの 4 コマ漫画でやさしく解説します。',
            'From browsing, posting and AI image generation to coin support, creator rewards (cash out), paid requests and promotion slots — every Aipictors feature, explained with 4-panel comics starring our mascot Pictor-chan.',
          ),
          style: const TextStyle(fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: Ds.s12),
        ClipRRect(borderRadius: Ds.br(16), child: AspectRatio(aspectRatio: 960 / 656, child: AppImage(helpMangaImageUrl('hero'), memCacheWidth: 1000))),
        if (newSections.isNotEmpty) ...[
          const SizedBox(height: Ds.s12),
          Wrap(spacing: Ds.s6, runSpacing: Ds.s6, crossAxisAlignment: WrapCrossAlignment.center, children: [
            Text('✨ ${tr('新機能', 'New')}', style: TextStyle(color: cs.primary, fontWeight: FontWeight.w800, fontSize: 13)),
            for (final s in newSections) AppChip('${s.emoji} ${s.title.text}', onTap: () => _jump(s.id)),
          ]),
        ],
      ]),
    );
  }

  Widget _toc(BuildContext context, HelpGuide guide) {
    return Container(
      padding: const EdgeInsets.all(Ds.s16),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(tr('目次', 'Contents'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        for (final g in guide.groups) ...[
          const SizedBox(height: Ds.s12),
          Text(g.label.text, style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
          const SizedBox(height: Ds.s6),
          Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
            for (final s in guide.sections.where((s) => s.group == g.id))
              AppChip('${s.emoji} ${s.title.text}${s.isNew ? ' NEW' : ''}', onTap: () => _jump(s.id)),
          ]),
        ],
      ]),
    );
  }

  Widget _faq(BuildContext context, List<({HelpText q, HelpText a})> faqs) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text('💬 ${tr('よくある質問', 'FAQ')}', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
      const SizedBox(height: Ds.s8),
      Container(
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
        child: Column(children: [
          for (final (i, f) in faqs.indexed) ...[
            if (i > 0) Divider(height: 1, color: context.hairline),
            ExpansionTile(
              shape: const Border(),
              title: Text(f.q.text, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: const EdgeInsets.fromLTRB(Ds.s16, 0, Ds.s16, Ds.s16),
              children: [Text(f.a.text, style: TextStyle(color: context.muted, fontSize: 13.5, height: 1.6))],
            ),
          ],
        ]),
      ),
    ]);
  }

  Widget _stillHaveQuestions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Ds.s20),
      decoration: BoxDecoration(color: context.cs.secondaryContainer.withValues(alpha: 0.5), borderRadius: Ds.br(24)),
      child: Column(children: [
        Text(tr('わからないときは', 'Still have questions?'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
        const SizedBox(height: Ds.s8),
        Text(
          tr('Discord ではぴくたーちゃんと運営が質問や要望に答えています。お問い合わせからも連絡できます。', 'Pictor-chan and our team answer questions and requests on Discord. You can also contact us here.'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13.5, height: 1.6),
        ),
        const SizedBox(height: Ds.s12),
        Wrap(alignment: WrapAlignment.center, spacing: Ds.s8, runSpacing: Ds.s8, children: [
          SecondaryButton(expand: false, label: tr('Discord に参加', 'Join Discord'), onPressed: () => launchUrl(Uri.parse(WebLinks.discordInvite), mode: LaunchMode.externalApplication)),
          SecondaryButton(expand: false, label: tr('お問い合わせ', 'Contact us'), onPressed: () => context.push('/support/chat')),
        ]),
      ]),
    );
  }
}

class _HelpSectionView extends StatelessWidget {
  const _HelpSectionView({required this.section, required this.onOpen});

  final HelpSection section;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    final s = section;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: Ds.s8, children: [
        Text('${s.emoji} ${s.title.text}', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
        if (s.isNew) const Badge2('NEW', color: Ds.pink),
      ]),
      const SizedBox(height: Ds.s6),
      Text(s.lead.text, style: const TextStyle(fontSize: 14, height: 1.65)),
      const SizedBox(height: Ds.s16),
      HelpFourKoma(title: s.mangaTitle, panels: s.panels),
      const SizedBox(height: Ds.s16),
      _card(context, tr('ポイント', 'Key points'), [
        for (final p in s.points)
          Padding(
            padding: const EdgeInsets.only(top: Ds.s6),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(padding: const EdgeInsets.only(top: 6, right: Ds.s8), child: Icon(Icons.circle, size: 7, color: context.cs.primary)),
              Expanded(child: Text(p.text, style: const TextStyle(fontSize: 13.5, height: 1.6))),
            ]),
          ),
      ]),
      if (s.links.isNotEmpty) ...[
        const SizedBox(height: Ds.s12),
        _card(context, tr('ここから使う', 'Go to'), [
          for (final l in s.links)
            InkWell(
              onTap: () => onOpen(l.to),
              borderRadius: Ds.br(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Ds.s8),
                child: Row(children: [
                  Expanded(child: Text(l.label.text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                  Icon(Icons.arrow_forward_rounded, size: 18, color: context.muted),
                ]),
              ),
            ),
        ]),
      ],
    ]);
  }

  Widget _card(BuildContext context, String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, Ds.s12),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(16), border: Border.all(color: context.hairline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
        ...children,
      ]),
    );
  }
}

/// ぴくたーちゃんの 4 コマ（Web の HelpFourKoma）。絵は文字なしの画像で、ナレーションと吹き出しを文字で重ねる。
/// 吹き出しは漫画の一部なので Web と同じくダークでも白地に濃い文字
class HelpFourKoma extends StatelessWidget {
  const HelpFourKoma({super.key, required this.title, required this.panels});

  final HelpText title;
  final List<HelpPanel> panels;

  static const _ink = Color(0xFF1E293B);
  static const _orange = Color(0xFFF97316);

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final frame = dark ? const Color(0xFFCBD5E1) : _ink;
    return Container(
      padding: const EdgeInsets.all(Ds.s12),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF0F172A) : const Color(0xFFFFFAF0),
        borderRadius: Ds.br(16),
        border: Border.all(color: frame, width: 2),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(title.text, textAlign: TextAlign.center, style: const TextStyle(color: _orange, fontWeight: FontWeight.w900, fontSize: 17)),
        Text(tr('ぴくたーちゃんの4コマ', 'A Pictor-chan 4-panel comic'), textAlign: TextAlign.center, style: TextStyle(color: context.muted, fontSize: 11.5)),
        const SizedBox(height: Ds.s8),
        for (final (i, p) in panels.indexed) ...[
          if (i > 0) const SizedBox(height: Ds.s12),
          _panel(p, i, frame),
        ],
      ]),
    );
  }

  Widget _panel(HelpPanel p, int index, Color frame) {
    return Semantics(
      label: p.caption.text,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: Ds.br(6), border: Border.all(color: frame, width: 3)),
        child: ClipRRect(
          borderRadius: Ds.br(3),
          child: AspectRatio(
            aspectRatio: 960 / 656,
            child: LayoutBuilder(builder: (context, c) {
              final w = c.maxWidth;
              final h = c.maxHeight;
              // ナレーションが上にあるときは吹き出しをその下へずらす（Web の mt-6）
              final shift = p.captionAtBottom ? 0.0 : 24.0;
              return Stack(fit: StackFit.expand, children: [
                AppImage(helpMangaImageUrl(p.image), memCacheWidth: 1000),
                Positioned(
                  left: 0,
                  right: 0,
                  top: p.captionAtBottom ? null : 8,
                  bottom: p.captionAtBottom ? 8 : null,
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: w * 0.94),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: const Color(0xFFFEF3C7), border: Border.all(color: _ink, width: 2)),
                      child: Text(p.caption.text, textAlign: TextAlign.center, style: const TextStyle(color: _ink, fontSize: 11, fontWeight: FontWeight.w600, height: 1.35)),
                    ),
                  ),
                ),
                for (final b in p.bubbles) _bubble(b, w, h, shift),
                Positioned(
                  left: 6,
                  bottom: 6,
                  child: Container(
                    width: 26,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: _orange, shape: BoxShape.circle),
                    child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13)),
                  ),
                ),
              ]);
            }),
          ),
        ),
      ),
    );
  }

  Widget _bubble(HelpBubble b, double w, double h, double shift) {
    final top = b.at.startsWith('t') ? h * 0.04 + shift : null;
    final bottom = b.at.startsWith('b') ? h * 0.16 : null;
    final left = b.at == 'tl' || b.at == 'bl' ? w * 0.03 : null;
    final right = b.at == 'tr' || b.at == 'br' ? w * 0.03 : null;
    final bubble = CustomPaint(
      foregroundPainter: _BubbleTailPainter(at: b.at, color: Colors.white, border: _ink),
      child: Container(
        constraints: BoxConstraints(maxWidth: w * 0.44),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(color: Colors.white, borderRadius: Ds.br(16), border: Border.all(color: _ink, width: 2)),
        child: Text(b.text.text, textAlign: TextAlign.center, style: const TextStyle(color: _ink, fontSize: 11.5, fontWeight: FontWeight.w800, height: 1.35)),
      ),
    );
    if (b.at == 'tc') return Positioned(top: top, left: 0, right: 0, child: Center(child: bubble));
    return Positioned(top: top, bottom: bottom, left: left, right: right, child: bubble);
  }
}

/// 吹き出しのしっぽ（コマの中央のほう＝ぴくたーちゃんのほうへ。Web の TAIL_CLASS）
class _BubbleTailPainter extends CustomPainter {
  const _BubbleTailPainter({required this.at, required this.color, required this.border});

  final String at;
  final Color color;
  final Color border;

  @override
  void paint(Canvas canvas, Size size) {
    final down = at != 'bl' && at != 'br';
    final x = switch (at) { 'tl' || 'bl' => size.width * 0.72, 'tc' => size.width * 0.5, _ => size.width * 0.28 };
    // 枠の線の内側から描いて、しっぽの付け根の線を消す
    final y = down ? size.height - 2.5 : 2.5;
    final tip = down ? y + 9 : y - 9;
    final path = Path()
      ..moveTo(x - 7, y)
      ..lineTo(x, tip)
      ..lineTo(x + 7, y);
    canvas.drawPath(path..close(), Paint()..color = color);
    canvas.drawPath(
      Path()
        ..moveTo(x - 7, y)
        ..lineTo(x, tip)
        ..lineTo(x + 7, y),
      Paint()
        ..color = border
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(_BubbleTailPainter old) => old.at != at;
}
