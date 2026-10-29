import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

String categoryLabel(String category) => switch (category) {
  'UNIVERSAL' => '汎用',
  'ILLUSTRATION_GIRL' => '美少女イラスト',
  'ANIME_GIRL' => '美少女アニメ',
  'ANIMAL' => '獣系',
  'BIKINI_MODEL' => 'グラビア',
  'ILLUSTRATION_BOY' => '美男子イラスト',
  'FIGURE' => '美少女フィギュア',
  'BACKGROUND' => '背景',
  _ => 'その他',
};

String typeLabel(String type) => switch (type) {
  'SD1' => 'SD1.5',
  'SDXL' => 'SDXL',
  'FLUX' => 'FLUX',
  'GEMINI' || 'SD5' => 'Gemini',
  _ => type,
};

Color typeColor(String type) => switch (type) {
  'SDXL' => Ds.purple,
  'FLUX' => Ds.pink,
  'GEMINI' || 'SD5' => Ds.gold,
  _ => Ds.blue,
};

/// モデルを選ぶシート
Future<void> showModelPicker(BuildContext context, GenController controller) {
  return showGenSheet(context, expand: true, initialSize: 0.94, builder: (_) => _ModelPicker(controller: controller));
}

class _ModelPicker extends StatefulWidget {
  const _ModelPicker({required this.controller});

  final GenController controller;

  @override
  State<_ModelPicker> createState() => _ModelPickerState();
}

class _ModelPickerState extends State<_ModelPicker> {
  static const _tabs = ['公式モデル', 'お気に入り', 'みんなのモデル', '自分のモデル'];

  int _tab = 0;
  String _category = '';
  String _type = '';
  String _query = '';
  final _search = TextEditingController();
  Timer? _debounce;

  // みんなのモデル
  List<UserModel>? _userModels;
  String? _userError;
  bool _userLoading = false;
  List<UserModel>? _mine;
  String? _mineError;

  GenController get c => widget.controller;

