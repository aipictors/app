import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/container/generation/generation_model_picker.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画像生成
class GenerationScreen extends HookConsumerWidget {
  const GenerationScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingContainer();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('画像生成'.i18n),
        ),
        body: Column(
          children: [
            GenerationModelPicker(onSelected: (String modelName) {
              print(modelName);
            }),
            WorkInfoListTile(
                thumbnailImageURL: 'thumbnailImageURL',
                title: 'title',
                body: Text('Title'),
                onTap: () {})
          ],
        ));
  }
}
