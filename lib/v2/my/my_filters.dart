import 'package:aipictors/v2/core/store_policy.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:flutter/material.dart';

/// 並び順の選択肢（Web の works-settings の SORT_OPTIONS と同じ。並び順と向きをまとめて 1 つで選ぶ）
class WorkSortOption {
  const WorkSortOption(this.orderBy, this.sort, this.ja, this.en);

  final String orderBy;
  final String sort;
  final String ja;
  final String en;

  String get label => tr(ja, en);
}

const myWorkSortOptions = [
  WorkSortOption('DATE_CREATED', 'DESC', '新しい順', 'Newest'),
  WorkSortOption('DATE_CREATED', 'ASC', '古い順', 'Oldest'),
  WorkSortOption('LIKES_COUNT', 'DESC', 'いいねが多い順', 'Most likes'),
  WorkSortOption('LIKES_COUNT', 'ASC', 'いいねが少ない順', 'Fewest likes'),
  WorkSortOption('BOOKMARKS_COUNT', 'DESC', 'ブックマークが多い順', 'Most bookmarks'),
  WorkSortOption('BOOKMARKS_COUNT', 'ASC', 'ブックマークが少ない順', 'Fewest bookmarks'),
  WorkSortOption('COMMENTS_COUNT', 'DESC', 'コメントが多い順', 'Most comments'),
  WorkSortOption('COMMENTS_COUNT', 'ASC', 'コメントが少ない順', 'Fewest comments'),
  WorkSortOption('VIEWS_COUNT', 'DESC', '閲覧が多い順', 'Most views'),
  WorkSortOption('VIEWS_COUNT', 'ASC', '閲覧が少ない順', 'Fewest views'),
  WorkSortOption('NAME', 'ASC', 'タイトル順', 'Title A-Z'),
  WorkSortOption('NAME', 'DESC', 'タイトル逆順', 'Title Z-A'),
];

/// 公開範囲のタブ（Web の my.posts と同じ並び）
List<(String?, String)> get myPostAccessTabs => [
      (null, tr('すべて', 'All')),
      ('PUBLIC', tr('公開', 'Public')),
      ('SILENT', tr('新着なし', 'No new')),
      ('LIMITED', tr('限定公開', 'Limited')),
      ('PRIVATE', tr('非公開', 'Private')),
      ('DRAFT', tr('下書き', 'Draft')),
    ];

List<(String?, String)> get myPostWorkTypes => [
      (null, tr('すべての種類', 'All types')),
      ('WORK', tr('画像', 'Image')),
      ('VIDEO', tr('動画', 'Video')),
      ('NOVEL', tr('小説', 'Novel')),
      ('COLUMN', tr('コラム', 'Column')),
    ];

/// 年齢の絞り込み。アプリは R18 を出さないので全年齢と R-15 だけ
List<(String?, String)> get myRatingFilters => [
      (null, tr('すべての年齢', 'All ratings')),
      ('G', tr('全年齢', 'All ages')),
      if (!StorePolicy.strict) ('R15', 'R-15'),
    ];

/// 自分の作品一覧の条件（Web の my.posts の URL の条件と同じ）
class MyPostsQuery {
  String? accessType;
  String? workType;
  String? rating;
  String search = '';
  WorkSortOption sort = myWorkSortOptions.first;

  bool get isFiltered => search.isNotEmpty || accessType != null || workType != null || rating != null;

  void clearFilters() {
    search = '';
    accessType = null;
    workType = null;
    rating = null;
  }

  /// works / worksCount の where（Web の works-list-container と同じ）
  Map<String, dynamic> where(String? userId) => {
        'userId': userId,
        'orderBy': sort.orderBy,
        'sort': sort.sort,
        'isIncludePrivate': true,
        if (accessType != null) 'accessTypes': [accessType],
        if (workType != null) 'workTypes': [workType],
        'ratings': rating != null ? [rating] : appRatings,
        if (search.isNotEmpty) ...{'search': search, 'searchInTags': true, 'searchInDescription': true},
        'createdAtAfter': DateTime.utc(1999).toIso8601String(),
        'beforeCreatedAt': DateTime.utc(2099).toIso8601String(),
      };
}

