import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart';
import 'package:aipictors/widgets/container/dismissible_background_container.dart';
import 'package:aipictors/widgets/list/muted_tag_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DismissibleMutedTagList extends HookConsumerWidget {
  const DismissibleMutedTagList({
    Key? key,
    required this.tagList,
  }) : super(key: key);

  final List<GPartialUserFields> tagList;

  @override
  Widget build(context, ref) {
    final state = useState(tagList);

    return ListView.builder(
      itemCount: tagList.length,
      itemBuilder: (context, index) {
        final tag = state.value[index];
        return Dismissible(
          key: ValueKey(tag.id),
          background: DismissibleBackgroundContainer(
            text: 'ミュートを解除する'.i18n,
          ),
          child: MutedTagListTile(
            tagName: tag.name,
            onTap: null,
          ),
        );
      },
    );
  }
}
