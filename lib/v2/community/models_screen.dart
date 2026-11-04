import 'dart:convert';

import 'package:aipictors/v2/community/app_markdown.dart';
import 'package:aipictors/v2/community/paged_list.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

const _officialQuery = '''
query AppImageModels {
  imageModels { id name displayName slug type category style isNew thumbnailImageURL description }
}''';

/// みんなのモデル（Web の公開 API。アップロードは Web のまま）
class UserModelsApi {
  UserModelsApi._();

  static const _base = 'https://www.aipictors.com/api/user-models';

  static Future<List<Map<String, dynamic>>> list({required String sort, String kind = '', String q = '', required int offset, required int limit}) async {
    final uri = Uri.parse(_base).replace(queryParameters: {
      'sort': sort,
      'ratings': 'G,R15',
      'offset': '$offset',
      'limit': '$limit',
      if (kind.isNotEmpty) 'kind': kind,
      if (q.isNotEmpty) 'q': q,
    });
    final res = await http.get(uri).timeout(const Duration(seconds: 20));
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final data = json is Map ? json['data'] : null;
    if (res.statusCode != 200 || data is! Map) throw const ApiException('モデルを読み込めませんでした');
    final models = data['models'];
    return models is List ? models.whereType<Map<String, dynamic>>().where((m) => m.str('rating') != 'R18').toList() : const [];
  }

  static Future<Map<String, dynamic>> detail(String id) async {
    final res = await http.get(Uri.parse('$_base/$id')).timeout(const Duration(seconds: 20));
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final data = json is Map ? json['data'] : null;
    final model = data is Map ? (data['model'] ?? data) : null;
    if (res.statusCode != 200 || model is! Map) throw const ApiException('モデルを読み込めませんでした');
    return Map<String, dynamic>.from(model);
  }
}

/// モデル（みんなのモデル・公式・ライブラリ）
class ModelsScreen extends StatefulWidget {
  const ModelsScreen({super.key});

  @override
  State<ModelsScreen> createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
  static const _sorts = ['popular', 'new'];
  int _sort = 0;
  String _q = '';
  late PagedController<Map<String, dynamic>> _community = _make();
  late final Future<List<Map<String, dynamic>>> _official =
      Api.query(_officialQuery, cacheFor: const Duration(minutes: 10)).then((d) => d.list('imageModels'));

  PagedController<Map<String, dynamic>> _make() {
    final sort = _sorts[_sort];
    final q = _q;
    return PagedController(
      idOf: (m) => m.str('id'),
      fetch: (offset, limit) => UserModelsApi.list(sort: sort, q: q, offset: offset, limit: limit),
    );
  }

  void _reset(VoidCallback change) => setState(() {
        _community.dispose();
        change();
        _community = _make();
      });

  @override
  void dispose() {
    _community.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('モデル', style: TextStyle(fontWeight: FontWeight.w800)),
          actions: [TextButton(onPressed: () => context.push('/models/library'), child: const Text('ライブラリ'))],
          bottom: TabBar(dividerColor: context.hairline, tabs: const [Tab(text: 'みんなのモデル'), Tab(text: '公式')]),
        ),
        body: TabBarView(children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s4),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(hintText: 'モデルを検索', prefixIcon: Icon(Icons.search_rounded), isDense: true),
                onSubmitted: (v) => _reset(() => _q = v.trim()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Ds.s6),
              child: PillTabs(labels: const ['人気', '新着'], index: _sort, onChanged: (i) => _reset(() => _sort = i)),
            ),
            Expanded(
              child: PagedList<Map<String, dynamic>>(
                key: ValueKey('$_sort-$_q'),
                controller: _community,
                emptyTitle: 'モデルが見つかりません',
                itemBuilder: (context, m) => _ModelRow(
                  title: m.str('name'),
                  subtitle: '${m.str('kind')}・${m.str('baseModel')}・${m.integer('useCount')} 回使用',
                  image: m.strOrNull('thumbnailUrl'),
                  onTap: () => context.push('/models/u/${m.str('id')}'),
                ),
              ),
            ),
          ]),
          _OfficialList(future: _official),
        ]),
      ),
    );
  }
}

