import 'package:aipictors/repositories/config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stickers_screen_cross_axis_count_provider.g.dart';

@riverpod
class StickersScreenCrossAxisCount extends _$StickersScreenCrossAxisCount {
  @override
  int build() {
    return const ConfigRepository().stickersScreenCrossAxisCount;
  }

  void update(int n) {
    const ConfigRepository().setStickersScreenCrossAxisCount(n);
    state = n;
  }
}