/// 人に渡せる作品の URL（Web の my-work-items の toPostUrl と同じ。非公開・下書き・予約は渡せないので null）
String? shareableWorkUrl({required String id, required String accessType, String? uuid, required int createdAt, DateTime? now}) {
  final scheduled = createdAt * 1000 > (now ?? DateTime.now()).millisecondsSinceEpoch;
  if (scheduled || accessType == 'PRIVATE' || accessType == 'DRAFT') return null;
  if (accessType == 'LIMITED' && uuid != null && uuid.isNotEmpty) return 'https://www.aipictors.com/posts/$uuid';
  return 'https://www.aipictors.com/posts/$id';
}

/// 3 桁ごとのカンマ
String commaCount(int n) => n.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]},');

/// 1 つ選ぶシート。閉じたら null、選んだら (値,)（値が null の選択肢も区別できるように包む）
Future<(T,)?> showChoiceSheet<T>(BuildContext context, {required String title, required List<(T, String)> options, required T selected}) {
  return showModalBottomSheet<(T,)>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: context.surfaceCard,
    builder: (context) => SafeArea(
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Ds.s20, 0, Ds.s20, Ds.s8),
            child: Text(title, style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
          ),
          for (final o in options)
            ListTile(
              title: Text(o.$2),
              trailing: o.$1 == selected ? Icon(Icons.check_rounded, color: context.cs.primary) : null,
              onTap: () => Navigator.pop(context, (o.$1,)),
            ),
          const SizedBox(height: Ds.s8),
        ]),
      ),
    ),
  );
}

/// 絞り込みのボタン（押すとシートが開く）
class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.label, required this.onTap, this.active = false, this.icon = Icons.expand_more_rounded});

  final String label;
  final VoidCallback onTap;
  final bool active;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final fg = active ? context.cs.primary : context.cs.onSurface.withValues(alpha: 0.8);
    return Material(
      color: active ? context.cs.primary.withValues(alpha: 0.12) : context.skeleton,
      borderRadius: Ds.br(10),
      child: InkWell(
        borderRadius: Ds.br(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Flexible(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: fg))),
            const SizedBox(width: 2),
            Icon(icon, size: 16, color: fg),
          ]),
        ),
      ),
    );
  }
}

/// 打ち終わってから検索する入力欄（Web と同じく 600ms 待つ。確定で待たずに検索、× で消す）
class DebouncedSearchField extends StatefulWidget {
  const DebouncedSearchField({super.key, required this.hint, required this.value, required this.onSearch});

  final String hint;
  final String value;
  final ValueChanged<String> onSearch;

  @override
  State<DebouncedSearchField> createState() => _DebouncedSearchFieldState();
}

class _DebouncedSearchFieldState extends State<DebouncedSearchField> {
  late final _controller = TextEditingController(text: widget.value);
  int _seq = 0;

  @override
  void didUpdateWidget(covariant DebouncedSearchField old) {
    super.didUpdateWidget(old);
    if (widget.value != old.value && widget.value != _controller.text.trim()) _controller.text = widget.value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changed(String text) {
    setState(() {});
    // 日本語の変換中は検索しない
    if (_controller.value.composing.isValid && !_controller.value.composing.isCollapsed) return;
    final seq = ++_seq;
    Future<void>.delayed(const Duration(milliseconds: 600), () {
      if (!mounted || seq != _seq) return;
      final v = _controller.text.trim();
      if (v != widget.value) widget.onSearch(v);
    });
  }

  void _submit(String text) {
    _seq++;
    widget.onSearch(text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.search,
      onChanged: _changed,
      onSubmitted: _submit,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: const Icon(Icons.search_rounded, size: 20),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: tr('検索を消す', 'Clear search'),
                icon: const Icon(Icons.close_rounded, size: 18),
                onPressed: () {
                  _controller.clear();
                  _submit('');
                  setState(() {});
                },
              ),
        filled: true,
        fillColor: context.skeleton,
        isDense: true,
        border: OutlineInputBorder(borderRadius: Ds.br(12), borderSide: BorderSide.none),
      ),
    );
  }
}
