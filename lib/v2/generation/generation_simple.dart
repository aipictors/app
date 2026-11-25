import 'dart:async';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/generation/generation_entry.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// かんたん入口の作例（Web の GenerationHomeWork と同じ項目）
class _EntryWork {
  const _EntryWork({required this.id, required this.title, required this.prompt, required this.likesCount, required this.imageUrl, required this.width, required this.height, this.user});

  final String id;
  final String title;
  final String prompt;
  final int likesCount;
  final String imageUrl;
  final int width;
  final int height;
  final UserSummary? user;

  factory _EntryWork.fromJson(Map<String, dynamic> j) {
    final user = j.obj('user');
    return _EntryWork(
      id: j.str('id'),
      title: j.str('title'),
      prompt: j.str('prompt'),
      likesCount: j.integer('likesCount'),
      imageUrl: j.str('largeThumbnailImageURL'),
      width: j.integer('largeThumbnailImageWidth', 1),
      height: j.integer('largeThumbnailImageHeight', 1),
      user: user == null ? null : UserSummary.fromJson(user),
    );
  }

  factory _EntryWork.example(GenEntryExample e) => _EntryWork(id: e.workId, title: tr(e.title, e.enTitle), prompt: e.prompt, likesCount: 0, imageUrl: e.imageUrl, width: e.width, height: e.height);
}

const _worksQuery =
    '''
query GenerationHomeWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    id title prompt likesCount
    largeThumbnailImageURL largeThumbnailImageWidth largeThumbnailImageHeight
    user { $userSummaryFields }
  }
}
''';

/// はじめての人向けの「かんたん入口」（Web の /generation/home と同じ）
/// - 書いて「生成する」を押すと、そのプロンプトで生成を始める（未ログインならログインのあと）
/// - 作例を押すと、その作品の公開プロンプトが入力欄に入る
class GenerationSimpleEntry extends StatefulWidget {
  const GenerationSimpleEntry({super.key, required this.loggedIn, required this.onGenerate, required this.onOpenAdvanced, this.initialPrompt, this.busy = false});

  final bool loggedIn;

  /// 空でないプロンプトを渡す
  final ValueChanged<String> onGenerate;

  /// 「詳細設定」（通常の画面へ）
  final VoidCallback onOpenAdvanced;

  /// ログインを途中でやめて戻ってきたときも、書いた内容を残す
  final String? initialPrompt;
  final bool busy;

  @override
  State<GenerationSimpleEntry> createState() => _GenerationSimpleEntryState();
}

class _GenerationSimpleEntryState extends State<GenerationSimpleEntry> {
  late final _text = TextEditingController(text: widget.initialPrompt ?? '');
  final _focus = FocusNode();
  final _scroll = ScrollController();

  String? _hint;
  bool _highlighted = false;
  Timer? _highlightTimer;

  GenEntryFilter _filter = const GenEntryFilter.popular();
  List<_EntryWork> _works = const [];
  int _pages = 0;
  bool _hasMore = false;
  bool _loading = false;
  int _requestId = 0;

  @override
  void initState() {
    super.initState();
    _load(_filter, 1);
  }

  @override
  void didUpdateWidget(GenerationSimpleEntry old) {
    super.didUpdateWidget(old);
    final p = widget.initialPrompt;
    if (p != null && p != old.initialPrompt && _text.text.isEmpty) _text.text = p;
  }

