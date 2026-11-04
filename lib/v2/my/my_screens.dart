import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/my/my_api.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/paged_list.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 作品の一覧だけの画面（いいね・ブックマーク・閲覧履歴・フォルダの中身）
class MyWorksScreen extends StatefulWidget {
  const MyWorksScreen({
    super.key,
    required this.title,
    required this.fetch,
    required this.emptyTitle,
    this.emptyMessage,
    this.emptyIcon = Icons.image_search_rounded,
    this.actions = const [],
  });

  final String title;
  final Future<List<WorkSummary>> Function(int offset, int limit) fetch;
  final String emptyTitle;
  final String? emptyMessage;
  final IconData emptyIcon;
  final List<Widget> actions;

  @override
  State<MyWorksScreen> createState() => _MyWorksScreenState();
}

class _MyWorksScreenState extends State<MyWorksScreen> {
  late final _works = PagedController<WorkSummary>(pageSize: 30, idOf: (w) => w.id, fetch: widget.fetch);

  @override
  void dispose() {
    _works.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppRefresh(
        edgeOffset: MediaQuery.paddingOf(context).top + kToolbarHeight,
        onRefresh: _works.refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800)),
              actions: widget.actions,
            ),
            SliverPagedWorks(controller: _works, emptyTitle: widget.emptyTitle, emptyMessage: widget.emptyMessage, emptyIcon: widget.emptyIcon),
          ],
        ),
      ),
    );
  }
}

/// フォルダの中身（Web のコレクション）
class FolderWorksScreen extends StatefulWidget {
  const FolderWorksScreen({super.key, required this.folderId});

  final String folderId;

  @override
  State<FolderWorksScreen> createState() => _FolderWorksScreenState();
}

class _FolderWorksScreenState extends State<FolderWorksScreen> {
  String _title = 'コレクション';

  @override
  Widget build(BuildContext context) {
    return MyWorksScreen(
      key: ValueKey(_title),
      title: _title,
      emptyTitle: 'このコレクションに作品はありません',
      emptyIcon: Icons.folder_outlined,
      actions: [
        PopupMenuButton<String>(
          onSelected: (_) => context.push('/folders/${widget.folderId}/report'),
          itemBuilder: (_) => const [PopupMenuItem(value: 'report', child: Text('通報する'))],
        ),
      ],
      fetch: (o, l) async {
        final (title, works) = await MyApi.folderWorks(widget.folderId, o, l);
        if (mounted && title.isNotEmpty && title != _title) {
          // 題名は最初のページで分かる。作り直すと一覧が読み直されるので一度だけ
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() => _title = title);
          });
        }
        return works;
      },
    );
  }
}

/// フォルダのカードの並び
class FolderTile extends StatelessWidget {
  const FolderTile({super.key, required this.folder});

  final FolderSummary folder;

  @override
  Widget build(BuildContext context) {
    final f = folder;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: Ds.s16, vertical: Ds.s4),
      leading: SizedBox(width: 56, height: 56, child: AppImage(f.thumbnailUrl, radius: 12, memCacheWidth: 168)),
      title: Text(f.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text('${f.worksCount}作品${f.isPrivate ? '・非公開' : ''}', style: TextStyle(color: context.muted, fontSize: 12.5)),
      trailing: Icon(Icons.chevron_right_rounded, color: context.muted),
      onTap: () => context.push('/folders/${f.id}'),
    );
  }
}

/// 自分のフォルダの一覧
class MyFoldersScreen extends StatefulWidget {
  const MyFoldersScreen({super.key});

  @override
  State<MyFoldersScreen> createState() => _MyFoldersScreenState();
}

class _MyFoldersScreenState extends State<MyFoldersScreen> {
  final _folders = PagedController<FolderSummary>(pageSize: 30, idOf: (f) => f.id, fetch: MyApi.folders);

  @override
  void dispose() {
    _folders.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('フォルダ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: PagedList<FolderSummary>(
        controller: _folders,
        emptyTitle: 'フォルダはありません',
        emptyMessage: '作品をまとめるフォルダがここに並びます',
        emptyIcon: Icons.folder_outlined,
        separated: false,
        itemBuilder: (context, f) => FolderTile(folder: f),
      ),
    );
  }
}

/// 作品の投稿・編集の履歴（Web の /my/histories）
class MyHistoriesScreen extends StatefulWidget {
  const MyHistoriesScreen({super.key});

  @override
  State<MyHistoriesScreen> createState() => _MyHistoriesScreenState();
}

