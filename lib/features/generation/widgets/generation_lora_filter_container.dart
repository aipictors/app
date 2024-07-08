import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/search/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationLoraFilterContainer extends HookConsumerWidget {
  const GenerationLoraFilterContainer({
    super.key,
    required this.genreList,
    required this.onGenreSelected,
    required this.onSearchTextSubmit,
  });

  final List<String> genreList;

  final Function(String? type) onGenreSelected;

  final Function(String text) onSearchTextSubmit;

  @override
  Widget build(context, ref) {
    final ValueNotifier<String?> genre = useState(null);
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            DropdownButton(
              hint: Text('ジャンル'.i18n),
              value: genre.value,
              items: [
                DropdownMenuItem(value: '', child: Text('すべて'.i18n)),
                for (final String genre in genreList)
                  DropdownMenuItem(value: genre, child: Text(genre)),
              ],
              onChanged: (value) {
                if (value == '') {
                  genre.value = null;
                } else {
                  genre.value = value;
                }
                onGenreSelected(genre.value);
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