  @override
  void dispose() {
    _highlightTimer?.cancel();
    _text.dispose();
    _focus.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _load(GenEntryFilter filter, int page) async {
    final id = ++_requestId;
    setState(() => _loading = true);
    try {
      final data = await Api.query(
        _worksQuery,
        variables: {'offset': (page - 1) * GenEntryFilter.pageSize, 'limit': GenEntryFilter.pageSize, 'where': filter.where(DateTime.now())},
        cacheFor: const Duration(minutes: 30),
      );
      if (!mounted || id != _requestId) return;
      final loaded = data.list('works').map(_EntryWork.fromJson).where((w) => w.imageUrl.isNotEmpty).toList();
      setState(() {
        if (page == 1) {
          // 人気が読めなかったときは運営が選んだ作例を出す（Web と同じ）
          _works = loaded.isEmpty && filter == const GenEntryFilter.popular() ? GenEntryExample.all.map(_EntryWork.example).toList() : loaded;
        } else {
          final seen = _works.map((w) => w.id).toSet();
          _works = [..._works, ...loaded.where((w) => seen.add(w.id))];
        }
        _pages = page;
        _hasMore = loaded.length >= GenEntryFilter.pageSize;
      });
    } catch (_) {
      if (!mounted || id != _requestId) return;
      setState(() {
        if (page == 1) _works = filter == const GenEntryFilter.popular() ? GenEntryExample.all.map(_EntryWork.example).toList() : const [];
        _hasMore = false;
      });
    } finally {
      if (mounted && id == _requestId) setState(() => _loading = false);
    }
  }

  void _selectFilter(GenEntryFilter filter) {
    if (filter == _filter) return;
    Ds.tap();
    setState(() {
      _filter = filter;
      _works = const [];
    });
    _load(filter, 1);
  }

  void _highlight(String hint) {
    _highlightTimer?.cancel();
    setState(() {
      _hint = hint;
      _highlighted = true;
    });
    _highlightTimer = Timer(const Duration(milliseconds: 1200), () {
      if (mounted) setState(() => _highlighted = false);
    });
  }

  void _submit() {
    final text = _text.text.trim();
    // 空のときは例文を入れて、入力欄に戻す（押しても何も起きない、にしない）
    if (text.isEmpty) {
      _text.text = tr('夕焼けの海辺で笑う女の子、やわらかい光、アニメ風', 'a smiling girl on a beach at sunset, soft light, anime style');
      _highlight(tr('例文を入れました。このまま「生成する」を押すか、好きな言葉に書きかえてください', 'We added an example. Press Generate as is, or rewrite it in your own words'));
      _focus.requestFocus();
      return;
    }
    FocusScope.of(context).unfocus();
    widget.onGenerate(text);
  }

  void _selectWork(_EntryWork work) {
    final text = toEntryExamplePrompt(work.prompt);
    if (text.isEmpty) return;
    Ds.tap();
    _text.text = text;
    _highlight(tr('この作品のプロンプトを入れました。「生成する」を押すと作れます（書きかえてもOK）', "Added this work's prompt. Press Generate to create it (feel free to edit)"));
    _scroll.animateTo(0, duration: Ds.slow, curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final filters = <(GenEntryFilter, String)>[
      (const GenEntryFilter.popular(), tr('人気', 'Popular')),
      (const GenEntryFilter.latest(), tr('新着', 'Latest')),
      for (final t in GenEntryFilter.tags) (GenEntryFilter.tag(t.$1), tr(t.$1, t.$2)),
    ];
    return LayoutBuilder(
      builder: (context, box) {
        final cols = gridColumnsFor(box.maxWidth);
        return CustomScrollView(
          controller: _scroll,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                child: ContentWidth(maxWidth: 672, child: _form(context)),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  height: 34,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, i) => Center(
                      child: AppChip(filters[i].$2, selected: filters[i].$1 == _filter, onTap: () => _selectFilter(filters[i].$1)),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                child: Text(tr('Aipictors で作られた作品です。押すとそのプロンプトが入力欄に入ります', 'Made on Aipictors. Tap one to use its prompt'), style: TextStyle(fontSize: 12, color: context.muted)),
              ),
            ),
            if (_works.isEmpty && _loading)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: cols,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childCount: cols * 3,
                  itemBuilder: (context, i) => Skeleton(height: [220.0, 160.0, 260.0, 190.0][i % 4], radius: 14),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: cols,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childCount: _works.length,
                  itemBuilder: (context, i) => _WorkTile(work: _works[i], onTap: () => _selectWork(_works[i])),
                ),
              ),
            SliverToBoxAdapter(child: _footer(context)),
          ],
        );
      },
    );
  }

  Widget _form(BuildContext context) {
    final cs = context.cs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          tr('思い浮かべた絵を、文章にするだけ', 'Just describe the picture in your mind'),
          textAlign: TextAlign.center,
          style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.3),
        ),
        const SizedBox(height: 12),
        AnimatedContainer(
          duration: Ds.normal,
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
          decoration: BoxDecoration(
            color: context.surfaceCard,
            borderRadius: Ds.br(18),
            border: Border.all(color: _highlighted ? cs.primary : context.hairline, width: _highlighted ? 2 : 1),
            boxShadow: [
              if (_highlighted) BoxShadow(color: cs.primary.withValues(alpha: 0.2), blurRadius: 0, spreadRadius: 4),
              BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Icon(Icons.edit_outlined, size: 16, color: context.muted),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _text,
                      focusNode: _focus,
                      minLines: 3,
                      maxLines: 6,
                      maxLength: 20000,
                      onChanged: (_) {
                        if (_hint != null) setState(() => _hint = null);
                      },
                      style: const TextStyle(fontSize: 16, height: 1.5),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        counterText: '',
                        hintText: tr('例: 桜の下で笑う女の子、やわらかい光、アニメ風（日本語でOK）', 'e.g. a smiling girl under cherry blossoms, soft light, anime style'),
                        hintStyle: TextStyle(color: context.muted.withValues(alpha: 0.8)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(_hint ?? tr('モデルやサイズはおすすめの設定で作ります', 'We use the recommended model and size'), style: TextStyle(fontSize: 12, height: 1.4, color: _hint != null ? cs.primary : context.muted)),
              const SizedBox(height: 8),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: widget.onOpenAdvanced,
                    style: TextButton.styleFrom(foregroundColor: context.muted, shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(horizontal: 12)),
                    icon: const Icon(Icons.tune_rounded, size: 16),
                    label: Text(tr('詳細設定', 'Advanced'), style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GradientButton(label: tr('生成する', 'Generate'), icon: Icons.auto_awesome_rounded, height: 46, loading: widget.busy, onPressed: _submit),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (!widget.loggedIn) ...[
          const SizedBox(height: 8),
          Text(
            tr('ログインすると毎日10枚まで無料', 'Up to 10 free images every day after login'),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: context.muted),
          ),
        ],
      ],
    );
  }

  Widget _footer(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom + 32;
    if (_loading && _works.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 24, 0, bottom),
        child: const Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5))),
      );
    }
    if (!_loading && _works.isEmpty) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, bottom),
        child: Text(
          tr('作品が見つかりませんでした', 'No works found'),
          textAlign: TextAlign.center,
          style: TextStyle(color: context.muted),
        ),
      );
    }
    if (!_loading && _hasMore && _pages < GenEntryFilter.maxPages) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, bottom),
        child: Center(
          child: SecondaryButton(label: tr('もっと見る', 'Show more'), expand: false, onPressed: () => _load(_filter, _pages + 1)),
        ),
      );
    }
    return SizedBox(height: bottom);
  }
}

