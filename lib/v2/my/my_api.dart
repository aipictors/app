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

/// マイページの作品の一覧の種類（Web の my-collected-works の Kind と同じ）
enum MyCollectionKind {
  likes('likedWorks', 'likedWorksCount'),
  bookmarks('bookmarkedWorks', 'bookmarkedWorksCount'),
  views('viewedWorks', 'viewedWorksCount'),
  recommended('recommendedWorks', 'recommendedWorksCount');

  const MyCollectionKind(this.field, this.countField);

  final String field;
  final String countField;

  /// 一覧から外せるか（閲覧履歴は外せない）
  bool get removable => this != views;
}

/// 一覧の 1 ページと、ブックマークを外すときに使う入れ物の ID
class MyCollectionPage {
  const MyCollectionPage(this.works, this.bookmarkFolderId);

  final List<WorkSummary> works;
  final String? bookmarkFolderId;
}

class MyApi {
  MyApi._();

  /// 検索・年齢の where（Web の toWhere と同じ。年齢を選ばなければアプリで出せるものだけ）
  static Map<String, dynamic> collectionWhere(String search, String? rating) => {
        if (search.isNotEmpty) 'search': search,
        'ratings': rating == null ? appRatings : [rating],
      };

  static Future<MyCollectionPage> collection(MyCollectionKind kind, Map<String, dynamic> where, int offset, int limit) async {
    final doc = '''
query AppViewerCollection(\$offset: Int!, \$limit: Int!, \$where: UserWorksWhereInput) {
  viewer { id bookmarkFolderId ${kind.field}(offset: \$offset, limit: \$limit, where: \$where) { $workCardFields } }
}''';
    final data = await Api.query(doc, variables: {'offset': offset, 'limit': limit, 'where': where});
    final viewer = data.obj('viewer');
    return MyCollectionPage(WorkSummary.listFrom(viewer?.list(kind.field) ?? const []), viewer?.strOrNull('bookmarkFolderId'));
  }

  static Future<int> collectionCount(MyCollectionKind kind, Map<String, dynamic> where) async {
    final data = await Api.query('query AppViewerCollectionCount(\$where: UserWorksWhereInput) { viewer { id ${kind.countField}(where: \$where) } }', variables: {'where': where});
    return data.obj('viewer')?.integer(kind.countField) ?? 0;
  }

  /// 一覧から外す（いいね・ブックマーク・推薦を取り消す。Web と同じ mutation）
  static Future<void> removeFromCollection(MyCollectionKind kind, String workId, {String? bookmarkFolderId}) async {
    switch (kind) {
      case MyCollectionKind.likes:
        await Api.mutate(r'mutation AppDeleteMyWorkLike($input: DeleteWorkLikeInput!) { deleteWorkLike(input: $input) { id } }', variables: {
          'input': {'workId': workId},
        });
      case MyCollectionKind.bookmarks:
        await Api.mutate(r'mutation AppDeleteMyBookmark($input: DeleteFolderWorkInput!) { deleteFolderWork(input: $input) { id } }', variables: {
          'input': {'folderId': bookmarkFolderId ?? '', 'workId': workId},
        });
      case MyCollectionKind.recommended:
        await Api.mutate(r'mutation AppDeleteMyRecommendedWork($input: DeleteRecommendedWorkInput!) { deleteRecommendedWork(input: $input) }', variables: {
          'input': {'workId': workId},
        });
      case MyCollectionKind.views:
        break;
    }
  }

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
