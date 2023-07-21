import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explorer_tab_index_provider.g.dart';

@riverpod
class ExplorerTabIndex extends _$ExplorerTabIndex {
  @override
  int build() {
    return 0;
  }

  void update(int n) {
    state = n;
  }
}
