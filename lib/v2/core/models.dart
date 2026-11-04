import 'package:aipictors/v2/core/api.dart';

/// ユーザーの枠の項目。ユーザーを取る GraphQL には必ず入れる
const avatarFrameFields = 'avatarFrame { frameType backgroundStyle borderPadding overlayImageUrl }';

/// アイコンと名前を出すのに要るユーザーの項目（[UserSummary] がこれを読む）
const userSummaryFields = 'id login name iconUrl isOfficial isModerator $avatarFrameFields';

/// 一覧で使う作品の項目（Web の PhotoAlbumWork とほぼ同じ）
const workCardFields = '''
  id
  title
  type
  rating
  isLiked
  likesCount
  commentsCount
  viewsCount
  createdAt
  subWorksCount
  isGeneration
  largeThumbnailImageURL
  largeThumbnailImageWidth
  largeThumbnailImageHeight
  smallThumbnailImageURL
  smallThumbnailImageWidth
  smallThumbnailImageHeight
  user { $userSummaryFields }
''';

/// アプリで見せる年齢区分（R18 はアプリでは出さない）
const appRatings = ['G', 'R15'];

/// ユーザーのアイコン枠（Web の UserAvatarFramePresentation）
class AvatarFrame {
  const AvatarFrame({
    required this.frameType,
    this.backgroundStyle,
    this.borderPadding = 3,
    this.overlayImageUrl,
  });

  static const typeDecoration = 'DECORATION';
  static const typeRainbow = 'ANIMATED_RAINBOW';
  static const typeAurora = 'AURORA';
  static const typePearl = 'PEARL_SHINE';
  static const typeStarlight = 'STARLIGHT';

  /// 枠の画像は Web の public に置かれていて、/avatar-frames/... の形で来る
  static const _webOrigin = 'https://www.aipictors.com';

  final String frameType;
  final String? backgroundStyle;
  final int borderPadding;
  final String? overlayImageUrl;

  bool get isDecoration => frameType == typeDecoration;

  /// 光が横切る種類
  bool get hasGloss => const {typeRainbow, typeAurora, typePearl, typeStarlight, 'DECORATED', 'GRADIENT'}.contains(frameType);

  /// 重ねる画像の絶対 URL
  String? get overlayUrl {
    final u = overlayImageUrl;
    if (u == null || u.isEmpty) return null;
    return u.startsWith('/') ? '$_webOrigin$u' : u;
  }

  /// 止まった絵（deco/x.webp）の URL から動く絵（deco/x.anim.webp）の URL を作る
  static String animatedDecorationUrl(String url) => url.replaceFirst(RegExp(r'\.webp(?=$|\?)'), '.anim.webp');

  static AvatarFrame? fromJson(Map<String, dynamic>? j) {
    if (j == null) return null;
    return AvatarFrame(
      frameType: j.str('frameType', 'GRADIENT'),
      backgroundStyle: j.strOrNull('backgroundStyle'),
      borderPadding: j.integer('borderPadding', 3),
      overlayImageUrl: j.strOrNull('overlayImageUrl'),
    );
  }
}

class UserSummary {
  const UserSummary({
    required this.id,
    required this.login,
    required this.name,
    required this.iconUrl,
    this.isOfficial = false,
    this.isModerator = false,
    this.avatarFrame,
  });

  final String id;
  final String login;
  final String name;
  final String? iconUrl;
  final bool isOfficial;
  final bool isModerator;
  final AvatarFrame? avatarFrame;

  factory UserSummary.fromJson(Map<String, dynamic> j) => UserSummary(
        id: j.str('id'),
        login: j.str('login'),
        name: j.str('name', j.str('login')),
        iconUrl: j.strOrNull('iconUrl'),
        isOfficial: j.boolean('isOfficial'),
        isModerator: j.boolean('isModerator'),
        avatarFrame: AvatarFrame.fromJson(j.obj('avatarFrame')),
      );

  static const empty = UserSummary(id: '', login: '', name: '', iconUrl: null);
}

class WorkSummary {
  WorkSummary({
    required this.id,
    required this.title,
    required this.type,
    required this.rating,
    required this.isLiked,
    required this.likesCount,
    required this.commentsCount,
    required this.viewsCount,
    required this.createdAt,
    required this.subWorksCount,
    required this.isGeneration,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.user,
  });

  final String id;
  final String title;
  final String type;
  final String rating;
  bool isLiked;
  int likesCount;
  final int commentsCount;
  final int viewsCount;
  final int createdAt;
  final int subWorksCount;
  final bool isGeneration;
  final String imageUrl;
  final int width;
  final int height;
  final UserSummary user;

  double get aspect {
    if (width <= 0 || height <= 0) return 1;
    return (width / height).clamp(0.45, 2.2);
  }

  bool get isVideo => type == 'VIDEO';

  bool get isNovel => type == 'NOVEL' || type == 'COLUMN';

  factory WorkSummary.fromJson(Map<String, dynamic> j) {
    final large = j.strOrNull('largeThumbnailImageURL');
    return WorkSummary(
      id: j.str('id'),
      title: j.str('title'),
      type: j.str('type', 'WORK'),
      rating: j.str('rating', 'G'),
      isLiked: j.boolean('isLiked'),
      likesCount: j.integer('likesCount'),
      commentsCount: j.integer('commentsCount'),
      viewsCount: j.integer('viewsCount'),
      createdAt: j.integer('createdAt'),
      subWorksCount: j.integer('subWorksCount'),
      isGeneration: j.boolean('isGeneration'),
      imageUrl: large ?? j.str('smallThumbnailImageURL'),
      width: large != null ? j.integer('largeThumbnailImageWidth') : j.integer('smallThumbnailImageWidth'),
      height: large != null ? j.integer('largeThumbnailImageHeight') : j.integer('smallThumbnailImageHeight'),
      user: j.obj('user') != null ? UserSummary.fromJson(j.obj('user')!) : UserSummary.empty,
    );
  }

  static List<WorkSummary> listFrom(List<Map<String, dynamic>> items) => items
      .map(WorkSummary.fromJson)
      .where((w) => w.id.isNotEmpty && w.imageUrl.isNotEmpty && w.rating != 'R18' && w.rating != 'R18G')
      .toList();
}
