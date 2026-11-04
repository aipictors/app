import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:flutter/foundation.dart';

/// 通知の種類（Web の NotificationPanelKind）
enum NotificationKind { liked, comment, reply, follow, award, coin }

/// 未読の数（種類ごと）
class UnreadCounts {
  const UnreadCounts({this.liked = 0, this.comment = 0, this.reply = 0, this.follow = 0, this.award = 0, this.message = 0, this.moderation = 0});

  final int liked;
  final int comment;
  final int reply;
  final int follow;
  final int award;
  final int message;
  final int moderation;

  /// 「すべて」のタブに入る種類の合計
  int get activity => liked + comment + reply + follow + award;

  int get total => activity + message + moderation;

  factory UnreadCounts.fromJson(Map<String, dynamic>? j) => j == null
      ? const UnreadCounts()
      : UnreadCounts(
          liked: j.integer('liked'),
          comment: j.integer('comment'),
          reply: j.integer('reply'),
          follow: j.integer('follow'),
          award: j.integer('award'),
          message: j.integer('message'),
          moderation: j.integer('moderation'),
        );
}

class NotificationWork {
  const NotificationWork({required this.id, required this.title, required this.thumbnailUrl, required this.isAdult});

  final String id;
  final String title;
  final String? thumbnailUrl;

  /// R18 はアプリでは出さない（サムネイルも開く先も）
  final bool isAdult;
}

class NotificationReply {
  const NotificationReply({required this.text, this.stickerUrl});

  final String text;
  final String? stickerUrl;
}

/// 通知の 1 行
class NotificationItem {
  NotificationItem({
    required this.id,
    required this.kind,
    required this.createdAt,
    required this.work,
    required this.user,
    required this.message,
    required this.stickerUrl,
    required this.replyTargetCommentId,
    required this.myReplies,
    required this.parentText,
    required this.parentStickerUrl,
    required this.parentUserName,
    required this.supportCoins,
    required this.isAnonymous,
  });

  final String id;
  final NotificationKind kind;
  final int createdAt;
  final NotificationWork? work;
  final UserSummary? user;
  final String? message;
  final String? stickerUrl;
  final String? replyTargetCommentId;
  final List<NotificationReply> myReplies;
  final String? parentText;
  final String? parentStickerUrl;
  final String? parentUserName;

  /// コメントに付いた応援コイン。付いていなければ 0
  final int supportCoins;
  final bool isAnonymous;

  bool get canReply => kind == NotificationKind.comment || kind == NotificationKind.reply;

  bool get isNotReplied => kind == NotificationKind.comment && myReplies.isEmpty;

  static const _kinds = {
    'LikedWorkNotificationNode': NotificationKind.liked,
    'WorkCommentNotificationNode': NotificationKind.comment,
    'WorkCommentReplyNotificationNode': NotificationKind.reply,
    'FollowNotificationNode': NotificationKind.follow,
    'WorkAwardNotificationNode': NotificationKind.award,
    'LikedWorksSummaryNotificationNode': NotificationKind.coin,
  };

  static NotificationItem? fromJson(Map<String, dynamic> j) {
    var kind = _kinds[j.str('__typename')];
    if (kind == null) return null;
    final workJson = j.obj('work');
    // コインのお知らせは作品のない入賞のノードで返ってくる
    if (kind == NotificationKind.award && workJson == null) kind = NotificationKind.coin;
    if (kind == NotificationKind.liked && workJson == null) return null;
    if (kind == NotificationKind.follow && j.obj('user') == null) return null;
    final rating = workJson?.str('rating') ?? '';
    final support = j.obj('support');
    final parent = j.obj('comment');
    return NotificationItem(
      id: j.str('id'),
      kind: kind,
      createdAt: j.integer('createdAt'),
      work: workJson == null
          ? null
          : NotificationWork(
              id: workJson.str('id'),
              title: workJson.str('title'),
              thumbnailUrl: workJson.strOrNull('smallThumbnailImageURL'),
              isAdult: rating == 'R18' || rating == 'R18G',
            ),
      user: j.obj('user') == null ? null : UserSummary.fromJson(j.obj('user')!),
      message: j.strOrNull('message'),
      stickerUrl: j.obj('sticker')?.strOrNull('imageUrl'),
      replyTargetCommentId: j.strOrNull('replyTargetCommentId'),
      myReplies: j
          .list('myReplies')
          .map((r) => NotificationReply(text: r.str('text'), stickerUrl: r.obj('sticker')?.strOrNull('imageUrl')))
          .toList(),
      parentText: parent?.strOrNull('text'),
      parentStickerUrl: parent?.obj('sticker')?.strOrNull('imageUrl'),
      parentUserName: parent?.obj('user')?.strOrNull('name'),
      supportCoins: support == null ? 0 : support.integer('freeCoinAmount') + support.integer('premiumCoinAmount'),
      isAnonymous: j.boolean('isAnonymous'),
    );
  }
}

