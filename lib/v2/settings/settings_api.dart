import 'dart:typed_data';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
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
    required this.featured,
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

  /// ピックアップ（全年齢）。Web の /settings/profile と同じく 3 つまで
  final List<PickupWork> featured;

  /// センシティブのピックアップはアプリで選ばないので、そのまま送り返す
  final List<String> featuredSensitiveIds;
  final String thankYou;
  final AvatarFrame? frame;
}

/// ピックアップに選ぶ作品（Web の DialogWork）
class PickupWork {
  const PickupWork({required this.id, required this.title, required this.thumbnailUrl});

  factory PickupWork.fromJson(Map<String, dynamic> j) =>
      PickupWork(id: j.str('id'), title: j.str('title'), thumbnailUrl: j.strOrNull('smallThumbnailImageURL'));

  final String id;
  final String title;
  final String? thumbnailUrl;
}

/// 受け取った推しの 1 件（Web の ReceivedTransferHistoryItem）
class SupportTransfer {
  const SupportTransfer({required this.isPremium, required this.coins, required this.pt, required this.createdAt});

  factory SupportTransfer.fromJson(Map<String, dynamic> j) => SupportTransfer(
        isPremium: j['coinType'] == 'PREMIUM',
        coins: _num(j['coinAmount']),
        pt: _num(j['ptAmount']),
        createdAt: _num(j['createdAt']),
      );

  final bool isPremium;
  final int coins;
  final int pt;
  final int createdAt;
}

/// API は数を文字列で返すことがある
int _num(Object? v) => v is num ? v.toInt() : int.tryParse('${v ?? ''}') ?? double.tryParse('${v ?? ''}')?.toInt() ?? 0;

/// 受け取った推しの累計（Web の /api/coins/support/summary/:userId）
class SupportReceivedSummary {
  const SupportReceivedSummary({
    required this.totalPt,
    required this.totalCoins,
    required this.freePt,
    required this.freeCoins,
    required this.premiumPt,
    required this.premiumCoins,
    required this.recent,
  });

  factory SupportReceivedSummary.fromJson(Map<String, dynamic> j) => SupportReceivedSummary(
        totalPt: _num(j['cumulativeReceivedPt']),
        totalCoins: _num(j['cumulativeReceivedCoins']),
        freePt: _num(j['cumulativeReceivedFreePt']),
        freeCoins: _num(j['cumulativeReceivedFreeCoins']),
        premiumPt: _num(j['cumulativeReceivedPremiumPt']),
        premiumCoins: _num(j['cumulativeReceivedPremiumCoins']),
        recent: (j['recentReceivedTransfers'] is List ? j['recentReceivedTransfers'] as List : const []).whereType<Map<String, dynamic>>().map(SupportTransfer.fromJson).toList(),
      );

  final int totalPt;
  final int totalCoins;
  final int freePt;
  final int freeCoins;
  final int premiumPt;
  final int premiumCoins;
  final List<SupportTransfer> recent;
}

/// 日本時間の日時（Web と同じ 2026/11/24 12:34）
String formatJstDateTime(int unixSeconds) {
  final d = DateTime.fromMillisecondsSinceEpoch(unixSeconds * 1000, isUtc: true).add(const Duration(hours: 9));
  String two(int v) => v.toString().padLeft(2, '0');
  return '${d.year}/${two(d.month)}/${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
}

class SettingsApi {
  SettingsApi._();

  static Future<SupportReceivedSummary> supportReceivedSummary() async {
    final user = await viewerAccount();
    final id = user?.str('id') ?? '';
    if (id.isEmpty) throw const ApiException('ログインしてください');
    final data = await GenApi.webGet('/api/coins/support/summary/${Uri.encodeComponent(id)}');
    if (data == null) throw const ApiException('受け取り集計の読み込みに失敗しました');
    return SupportReceivedSummary.fromJson(data);
  }

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
      featuredWorks { id title smallThumbnailImageURL }
      featuredSensitiveWorks { id }
    }
  }
  userSetting { id supportThankYouMessage }
}''';

  static Future<ProfileForm> profile() async {
    final data = await Api.query(_profile);
    final u = data.obj('viewer')?.obj('user');
    if (u == null) throw const ApiException('ユーザー情報を取得できませんでした');
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
      featured: u.list('featuredWorks').map(PickupWork.fromJson).where((w) => w.id.isNotEmpty).toList(),
      featuredSensitiveIds: u.list('featuredSensitiveWorks').map((w) => w.str('id')).toList(),
      thankYou: data.obj('userSetting')?.str('supportThankYouMessage') ?? '',
      frame: AvatarFrame.fromJson(u.obj('avatarFrame')),
    );
  }

  /// ピックアップに選べる自分の作品（Web の SelectCreatedWorksDialog と同じ条件、新しい順）
  static Future<List<PickupWork>> pickupCandidates(String userId, int offset, int limit) async {
    final data = await Api.query(r'''
query AppPickupCandidates($offset: Int!, $limit: Int!, $where: WorksWhereInput) {
  works(offset: $offset, limit: $limit, where: $where) { id title smallThumbnailImageURL }
}''', variables: {
      'offset': offset,
      'limit': limit,
      'where': {
        'userId': userId,
        'orderBy': 'DATE_CREATED',
        'sort': 'DESC',
        'ratings': AppContentFilter.showR15 ? appRatings : const ['G'],
        // 投稿から 24 時間以内の作品も選べるように（省略すると API は 24 時間より前だけ返す）
        'isNowCreatedAt': true,
      },
    });
    return data.list('works').map(PickupWork.fromJson).where((w) => w.id.isNotEmpty).toList();
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
    if (token == null) throw const ApiException('ログイン情報を取得できませんでした。ログインし直してください');
    final http.Response res;
    try {
      res = await http
          .put(Uri.parse(_uploaderUrl), headers: {'Authorization': 'Bearer $token', 'Content-Type': contentType}, body: bytes)
          .timeout(const Duration(seconds: 45));
    } catch (_) {
      throw const ApiException('画像をアップロードできませんでした。通信を確認してください');
    }
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw ApiException('画像をアップロードできませんでした（${res.statusCode}）');
    }
    final match = RegExp(r'"url"\s*:\s*"([^"]+)"').firstMatch(res.body);
    final url = match?.group(1)?.replaceAll(r'\/', '/');
    if (url == null) throw const ApiException('画像をアップロードできませんでした');
    return url;
  }

  static Future<Map<String, dynamic>> userSetting() async {
    final data = await Api.query(r'''
query AppUserSetting {
  userSetting {
    id
    preferenceRating
    isNotifyComment
    isNotifyLike
    isNotifyAnonymousLike
    isAnonymousLikeAllAges
    isAnonymousLikeR15
    isHideDefaultStickers
    isShowLegacyDefaultStickers
    isRejectCoinSupport
    isRejectPremiumCoinSupport
    isRejectFreeCoinSupportReceive
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

  /// ピックアップ（全年齢）だけ変える。プロフィールの画面からその場で選んだとき（ほかの欄は送らないので変わらない）
  static Future<void> updatePickups(List<String> workIds) => updateProfile({'featuredWorkIds': workIds});

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
