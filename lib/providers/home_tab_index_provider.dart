import 'package:aipictors/repositories/config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_tab_index_provider.g.dart';

@riverpod
class HomeTabIndex extends _$HomeTabIndex {
  @override
  int build() {
    return const ConfigRepository().homeTabIndex;
  }

  void update(int n) {
    const ConfigRepository().setHomeTabIndex(n);
    state = n;
  }

  void toLoginTab() {
    update(3);
  }
}
