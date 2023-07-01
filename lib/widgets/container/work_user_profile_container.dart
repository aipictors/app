import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        InkWell(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              user.iconImage!.downloadURL,
            ),
          ),
          onTap: () {
            context.push('/users/${user.id}');
          },
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Text(
                user.name,
                style: const TextStyle(
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                context.push('/users/${user.id}');
              },
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
