import 'package:aipictors/config.dart';

/// レイアウト
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum Layout {
  compact('compact'),
  medium('medium'),
  expanded('expanded');

  const Layout(this.value);

  final String value;

  static Layout fromWidth(double maxWidth) {
    if (DefaultConfig.mediumUIThreshold < maxWidth) {
      return medium;
    }
    return compact;
  }

  static Layout fromWidthAndConfig(double maxWidth, config) {
    if ((DefaultConfig.mediumUIThreshold < maxWidth &&
            !config.themeCompactLayout) ||
        config.themeMediumLayout) {
      return medium;
    }
    return compact;
  }

  get notCompact {
    return this != compact;
  }
}
