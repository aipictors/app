import 'package:aipictors/repositories/config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explorer_tab_index_provider.g.dart';

@riverpod
class ExplorerTabIndex extends _$ExplorerTabIndex {
  @override
  int build() {
    return const ConfigRepository().explorerTabIndex;
  }

  void update(int n) {
    const ConfigRepository().setExplorerTabIndex(n);
    state = n;
  }
}
