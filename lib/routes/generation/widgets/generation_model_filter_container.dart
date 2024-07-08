import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/routes/search/widgets/search_app_bar.dart';
import 'package:aipictors/utils/to_model_category_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationModelFilterContainer extends HookConsumerWidget {
  const GenerationModelFilterContainer({
    super.key,
    required this.onCategorySelected,
    required this.onTypeSelected,
    required this.onSearchTextSubmit,
  });

  final Function(GImageModelCategory? category) onCategorySelected;

  final Function(String? type) onTypeSelected;

  final Function(String text) onSearchTextSubmit;

  @override
  Widget build(context, ref) {
    final ValueNotifier<GImageModelCategory?> category = useState(null);
    final ValueNotifier<String?> type = useState(null);
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            DropdownButton(
              hint: Text('カテゴリ'.i18n),
              value: category.value,
              items: [
                DropdownMenuItem(value: '', child: Text('すべて'.i18n)),
                for (GImageModelCategory category in GImageModelCategory.values)
                  DropdownMenuItem(
                      value: category,
                      child: Text(toModelCategoryText(category))),
              ],
              onChanged: (value) {
                if (value == '') {
                  category.value = null;
                } else {
                  category.value = value as GImageModelCategory?;
                }
                onCategorySelected(category.value);
              },
            ),
            DropdownButton(
              hint: Text('種別'.i18n),
              value: type.value,
              items: [
                DropdownMenuItem(value: '', child: Text('すべて'.i18n)),
                DropdownMenuItem(value: 'SD1', child: Text('SD1'.i18n)),
                DropdownMenuItem(value: 'SD2', child: Text('SD2'.i18n)),
                DropdownMenuItem(value: 'SDXL', child: Text('SDXL'.i18n))
              ],
              onChanged: (value) {
                if (value == '') {
                  type.value = null;
                } else {
                  type.value = value;
                }
                onTypeSelected(type.value);
              },
            ),
          ],
        ),
        SearchContainer(
          isFilled: false,
          onSubmit: (value) {
            onSearchTextSubmit(value.text);
          },
          onFill: ((value) {}),
        ),
      ],
    );
  }
}
