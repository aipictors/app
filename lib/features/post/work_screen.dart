import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/post/work_screen_compact.dart';
import 'package:aipictors/features/post/work_screen_medium.dart';
import 'package:aipictors/providers/config_provider.dart';
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

    if (layout.notCompact &&
        !config.themeCompactLayout &&
        MediaQuery.of(context).size.height <
            MediaQuery.of(context).size.width) {
      return WorkScreenMedium(workId: workId);
    }

    return WorkScreenCompact(workId: workId);
  }
}