class _OfficialList extends StatelessWidget {
  const _OfficialList({required this.future});

  final Future<List<Map<String, dynamic>>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: future,
      builder: (context, snap) {
        if (snap.hasError) return StateView.error('モデルを読み込めませんでした');
        if (!snap.hasData) return const SkeletonList();
        final models = snap.data!;
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: Ds.s32),
          itemCount: models.length,
          itemBuilder: (context, i) {
            final m = models[i];
            return _ModelRow(
              title: m.str('displayName', m.str('name')),
              subtitle: '${m.str('category')}・${m.str('style')}',
              image: m.strOrNull('thumbnailImageURL'),
              isNew: m.boolean('isNew'),
              onTap: () => context.push('/models/${m.str('id')}'),
            );
          },
        );
      },
    );
  }
}

class _ModelRow extends StatelessWidget {
  const _ModelRow({required this.title, required this.subtitle, required this.image, required this.onTap, this.isNew = false});

  final String title;
  final String subtitle;
  final String? image;
  final VoidCallback onTap;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppImage(image, width: 56, height: 56, radius: 10, memCacheWidth: 168),
      title: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
      subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: context.muted)),
      trailing: isNew ? const Badge2('NEW', color: Ds.pink) : null,
      onTap: onTap,
    );
  }
}

/// 公式モデルの詳細と作品
class ModelDetailScreen extends StatefulWidget {
  const ModelDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<ModelDetailScreen> createState() => _ModelDetailScreenState();
}

class _ModelDetailScreenState extends State<ModelDetailScreen> {
  static const _doc = r'''
query AppImageModel($id: [ID!]) {
  imageModel(where: { id: $id }) { id name displayName description explanation license thumbnailImageURL style category }
}''';

  Map<String, dynamic>? _model;
  String? _error;

  late final PagedController<WorkSummary> _works = PagedController(
    idOf: (w) => w.id,
    fetch: (offset, limit) async {
      final data = await Api.query(
        'query AppImageModelWorks(\$id: [ID!], \$offset: Int!, \$limit: Int!) { imageModel(where: { id: \$id }) { id works(offset: \$offset, limit: \$limit, where: { ratings: [G, R15] }) { $workCardFields } } }',
        variables: {'id': [widget.id], 'offset': offset, 'limit': limit},
        cacheFor: const Duration(minutes: 3),
      );
      return WorkSummary.listFrom(data.obj('imageModel')?.list('works') ?? const []);
    },
  );

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _works.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(_doc, variables: {'id': [widget.id]}, cacheFor: const Duration(minutes: 10));
      if (mounted) setState(() => _model = data.obj('imageModel'));
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = _model;
    if (_error != null) return Scaffold(appBar: AppBar(), body: StateView.error(_error!, onRetry: _load));
    if (m == null) return Scaffold(appBar: AppBar(), body: const SkeletonGrid());
    return Scaffold(
      appBar: AppBar(title: Text(m.str('displayName', m.str('name')), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(Ds.s16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (m.strOrNull('explanation') != null) AppMarkdown(m.str('explanation')) else if (m.strOrNull('description') != null) AppMarkdown(m.str('description')),
              if (m.strOrNull('license') != null) ...[
                const SizedBox(height: Ds.s8),
                Text('ライセンス: ${m.str('license')}', style: TextStyle(color: context.muted, fontSize: 12)),
              ],
            ]),
          ),
        ),
        const SliverToBoxAdapter(child: SectionHeader('このモデルの作品', icon: Icons.image_outlined)),
        SliverPagedWorks(controller: _works),
        const SliverToBoxAdapter(child: SizedBox(height: Ds.s32)),
      ]),
    );
  }
}

/// みんなのモデルの詳細
class UserModelDetailScreen extends StatefulWidget {
  const UserModelDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<UserModelDetailScreen> createState() => _UserModelDetailScreenState();
}