/// 運営からのメッセージ
class SupportMessage {
  const SupportMessage({required this.id, required this.text, required this.createdAt, required this.isFromTeam});

  final String id;
  final String text;
  final int createdAt;
  final bool isFromTeam;
}

class NotificationsApi {
  NotificationsApi._();

  /// タブのバッジ。アプリのどこからでも読む
  static final unread = ValueNotifier<int>(0);

  static const _work = 'work { id title rating smallThumbnailImageURL }';
  static const _user = 'user { $userSummaryFields }';

  static const _list = '''
query AppNotifications(\$offset: Int!, \$limit: Int!, \$where: NotificationsWhereInput) {
  viewer {
    id
    notifications(offset: \$offset, limit: \$limit, where: \$where) {
      __typename
      ... on LikedWorkNotificationNode { id createdAt isAnonymous $_work $_user }
      ... on WorkCommentNotificationNode {
        id createdAt message replyTargetCommentId $_work $_user
        sticker { id imageUrl }
        myReplies { id text sticker { id imageUrl } }
        support { freeCoinAmount premiumCoinAmount totalPt }
      }
      ... on WorkCommentReplyNotificationNode {
        id createdAt message replyTargetCommentId $_work $_user
        sticker { id imageUrl }
        support { freeCoinAmount premiumCoinAmount totalPt }
        comment { id text sticker { id imageUrl } user { id name } }
      }
      ... on FollowNotificationNode { id createdAt $_user }
      ... on WorkAwardNotificationNode { id createdAt message $_work }
      ... on LikedWorksSummaryNotificationNode { id createdAt message }
    }
  }
}''';

  static Future<List<NotificationItem>> list(Map<String, dynamic> where, int offset, int limit) async {
    final data = await Api.query(_list, variables: {'offset': offset, 'limit': limit, 'where': where});
    final items = (data.obj('viewer')?.list('notifications') ?? const <Map<String, dynamic>>[])
        .map(NotificationItem.fromJson)
        .whereType<NotificationItem>()
        .toList();
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  }

  static Future<UnreadCounts> unreadCounts() async {
    final data = await Api.query(r'''
query AppUnreadNotificationCounts {
  viewer {
    id
    unreadNotificationCounts { liked comment reply follow award message moderation }
  }
}''');
    final counts = UnreadCounts.fromJson(data.obj('viewer')?.obj('unreadNotificationCounts'));
    unread.value = counts.total;
    return counts;
  }

  static Future<void> markAsRead() async {
    await Api.mutate(r'''
mutation AppMarkNotificationsAsRead {
  markNotificationsAsRead
}''');
    unread.value = 0;
  }

  static Future<void> hide(String id) async {
    await Api.mutate(r'''
mutation AppHideNotification($id: ID!) {
  hideNotification(id: $id)
}''', variables: {'id': id});
  }

  static Future<void> reply(String commentId, String text) async {
    await Api.mutate(r'''
mutation AppNotificationReply($input: CreateResponseCommentInput!) {
  createResponseComment(input: $input) { id }
}''', variables: {
      'input': {'commentId': commentId, 'text': text},
    });
  }

  static Future<List<SupportMessage>> messages(int offset, int limit) async {
    final data = await Api.query(r'''
query AppSupportMessages($offset: Int!, $limit: Int!) {
  viewer {
    id
    user { id }
    supportMessages(offset: $offset, limit: $limit) {
      id
      text
      createdAt
      user { id }
    }
  }
}''', variables: {'offset': offset, 'limit': limit});
    final viewer = data.obj('viewer');
    final me = viewer?.obj('user')?.str('id');
    return (viewer?.list('supportMessages') ?? const <Map<String, dynamic>>[])
        .map((m) => SupportMessage(
              id: m.str('id'),
              text: m.str('text'),
              createdAt: m.integer('createdAt'),
              isFromTeam: m.obj('user')?.str('id') != me,
            ))
        .toList();
  }
}
