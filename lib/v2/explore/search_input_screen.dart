import 'dart:async';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/explore/explore_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 最近の検索（端末に保存）
class RecentSearches {
  RecentSearches._();

  static const _key = 'v2.explore.recentSearches';
  static const _max = 20;

  static Future<List<String>> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? const [];
  }

  static Future<void> add(String text) async {
    final t = text.trim();
    if (t.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    final list = [t, ...(prefs.getStringList(_key) ?? const <String>[]).where((e) => e != t)];
    await prefs.setStringList(_key, list.take(_max).toList());
  }

  static Future<void> remove(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, (prefs.getStringList(_key) ?? const <String>[]).where((e) => e != text).toList());
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

/// 検索ワードを入れる画面。決まったら pop で文字を返す
class SearchInputScreen extends StatefulWidget {
  const SearchInputScreen({super.key, this.initialText = ''});

  final String initialText;

  /// 開いて、入力された文字を受け取る（キャンセルなら null）
  static Future<String?> open(BuildContext context, {String initialText = ''}) {
    return Navigator.of(context, rootNavigator: true).push<String>(PageRouteBuilder(
      opaque: true,
      transitionDuration: Ds.normal,
      reverseTransitionDuration: Ds.fast,
      pageBuilder: (_, __, ___) => SearchInputScreen(initialText: initialText),
      transitionsBuilder: (_, a, __, child) => FadeTransition(
        opacity: CurvedAnimation(parent: a, curve: Ds.curve),
        child: SlideTransition(
          position: Tween(begin: const Offset(0, 0.03), end: Offset.zero).animate(CurvedAnimation(parent: a, curve: Ds.curve)),
          child: child,
        ),
      ),
    ));
  }

  @override
  State<SearchInputScreen> createState() => _SearchInputScreenState();
}

class _SearchInputScreenState extends State<SearchInputScreen> {
  late final _controller = TextEditingController(text: widget.initialText);
  final _focus = FocusNode();
  List<String> _recent = const [];
  List<TagSummary> _suggestions = const [];
  List<TagSummary> _popular = const [];
  bool _loadingSuggest = false;
  Timer? _debounce;
  int _requestId = 0;

  @override
  void initState() {
    super.initState();
    _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
    RecentSearches.load().then((v) {
      if (mounted) setState(() => _recent = v);
    });
    ExploreApi.popularTags(limit: 16).then((v) {
      if (mounted) setState(() => _popular = v);
    }).catchError((_) {});
    _controller.addListener(_onChanged);
    if (_controller.text.trim().isNotEmpty) _fetchSuggest(_controller.text.trim());
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _onChanged() {
    final t = _controller.text.trim();
    _debounce?.cancel();
    if (t.isEmpty) {
      setState(() {
        _suggestions = const [];
        _loadingSuggest = false;
      });
      return;
    }
    setState(() {});
    _debounce = Timer(const Duration(milliseconds: 250), () => _fetchSuggest(t));
  }

  Future<void> _fetchSuggest(String t) async {
    final id = ++_requestId;
    setState(() => _loadingSuggest = true);
    try {
      final tags = await ExploreApi.searchTags(t, 0, 50);
      if (!mounted || id != _requestId) return;
      // 完全一致・前方一致を先に
      tags.sort((a, b) {
        int score(TagSummary s) => s.name == t ? 0 : (s.name.startsWith(t) ? 1 : 2);
        final c = score(a).compareTo(score(b));
        return c != 0 ? c : a.name.length.compareTo(b.name.length);
      });
      setState(() {
        _suggestions = tags.where((s) => s.name.length <= 40).take(10).toList();
        _loadingSuggest = false;
      });
    } catch (_) {
      if (mounted && id == _requestId) setState(() => _loadingSuggest = false);
    }
  }

  void _submit(String text) {
    final t = text.trim().replaceFirst(RegExp(r'^#+'), '');
    if (t.isEmpty) return;
    RecentSearches.add(t);
    Navigator.of(context).pop(t);
  }

  @override
  Widget build(BuildContext context) {
    final text = _controller.text.trim();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
            child: Row(children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.isDark ? const Color(0xFF1E2127) : const Color(0xFFF1F3F7),
                    borderRadius: Ds.br(24),
                    border: Border.all(color: context.cs.primary.withValues(alpha: 0.6), width: 1.5),
                  ),
                  child: Row(children: [
                    const SizedBox(width: 14),
                    Icon(Icons.search_rounded, color: context.cs.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focus,
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        onSubmitted: _submit,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                          hintText: 'タグ・キーワードを入力',
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                    if (text.isNotEmpty)
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: Icon(Icons.cancel_rounded, color: context.muted, size: 20),
                        onPressed: () {
                          _controller.clear();
                          _focus.requestFocus();
                        },
                      ),
                  ]),
                ),
              ),
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('キャンセル')),
            ]),
          ),
          if (_loadingSuggest) const LinearProgressIndicator(minHeight: 2) else const SizedBox(height: 2),
          Expanded(child: text.isEmpty ? _idle(context) : _suggest(context, text)),
        ]),
      ),
    );
  }

  Widget _suggest(BuildContext context, String text) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.only(bottom: 40),
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: context.cs.primary.withValues(alpha: 0.12),
            child: Icon(Icons.search_rounded, color: context.cs.primary),
          ),
          title: Text.rich(TextSpan(children: [
            TextSpan(text: '「$text」', style: const TextStyle(fontWeight: FontWeight.w800)),
            const TextSpan(text: ' で検索'),
          ])),
          onTap: () => _submit(text),
        ),
        for (final s in _suggestions)
          ListTile(
            leading: ClipRRect(
              borderRadius: Ds.br(10),
              child: SizedBox(
                width: 40,
                height: 40,
                child: s.thumbnailUrl != null
                    ? AppImage(s.thumbnailUrl, memCacheWidth: 120)
                    : DecoratedBox(
                        decoration: BoxDecoration(gradient: LinearGradient(colors: tagColors(s.name))),
                        child: const Icon(Icons.tag_rounded, color: Colors.white, size: 20),
                      ),
              ),
            ),
            title: _highlight(context, s.name, text),
            trailing: IconButton(
              tooltip: '入力欄に入れる',
              icon: Icon(Icons.north_west_rounded, size: 18, color: context.muted),
              onPressed: () {
                _controller.text = s.name;
                _controller.selection = TextSelection.collapsed(offset: s.name.length);
              },
            ),
            onTap: () => _submit(s.name),
          ),
      ],
    );
  }

  Widget _highlight(BuildContext context, String name, String q) {
    final i = name.toLowerCase().indexOf(q.toLowerCase());
    if (i < 0) return Text(name, maxLines: 1, overflow: TextOverflow.ellipsis);
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: name.substring(0, i)),
        TextSpan(text: name.substring(i, i + q.length), style: TextStyle(fontWeight: FontWeight.w900, color: context.cs.primary)),
        TextSpan(text: name.substring(i + q.length)),
      ]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _idle(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.only(bottom: 40),
      children: [
        if (_recent.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 4),
            child: Row(children: [
              Expanded(child: Text('最近の検索', style: context.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800))),
              TextButton(
                onPressed: () async {
                  await RecentSearches.clear();
                  if (mounted) setState(() => _recent = const []);
                },
                child: const Text('すべて消す'),
              ),
            ]),
          ),
          for (final r in _recent.take(10))
            ListTile(
              dense: true,
              leading: Icon(Icons.history_rounded, color: context.muted),
              title: Text(r, style: const TextStyle(fontSize: 15)),
              trailing: IconButton(
                icon: Icon(Icons.close_rounded, size: 18, color: context.muted),
                onPressed: () async {
                  await RecentSearches.remove(r);
                  final v = await RecentSearches.load();
                  if (mounted) setState(() => _recent = v);
                },
              ),
              onTap: () => _submit(r),
            ),
        ],
        if (_popular.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Text('人気のタグ', style: context.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(spacing: 8, runSpacing: 8, children: [
              for (final t in _popular) TagChip(name: t.name, onTap: () => _submit(t.name)),
            ]),
          ),
        ],
        if (_recent.isEmpty && _popular.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: StateView(icon: Icons.search_rounded, title: '気になる言葉で探してみよう', message: 'タグやキーワードで作品・ユーザーを探せます', compact: true),
          ),
      ],
    );
  }
}
