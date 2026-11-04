import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';

class FolderSummary {
  const FolderSummary({required this.id, required this.title, required this.thumbnailUrl, required this.worksCount, required this.isPrivate});

  final String id;
  final String title;
  final String? thumbnailUrl;
  final int worksCount;
  final bool isPrivate;

  static List<FolderSummary> listFrom(List<Map<String, dynamic>> items) => items
      .where((f) => !f.boolean('isSensitive') && f.str('rating') != 'R18' && f.str('rating') != 'R18G')
      .map((f) => FolderSummary(
            id: f.str('id'),
            title: f.str('title', '').isEmpty ? '無題のフォルダ' : f.str('title'),
            thumbnailUrl: f.strOrNull('thumbnailImageURL'),
            worksCount: f.integer('worksCount'),
            isPrivate: f.boolean('isPrivate'),
          ))
      .toList();
}

class ActionHistoryItem {
  const ActionHistoryItem({
    required this.id,
    required this.actionType,
    required this.createdAt,
    required this.summary,
    required this.title,
    required this.workId,
    required this.thumbnailUrl,
    required this.isModeratorAction,
  });

  final String id;
  final String actionType;
  final int createdAt;
  final String summary;
  final String? title;
  final String? workId;
  final String? thumbnailUrl;
  final bool isModeratorAction;
}

class ModerationReport {
  ModerationReport({
    required this.id,
    required this.createdAt,
    required this.workId,
    required this.workTitle,
    required this.thumbnailUrl,
    required this.customMessage,
    required this.reportMessage,
    required this.responseMessage,
    required this.status,
  });

  final String id;
  final int createdAt;
  final String? workId;
  final String? workTitle;
  final String? thumbnailUrl;
  final String? customMessage;
  final String? reportMessage;
  String? responseMessage;
  String status;

  bool get needsAction => status == 'UNHANDLED' && (responseMessage == null || responseMessage!.isEmpty);
}

class MyApi {
  MyApi._();

  static Map<String, dynamic> get _where => {'ratings': appRatings};

  static const _likes = '''
query AppViewerLikedWorks(\$offset: Int!, \$limit: Int!, \$where: UserWorksWhereInput) {
  viewer { id likedWorks(offset: \$offset, limit: \$limit, where: \$where) { $workCardFields } }
}''';

  static const _bookmarks = '''
query AppViewerBookmarkedWorks(\$offset: Int!, \$limit: Int!, \$where: UserWorksWhereInput) {
  viewer { id bookmarkedWorks(offset: \$offset, limit: \$limit, where: \$where) { $workCardFields } }
}''';

  static const _views = '''
query AppViewerViewedWorks(\$offset: Int!, \$limit: Int!, \$where: UserWorksWhereInput) {
  viewer { id viewedWorks(offset: \$offset, limit: \$limit, where: \$where) { $workCardFields } }
}''';

  static Future<List<WorkSummary>> _works(String doc, String key, int offset, int limit) async {
    final data = await Api.query(doc, variables: {'offset': offset, 'limit': limit, 'where': _where});
    return WorkSummary.listFrom(data.obj('viewer')?.list(key) ?? const []);
  }

  static Future<List<WorkSummary>> likes(int o, int l) => _works(_likes, 'likedWorks', o, l);

  static Future<List<WorkSummary>> bookmarks(int o, int l) => _works(_bookmarks, 'bookmarkedWorks', o, l);

  static Future<List<WorkSummary>> views(int o, int l) => _works(_views, 'viewedWorks', o, l);

  static Future<List<FolderSummary>> folders(int offset, int limit) async {
    final data = await Api.query(r'''
query AppViewerFolders($offset: Int!, $limit: Int!) {
  viewer {
    id
    bookmarkFolderId
    folders(offset: $offset, limit: $limit) { id title thumbnailImageURL worksCount isPrivate isSensitive rating }
  }
}''', variables: {'offset': offset, 'limit': limit});
    final viewer = data.obj('viewer');
    // ブックマークの入れ物は「ブックマーク」の画面で見せる
    final bookmarkId = viewer?.strOrNull('bookmarkFolderId');
    return FolderSummary.listFrom((viewer?.list('folders') ?? const <Map<String, dynamic>>[]).where((f) => f.str('id') != bookmarkId).toList());
  }

