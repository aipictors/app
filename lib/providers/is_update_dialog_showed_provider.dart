import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_update_dialog_showed_provider.g.dart';

@riverpod
class IsUpdateDialogShowed extends _$IsUpdateDialogShowed {
  @override
  bool build() {
    return false;
  }

  void update(bool n) {
    state = n;
  }
}
