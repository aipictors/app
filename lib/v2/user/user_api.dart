import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// ユーザーのページで使う GraphQL（Web と同じもの）

class UserProfile {
  UserProfile({
    required this.id,
    required this.login,
    required this.name,
    required this.iconUrl,
    required this.headerImageUrl,
    required this.biography,
    required this.followCount,
    required this.followersCount,
    required this.worksCount,
    required this.receivedLikesCount,
    required this.awardsCount,
    required this.albumCount,
    required this.isFollowee,
    required this.isFollower,
    required this.isMuted,
    required this.isBlocked,
    required this.isModerator,
    required this.twitter,
    required this.instagram,
    required this.github,
    required this.siteUrl,
    required this.passType,
    required this.counts,
    required this.featured,
  });

  final String id;
  final String login;
  final String name;
  final String? iconUrl;
  final String? headerImageUrl;
  final String biography;
  final int followCount;
  int followersCount;
  final int worksCount;
  final int receivedLikesCount;
  final int awardsCount;
  final int albumCount;
  bool isFollowee;
  final bool isFollower;
  bool isMuted;
  bool isBlocked;
  final bool isModerator;
  final String? twitter;
  final String? instagram;
  final String? github;
  final String? siteUrl;
  final String? passType;

  /// 種類ごとの作品数（全年齢・R15 のみ）
  final Map<String, int> counts;

  /// ピックアップ作品
  final List<WorkSummary> featured;

  factory UserProfile.fromJson(Map<String, dynamic> u, Map<String, dynamic> data) {
    String? clean(String? s) => s == null || s.trim().isEmpty ? null : s.trim();
    return UserProfile(
      id: u.str('id'),
      login: u.str('login'),
      name: u.str('name').isEmpty ? u.str('login') : u.str('name'),
      iconUrl: clean(u.strOrNull('iconUrl')),
      headerImageUrl: clean(u.strOrNull('headerImageUrl')),
      biography: u.str('biography').trim(),
      followCount: u.integer('followCount').clamp(0, 1 << 31),
      followersCount: u.integer('followersCount').clamp(0, 1 << 31),
      worksCount: u.integer('worksCount'),
      receivedLikesCount: u.integer('receivedLikesCount'),
      awardsCount: u.integer('awardsCount'),
      albumCount: u.integer('albumCount'),
      isFollowee: u.boolean('isFollowee'),
      isFollower: u.boolean('isFollower'),
      isMuted: u.boolean('isMuted'),
      isBlocked: u.boolean('isBlocked'),
      isModerator: u.boolean('isModerator'),
      twitter: clean(u.strOrNull('twitterAccountId')),
      instagram: clean(u.strOrNull('instagramAccountId')),
      github: clean(u.strOrNull('githubAccountId')),
      siteUrl: clean(u.strOrNull('siteURL')),
      passType: u.obj('pass')?.strOrNull('type'),
      counts: {
        'WORK': data.integer('imageWorksCount'),
        'NOVEL': data.integer('novelWorksCount'),
        'VIDEO': data.integer('videoWorksCount'),
        'COLUMN': data.integer('columnWorksCount'),
      },
      featured: WorkSummary.listFrom(u.list('featuredWorks')),
    );
  }

  int get safeWorksCount => counts.values.fold(0, (a, b) => a + b);
}

class AlbumSummary {
  const AlbumSummary({required this.id, required this.title, required this.thumbnailUrl, required this.worksCount});

  final String id;
  final String title;
  final String? thumbnailUrl;
  final int worksCount;
}

/// フォロー一覧などの 1 行
class UserRowData {
  UserRowData({
    required this.id,
    required this.login,
    required this.name,
    required this.iconUrl,
    required this.biography,
    required this.isFollowee,
    required this.works,
  });

  final String id;
  final String login;
  final String name;
  final String? iconUrl;
  final String biography;
  bool isFollowee;
  final List<WorkSummary> works;

  factory UserRowData.fromJson(Map<String, dynamic> u) => UserRowData(
        id: u.str('id'),
        login: u.str('login'),
        name: u.str('name').isEmpty ? u.str('login') : u.str('name'),
        iconUrl: u.strOrNull('iconUrl'),
        biography: u.str('biography').replaceAll(RegExp(r'\s+'), ' ').trim(),
        isFollowee: u.boolean('isFollowee'),
        works: WorkSummary.listFrom(u.list('works')),
      );
}