class _UserModelDetailScreenState extends State<UserModelDetailScreen> {
  late Future<Map<String, dynamic>> _f = UserModelsApi.detail(widget.id);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _f,
      builder: (context, snap) {
        if (snap.hasError) {
          return Scaffold(appBar: AppBar(), body: StateView.error('モデルを読み込めませんでした', onRetry: () => setState(() => _f = UserModelsApi.detail(widget.id))));
        }
        final m = snap.data;
        if (m == null) return Scaffold(appBar: AppBar(), body: const SkeletonList());
        if (m.str('rating') == 'R18') return Scaffold(appBar: AppBar(), body: StateView.empty('このモデルはアプリでは表示できません'));
        final samples = (m['sampleImageUrls'] as List? ?? const []).whereType<String>().toList();
        final trigger = m.strOrNull('triggerWords');
        final creatorId = m.strOrNull('userId');
        return Scaffold(
          appBar: AppBar(title: Text(m.str('name'), maxLines: 1, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
          body: ListView(padding: const EdgeInsets.fromLTRB(Ds.s16, 0, Ds.s16, Ds.s32), children: [
            if (samples.isNotEmpty || m.strOrNull('thumbnailUrl') != null)
              SizedBox(
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: samples.isEmpty ? 1 : samples.length,
                  separatorBuilder: (_, __) => const SizedBox(width: Ds.s8),
                  itemBuilder: (context, i) => AppImage(samples.isEmpty ? m.str('thumbnailUrl') : samples[i], width: 200, height: 260, radius: 14, memCacheWidth: 600),
                ),
              ),
            const SizedBox(height: Ds.s12),
            Text(m.str('name'), style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900, height: 1.35)),
            const SizedBox(height: Ds.s4),
            Text('${m.str('kind')}・${m.str('baseModel')}・${m.integer('useCount')} 回使用', style: TextStyle(color: context.muted, fontSize: 12)),
            if (trigger != null) ...[
              const SizedBox(height: Ds.s12),
              const Text('トリガーワード', style: TextStyle(fontWeight: FontWeight.w800)),
              SelectableText(trigger),
            ],
            if (m.strOrNull('description') != null) ...[
              const SizedBox(height: Ds.s12),
              AppMarkdown(m.str('description')),
            ],
            if (creatorId != null) ...[
              const SizedBox(height: Ds.s16),
              SecondaryButton(label: '作った人を見る', icon: Icons.person_outline_rounded, onPressed: () => Nav.user(context, creatorId)),
            ],
          ]),
        );
      },
    );
  }
}

/// モデルのライブラリ（お気に入りと公式）
class ModelsLibraryScreen extends StatefulWidget {
  const ModelsLibraryScreen({super.key});

  @override
  State<ModelsLibraryScreen> createState() => _ModelsLibraryScreenState();
}

class _ModelsLibraryScreenState extends State<ModelsLibraryScreen> {
  late Future<List<Map<String, dynamic>>> _f = _load();

  Future<List<Map<String, dynamic>>> _load() async {
    if (!Nav.isLoggedIn) return const [];
    final data = await Api.query('query AppModelFavorites { viewer { id favoritedImageGenerationModels { id name displayName category style thumbnailImageURL } } }');
    return data.obj('viewer')?.list('favoritedImageGenerationModels') ?? const [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('モデルのライブラリ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: !Nav.isLoggedIn
          ? LoginRequiredView(icon: Icons.star_outline_rounded, title: 'ログインするとお気に入りを見られます', message: '画像生成でお気に入りにしたモデルが並びます。', onLogin: () => Nav.login(context))
          : FutureBuilder<List<Map<String, dynamic>>>(
              future: _f,
              builder: (context, snap) {
                if (snap.hasError) return StateView.error('読み込めませんでした', onRetry: () => setState(() => _f = _load()));
                if (!snap.hasData) return const SkeletonList();
                if (snap.data!.isEmpty) return StateView.empty('お気に入りのモデルはまだありません', icon: Icons.star_outline_rounded);
                return ListView(children: [
                  for (final m in snap.data!)
                    _ModelRow(
                      title: m.str('displayName', m.str('name')),
                      subtitle: '${m.str('category')}・${m.str('style')}',
                      image: m.strOrNull('thumbnailImageURL'),
                      onTap: () => context.push('/models/${m.str('id')}'),
                    ),
                ]);
              },
            ),
    );
  }
}