  static Future<List<FolderSummary>> userFolders(String userId, int offset, int limit) async {
    final data = await Api.query(r'''
query AppUserFolders($userId: ID!, $offset: Int!, $limit: Int!) {
  user(id: $userId) {
    id
    folders(offset: $offset, limit: $limit, where: { isSensitive: false }) { id title thumbnailImageURL worksCount isPrivate isSensitive rating }
  }
}''', variables: {'userId': userId, 'offset': offset, 'limit': limit});
    return FolderSummary.listFrom(data.obj('user')?.list('folders') ?? const []);
  }

  static const _folderWorks = '''
query AppFolderWorks(\$id: ID!, \$offset: Int!, \$limit: Int!) {
  folder(id: \$id) {
    id
    title
    works(offset: \$offset, limit: \$limit) { $workCardFields }
  }
}''';

  static Future<(String, List<WorkSummary>)> folderWorks(String id, int offset, int limit) async {
    final data = await Api.query(_folderWorks, variables: {'id': id, 'offset': offset, 'limit': limit});
    final folder = data.obj('folder');
    return (folder?.str('title') ?? '', WorkSummary.listFrom(folder?.list('works') ?? const []));
  }

  static Future<List<ActionHistoryItem>> histories(String? actionType, int offset, int limit) async {
    final data = await Api.query(r'''
query AppWorkActionHistories($offset: Int!, $limit: Int!, $actionType: String) {
  viewer {
    id
    workActionHistories(offset: $offset, limit: $limit, actionType: $actionType) {
      id actionType createdAt summary title workId thumbnailImageURL ratingLabel isModeratorAction
    }
  }
}''', variables: {'offset': offset, 'limit': limit, 'actionType': actionType});
    return (data.obj('viewer')?.list('workActionHistories') ?? const <Map<String, dynamic>>[]).map((h) {
      final label = h.str('ratingLabel');
      final isAdult = label.contains('R18');
      return ActionHistoryItem(
        id: h.str('id'),
        actionType: h.str('actionType'),
        createdAt: h.integer('createdAt'),
        summary: isAdult ? 'アプリでは表示できない作品の履歴です' : h.str('summary'),
        title: isAdult ? null : h.strOrNull('title'),
        workId: isAdult ? null : h.strOrNull('workId'),
        thumbnailUrl: isAdult ? null : h.strOrNull('thumbnailImageURL'),
        isModeratorAction: h.boolean('isModeratorAction'),
      );
    }).toList();
  }

  static Future<List<ModerationReport>> reports(String userId, int offset, int limit) async {
    final data = await Api.query(r'''
query AppModerationReports($offset: Int!, $limit: Int!, $where: ModerationReportsWhereInput) {
  moderationReports(offset: $offset, limit: $limit, where: $where) {
    id createdAt customMessage isRead responseMessage status reportMessage reportType
    work { id title rating smallThumbnailImageURL }
  }
}''', variables: {
      'offset': offset,
      'limit': limit,
      'where': {'userId': userId},
    });
    return data.list('moderationReports').map((r) {
      final w = r.obj('work');
      final isAdult = w?.str('rating') == 'R18' || w?.str('rating') == 'R18G';
      return ModerationReport(
        id: r.str('id'),
        createdAt: r.integer('createdAt'),
        workId: isAdult ? null : w?.strOrNull('id'),
        workTitle: isAdult ? null : w?.strOrNull('title'),
        thumbnailUrl: isAdult ? null : w?.strOrNull('smallThumbnailImageURL'),
        customMessage: r.strOrNull('customMessage'),
        reportMessage: r.strOrNull('reportMessage'),
        responseMessage: r.strOrNull('responseMessage'),
        status: r.str('status'),
      );
    }).toList();
  }

  static Future<void> respondReport(String id, String message) async {
    await Api.mutate(r'''
mutation AppRespondModerationReport($id: ID!, $message: String) {
  respondModerationReport(id: $id, message: $message)
}''', variables: {'id': id, 'message': message});
  }
}
