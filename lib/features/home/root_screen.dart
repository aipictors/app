import 'dart:io';

import 'package:aipictors/enums/layout.dart';
import 'package:aipictors/features/config/config_screen.dart';
import 'package:aipictors/features/daily_theme/daily_theme_home_screen.dart';
import 'package:aipictors/features/explorer/explorer_screen.dart';
import 'package:aipictors/features/feed/feed_screen.dart';
import 'package:aipictors/features/generation/generation_%20construction_screen.dart';
import 'package:aipictors/features/home/hello_screen.dart';
import 'package:aipictors/features/home/hello_terms_screen.dart';
import 'package:aipictors/features/home/home_loading_screen.dart';
import 'package:aipictors/features/home/maintenance_screen.dart';
import 'package:aipictors/features/home/update_screen.dart';
import 'package:aipictors/features/home/widgets/config_error_screen.dart';
import 'package:aipictors/features/home/widgets/home_navigation_bar.dart';
import 'package:aipictors/features/home/widgets/home_navigation_rail.dart';
import 'package:aipictors/features/home/widgets/latest_version_dialog.dart';
import 'package:aipictors/features/notification/notification_screen.dart';
import 'package:aipictors/features/viewer/queries/__generated__/viewer_user.data.gql.dart';
import 'package:aipictors/handlers/message_handler.dart';
import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:aipictors/providers/background_message_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/providers/foreground_message_provider.dart';
import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/providers/initial_message_provider.dart';
import 'package:aipictors/providers/is_update_dialog_showed_provider.dart';
import 'package:aipictors/providers/tracking_status_provider.dart';
import 'package:aipictors/providers/viewer_provider.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';

class RootScreen extends HookConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(context, ref) {
    final authState = ref.watch(authStateProvider);

    final config = ref.watch(configProvider);

    // タブの位置
    final pageIndex = ref.watch(homeTabIndexProvider);

    // タブの位置
    final trackingStatus = ref.watch(trackingStatusProvider);

    final ValueNotifier<GViewerUserData?> viewer = useState(null);

    ref.watch(viewerProvider.future).then((value) => viewer.value = value);

    // 初期化エラー
    if (config.isFailed) {
      return const ConfigErrorScreen();
    }

    // アップデート
    if (config.isOutOfDate) {
      return const UpdateScreen();
    }

    // メンテナンスモード
    if (config.isMaintenanceMode) {
      return const MaintenanceScreen();
    }

    // ログイン中
    if (authState.isLoading || trackingStatus.isLoading) {
      return const HomeLoadingScreen();
    }

    if (trackingStatus.value == TrackingStatus.notDetermined) {
      AppTrackingTransparency.requestTrackingAuthorization();
    }

    if (Platform.isIOS && !config.eulaCheck) {
      return const HelloTermsScreen();
    }

    ref.listen(
      initialMessageProvider,
      messageListener(context, ref),
    );

    ref.listen(
      foregroundMessageProvider,
      messageListener(context, ref),
    );

    ref.listen(
      backgroundMessageProvider,
      messageListener(context, ref),
    );

    // アップデートの通知
    final updateDialogShowed = ref.watch(isUpdateDialogShowedProvider);

    if (config.isNotLatestVersion && updateDialogShowed == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final notifier = ref.read(isUpdateDialogShowedProvider.notifier);
        notifier.update(true);
        showDialog(
          context: context,
          builder: (_) {
            return LatestVersionDialog(
              onAccept: () {
                onOpenAppStore(context, ref);
              },
              onCancel: () {
                context.pop();
              },
            );
          },
        );
      });
    }

    final screenList = [
      const FeedScreen(key: PageStorageKey('root_feed')),
      const DailyThemeHomeScreen(key: PageStorageKey('root_daily_theme')),
      if (authState.value == null)
        const ExplorerScreen(key: PageStorageKey('root_explorer')),
      if (authState.value != null)
        const GenerationConstructionScreen(
          key: PageStorageKey('root_generation'),
        ),
      // const GenerationScreen(key: PageStorageKey('root_generation')),
      if (authState.value == null)
        const HelloScreen(key: PageStorageKey('root_hello')),
      if (authState.value != null)
        const NotificationScreen(key: PageStorageKey('root_notification')),
      const ConfigScreen(key: PageStorageKey('root_config'))
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final layout = Layout.fromWidth(constraints.maxWidth);
      // タブレット
      if (layout.notCompact && !config.themeCompactLayout) {
        return Scaffold(
          body: Row(
            children: [
              const HomeNavigationRail(),
              Expanded(child: screenList[pageIndex])
            ],
          ),
        );
      }
      // スマホ用
      return Scaffold(
        body: screenList[pageIndex],
        bottomNavigationBar: const HomeNavigationBar(),
      );
    });
  }

  // アプリストアを開く
  Future onOpenAppStore(BuildContext context, WidgetRef ref) async {
    final config = ref.read(configProvider);
    // final isAvailable = await canLaunchUrl(config.pageAppStoreURL);
    // if (!isAvailable) return;
    // await launchUrl(
    //   config.pageAppStoreURL,
    //   mode: LaunchMode.externalApplication,
    // );
  }
}
