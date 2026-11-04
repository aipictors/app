import 'package:aipictors/v2/settings/profile_edit_screen.dart';
import 'package:aipictors/v2/settings/settings_screens.dart';
import 'package:go_router/go_router.dart';

GoRoute _route(String path, GoRouterWidgetBuilder builder) => GoRoute(path: path, builder: builder);

final List<RouteBase> settingsRoutes = [
  _route('/settings', (_, __) => const SettingsScreen()),
  _route('/settings/profile', (_, __) => const ProfileEditScreen()),
  _route('/settings/account', (_, __) => const AccountSettingsScreen()),
  _route('/settings/account/login', (_, __) => const AccountLoginScreen()),
  _route('/settings/account/password', (_, __) => const AccountPasswordScreen2()),
  _route('/settings/notification', (_, __) => const NotificationSettingsScreen()),
  _route('/settings/restriction', (_, __) => const RestrictionSettingsScreen()),
  _route('/settings/color', (_, __) => const ColorSettingsScreen()),
  _route('/settings/muted/users', (_, __) => const ManagedUsersScreen(blocked: false)),
  _route('/settings/blocked/users', (_, __) => const ManagedUsersScreen(blocked: true)),
  _route('/settings/muted/tags', (_, __) => const ManagedTagsScreen(followed: false)),
  _route('/settings/followed/tags', (_, __) => const ManagedTagsScreen(followed: true)),
  _route('/settings/support-received', (_, __) => const SupportReceivedScreen()),
  // 旧画面の置き換え
  _route('/config/profile', (_, __) => const ProfileEditScreen()),
  _route('/config/notifications', (_, __) => const NotificationSettingsScreen()),
  _route('/config/muted_users', (_, __) => const ManagedUsersScreen(blocked: false)),
  _route('/config/muted_tags', (_, __) => const ManagedTagsScreen(followed: false)),
];
