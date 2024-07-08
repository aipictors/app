import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/routes/post/work_screen_compact.dart';
import 'package:aipictors/routes/post/work_screen_medium.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 作品の詳細
class WorkScreen extends HookConsumerWidget {
  const WorkScreen({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);
    final layout = Layout.fromWidth(MediaQuery.of(context).size.width);

    if (layout.notCompact && !config.themeCompactLayout) {
      return WorkScreenMedium(workId: workId);
    }

    return WorkScreenCompact(workId: workId);
  }
}