  @override
  void dispose() {
    _search.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onQuery(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      setState(() => _query = v.trim());
      if (_tab == 2) _loadUserModels();
    });
  }

  Future<void> _loadUserModels() async {
    setState(() {
      _userLoading = true;
      _userError = null;
    });
    try {
      final list = await GenApi.userModels(kind: 'CHECKPOINT', q: _query, limit: 48);
      if (!mounted) return;
      setState(() => _userModels = list);
    } on ApiException catch (e) {
      if (mounted) setState(() => _userError = e.message);
    } catch (_) {
      if (mounted) setState(() => _userError = 'みんなのモデルを読み込めませんでした');
    } finally {
      if (mounted) setState(() => _userLoading = false);
    }
  }

  Future<void> _loadMine() async {
    setState(() => _mineError = null);
    try {
      final list = await GenApi.myUserModels();
      if (!mounted) return;
      setState(() => _mine = list.where((m) => m.kind == 'CHECKPOINT').toList());
    } on ApiException catch (e) {
      if (mounted) setState(() => _mineError = e.message);
    } catch (_) {
      if (mounted) setState(() => _mineError = '自分のモデルを読み込めませんでした');
    }
  }

  void _setTab(int i) {
    setState(() => _tab = i);
    if (i == 2 && _userModels == null && !_userLoading) _loadUserModels();
    if (i == 3 && _mine == null) _loadMine();
  }

  void _pick(ImageModel m) {
    Ds.success();
    c.settings.selectModel(m);
    Navigator.of(context).pop();
  }

  void _pickUser(UserModel m) {
    final catalog = c.catalog;
    if (catalog == null) return;
    Ds.success();
    c.settings.selectUserCheckpoint(m, catalog);
    Navigator.of(context).pop();
  }

  List<ImageModel> _filtered(List<ImageModel> all) {
    final q = _query.toLowerCase();
    return all.where((m) {
        if (_category.isNotEmpty && m.category != _category) return false;
        if (_type.isNotEmpty && (m.type == 'SD5' ? 'GEMINI' : m.type) != _type) return false;
        if (q.isNotEmpty && !m.displayName.toLowerCase().contains(q) && !m.name.toLowerCase().contains(q)) return false;
        return true;
      }).toList()
      // 新しいモデル（id が大きい）を先に
      ..sort((a, b) => (int.tryParse(b.id) ?? 0).compareTo(int.tryParse(a.id) ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        final catalog = c.catalog;
        return Column(
          children: [
            const SheetHandle(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 12, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text('モデルを選ぶ', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                  ),
                  IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close_rounded)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _search,
                onChanged: _onQuery,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'モデル名で探す',
                  prefixIcon: const Icon(Icons.search_rounded),
                  filled: true,
                  fillColor: context.skeleton,
                  isDense: true,
                  border: OutlineInputBorder(borderRadius: Ds.br(14), borderSide: BorderSide.none),
                ),
              ),
            ),
            const SizedBox(height: 10),
            PillTabs(labels: _tabs, index: _tab, onChanged: _setTab),
            if (_tab == 0) ...[
              const SizedBox(height: 8),
              _chips(['', 'SD1', 'SDXL', 'FLUX', 'GEMINI'], _type, (v) => v.isEmpty ? 'すべての種類' : typeLabel(v), (v) => setState(() => _type = v)),
              const SizedBox(height: 6),
              _chips(
                [
                  '',
                  ...{...?catalog?.models.map((m) => m.category)},
                ],
                _category,
                (v) => v.isEmpty ? 'すべてのジャンル' : categoryLabel(v),
                (v) => setState(() => _category = v),
              ),
            ],
            const SizedBox(height: 8),
            Expanded(child: _body(catalog)),
          ],
        );
      },
    );
  }

  Widget _chips(List<String> values, String selected, String Function(String) label, ValueChanged<String> onTap) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final v = values[i];
          final on = v == selected;
          return ChoiceChip(
            label: Text(label(v)),
            selected: on,
            showCheckmark: false,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(borderRadius: Ds.br(17)),
            onSelected: (_) {
              Ds.tap();
              onTap(v);
            },
          );
        },
      ),
    );
  }

  Widget _body(GenCatalog? catalog) {
    if (catalog == null) {
      if (c.catalogError != null) return StateView.error(c.catalogError!, onRetry: c.loadCatalog);
      return const Center(child: CircularProgressIndicator());
    }
    switch (_tab) {
      case 1:
        final favs = c.viewer?.favoriteModelIds ?? const <String>{};
        final list = _filtered(catalog.models.where((m) => favs.contains(m.id)).toList());
        if (list.isEmpty) {
          return const StateView(icon: Icons.favorite_border_rounded, title: 'お気に入りはまだありません', message: 'モデルの ♡ を押すと、ここにまとまります', compact: true);
        }
        return _officialGrid(list);
      case 2:
        return _userGrid(_userModels, _userError, _userLoading, _loadUserModels, emptyTitle: 'モデルが見つかりません', emptyMessage: 'ほかの言葉で探してみてください');
      case 3:
        final mine = _mine?.where((m) => _query.isEmpty || m.name.toLowerCase().contains(_query.toLowerCase())).toList();
        return _userGrid(
          mine,
          _mineError,
          _mine == null && _mineError == null,
          _loadMine,
          emptyTitle: '自分のモデルはまだありません',
          emptyMessage: 'Web の「みんなのモデル」からチェックポイントをアップロードすると、ここから生成に使えます',
        );
      default:
        final list = _filtered(catalog.models);
        if (list.isEmpty) {
          return const StateView(icon: Icons.search_off_rounded, title: 'モデルが見つかりません', compact: true);
        }
        return _officialGrid(list);
    }
  }

  SliverGridDelegate get _grid =>
      const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.66);

  Widget _officialGrid(List<ImageModel> list) {
    final selected = c.settings.userCheckpoint == null ? c.settings.modelId : '';
    final favs = c.viewer?.favoriteModelIds ?? const <String>{};
    return GridView.builder(
      controller: PrimaryScrollController.of(context),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
      gridDelegate: _grid,
      itemCount: list.length,
      itemBuilder: (context, i) {
        final m = list[i];
        return _ModelCard(
          title: m.displayName,
          subtitle: categoryLabel(m.category),
          imageUrl: m.thumbnailUrl,
          type: m.type,
          isNew: m.isNew,
          selected: m.id == selected,
          favorite: c.viewer == null ? null : favs.contains(m.id),
          onFavorite: () async {
            final error = await c.toggleFavoriteModel(m.id);
            if (error != null && context.mounted) context.toast(error, error: true);
          },
          onTap: () => _pick(m),
        );
      },
    );
  }

  Widget _userGrid(
    List<UserModel>? list,
    String? error,
    bool loading,
    Future<void> Function() retry, {
    required String emptyTitle,
    required String emptyMessage,
  }) {
    if (error != null && (list == null || list.isEmpty)) return StateView.error(error, onRetry: retry);
    if (list == null || (loading && list.isEmpty)) {
      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
        gridDelegate: _grid,
        itemCount: 9,
        itemBuilder: (_, __) => const Skeleton(radius: 16),
      );
    }
    if (list.isEmpty) return StateView(icon: Icons.inventory_2_outlined, title: emptyTitle, message: emptyMessage, compact: true);
    final selected = c.settings.userCheckpoint?.id;
    return GridView.builder(
      controller: PrimaryScrollController.of(context),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
      gridDelegate: _grid,
      itemCount: list.length,
      itemBuilder: (context, i) {
        final m = list[i];
        return _ModelCard(
          title: m.name,
          subtitle: m.authorName ?? m.baseModel,
          imageUrl: m.thumbnailUrl,
          type: m.modelType,
          extraBadge: m.baseModel,
          selected: m.id == selected,
          onTap: () => _pickUser(m),
        );
      },
    );
  }
}

class _ModelCard extends StatelessWidget {
  const _ModelCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.type,
    required this.selected,
    required this.onTap,
    this.isNew = false,
    this.favorite,
    this.onFavorite,
    this.extraBadge,
  });

  final String title;
  final String subtitle;
  final String? imageUrl;
  final String type;
  final bool isNew;
  final bool selected;
  final bool? favorite;
  final VoidCallback? onFavorite;
  final VoidCallback onTap;
  final String? extraBadge;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Ds.normal,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(borderRadius: Ds.br(18), gradient: selected ? Ds.brandGradient : null),
        child: Container(
          decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(15)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppImage(imageUrl, memCacheWidth: 400),
                    Positioned(
                      left: 6,
                      top: 6,
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          Badge2(typeLabel(type), color: typeColor(type).withValues(alpha: 0.9)),
                          if (isNew) const Badge2('NEW', color: Ds.pink),
                        ],
                      ),
                    ),
                    if (favorite != null)
                      Positioned(
                        right: 2,
                        top: 2,
                        child: IconButton(
                          visualDensity: VisualDensity.compact,
                          onPressed: () {
                            Ds.impact();
                            onFavorite?.call();
                          },
                          icon: Icon(
                            favorite! ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                            color: favorite! ? Ds.pink : Colors.white,
                            shadows: const [Shadow(blurRadius: 6, color: Colors.black54)],
                          ),
                        ),
                      ),
                    if (selected)
                      const Positioned(
                        right: 8,
                        bottom: 8,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.check_rounded, size: 18, color: Ds.blue),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11, color: context.muted),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
