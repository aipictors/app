import 'package:aipictors/v2/core/api.dart';

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
  user {
    id
    login
    name
    iconUrl
  }
''';

/// アプリで見せる年齢区分（R18 はアプリでは出さない）
const appRatings = ['G', 'R15'];

class UserSummary {
  const UserSummary({
    required this.id,
    required this.login,
    required this.name,
    required this.iconUrl,
  });

  final String id;
  final String login;
  final String name;
  final String? iconUrl;

  factory UserSummary.fromJson(Map<String, dynamic> j) => UserSummary(
        id: j.str('id'),
        login: j.str('login'),
        name: j.str('name', j.str('login')),
        iconUrl: j.strOrNull('iconUrl'),
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
