import 'package:aipictors/features/config/widgets/__generated__/muted_tag_list_tile.data.gql.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MutedTagListTile extends HookConsumerWidget {
  const MutedTagListTile({
    super.key,
    required this.tag,
  });

  final GMutedTagListTile tag;

  @override
  Widget build(context, ref) {
    return ListTile(
      minVerticalPadding: 0,
      title: Text(
        '#${tag.name}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
