import 'package:aipictors/v2/albums/albums_screen.dart';
import 'package:aipictors/v2/albums/folders_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> albumRoutes = [
  GoRoute(path: '/viewer/albums', builder: (context, state) => const MyAlbumsScreen()),
  GoRoute(path: '/albums/create', builder: (context, state) => const AlbumEditScreen()),
  GoRoute(path: '/albums/:album', builder: (context, state) => AlbumScreen(id: state.pathParameters['album']!)),
  GoRoute(path: '/albums/:album/update', builder: (context, state) => AlbumEditScreen(id: state.pathParameters['album'])),
  GoRoute(path: '/viewer/folders', builder: (context, state) => const MyFoldersScreen()),
  GoRoute(path: '/folders/:folder', builder: (context, state) => FolderScreen(id: state.pathParameters['folder']!)),
];
