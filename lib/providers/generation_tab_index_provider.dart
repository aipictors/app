import 'package:aipictors/repositories/config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generation_tab_index_provider.g.dart';

@riverpod
class GenerationTabIndex extends _$GenerationTabIndex {
  @override
  int build() {
    return const ConfigRepository().generationTabIndex;
  }

  void update(int n) {
    const ConfigRepository().setGenerationTabIndex(n);
    state = n;
  }
}
