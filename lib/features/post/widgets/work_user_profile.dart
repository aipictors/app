import 'package:aipictors/features/post/widgets/__generated__/work_user_profile.data.gql.dart';
import 'package:aipictors/features/user/widgets/user_profile_avatar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkUserProfile extends HookConsumerWidget {
  const WorkUserProfile({
    super.key,
    required this.user,
  });

  final GWorkUserProfile user;

  @override
  Widget build(context, ref) {
    return Row(
      children: [
        InkWell(
          child: UserProfileAvatar(
            imageURL: user.iconImage?.downloadURL,
            radius: null,
          ),
          onTap: () {
            FirebaseAnalytics.instance.logSelectContent(
              contentType: 'user',
              itemId: user.id,
            );
            context.push('/users/${user.id}');
          },
        ),
        const SizedBox(width: 8),
        Flexible(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Text(
                user.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                FirebaseAnalytics.instance.logSelectContent(
                  contentType: 'user',
                  itemId: user.id,
                );
                context.push('/users/${user.id}');
              },
            ),
            Row(
              children: [
                const SizedBox(width: 1),
                Flexible(
                    child: Text(
                  user.login,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).dividerColor,
                    fontSize: 10,
                  ),
                )),
              ],
            ),
          ],
        )),
      ],
    );
  }
}
