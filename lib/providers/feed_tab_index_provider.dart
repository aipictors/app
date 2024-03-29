import 'package:aipictors/repositories/config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_tab_index_provider.g.dart';

@riverpod
class FeedTabIndex extends _$FeedTabIndex {
  @override
  int build() {
    return const ConfigRepository().feedTabIndex;
  }

  void update(int n) {
    const ConfigRepository().setFeedTabIndex(n);
    state = n;
  }
}
