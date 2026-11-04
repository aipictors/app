import 'package:aipictors/v2/community/ai_ranking_screen.dart';
import 'package:aipictors/v2/community/albums_screen.dart';
import 'package:aipictors/v2/community/app_markdown.dart';
import 'package:aipictors/v2/community/events_screen.dart';
import 'package:aipictors/v2/community/messages_screen.dart';
import 'package:aipictors/v2/community/models_screen.dart';
import 'package:aipictors/v2/community/releases_screen.dart';
import 'package:aipictors/v2/community/support_chat_screen.dart';
import 'package:aipictors/v2/community/themes_screen.dart';
import 'package:aipictors/v2/community/works_browse_screen.dart';
import 'package:aipictors/v2/support/support_ranking_screen.dart';
import 'package:go_router/go_router.dart';

GoRoute _browse(String path, String title, Map<String, dynamic> where) =>
    GoRoute(path: path, builder: (context, state) => WorksBrowseScreen(title: title, where: where));

final List<RouteBase> communityRoutes = [
  GoRoute(path: '/tags', builder: (context, state) => const TagsScreen()),
  _browse('/new-works', '新着作品', const {}),
  _browse('/posts/2d', '2D', const {'style': 'ILLUSTRATION', 'workType': 'WORK'}),
  _browse('/posts/2.5d', '2.5D', const {'style': 'SEMI_REAL', 'workType': 'WORK'}),
  _browse('/posts/3d', '3D', const {'style': 'REAL', 'workType': 'WORK'}),
  _browse('/novels', '小説', const {'workType': 'NOVEL'}),
  _browse('/notes', 'ノート', const {'workType': 'COLUMN'}),
  _browse('/videos', '動画', const {'workType': 'VIDEO'}),
  GoRoute(path: '/ai-rankings', builder: (context, state) => const AiRankingScreen()),
  GoRoute(path: '/coin-rankings', builder: (context, state) => const SupportRankingScreen()),
  GoRoute(path: '/themes', builder: (context, state) => const ThemesScreen()),
  GoRoute(path: '/themes/proposals', builder: (context, state) => const ThemeProposalsScreen()),
  GoRoute(path: '/themes/proposals/new', builder: (context, state) => const ThemeProposalNewScreen()),
  GoRoute(
    path: '/themes/:year/:month/:day',
    builder: (context, state) => ThemeDayScreen(
      year: int.parse(state.pathParameters['year']!),
      month: int.parse(state.pathParameters['month']!),
      day: int.parse(state.pathParameters['day']!),
    ),
  ),
  GoRoute(path: '/messages', builder: (context, state) => const MessagesScreen()),
  GoRoute(path: '/messages/:recipient', builder: (context, state) => MessageThreadScreen(recipientId: state.pathParameters['recipient']!)),
  GoRoute(path: '/support/chat', builder: (context, state) => const SupportChatScreen()),
  GoRoute(path: '/releases', builder: (context, state) => const ReleasesScreen()),
  GoRoute(path: '/announcements', builder: (context, state) => const ReleasesScreen(initial: 1)),
  GoRoute(
    path: '/releases/:id',
    builder: (context, state) => ReleaseDetailScreen(id: state.pathParameters['id']!, release: state.extra is Release ? state.extra as Release : null),
  ),
  GoRoute(path: '/help', builder: (context, state) => const DocScreen(title: 'ヘルプ', asset: 'assets/docs/help.md')),
  GoRoute(path: '/guideline', builder: (context, state) => const DocScreen(title: 'ガイドライン', asset: 'assets/docs/guideline.md')),
  GoRoute(path: '/roadmap', builder: (context, state) => const DocScreen(title: 'ロードマップ', asset: 'assets/docs/roadmap.md')),
  GoRoute(path: '/events', builder: (context, state) => const EventsScreen()),
  GoRoute(path: '/events/:slug', builder: (context, state) => EventDetailScreen(slug: state.pathParameters['slug']!)),
  GoRoute(path: '/albums', builder: (context, state) => const AlbumsBrowseScreen()),
  GoRoute(path: '/models', builder: (context, state) => const ModelsScreen()),
  GoRoute(path: '/models/library', builder: (context, state) => const ModelsLibraryScreen()),
  GoRoute(path: '/models/u/:id', builder: (context, state) => UserModelDetailScreen(id: state.pathParameters['id']!)),
  GoRoute(path: '/models/:id', builder: (context, state) => ModelDetailScreen(id: state.pathParameters['id']!)),
];
