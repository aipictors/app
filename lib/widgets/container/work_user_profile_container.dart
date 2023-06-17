import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart';

class WorkUserProfileContainer extends HookConsumerWidget {
  const WorkUserProfileContainer({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GWorkUserFields user;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            user.iconImage!.downloadURL,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: const TextStyle(
                height: 1.2,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 1),
                Text(
                  user.login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).dividerColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
