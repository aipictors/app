import 'package:aipictors/v2/notifications/notifications_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> notificationsRoutes = [
  GoRoute(path: '/notifications', builder: (context, state) => const NotificationsScreen(inTab: false)),
];
