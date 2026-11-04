import 'package:aipictors/v2/community/web_links.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;

/// Markdown の本文。リンクは WebLinks を通す
class AppMarkdown extends StatelessWidget {
  const AppMarkdown(this.data, {super.key, this.selectable = false});

  final String data;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.7, fontSize: 15);
    return MarkdownBody(
      data: WebLinks.rewriteMarkdown(data),
      selectable: selectable,
      softLineBreak: true,
      extensionSet: md.ExtensionSet.gitHubWeb,
      onTapLink: (_, href, __) {
        if (href != null) WebLinks.open(context, href);
      },
      imageBuilder: (uri, _, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Ds.s8),
        child: ClipRRect(
          borderRadius: Ds.br(12),
          child: AppImage(uri.toString(), fit: BoxFit.fitWidth),
        ),
      ),
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        p: base,
        listBullet: base,
        a: base?.copyWith(color: context.cs.primary),
        h1: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, height: 1.5),
        h2: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, height: 1.5),
        h3: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, height: 1.5),
        h4: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, height: 1.5),
        blockSpacing: Ds.s12,
        h1Padding: const EdgeInsets.only(top: Ds.s16),
        h2Padding: const EdgeInsets.only(top: Ds.s16),
        h3Padding: const EdgeInsets.only(top: Ds.s12),
      ),
    );
  }
}

/// HTML の本文（昔のお知らせ）
class AppHtmlBody extends StatelessWidget {
  const AppHtmlBody(this.html, {super.key});

  final String html;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: html.replaceAll(r'\"', '"'),
      style: {
        'body': Style(margin: Margins.zero, padding: HtmlPaddings.zero, fontSize: FontSize(15), lineHeight: const LineHeight(1.7)),
        '*': Style(fontFamily: null),
      },
      onLinkTap: (url, _, __) {
        if (url != null) WebLinks.open(context, url);
      },
    );
  }
}

/// アプリに入れた Markdown の文書（ヘルプ・ガイドライン・ロードマップ）
class DocScreen extends StatelessWidget {
  const DocScreen({super.key, required this.title, required this.asset});

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800))),
      body: FutureBuilder<String>(
        future: rootBundle.loadString(asset),
        builder: (context, snap) {
          if (!snap.hasData) return const SkeletonList(avatarSize: 0);
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s32),
            child: ContentWidth(child: AppMarkdown(snap.data!)),
          );
        },
      ),
    );
  }
}