enum ReportReasonItem {
  unauthorizedRepost('UNAUTHORIZED_REPOST', '無断転載している'),
  privacy('PRIVACY_VIOLATION', 'プライバシーまたは肖像権を侵害している'),
  commercial('COMMERCIAL_CONTENT', '広告・宣伝・勧誘を目的としている'),
  illegal('ILLEGAL_CONTENT', '禁止されているコンテンツへ誘導している'),
  ageMismatch('AGE_MISMATCH', '対象年齢が異なる（過度な性的表現など）'),
  gore('EXCESSIVE_GORE', '過度なグロテスク表現がある'),
  other('OTHER', 'その他（迷惑行為・なりすましなど）');

  const ReportReasonItem(this.value, this.label);

  final String value;
  final String label;
}

class UserApi {
  UserApi._();

  static const _userRowFields = '''
    id
    login
    name
    iconUrl
    biography
    isFollowee
''';

  static const _user = '''
query User(\$userId: ID!) {
  user(id: \$userId) {
    id
    login
    name
    iconUrl
    headerImageUrl
    biography
    isModerator
    isFollowee
    isFollower
    isMuted
    isBlocked
    followCount
    followersCount
    worksCount
    receivedLikesCount
    awardsCount
    albumCount(where: { isSensitive: false })
    twitterAccountId
    instagramAccountId
    githubAccountId
    siteURL
    pass {
      id
      type
    }
    featuredWorks {
      $workCardFields
    }
  }
}''';

  static const _counts = r'''
query UserWorksCounts($userId: ID!) {
  imageWorksCount: worksCount(where: { userId: $userId, workType: WORK, ratings: [G, R15] })
  novelWorksCount: worksCount(where: { userId: $userId, workType: NOVEL, ratings: [G, R15] })
  videoWorksCount: worksCount(where: { userId: $userId, workType: VIDEO, ratings: [G, R15] })
  columnWorksCount: worksCount(where: { userId: $userId, workType: COLUMN, ratings: [G, R15] })
}''';

  /// [idOrLogin] は数字の ID でもログイン名でもよい
  static Future<UserProfile?> profile(String idOrLogin) async {
    final data = await Api.query(_user, variables: {'userId': idOrLogin});
    final u = data.obj('user');
    if (u == null) return null;
    final counts = await Api.query(_counts, variables: {'userId': u.str('id')}, cacheFor: const Duration(minutes: 2));
    return UserProfile.fromJson(u, counts);
  }

  static const _works = '''
query UserWorks(\$offset: Int!, \$limit: Int!, \$where: WorksWhereInput) {
  works(offset: \$offset, limit: \$limit, where: \$where) {
    $workCardFields
  }
}''';

  static Future<List<WorkSummary>> works(String userId, {String? workType, String orderBy = 'DATE_CREATED', required int offset, required int limit}) async {
    final data = await Api.query(_works, variables: {
      'offset': offset,
      'limit': limit,
      'where': {
        'userId': userId,
        'ratings': appRatings,
        'orderBy': orderBy,
        'sort': 'DESC',
        if (workType != null) 'workType': workType,
      },
    });
    return WorkSummary.listFrom(data.list('works'));
  }

  static const _albums = r'''
query UserAlbums($userId: ID!, $offset: Int!, $limit: Int!) {
  user(id: $userId) {
    id
    albums(offset: $offset, limit: $limit, where: { isSensitive: false }) {
      id
      title
      rating
      thumbnailImageURL
      worksCount
    }
  }
}''';

  static Future<List<AlbumSummary>> albums(String userId, int offset, int limit) async {
    final data = await Api.query(_albums, variables: {'userId': userId, 'offset': offset, 'limit': limit});
    return (data.obj('user')?.list('albums') ?? const [])
        .where((a) => a.str('rating') != 'R18' && a.str('rating') != 'R18G')
        .map((a) => AlbumSummary(
              id: a.str('id'),
              title: a.str('title'),
              thumbnailUrl: a.strOrNull('thumbnailImageURL'),
              worksCount: a.integer('worksCount'),
            ))
        .toList();
  }

  static const _albumWorks = '''
query AlbumWorks(\$albumId: ID!, \$offset: Int!, \$limit: Int!) {
  album(id: \$albumId) {
    id
    works(offset: \$offset, limit: \$limit) {
      $workCardFields
    }
  }
}''';

