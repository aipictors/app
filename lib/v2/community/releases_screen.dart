import 'dart:convert';

import 'package:aipictors/v2/community/app_markdown.dart';
import 'package:aipictors/v2/community/paged_list.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

/// Web の .data（Remix の turbo-stream）を読む。リリースは GraphQL に無いため
class WebLoaderData {
  WebLoaderData._();

  static dynamic _decode(List<dynamic> table, int index) {
    if (index < 0) return null;
    final v = table[index];
    if (v is Map) {
      return {for (final e in v.entries) table[int.parse((e.key as String).substring(1))] as String: _decode(table, e.value as int)};
    }
    if (v is List) {
      if (v.isNotEmpty && v.first is String) {
        // ["D", ms] は日付。ほかの特殊な型は使わない
        return v.first == 'D' ? DateTime.fromMillisecondsSinceEpoch((v[1] as num).toInt()).toIso8601String() : null;
      }
      return [for (final i in v) _decode(table, i as int)];
    }
    return v;
  }

  /// [path] のページの、[routeSuffix] で終わるルートのデータ
  static Future<Map<String, dynamic>> fetch(String path, String routeSuffix) async {
    final res = await http.get(Uri.parse('https://www.aipictors.com$path')).timeout(const Duration(seconds: 20));
    if (res.statusCode != 200) throw const ApiException('読み込めませんでした');
    final line = const LineSplitter().convert(utf8.decode(res.bodyBytes)).first;
    final root = _decode(jsonDecode(line) as List<dynamic>, 0) as Map<String, dynamic>;
    for (final e in root.entries) {
      if (e.key.endsWith(routeSuffix)) {
        final data = (e.value as Map?)?['data'];
        if (data is Map<String, dynamic>) return data;
      }
    }
    throw const ApiException('読み込めませんでした');
  }
}

class Release {
  const Release(this.id, this.title, this.body, this.date, this.tags);

  final String id;
  final String title;
  final String body;
  final DateTime? date;
  final List<String> tags;

  factory Release.fromJson(Map<String, dynamic> j) {
    final tag = j['tag'];
    return Release(
      j.str('id'),
      j.str('title'),
      j.str('description'),
      DateTime.tryParse(j.str('publishedAt', j.str('createdAt')))?.toLocal(),
      tag is List ? tag.whereType<String>().toList() : (tag is String && tag.isNotEmpty ? [tag] : const []),
    );
  }

  String get dateLabel => date == null ? '' : '${date!.year}年${date!.month}月${date!.day}日';

  static Future<List<Release>> page(int page) async {
    final data = await WebLoaderData.fetch('/releases.data?page=$page', 'releases._index');
    final contents = (data['data'] as Map?)?['contents'];
    return contents is List ? contents.whereType<Map<String, dynamic>>().map(Release.fromJson).toList() : const [];
  }

  static Future<Release> byId(String id) async {
    final data = await WebLoaderData.fetch('/releases/$id.data', r'releases.$id._index');
    final contents = (data['data'] as Map?)?['contents'] ?? data['contents'];
    if (contents is List && contents.isNotEmpty) return Release.fromJson(contents.first as Map<String, dynamic>);
    final one = data['release'];
    if (one is Map<String, dynamic>) return Release.fromJson(one);
    throw const ApiException('見つかりませんでした');
  }
}

/// お知らせ（更新情報・運営からのお知らせ）
class ReleasesScreen extends StatefulWidget {
  const ReleasesScreen({super.key, this.initial = 0});

  final int initial;

  @override
  State<ReleasesScreen> createState() => _ReleasesScreenState();
}

class _ReleasesScreenState extends State<ReleasesScreen> {
  late final _releases = PagedController<Release>(
    pageSize: 1,
    idOf: (r) => r.id,
    fetch: (offset, _) => Release.page(offset),
  );
  late final _announcements = PagedController<Map<String, dynamic>>(
    pageSize: 20,
    idOf: (a) => a.str('id'),
    fetch: (offset, limit) async {
      final data = await Api.query(
        r'query AppAnnouncements($offset: Int!, $limit: Int!) { announcements(offset: $offset, limit: $limit) { id title body publishedAt } }',
        variables: {'offset': offset, 'limit': limit},
        cacheFor: const Duration(minutes: 5),
      );
      return data.list('announcements');
    },
  );

  @override
  void dispose() {
    _releases.dispose();
    _announcements.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initial,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('お知らせ', style: TextStyle(fontWeight: FontWeight.w800)),
          bottom: TabBar(
            dividerColor: context.hairline,
            tabs: const [Tab(text: '更新情報'), Tab(text: '運営から')],
          ),
        ),
        body: TabBarView(children: [
          PagedList<Release>(
            controller: _releases,
            itemBuilder: (context, r) => _Row(
              title: r.title,
              date: r.dateLabel,
              onTap: () => context.push('/releases/${r.id}', extra: r),
            ),
          ),
          PagedList<Map<String, dynamic>>(
            controller: _announcements,
            itemBuilder: (context, a) => _Row(
              title: a.str('title'),
              date: formatYmd(a.integer('publishedAt')),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => _ReadingScaffold(title: a.str('title'), date: formatYmd(a.integer('publishedAt')), child: AppHtmlBody(a.str('body'))),
              )),
            ),
          ),
        ]),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.title, required this.date, required this.onTap});

  final String title;
  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Ds.s16),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: context.hairline))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, height: 1.4)),
          const SizedBox(height: Ds.s4),
          Text(date, style: TextStyle(color: context.muted, fontSize: 12)),
        ]),
      ),
    );
  }
}

class _ReadingScaffold extends StatelessWidget {
  const _ReadingScaffold({required this.title, required this.date, required this.child});

  final String title;
  final String date;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('お知らせ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s32),
        child: ContentWidth(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, height: 1.4)),
            const SizedBox(height: Ds.s6),
            Text(date, style: TextStyle(color: context.muted, fontSize: 12)),
            const SizedBox(height: Ds.s16),
            child,
          ]),
        ),
      ),
    );
  }
}

/// 更新情報の本文（Markdown）
class ReleaseDetailScreen extends StatefulWidget {
  const ReleaseDetailScreen({super.key, required this.id, this.release});

  final String id;
  final Release? release;

  @override
  State<ReleaseDetailScreen> createState() => _ReleaseDetailScreenState();
}

class _ReleaseDetailScreenState extends State<ReleaseDetailScreen> {
  late Future<Release> _f = widget.release != null ? Future.value(widget.release) : Release.byId(widget.id);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Release>(
      future: _f,
      builder: (context, snap) {
        if (snap.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body: StateView.error('読み込めませんでした', onRetry: () => setState(() => _f = Release.byId(widget.id))),
          );
        }
        final r = snap.data;
        if (r == null) return Scaffold(appBar: AppBar(), body: const SkeletonList(avatarSize: 0));
        return _ReadingScaffold(title: r.title, date: r.dateLabel, child: AppMarkdown(r.body));
      },
    );
  }
}
