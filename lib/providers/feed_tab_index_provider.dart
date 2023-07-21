import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_tab_index_provider.g.dart';

@riverpod
class FeedTabIndex extends _$FeedTabIndex {
  @override
  int build() {
    return 0;
  }

  void update(int n) {
    state = n;
  }
}
