import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_tab_index_provider.g.dart';

@riverpod
ValueNotifier<int> feedTabIndex(FeedTabIndexRef ref) {
  ref.keepAlive();
  return useState(0);
}