  static Future<List<WorkSummary>> albumWorks(String albumId, int offset, int limit) async {
    final data = await Api.query(_albumWorks, variables: {'albumId': albumId, 'offset': offset, 'limit': limit});
    return WorkSummary.listFrom(data.obj('album')?.list('works') ?? const []);
  }

  static const _followees = '''
query UserFollowees(\$userId: ID!, \$offset: Int!, \$limit: Int!) {
  user(id: \$userId) {
    id
    followees(offset: \$offset, limit: \$limit) {
      $_userRowFields
      works(offset: 0, limit: 4, where: { ratings: [G, R15] }) {
        $workCardFields
      }
    }
  }
}''';

  static const _followers = '''
query UserFollowers(\$userId: ID!, \$offset: Int!, \$limit: Int!) {
  user(id: \$userId) {
    id
    followers(offset: \$offset, limit: \$limit) {
      $_userRowFields
      works(offset: 0, limit: 4, where: { ratings: [G, R15] }) {
        $workCardFields
      }
    }
  }
}''';

  static Future<List<UserRowData>> followees(String userId, int offset, int limit) async {
    final data = await Api.query(_followees, variables: {'userId': userId, 'offset': offset, 'limit': limit});
    return (data.obj('user')?.list('followees') ?? const []).map(UserRowData.fromJson).toList();
  }

  static Future<List<UserRowData>> followers(String userId, int offset, int limit) async {
    final data = await Api.query(_followers, variables: {'userId': userId, 'offset': offset, 'limit': limit});
    return (data.obj('user')?.list('followers') ?? const []).map(UserRowData.fromJson).toList();
  }

  static const _searchUsers = '''
query SearchUsers(\$offset: Int!, \$limit: Int!, \$where: UsersWhereInput) {
  users(offset: \$offset, limit: \$limit, where: \$where) {
    $_userRowFields
    works(offset: 0, limit: 4, where: { ratings: [G, R15] }) {
      $workCardFields
    }
  }
}''';

  static Future<List<UserRowData>> search(String text, int offset, int limit) async {
    final data = await Api.query(_searchUsers, variables: {
      'offset': offset,
      'limit': limit,
      'where': {'search': text},
    });
    return data.list('users').map(UserRowData.fromJson).toList();
  }

  static Future<void> follow(String userId, bool follow) async {
    if (follow) {
      await Api.mutate(r'''
mutation FollowUser($input: FollowUserInput!) {
  followUser(input: $input) {
    id
    isFollowee
  }
}''', variables: {
        'input': {'userId': userId},
      });
    } else {
      await Api.mutate(r'''
mutation UnfollowUser($input: UnfollowUserInput!) {
  unfollowUser(input: $input) {
    id
    isFollowee
  }
}''', variables: {
        'input': {'userId': userId},
      });
    }
  }

  static Future<void> mute(String userId, bool mute) async {
    await Api.mutate(
      mute
          ? r'''
mutation MuteUser($input: MuteUserInput!) {
  muteUser(input: $input) {
    id
    isMuted
  }
}'''
          : r'''
mutation UnmuteUser($input: UnmuteUserInput!) {
  unmuteUser(input: $input) {
    id
    isMuted
  }
}''',
      variables: {
        'input': {'userId': userId},
      },
    );
  }

  static Future<void> block(String userId, bool block) async {
    await Api.mutate(
      block
          ? r'''
mutation BlockUser($input: BlockUserInput!) {
  blockUser(input: $input) {
    id
    isBlocked
  }
}'''
          : r'''
mutation UnblockUser($input: UnblockUserInput!) {
  unblockUser(input: $input) {
    id
    isBlocked
  }
}''',
      variables: {
        'input': {'userId': userId},
      },
    );
  }

  static Future<void> report(String userId, ReportReasonItem reason) async {
    await Api.mutate(r'''
mutation ReportUser($input: ReportUserInput!) {
  reportUser(input: $input)
}''', variables: {
      'input': {'userId': userId, 'reason': reason.value},
    });
  }

  static String? _viewerId;
  static String? _viewerUid;

  /// ログイン中のユーザーの ID（数字）。ログインしていなければ null
  static Future<String?> viewerId() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    if (_viewerUid == uid && _viewerId != null) return _viewerId;
    try {
      final data = await Api.query(r'''
query ViewerUserId {
  viewer {
    id
    user {
      id
    }
  }
}''');
      _viewerId = data.obj('viewer')?.obj('user')?.strOrNull('id');
      _viewerUid = uid;
    } catch (_) {
      return null;
    }
    return _viewerId;
  }
}
