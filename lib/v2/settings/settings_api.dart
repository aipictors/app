import 'dart:typed_data';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:http/http.dart' as http;

/// 公開画像のアップロード先（Web の VITE_WORKERS_UPLOADER）
const _uploaderUrl = 'https://uploader.aipictors.com/';

class ProfileForm {
  ProfileForm({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.headerUrl,
    required this.biography,
    required this.enBiography,
    required this.website,
    required this.mail,
    required this.twitter,
    required this.instagram,
    required this.github,
    required this.featuredIds,
    required this.featuredSensitiveIds,
    required this.thankYou,
    required this.frame,
  });

  final String id;
  final String name;
  final String? iconUrl;
  final String? headerUrl;
  final String biography;
  final String enBiography;
  final String website;
  final String mail;
  final String twitter;
  final String instagram;
  final String github;

  /// ピックアップはこの画面で変えないが、Web と同じくそのまま送り返す
  final List<String> featuredIds;
  final List<String> featuredSensitiveIds;
  final String thankYou;
  final AvatarFrame? frame;
}

class SupportedComment {
  const SupportedComment({
    required this.id,
    required this.createdAt,
    required this.text,
    required this.user,
    required this.workId,
    required this.workTitle,
    required this.workThumbnail,
    required this.isAdult,
    required this.stickerUrl,
    required this.coins,
  });

  final String id;
  final int createdAt;
  final String text;
  final UserSummary? user;
  final String? workId;
  final String workTitle;
  final String? workThumbnail;
  final bool isAdult;
  final String? stickerUrl;
  final int coins;
}

class SettingsApi {
  SettingsApi._();

  static const _profile = '''
query AppProfileForm {
  viewer {
    id
    user {
      id
      name
      iconUrl
      headerImageUrl
      biography
      enBiography
      siteURL
      mailAddress
      twitterAccountId
      instagramAccountId
      githubAccountId
      $avatarFrameFields
      featuredWorks { id }
      featuredSensitiveWorks { id }
    }
  }
  userSetting { id supportThankYouMessage }
}''';

  static Future<ProfileForm> profile() async {
    final data = await Api.query(_profile);
    final u = data.obj('viewer')?.obj('user');
    if (u == null) throw ApiException('ユーザー情報を取得できませんでした');
    return ProfileForm(
      id: u.str('id'),
      name: u.str('name'),
      iconUrl: u.strOrNull('iconUrl'),
      headerUrl: u.strOrNull('headerImageUrl'),
      biography: u.str('biography'),
      enBiography: u.str('enBiography'),
      website: u.str('siteURL'),
      mail: u.str('mailAddress'),
      twitter: u.str('twitterAccountId'),
      instagram: u.str('instagramAccountId'),
      github: u.str('githubAccountId'),
      featuredIds: u.list('featuredWorks').map((w) => w.str('id')).toList(),
      featuredSensitiveIds: u.list('featuredSensitiveWorks').map((w) => w.str('id')).toList(),
      thankYou: data.obj('userSetting')?.str('supportThankYouMessage') ?? '',
      frame: AvatarFrame.fromJson(u.obj('avatarFrame')),
    );
  }

  static Future<void> updateProfile(Map<String, dynamic> input) async {
    await Api.mutate(r'''
mutation AppUpdateUserProfile($input: UpdateUserProfileInput!) {
  updateUserProfile(input: $input) { id }
}''', variables: {'input': input});
    Api.clearCache();
  }

