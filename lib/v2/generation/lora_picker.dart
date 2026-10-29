import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/generation/generation_settings.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

/// LoRA を選ぶシート（公式 LoRA とみんなのモデルの LoRA）
Future<void> showLoraPicker(BuildContext context, GenController controller) {
  return showGenSheet(context, expand: true, initialSize: 0.9, builder: (_) => _LoraPicker(controller: controller));
}

class _LoraPicker extends StatefulWidget {
  const _LoraPicker({required this.controller});

  final GenController controller;

  @override
  State<_LoraPicker> createState() => _LoraPickerState();
}

class _LoraPickerState extends State<_LoraPicker> {
  int _tab = 0;
  String _genre = '';
  String _query = '';
  Timer? _debounce;
  List<UserModel>? _userLoras;
  String? _userError;

  GenController get c => widget.controller;

  int get _limit => c.viewer?.loraLimit ?? 2;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _loadUser() async {
    setState(() => _userError = null);
    try {
      final list = await GenApi.userModels(kind: 'LORA', q: _query, limit: 48);
      if (mounted) setState(() => _userLoras = list);
    } on ApiException catch (e) {
      if (mounted) setState(() => _userError = e.message);
    } catch (_) {
      if (mounted) setState(() => _userError = 'LoRA を読み込めませんでした');
    }
  }

  bool _isPicked(String name) => c.settings.loras.any((l) => l.name == name);

  void _toggle(String name, {String? label, String? thumb, double weight = 1}) {
    if (_isPicked(name)) {
      Ds.tap();
      c.settings.update((s) => s.loras = s.loras.where((l) => l.name != name).toList());
      return;
    }
    if (c.settings.loras.length >= _limit) {
      context.toast('今のプランでは LoRA は $_limit 個まで使えます', icon: Icons.info_outline_rounded);
      return;
    }
    Ds.impact();
    c.settings.update((s) => s.loras = [...s.loras, LoraPick(name: name, weight: weight, label: label, thumbnailUrl: thumb)]);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        final loras = c.catalog?.loras ?? const <LoraModel>[];
        final genres = [
          '',
          ...{for (final l in loras) l.genre},
        ];
        return Column(
          children: [
            const SheetHandle(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 12, 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text('LoRA を選ぶ', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                  ),
                  Text(
                    '${c.settings.loras.length} / $_limit',
                    style: TextStyle(color: context.muted, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 4),
                  TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('完了')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('絵柄や効果を足すための追加の学習データです。強さは選んだあとに調整できます。', style: context.tt.bodySmall?.copyWith(color: context.muted)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (v) {
                  _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 350), () {
                    setState(() => _query = v.trim());
                    if (_tab == 1) _loadUser();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'LoRA を探す',
                  prefixIcon: const Icon(Icons.search_rounded),
                  filled: true,
                  fillColor: context.skeleton,
                  isDense: true,
                  border: OutlineInputBorder(borderRadius: Ds.br(14), borderSide: BorderSide.none),
                ),
              ),
            ),
            const SizedBox(height: 10),
            PillTabs(
              labels: const ['公式 LoRA', 'みんなのモデル'],
              index: _tab,
              onChanged: (i) {
                setState(() => _tab = i);
                if (i == 1 && _userLoras == null) _loadUser();
              },
            ),
            if (_tab == 0) ...[
              const SizedBox(height: 8),
              SizedBox(
                height: 34,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 6),
                  itemBuilder: (context, i) => ChoiceChip(
                    label: Text(genres[i].isEmpty ? 'すべて' : genres[i]),
                    selected: genres[i] == _genre,
                    showCheckmark: false,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(borderRadius: Ds.br(17)),
                    onSelected: (_) => setState(() => _genre = genres[i]),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            Expanded(child: _tab == 0 ? _official(loras) : _user()),
          ],
        );
      },
    );
  }

  Widget _official(List<LoraModel> loras) {
    final q = _query.toLowerCase();
    final list = loras
        .where((l) => _genre.isEmpty || l.genre == _genre)
        .where((l) => q.isEmpty || l.name.toLowerCase().contains(q) || l.description.toLowerCase().contains(q))
        .toList();
    if (list.isEmpty) return const StateView(icon: Icons.search_off_rounded, title: '見つかりません', compact: true);
    return ListView.separated(
      controller: PrimaryScrollController.of(context),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final l = list[i];
        return _LoraTile(
          title: l.name,
          subtitle: l.description.isEmpty ? l.genre : l.description,
          imageUrl: l.thumbnailUrl,
          picked: _isPicked(l.name),
          onTap: () => _toggle(l.name, label: l.name, thumb: l.thumbnailUrl),
        );
      },
    );
  }

