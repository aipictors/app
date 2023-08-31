import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'interactive_image_dialog_matrix4_provider.g.dart';

@riverpod
class InteractiveImageDialogMatrix4 extends _$InteractiveImageDialogMatrix4 {
  @override
  Matrix4 build() {
    return Matrix4.identity();
  }

  void update(Matrix4 n) {
    state = n;
  }
}
