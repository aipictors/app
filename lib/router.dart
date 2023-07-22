import 'package:aipictors/screens/account/account_create_screen.dart';
import 'package:aipictors/screens/account/account_delete_screen.dart';
import 'package:aipictors/screens/account/account_login_screen.dart';
import 'package:aipictors/screens/account/account_password_screen.dart';
import 'package:aipictors/screens/account/account_screen.dart';
import 'package:aipictors/screens/award/novel_awards_screen.dart';
import 'package:aipictors/screens/award/work_awards_screen.dart';
import 'package:aipictors/screens/comment/comment_report_screen.dart';
import 'package:aipictors/screens/config/config_code_screen.dart';
import 'package:aipictors/screens/config/config_language_screen.dart';
import 'package:aipictors/screens/config/config_muted_tags_screen.dart';
import 'package:aipictors/screens/config/config_muted_users_screen.dart';
import 'package:aipictors/screens/config/config_pass_screen.dart';
import 'package:aipictors/screens/config/config_profile_screen.dart';
import 'package:aipictors/screens/config/config_theme_screen.dart';
import 'package:aipictors/screens/daily_theme/daily_theme_screen.dart';
import 'package:aipictors/screens/debug_screen.dart';
import 'package:aipictors/screens/feedback_screen.dart';
import 'package:aipictors/screens/folder/folder_create_screen.dart';
import 'package:aipictors/screens/folder/folder_report_screen.dart';
import 'package:aipictors/screens/folder/folder_screen.dart';
import 'package:aipictors/screens/folder/folder_update_screen.dart';
import 'package:aipictors/screens/guideline_screen.dart';
import 'package:aipictors/screens/privacy_screen.dart';
import 'package:aipictors/screens/root_screen.dart';
import 'package:aipictors/screens/sticker/sticker_report_screen.dart';
import 'package:aipictors/screens/sticker/stickers_screen.dart';
import 'package:aipictors/screens/surveys_screen.dart';
import 'package:aipictors/screens/tag/tag_screen.dart';
import 'package:aipictors/screens/terms_screen.dart';
import 'package:aipictors/screens/tutorial_screen.dart';
import 'package:aipictors/screens/user/user_followees_screen.dart';
import 'package:aipictors/screens/user/user_followers_screen.dart';
import 'package:aipictors/screens/user/user_report_screen.dart';
import 'package:aipictors/screens/user/user_screen.dart';
import 'package:aipictors/screens/viewer/viewer_bookmarked_works_screen.dart';
import 'package:aipictors/screens/viewer/viewer_folders_screen.dart';
import 'package:aipictors/screens/viewer/viewer_screen.dart';
import 'package:aipictors/screens/viewer/viewer_works_screen.dart';
import 'package:aipictors/screens/wiki_screen.dart';
import 'package:aipictors/screens/work/work_create_screen.dart';
import 'package:aipictors/screens/work/work_report_screen.dart';
import 'package:aipictors/screens/work/work_screen.dart';
import 'package:aipictors/screens/work/work_update_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    SentryNavigatorObserver(),
  ],
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: RootScreen());
      },
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) {
        return const AccountScreen();
      },
    ),
    GoRoute(
      path: '/account/create',
      builder: (context, state) {
        return const AccountCreateScreen();
      },
    ),
    GoRoute(
      path: '/account/delete',
      builder: (context, state) {
        return const AccountDeleteScreen();
      },
    ),
    GoRoute(
      path: '/account/password',
      builder: (context, state) {
        return const AccountPasswordScreen();
      },
    ),
    GoRoute(
      path: '/account/login',
      builder: (context, state) {
        return const AccountLoginScreen();
      },
    ),
    GoRoute(
      path: '/awards/novels',
      builder: (context, state) {
        return const NovelAwardsScreen();
      },
    ),
    GoRoute(
      path: '/awards/works',
      builder: (context, state) {
        return const WorkAwardsScreen();
      },
    ),
    GoRoute(
      path: '/comments/:comment_id/report',
      builder: (context, state) {
        final commentId = state.pathParameters['comment_id'];
        return CommentReportScreen(commentId: commentId!);
      },
    ),
    GoRoute(
      path: '/config/code',
      builder: (context, state) {
        return const ConfigCodeScreen();
      },
    ),
    GoRoute(
      path: '/config/code',
      builder: (context, state) {
        return const ConfigCodeScreen();
      },
    ),
    GoRoute(
      path: '/config/language',
      builder: (context, state) {
        return const ConfigLanguageScreen();
      },
    ),
    GoRoute(
      path: '/config/muted_tags',
      builder: (context, state) {
        return const ConfigMutedTagsScreen();
      },
    ),
    GoRoute(
      path: '/config/muted_users',
      builder: (context, state) {
        return const ConfigMutedUsersScreen();
      },
    ),
    GoRoute(
      path: '/config/pass',
      builder: (context, state) {
        return const ConfigPassScreen();
      },
    ),
    GoRoute(
      path: '/config/profile',
      builder: (context, state) {
        return const ConfigProfileScreen();
      },
    ),
    GoRoute(
      path: '/config/theme',
      builder: (context, state) {
        return const ConfigThemeScreen();
      },
    ),
    GoRoute(
      path: '/daily_themes/:theme_id',
      builder: (context, state) {
        final themeId = state.pathParameters['theme_id'];
        return DailyThemeScreen(themeId: themeId!);
      },
    ),
    GoRoute(
      path: '/folders/create',
      builder: (context, state) {
        return const FolderCreateScreen();
      },
    ),
    GoRoute(
      path: '/folders/:folder_id',
      builder: (context, state) {
        final folderId = state.pathParameters['folder_id'];
        return FolderScreen(folderId: folderId!);
      },
    ),
    GoRoute(
      path: '/folders/:folder_id/report',
      builder: (context, state) {
        final folderId = state.pathParameters['folder_id'];
        return FolderReportScreen(folderId: folderId!);
      },
    ),
    GoRoute(
      path: '/folders/:folder_id/update',
      builder: (context, state) {
        final folderId = state.pathParameters['folder_id'];
        return FolderUpdateScreen(folderId: folderId!);
      },
    ),
    GoRoute(
      path: '/stickers',
      builder: (context, state) {
        return const StickersScreen();
      },
    ),
    GoRoute(
      path: '/stickers/:sticker_id/report',
      builder: (context, state) {
        final stickerId = state.pathParameters['sticker_id'];
        return StickerReportScreen(stickerId: stickerId!);
      },
    ),
    GoRoute(
      path: '/tags/:tag_name',
      builder: (context, state) {
        final tagName = state.pathParameters['tag_name'];
        return TagScreen(tagName: tagName!);
      },
    ),
    GoRoute(
      path: '/users/:user_id',
      builder: (context, state) {
        final userId = state.pathParameters['user_id'];
        return UserScreen(userId: userId!);
      },
    ),
    GoRoute(
      path: '/users/:user_id/followees',
      builder: (context, state) {
        final userId = state.pathParameters['user_id'];
        return UserFolloweesScreen(userId: userId!);
      },
    ),
    GoRoute(
      path: '/users/:user_id/followers',
      builder: (context, state) {
        final userId = state.pathParameters['user_id'];
        return UserFollowersScreen(userId: userId!);
      },
    ),
    GoRoute(
      path: '/users/:user_id/report',
      builder: (context, state) {
        final userId = state.pathParameters['user_id'];
        return UserReportScreen(userId: userId!);
      },
    ),
    GoRoute(
      path: '/viewer',
      builder: (context, state) {
        return const ViewerScreen();
      },
    ),
    GoRoute(
      path: '/viewer/works',
      builder: (context, state) {
        return const ViewerWorksScreen();
      },
    ),
    GoRoute(
      path: '/viewer/folders',
      builder: (context, state) {
        return const ViewerFoldersScreen();
      },
    ),
    GoRoute(
      path: '/viewer/bookmarked_works',
      builder: (context, state) {
        return const ViewerBookmarkedWorksScreen();
      },
    ),
    GoRoute(
      path: '/works/create',
      builder: (context, state) {
        return const WorkCreateScreen();
      },
    ),
    GoRoute(
      path: '/works/:work_id',
      builder: (context, state) {
        final workId = state.pathParameters['work_id'];
        return WorkScreen(workId: workId!);
      },
    ),
    GoRoute(
      path: '/works/:work_id/report',
      builder: (context, state) {
        final workId = state.pathParameters['work_id'];
        return WorkReportScreen(workId: workId!);
      },
    ),
    GoRoute(
      path: '/works/:work_id/update',
      builder: (context, state) {
        final workId = state.pathParameters['work_id'];
        return WorkUpdateScreen(workId: workId!);
      },
    ),
    GoRoute(
      path: '/debug',
      builder: (context, state) {
        return const DebugScreen();
      },
    ),
    GoRoute(
      path: '/feedback',
      builder: (context, state) {
        return const FeedbackScreen();
      },
    ),
    GoRoute(
      path: '/guideline',
      builder: (context, state) {
        return const GuidelineScreen();
      },
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) {
        return const PrivacyScreen();
      },
    ),
    GoRoute(
      path: '/surveys',
      builder: (context, state) {
        return const SurveysScreen();
      },
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) {
        return const TermsScreen();
      },
    ),
    GoRoute(
      path: '/tutorial',
      builder: (context, state) {
        return const TutorialScreen();
      },
    ),
    GoRoute(
      path: '/wiki',
      builder: (context, state) {
        return const WikiScreen();
      },
    ),
  ],
);
