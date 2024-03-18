import 'package:aipictors/repositories/config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stickers_container_cross_axis_count_provider.g.dart';

@riverpod
class StickersContainerCrossAxisCount
    extends _$StickersContainerCrossAxisCount {
  @override
  int build() {
    return const ConfigRepository().stickersContainerCrossAxisCount;
  }

  void update(int n) {
    const ConfigRepository().setStickersContainerCrossAxisCount(n);
    state = n;
  }
}
