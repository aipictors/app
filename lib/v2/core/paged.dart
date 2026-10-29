import 'package:aipictors/v2/core/api.dart';
import 'package:flutter/foundation.dart';

/// offset / limit で読み足す一覧
class PagedController<T> extends ChangeNotifier {
  PagedController({
    required this.fetch,
    this.pageSize = 24,
    this.idOf,
  });

  final Future<List<T>> Function(int offset, int limit) fetch;
  final int pageSize;
  final String Function(T item)? idOf;

  final List<T> items = [];
  bool isLoading = false;
  bool isRefreshing = false;
  bool hasMore = true;
  String? error;
  int _offset = 0;
  int _generation = 0;
  bool _disposed = false;

  bool get isInitialLoading => items.isEmpty && isLoading;

  bool get isEmpty => items.isEmpty && !isLoading && error == null && !hasMore;

  Future<void> loadMore() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    error = null;
    _notify();
    final generation = _generation;
    try {
      final page = await fetch(_offset, pageSize);
      if (generation != _generation) return;
      _offset += pageSize;
      final seen = idOf == null ? null : items.map(idOf!).toSet();
      for (final item in page) {
        if (seen != null && !seen.add(idOf!(item))) continue;
        items.add(item);
      }
      // 1 件も返らなければ終わり（並べ替えの都合で limit 未満でも続きがあることがある）
      hasMore = page.isNotEmpty;
    } on ApiException catch (e) {
      if (generation != _generation) return;
      error = e.message;
    } catch (e) {
      if (generation != _generation) return;
      error = '読み込みに失敗しました';
    } finally {
      if (generation == _generation) {
        isLoading = false;
        _notify();
      }
    }
  }

  Future<void> refresh() async {
    _generation++;
    isRefreshing = true;
    final previous = List<T>.of(items);
    items.clear();
    _offset = 0;
    hasMore = true;
    isLoading = false;
    error = null;
    await loadMore();
    if (items.isEmpty && error != null) {
      // 取得に失敗したら前の一覧を残す
      items.addAll(previous);
    }
    isRefreshing = false;
    _notify();
  }

  void removeWhere(bool Function(T) test) {
    items.removeWhere(test);
    _notify();
  }

  void touch() => _notify();

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