class _WorkTile extends StatelessWidget {
  const _WorkTile({required this.work, required this.onTap});

  final _EntryWork work;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final user = work.user;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.surfaceCard,
        borderRadius: Ds.br(14),
        border: Border.all(color: context.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Pressable(
            onTap: onTap,
            child: AspectRatio(
              aspectRatio: (work.width / work.height).clamp(0.4, 2.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(work.imageUrl, memCacheWidth: 600),
                  // 押すとプロンプトが入ることが分かるように（Web はホバーで出す印）
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.55), borderRadius: Ds.br(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_awesome_rounded, size: 12, color: Colors.white),
                          const SizedBox(width: 3),
                          Text(
                            tr('このプロンプトを使う', 'Use this prompt'),
                            style: const TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 6, 4, 6),
            child: Row(
              children: [
                if (user != null) ...[UserAvatar.summary(user, size: 20), const SizedBox(width: 6)],
                Expanded(
                  child: Text(
                    user?.name ?? work.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11.5, color: context.muted),
                  ),
                ),
                if (work.likesCount > 0) ...[
                  Icon(Icons.favorite_border_rounded, size: 12, color: context.muted),
                  const SizedBox(width: 2),
                  Text(compactCount(work.likesCount), style: TextStyle(fontSize: 11.5, color: context.muted)),
                ],
                InkResponse(
                  onTap: () => Nav.work(context, work.id),
                  radius: 18,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(Icons.open_in_new_rounded, size: 14, color: context.muted, semanticLabel: tr('作品を見る', 'View work')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
