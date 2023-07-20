import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explorer_tab_index_provider.g.dart';

@riverpod
ValueNotifier<int> explorerTabIndex(ExplorerTabIndexRef ref) {
  ref.keepAlive();
  return useState(0);
}
