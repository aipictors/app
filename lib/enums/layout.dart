import 'package:aipictors/config.dart';

/// レイアウト
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum Layout {
  compact('compact'),
  medium('medium'),
  expanded('expanded');

  const Layout(this.value);

  final String value;

  static Layout fromWith(double maxWidth) {
    if (DefaultConfig.mediumUIThreshold < maxWidth) {
      return medium;
    }
    return compact;
  }

  get notCompact {
    return this != compact;
  }
}