  Widget _user() {
    final list = _userLoras;
    if (_userError != null && (list == null || list.isEmpty)) return StateView.error(_userError!, onRetry: _loadUser);
    if (list == null) {
      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
        itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, __) => const Skeleton(height: 72, radius: 16),
      );
    }
    if (list.isEmpty) return const StateView(icon: Icons.search_off_rounded, title: '見つかりません', compact: true);
    return ListView.separated(
      controller: PrimaryScrollController.of(context),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final m = list[i];
        final words = m.triggerWords.trim();
        return _LoraTile(
          title: m.name,
          subtitle: [m.baseModel, if (words.isNotEmpty) 'トリガー: $words'].join(' ・ '),
          imageUrl: m.thumbnailUrl,
          picked: _isPicked(m.loraName),
          onTap: () {
            final wasPicked = _isPicked(m.loraName);
            _toggle(m.loraName, label: m.name, thumb: m.thumbnailUrl, weight: m.recommendedWeight);
            // トリガーワードがあればプロンプトに足す（Web と同じ）
            if (!wasPicked && words.isNotEmpty && _isPicked(m.loraName) && !c.settings.prompt.contains(words)) {
              c.settings.update((s) => s.prompt = s.prompt.trim().isEmpty ? words : '${s.prompt.trim()}, $words');
            }
          },
        );
      },
    );
  }
}

class _LoraTile extends StatelessWidget {
  const _LoraTile({required this.title, required this.subtitle, required this.imageUrl, required this.picked, required this.onTap});

  final String title;
  final String subtitle;
  final String? imageUrl;
  final bool picked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      haptic: false,
      scale: 0.98,
      child: AnimatedContainer(
        duration: Ds.normal,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: picked ? context.cs.primary.withValues(alpha: 0.1) : context.skeleton.withValues(alpha: 0.5),
          borderRadius: Ds.br(16),
          border: Border.all(color: picked ? context.cs.primary : Colors.transparent, width: 1.5),
        ),
        child: Row(
          children: [
            AppImage(imageUrl, width: 56, height: 56, radius: 12, memCacheWidth: 180),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: context.muted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            AnimatedSwitcher(
              duration: Ds.fast,
              child: Icon(
                picked ? Icons.check_circle_rounded : Icons.add_circle_outline_rounded,
                key: ValueKey(picked),
                color: picked ? context.cs.primary : context.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// プロンプトの言葉を選ぶシート（Web の「キーワード」）
Future<void> showPromptWords(BuildContext context, {required List<PromptCategory> categories, required ValueChanged<String> onAdd, String title = 'キーワードを足す'}) {
  return showGenSheet(
    context,
    expand: true,
    initialSize: 0.75,
    builder: (_) => _PromptWords(categories: categories, onAdd: onAdd, title: title),
  );
}

class _PromptWords extends StatefulWidget {
  const _PromptWords({required this.categories, required this.onAdd, required this.title});

  final List<PromptCategory> categories;
  final ValueChanged<String> onAdd;
  final String title;

  @override
  State<_PromptWords> createState() => _PromptWordsState();
}

class _PromptWordsState extends State<_PromptWords> {
  int _index = 0;
  final Set<String> _added = {};

  @override
  Widget build(BuildContext context) {
    final cats = widget.categories.where((c) => c.prompts.isNotEmpty).toList();
    if (cats.isEmpty) return const StateView(icon: Icons.label_off_outlined, title: 'キーワードがありません', compact: true);
    final cat = cats[_index.clamp(0, cats.length - 1)];
    return Column(
      children: [
        const SheetHandle(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 12, 8),
          child: Row(
            children: [
              Expanded(
                child: Text(widget.title, style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              ),
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('完了')),
            ],
          ),
        ),
        PillTabs(labels: cats.map((c) => c.name).toList(), index: _index, onChanged: (i) => setState(() => _index = i)),
        const SizedBox(height: 12),
        Expanded(
          child: SingleChildScrollView(
            controller: PrimaryScrollController.of(context),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final p in cat.prompts)
                  _WordChip(
                    label: p.name,
                    sub: p.words.join(', '),
                    added: _added.contains('${cat.name}/${p.name}'),
                    onTap: () {
                      Ds.tap();
                      setState(() => _added.add('${cat.name}/${p.name}'));
                      widget.onAdd(p.words.join(', '));
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WordChip extends StatelessWidget {
  const _WordChip({required this.label, required this.sub, required this.added, required this.onTap});

  final String label;
  final String sub;
  final bool added;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      haptic: false,
      child: AnimatedContainer(
        duration: Ds.fast,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: added ? context.cs.primary.withValues(alpha: 0.12) : context.skeleton,
          borderRadius: Ds.br(14),
          border: Border.all(color: added ? context.cs.primary : Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (added) ...[Icon(Icons.check_rounded, size: 14, color: context.cs.primary), const SizedBox(width: 4)],
                Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
              ],
            ),
            if (sub.isNotEmpty)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Text(
                  sub,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.5, color: context.muted),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