class _MyHistoriesScreenState extends State<MyHistoriesScreen> {
  static const _types = <(String?, String)>[
    (null, 'すべて'),
    ('CREATE', '投稿'),
    ('UPDATE', '編集'),
    ('DELETE', '削除'),
    ('MODERATOR', '運営の対応'),
  ];

  int _index = 0;
  final Map<int, PagedController<ActionHistoryItem>> _controllers = {};

  PagedController<ActionHistoryItem> get _controller => _controllers.putIfAbsent(_index, () {
        final type = _types[_index].$1;
        return PagedController(pageSize: 30, idOf: (h) => h.id, fetch: (o, l) => MyApi.histories(type, o, l));
      });

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('作品の履歴', style: TextStyle(fontWeight: FontWeight.w800))),
      body: Column(children: [
        PillTabs(labels: [for (final t in _types) t.$2], index: _index, onChanged: (i) => setState(() => _index = i)),
        const SizedBox(height: Ds.s8),
        Expanded(
          child: PagedList<ActionHistoryItem>(
            key: ObjectKey(_controller),
            controller: _controller,
            emptyTitle: '履歴はありません',
            emptyIcon: Icons.history_rounded,
            itemBuilder: (context, h) => ListTile(
              leading: SizedBox(
                width: 48,
                height: 48,
                child: h.thumbnailUrl != null
                    ? AppImage(h.thumbnailUrl, radius: 10, memCacheWidth: 144)
                    : Icon(h.isModeratorAction ? Icons.shield_outlined : Icons.history_rounded, color: context.muted),
              ),
              title: Text(h.title ?? h.summary, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              subtitle: Text(
                '${h.title == null ? '' : '${h.summary}・'}${relativeTime(h.createdAt)}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: context.muted, fontSize: 12),
              ),
              onTap: h.workId == null || h.actionType == 'DELETE' ? null : () => Nav.work(context, h.workId!),
            ),
          ),
        ),
      ]),
    );
  }
}

/// 運営からのお知らせ（Web の /my/reports）
class MyReportsScreen extends StatefulWidget {
  const MyReportsScreen({super.key});

  @override
  State<MyReportsScreen> createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  final _reports = PagedController<ModerationReport>(
    pageSize: 30,
    idOf: (r) => r.id,
    fetch: (o, l) async {
      final me = await UserApi.viewerId();
      if (me == null) return <ModerationReport>[];
      return MyApi.reports(me, o, l);
    },
  );

  @override
  void dispose() {
    _reports.dispose();
    super.dispose();
  }

  Future<void> _respond(ModerationReport r) async {
    final ok = await showConfirmSheet(context, title: '対応が終わったことを運営に伝えますか？', confirmLabel: '対応しました');
    if (!ok) return;
    const message = '対応しました';
    try {
      await MyApi.respondReport(r.id, message);
      r.responseMessage = message;
      _reports.touch();
      if (mounted) context.toast('運営に完了を報告しました');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('運営からのお知らせ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: PagedList<ModerationReport>(
        controller: _reports,
        emptyTitle: 'お知らせはありません',
        emptyIcon: Icons.shield_outlined,
        itemBuilder: (context, r) => Padding(
          padding: const EdgeInsets.all(Ds.s16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              if (r.thumbnailUrl != null) ...[
                GestureDetector(
                  onTap: r.workId == null ? null : () => Nav.work(context, r.workId!),
                  child: SizedBox(width: 48, height: 48, child: AppImage(r.thumbnailUrl, radius: 10, memCacheWidth: 144)),
                ),
                const SizedBox(width: Ds.s12),
              ],
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(r.workTitle == null ? '（表示できない作品）' : '「${r.workTitle}」', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(relativeTime(r.createdAt), style: TextStyle(color: context.muted, fontSize: 12)),
                ]),
              ),
              Badge2(r.status == 'DONE' ? '対応済み' : (r.status == 'NO_NEED_ACTION' ? 'お知らせのみ' : '対応が必要'), color: r.status == 'UNHANDLED' ? context.cs.error : null),
            ]),
            if (r.reportMessage != null) Padding(padding: const EdgeInsets.only(top: Ds.s8), child: Text(r.reportMessage!, style: const TextStyle(fontSize: 13.5, height: 1.45))),
            if (r.customMessage != null) Padding(padding: const EdgeInsets.only(top: Ds.s6), child: Text('運営からのひとこと: ${r.customMessage}', style: TextStyle(color: context.muted, fontSize: 13, height: 1.4))),
            if (r.needsAction)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () => _respond(r), child: const Text('対応しました')),
              ),
          ]),
        ),
      ),
    );
  }
}
