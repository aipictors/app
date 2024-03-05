import 'package:aipictors/repositories/config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stickers_tab_index_provider.g.dart';

@riverpod
class StickersTabIndex extends _$StickersTabIndex {
  @override
  int build() {
    return const ConfigRepository().stickersTabIndex;
  }

  void update(int n) {
    const ConfigRepository().setStickersTabIndex(n);
    state = n;
  }
}