  /// 画像を上げて URL を返す（Web の uploadPublicImage と同じ）
  static Future<String> uploadImage(Uint8List bytes, String contentType) async {
    final data = await Api.query(r'''
query AppViewerToken {
  viewer { id token }
}''');
    final token = data.obj('viewer')?.strOrNull('token');
    if (token == null) throw ApiException('ログイン情報を取得できませんでした。ログインし直してください');
    final http.Response res;
    try {
      res = await http
          .put(Uri.parse(_uploaderUrl), headers: {'Authorization': 'Bearer $token', 'Content-Type': contentType}, body: bytes)
          .timeout(const Duration(seconds: 45));
    } catch (_) {
      throw ApiException('画像をアップロードできませんでした。通信を確認してください');
    }
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw ApiException('画像をアップロードできませんでした（${res.statusCode}）');
    }
    final match = RegExp(r'"url"\s*:\s*"([^"]+)"').firstMatch(res.body);
    final url = match?.group(1)?.replaceAll(r'\/', '/');
    if (url == null) throw ApiException('画像をアップロードできませんでした');
    return url;
  }

  static Future<Map<String, dynamic>> userSetting() async {
    final data = await Api.query(r'''
query AppUserSetting {
  userSetting {
    id
    preferenceRating
    isNotifyComment
    isAnonymousLikeAllAges
    isShowingMutedUsersWorks
    isShowingMutedUsersComments
  }
  viewer {
    id
    isBlurSensitiveImage
    user { id fcmToken }
  }
}''');
    return data;
  }

  /// 一覧の R15 の表示を、Web と同じ設定に合わせる
  static Future<void> loadContentFilter() async {
    try {
      final data = await Api.query(r'''
query AppPreferenceRating {
  userSetting { id preferenceRating }
}''');
      AppContentFilter.showR15 = data.obj('userSetting')?.str('preferenceRating') != 'G';
    } catch (_) {
      // 読めないときは今のまま
    }
  }

  static Future<void> updateSetting(Map<String, dynamic> input) async {
    await Api.mutate(r'''
mutation AppUpdateUserSetting($input: UpdateUserSettingInput!) {
  updateUserSetting(input: $input) { id }
}''', variables: {'input': input});
    Api.clearCache();
  }

  static Future<void> updateFcmToken(String? token) async {
    await Api.mutate(r'''
mutation AppUpdateAccountFcmToken($input: UpdateAccountFcmTokenInput!) {
  updateAccountFcmToken(input: $input) { id }
}''', variables: {
      'input': {'token': token},
    });
  }

  static Future<Map<String, dynamic>?> viewerAccount() async {
    final data = await Api.query(r'''
query AppViewerAccount {
  viewer { id user { id login } }
}''');
    return data.obj('viewer')?.obj('user');
  }

  static Future<void> updateLogin(String login) async {
    await Api.mutate(r'''
mutation AppUpdateAccountLogin($input: UpdateAccountLoginInput!) {
  updateAccountLogin(input: $input) { id login }
}''', variables: {
      'input': {'login': login},
    });
  }

  static Future<void> updatePassword(String current, String next) async {
    await Api.mutate(r'''
mutation AppUpdateAccountPassword($input: UpdateAccountPasswordInput!) {
  updateAccountPassword(input: $input) { id }
}''', variables: {
      'input': {'currentPassword': current, 'newPassword': next},
    });
  }

  static const _users = '''
query AppViewerUsers(\$offset: Int!, \$limit: Int!) {
  viewer {
    id
    mutedUsers(offset: \$offset, limit: \$limit) { $userSummaryFields }
  }
}''';

  static const _blocked = '''
query AppViewerBlockedUsers(\$offset: Int!, \$limit: Int!) {
  viewer {
    id
    blockedUsers(offset: \$offset, limit: \$limit) { $userSummaryFields }
  }
}''';

  static Future<List<UserSummary>> mutedUsers(int offset, int limit) async {
    final data = await Api.query(_users, variables: {'offset': offset, 'limit': limit});
    return (data.obj('viewer')?.list('mutedUsers') ?? const <Map<String, dynamic>>[]).map(UserSummary.fromJson).toList();
  }

  static Future<List<UserSummary>> blockedUsers(int offset, int limit) async {
    final data = await Api.query(_blocked, variables: {'offset': offset, 'limit': limit});
    return (data.obj('viewer')?.list('blockedUsers') ?? const <Map<String, dynamic>>[]).map(UserSummary.fromJson).toList();
  }

  static Future<List<String>> mutedTags(int offset, int limit) async {
    final data = await Api.query(r'''
query AppViewerMutedTags($offset: Int!, $limit: Int!) {
  viewer { id mutedTags(offset: $offset, limit: $limit) { id name } }
}''', variables: {'offset': offset, 'limit': limit});
    return (data.obj('viewer')?.list('mutedTags') ?? const <Map<String, dynamic>>[]).map((t) => t.str('name')).toList();
  }

  static Future<List<String>> followedTags(int offset, int limit) async {
    final data = await Api.query(r'''
query AppViewerFollowedTags($offset: Int!, $limit: Int!) {
  viewer { id followingTags(offset: $offset, limit: $limit) { id name } }
}''', variables: {'offset': offset, 'limit': limit});
    return (data.obj('viewer')?.list('followingTags') ?? const <Map<String, dynamic>>[]).map((t) => t.str('name')).toList();
  }

  static Future<void> muteTag(String name, bool mute) async {
    await Api.mutate(
      mute
          ? r'''
mutation AppMuteTag($input: MuteTagInput!) {
  muteTag(input: $input) { id }
}'''
          : r'''
mutation AppUnmuteTag($input: UnmuteTagInput!) {
  unmuteTag(input: $input) { id }
}''',
      variables: {
        'input': {'tagName': name},
      },
    );
  }

  static Future<void> followTag(String name, bool follow) async {
    await Api.mutate(
      follow
          ? r'''
mutation AppFollowTag($input: FollowTagInput!) {
  followTag(input: $input)
}'''
          : r'''
mutation AppUnfollowTag($input: UnfollowTagInput!) {
  unfollowTag(input: $input)
}''',
      variables: {
        'input': {'tagName': name},
      },
    );
  }

  static const _received = '''
query AppReceivedSupport(\$offset: Int!, \$limit: Int!) {
  receivedWorkComments(offset: \$offset, limit: \$limit, onlySupportAttached: true) {
    id
    createdAt
    text
    user { $userSummaryFields }
    work { id title rating smallThumbnailImageURL }
    sticker { id imageUrl }
    support { freeCoinAmount premiumCoinAmount totalPt }
  }
}''';

  static Future<List<SupportedComment>> receivedSupport(int offset, int limit) async {
    final data = await Api.query(_received, variables: {'offset': offset, 'limit': limit});
    return data.list('receivedWorkComments').map((c) {
      final w = c.obj('work');
      final s = c.obj('support');
      final rating = w?.str('rating') ?? '';
      return SupportedComment(
        id: c.str('id'),
        createdAt: c.integer('createdAt'),
        text: c.str('text'),
        user: c.obj('user') == null ? null : UserSummary.fromJson(c.obj('user')!),
        workId: w?.strOrNull('id'),
        workTitle: w?.str('title') ?? '',
        workThumbnail: w?.strOrNull('smallThumbnailImageURL'),
        isAdult: rating == 'R18' || rating == 'R18G',
        stickerUrl: c.obj('sticker')?.strOrNull('imageUrl'),
        coins: s == null ? 0 : s.integer('freeCoinAmount') + s.integer('premiumCoinAmount'),
      );
    }).toList();
  }

  static Future<Map<String, dynamic>?> viewerStatus() async {
    final data = await Api.query(r'''
query AppViewerUserStatus {
  viewerUserStatus { text isVisible expiresAt }
}''');
    return data.obj('viewerUserStatus');
  }

  static Future<void> updateStatus({required String text, required bool isVisible, required int? expiresAt}) async {
    await Api.mutate(r'''
mutation AppUpdateUserStatus($input: UpdateUserStatusInput!) {
  updateUserStatus(input: $input) { text isVisible expiresAt }
}''', variables: {
      'input': {'text': text, 'isVisible': isVisible, 'expiresAt': expiresAt},
    });
    Api.clearCache();
  }
}
