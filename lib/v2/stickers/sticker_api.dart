import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:flutter/foundation.dart';

const stickerFields = '''
  id title imageUrl accessType genre categories createdAt likesCount usesCount downloadsCount isDownloaded
  user { $userSummaryFields }
''';

const stickerGenres = {'CHARACTER': '人物', 'ANIMAL': '動物', 'MACHINE': '機械', 'BACKGROUND': '背景', 'OBJECT': '物'};

const stickerTags = ['楽しい', '嬉しい', 'お祝い', '悲しい', 'その他'];

/// Web の STICKER_SORTS と同じ
const stickerSorts = <String, Map<String, String>>{
  '新着': {},
  '古い順': {'orderBy': 'DATE_CREATED', 'sort': 'ASC'},
  '人気': {'orderBy': 'DATE_DOWNLOADED', 'sort': 'DESC'},
  'よく使われる': {'orderBy': 'DATE_USED', 'sort': 'DESC'},
};

const stickersPerPage = 42;

class Sticker {
  Sticker(this.json) : isDownloaded = json.boolean('isDownloaded');

  final Map<String, dynamic> json;
  bool isDownloaded;

  String get id => json.str('id');

  String get title => json.str('title');

  String? get imageUrl => json.strOrNull('imageUrl');

  bool get isPublic => json.str('accessType') == 'PUBLIC';

  String get genre => json.str('genre', 'CHARACTER');

  List<String> get categories => (json['categories'] as List? ?? const []).map((c) => c.toString()).toList();

  Map<String, dynamic>? get user => json.obj('user');

  int get usesCount => json.integer('usesCount');

  int get downloadsCount => json.integer('downloadsCount');

  int get likesCount => json.integer('likesCount');
}

class StickerApi {
  StickerApi._();

  /// デバッグの dry run で送るはずだった input
  static Map<String, dynamic>? lastDryRunInput;

  static Future<List<Sticker>> plaza(int offset, int limit, {required Map<String, String> sort, String search = '', String? genre}) async {
    final data = await Api.query('''
query AppStickers(\$offset: Int!, \$limit: Int!, \$where: StickersWhereInput) {
  stickers(offset: \$offset, limit: \$limit, where: \$where) { $stickerFields }
}''', variables: {
      'offset': offset,
      'limit': limit,
      'where': {
        ...sort,
        if (search.isNotEmpty) 'search': search,
        if (genre != null) 'genre': genre,
      },
    });
    return data.list('stickers').map(Sticker.new).toList();
  }

  static Future<Sticker?> detail(String id) async {
    final data = await Api.query('query AppSticker(\$id: ID!) { sticker(id: \$id) { $stickerFields } viewer { id user { id } } }', variables: {'id': id});
    final s = data.obj('sticker');
    return s == null ? null : Sticker(s);
  }

  /// [savedType] は DOWNLOADED / PUBLIC_CREATED / PRIVATE_CREATED
  static Future<List<Sticker>> mine(String savedType, int offset, int limit) async {
    final data = await Api.query('''
query AppMyStickers(\$offset: Int!, \$limit: Int!, \$where: UserStickersWhereInput) {
  viewer { id userStickers(offset: \$offset, limit: \$limit, where: \$where) { $stickerFields } }
}''', variables: {
      'offset': offset,
      'limit': limit,
      'where': {
        'savedTypes': [savedType],
      },
    });
    return (data.obj('viewer')?.list('userStickers') ?? const []).map(Sticker.new).toList();
  }

  static Future<void> addToMine(String id) async {
    await Api.mutate(r'mutation AppAddSticker($input: CreateUserStickerInput!) { createUserSticker(input: $input) { id } }', variables: {
      'input': {'stickerId': id},
    });
  }

  static Future<void> removeFromMine(String id) async {
    await Api.mutate(r'mutation AppRemoveSticker($input: DeleteUserStickerInput!) { deleteUserSticker(input: $input) { id } }', variables: {
      'input': {'stickerId': id},
    });
  }

  static Future<void> deleteOwn(String id) async {
    await Api.mutate(r'mutation AppDeleteSticker($input: DeleteStickerInput!) { deleteSticker(input: $input) { id } }', variables: {
      'input': {'stickerId': id},
    });
  }

  static Future<void> update(String id, {required String access, String? title, String? genre, List<String>? categories}) async {
    await Api.mutate(r'mutation AppUpdateSticker($input: UpdateStickerInput!) { updateSticker(input: $input) { id } }', variables: {
      'input': {
        'stickerId': id,
        'accessType': access,
        if (title != null) 'title': title,
        if (genre != null) 'genre': genre,
        if (categories != null) 'categories': categories,
      },
    });
  }

  /// 512x512 の PNG をアップロードして作る。作った人の一覧にも足す（Web の add-sticker-dialog）
  static Future<void> create(EncodedImage png, {required bool isPublic, String? title, String? genre, String? tag}) async {
    final token = await Uploader.token();
    final url = await Uploader.image(png.bytes, png.mime, token);
    final input = {
      'title': isPublic ? title : null,
      'genre': isPublic ? genre : null,
      'categories': isPublic ? [tag] : null,
      'imageUrl': url,
      'accessType': isPublic ? 'PUBLIC' : 'PRIVATE',
    };
    if (postDryRun) {
      lastDryRunInput = input;
      debugPrint('[sticker dry run] $input size=${png.width}x${png.height} ${png.mime}');
      return;
    }
    final data = await Api.mutate(r'mutation AppCreateSticker($input: CreateStickerInput!) { createSticker(input: $input) { id } }', variables: {'input': input});
    await addToMine(data.obj('createSticker')!.str('id'));
  }
}
