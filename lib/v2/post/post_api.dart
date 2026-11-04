import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Web の config.post.maxImageCount と同じ
const maxPostImages = 200;
const maxPostTags = 10;
const maxTitleLength = 120;
const maxCaptionLength = 3000;

const accessTypeLabels = {
  'PUBLIC': '公開',
  'SILENT': '新着に出さない',
  'LIMITED': 'リンクを知っている人だけ',
  'PRIVATE': '非公開',
  'DRAFT': '下書き',
};

const imageStyleLabels = {'ILLUSTRATION': 'イラスト', 'SEMI_REAL': 'セミリアル', 'REAL': 'リアル'};

/// 投稿フォームの 1 枚。新しく選んだ画像か、投稿済みの画像の URL
class PostImage {
  PostImage.local(EncodedImage this.encoded) : url = null;

  PostImage.remote(String this.url) : encoded = null;

  final EncodedImage? encoded;
  final String? url;

  /// 並べ替えの目印
  late final Object key = Object();
}

class ThemeOption {
  const ThemeOption(this.id, this.title, this.dateText);

  final String id;
  final String title;
  final String dateText;
}

class NamedOption {
  const NamedOption(this.id, this.name);

  final String id;
  final String name;
}

class PostOptions {
  const PostOptions({required this.albums, required this.models, required this.themes, required this.recentTags});

  final List<NamedOption> albums;
  final List<NamedOption> models;
  final List<ThemeOption> themes;
  final List<String> recentTags;
}

/// フォームの入力
class PostDraft {
  String title = '';
  String caption = '';
  List<String> tags = [];
  String accessType = 'PUBLIC';
  String imageStyle = 'ILLUSTRATION';

  /// アプリからは全年齢のみ。編集では元の値を変えない
  String rating = 'G';
  String? albumId;
  String? modelId;
  String? themeId;
  String? relatedUrl;
  DateTime? reservedAt;
  bool isCommentEditable = true;
  bool isTagEditable = true;
  bool publishParams = true;
  bool isBotGradingEnabled = true;
  bool isPromotion = false;
  String prompt = '';
  String negativePrompt = '';
  String seed = '';
  String sampler = '';
  String steps = '';
  String modelName = '';
  String modelHash = '';
  String? pngInfo;

  /// 本文（小説・コラム）
  String workType = 'WORK';
  String body = '';
}

/// 編集のときだけ使う元の値
class EditingWork {
  EditingWork(this.json);

  final Map<String, dynamic> json;

  String get id => json.str('id');

  String? get mdUrl => json.strOrNull('mdUrl');

  List<String> get imageUrls => [
        if (json.strOrNull('imageURL') != null) json.str('imageURL'),
        ...json.list('subWorks').map((s) => s.str('imageUrl')).where((u) => u.isNotEmpty),
      ];
}

class PostApi {
  PostApi._();

  /// デバッグの dry run で最後に送るはずだった input
  static Map<String, dynamic>? lastDryRunInput;

  static Future<PostOptions> options() async {
    final now = DateTime.now();
    String day(DateTime d) => d.toIso8601String().split('T').first;
    final data = await Api.query(r'''
query AppPostOptions($startDate: String, $endDate: String) {
  viewer { id albums(offset: 0, limit: 128) { id title } recentlyUsedTags { id name } }
  aiModels(offset: 0, limit: 124, where: {}) { id name workModelId }
  dailyThemes(limit: 8, offset: 0, where: { startDate: $startDate, endDate: $endDate }) { id title dateText }
}''', variables: {'startDate': day(now), 'endDate': day(now.add(const Duration(days: 7)))});
    final viewer = data.obj('viewer');
    return PostOptions(
      albums: (viewer?.list('albums') ?? const []).map((a) => NamedOption(a.str('id'), a.str('title'))).toList(),
      models: data
          .list('aiModels')
          .where((m) => m.strOrNull('workModelId') != null)
          .map((m) => NamedOption(m.str('workModelId'), m.str('name')))
          .toList(),
      themes: data.list('dailyThemes').map((t) => ThemeOption(t.str('id'), t.str('title'), t.str('dateText'))).toList(),
      recentTags: (viewer?.list('recentlyUsedTags') ?? const []).map((t) => t.str('name')).where((n) => n.isNotEmpty).toList(),
    );
  }

  /// 編集する作品を読む
  static Future<EditingWork?> loadForEdit(String id) async {
    final data = await Api.query(r'''
query AppWorkForEdit($id: ID!) {
  viewer { id user { id } }
  work(id: $id) {
    id title description type rating accessType promptAccessType style
    imageURL imageWidth imageHeight mdUrl
    largeThumbnailImageURL largeThumbnailImageWidth largeThumbnailImageHeight
    smallThumbnailImageURL smallThumbnailImageWidth smallThumbnailImageHeight
    thumbnailImagePosition ogpThumbnailImageUrl
    enTitle enDescription relatedUrl tagNames createdAt
    workModelId model modelHash isTagEditable isCommentsEditable isPromotion
    isBotGradingPublic isBotGradingRankingEnabled
    prompt negativePrompt seed steps sampler strength noise pngInfo
    album { id } dailyTheme { id } subWorks { id imageUrl }
    moderatorReport { id status }
    user { id }
  }
}''', variables: {'id': id});
    final work = data.obj('work');
    if (work == null) return null;
    final viewerId = data.obj('viewer')?.obj('user')?.str('id');
    if (viewerId == null || work.obj('user')?.str('id') != viewerId) {
      throw const ApiException('自分の作品だけ編集できます');
    }
    return EditingWork(work);
  }

  static PostDraft draftFrom(EditingWork e) {
    final w = e.json;
    final reservedSeconds = w.integer('createdAt');
    final reserved = DateTime.fromMillisecondsSinceEpoch(reservedSeconds * 1000);
    return PostDraft()
      ..title = w.str('title')
      ..caption = w.str('description')
      ..tags = (w['tagNames'] as List? ?? const []).map((t) => t.toString()).toList()
      ..accessType = w.str('accessType', 'PUBLIC')
      ..imageStyle = w.str('style', 'ILLUSTRATION')
      ..rating = w.str('rating', 'G')
      ..albumId = w.obj('album')?.strOrNull('id')
      ..modelId = w.strOrNull('workModelId')
      ..themeId = w.obj('dailyTheme')?.strOrNull('id')
      ..relatedUrl = w.strOrNull('relatedUrl')
      ..reservedAt = reserved.isAfter(DateTime.now()) ? reserved : null
      ..isCommentEditable = w.boolean('isCommentsEditable', true)
      ..isTagEditable = w.boolean('isTagEditable', true)
      ..publishParams = w.str('promptAccessType', 'PUBLIC') != 'PRIVATE'
      ..isPromotion = w.boolean('isPromotion')
      ..prompt = w.str('prompt')
      ..negativePrompt = w.str('negativePrompt')
      ..seed = w.str('seed')
      ..sampler = w.str('sampler')
      ..steps = w.str('steps')
      ..modelName = w.str('model')
      ..modelHash = w.str('modelHash')
      ..pngInfo = w.strOrNull('pngInfo')
      ..workType = w.str('type', 'WORK');
  }

  static String? _orNull(String s) => s.trim().isEmpty ? null : s.trim();

  static Map<String, dynamic> _commonInput(PostDraft d) => {
        'title': d.title.trim(),
        'entitle': '',
        'explanation': d.caption.trim(),
        'enExplanation': '',
        'rating': d.rating,
        'prompt': _orNull(d.prompt),
        'negativePrompt': _orNull(d.negativePrompt),
        'seed': _orNull(d.seed),
        'sampler': _orNull(d.sampler),
        'steps': _orNull(d.steps),
        'modelName': _orNull(d.modelName),
        'modelHash': _orNull(d.modelHash),
        'pngInfo': d.pngInfo,
        'imageStyle': d.imageStyle,
        'relatedUrl': d.relatedUrl ?? '',
        'tags': d.tags,
        'isTagEditable': d.isTagEditable,
        'isCommentEditable': d.isCommentEditable,
        'thumbnailPosition': 0,
        'modelId': d.modelId,
        'type': d.workType,
        'subjectId': d.themeId,
        'albumId': d.albumId,
        'isPromotion': d.isPromotion,
        // Web の toPostReservedAt はブラウザの時刻に 9 時間足した値を送る。サーバーが JST として読むので合わせる
        'reservedAt': d.reservedAt == null ? null : d.reservedAt!.millisecondsSinceEpoch + 3600000 * 9,
        'accessType': d.accessType,
        'accessGenerationType': d.publishParams ? 'PUBLIC' : 'PRIVATE',
        'videoUrl': null,
      };

  static List<String>? _validate(PostDraft d, List<PostImage> images) {
    if (d.title.trim().isEmpty) return ['タイトルを入力してください'];
    if (d.title.length > maxTitleLength) return ['タイトルは$maxTitleLength文字以内で入力してください'];
    if (d.caption.length > maxCaptionLength) return ['キャプションは$maxCaptionLength文字以内で入力してください'];
    if (images.isEmpty) return [d.workType == 'WORK' ? '画像を選択してください' : '表紙の画像を選択してください'];
    if (d.workType != 'WORK' && d.body.trim().isEmpty) return ['本文を入力してください'];
    if (d.rating == 'R18' || d.rating == 'R18G') return ['この年齢種別の作品はアプリから編集できません'];
    return null;
  }

  static String? validate(PostDraft d, List<PostImage> images) => _validate(d, images)?.first;

  static Future<Uint8List> _bytesOf(PostImage image) async {
    if (image.encoded != null) return image.encoded!.bytes;
    final res = await http.get(Uri.parse(image.url!)).timeout(const Duration(seconds: 60));
    if (res.statusCode != 200) throw const ApiException('画像を取得できませんでした');
    return res.bodyBytes;
  }

  /// 新規投稿。順にサムネイル → 本体をアップロードしてから作品を作る（Web の use-post-image-submit）
  static Future<String> create(
    PostDraft d,
    List<PostImage> images, {
    required void Function(double progress) onProgress,
    Future<void> Function(Duration wait)? delay,
  }) async {
    final token = await Uploader.token();
    final main = images.first.encoded!;
    onProgress(0.05);
    final small = await ImageTools.thumbnail(main.bytes, 400, 1200);
    final large = await ImageTools.thumbnail(main.bytes, 600, 1600);
    onProgress(0.15);
    final smallUrl = await Uploader.image(small.bytes, small.mime, token);
    final largeUrl = await Uploader.image(large.bytes, large.mime, token);
    onProgress(0.25);
    String? botImageUrl;
    if (d.isBotGradingEnabled) {
      final bot = await ImageTools.resizeJpeg(main.bytes, 400);
      botImageUrl = await Uploader.image(bot.bytes, bot.mime, token);
    }
    final imageUrls = <String>[];
    for (var i = 0; i < images.length; i++) {
      final e = images[i].encoded!;
      imageUrls.add(await Uploader.image(e.bytes, e.mime, token));
      onProgress(0.3 + 0.5 * (i + 1) / images.length);
    }
    String? mdUrl;
    if (d.workType != 'WORK') mdUrl = await Uploader.text(d.body, 'md', token);

    final hash = ImageTools.sha256OfDataUrl(main.bytes, main.mime);
    final input = {
      ..._commonInput(d),
      'mainImageSha256': hash,
      'imageUrls': imageUrls,
      'imageWidth': main.width,
      'imageHeight': main.height,
      'smallThumbnailImageURL': smallUrl,
      'smallThumbnailImageWidth': small.width,
      'smallThumbnailImageHeight': small.height,
      'largeThumbnailImageURL': largeUrl,
      'largeThumbnailImageWidth': large.width,
      'largeThumbnailImageHeight': large.height,
      'ogpImageUrl': null,
      if (mdUrl != null) 'mdUrl': mdUrl,
      'isBotGradingEnabled': d.isBotGradingEnabled,
      'isBotGradingPublic': d.isBotGradingEnabled,
      'isBotGradingRankingEnabled': d.isBotGradingEnabled,
      'botPersonality': 'pictor_chan',
      'botGradingType': 'COMMENT_AND_SCORE',
      if (botImageUrl != null) 'botGradingImageUrl': botImageUrl,
    };
    onProgress(0.85);
    if (postDryRun) {
      lastDryRunInput = input;
      if (kDebugMode) debugPrint('[post dry run] ${jsonEncode(input)}');
      onProgress(1);
      return 'dry-run';
    }
    final wait = delay ?? Future<void>.delayed;
    return _createWithRetry(input, hash, wait, onProgress);
  }

  /// 作品の作成だけやり直す。前回の要求が届いていたときは二重に作らない（Web と同じ）
  static Future<String> _createWithRetry(
    Map<String, dynamic> input,
    String hash,
    Future<void> Function(Duration) wait,
    void Function(double) onProgress,
  ) async {
    const maxRetries = 3;
    ApiException? last;
    for (var retry = 0; retry <= maxRetries; retry++) {
      try {
        if (retry > 0) {
          await wait(Duration(seconds: 1 << (retry - 1)));
          final data = await Api.query(r'''
query AppWorkByImageHash($imageHash: String!) {
  viewer { id user { id } }
  workByImageHash(imageHash: $imageHash) { id user { id } }
}''', variables: {'imageHash': hash});
          final existing = data.obj('workByImageHash');
          final viewerId = data.obj('viewer')?.obj('user')?.str('id');
          if (existing != null && existing.obj('user')?.str('id') == viewerId) return existing.str('id');
        }
        final data = await Api.mutate(
          r'mutation AppCreateWork($input: CreateWorkInput!) { createWork(input: $input) { id } }',
          variables: {'input': input},
        );
        onProgress(1);
        return data.obj('createWork')!.str('id');
      } on ApiException catch (e) {
        last = e;
      }
    }
    throw last!;
  }

  /// 更新。投稿済みの画像はそのまま使い、新しい画像だけアップロードする（Web の use-edit-image-submit）
  static Future<String> update(
    EditingWork e,
    PostDraft d,
    List<PostImage> images, {
    required void Function(double progress) onProgress,
  }) async {
    final w = e.json;
    final token = await Uploader.token();
    final mainUnchanged = images.first.url != null && images.first.url == w.strOrNull('imageURL');
    var smallUrl = w.str('smallThumbnailImageURL');
    var smallW = w.integer('smallThumbnailImageWidth');
    var smallH = w.integer('smallThumbnailImageHeight');
    var largeUrl = w.str('largeThumbnailImageURL');
    var largeW = w.integer('largeThumbnailImageWidth');
    var largeH = w.integer('largeThumbnailImageHeight');
    var imageW = w.integer('imageWidth');
    var imageH = w.integer('imageHeight');
    String hash;
    onProgress(0.1);
    if (mainUnchanged) {
      hash = ImageTools.sha256OfText(images.first.url!);
    } else {
      final bytes = await _bytesOf(images.first);
      final small = await ImageTools.thumbnail(bytes, 400, 1200);
      final large = await ImageTools.thumbnail(bytes, 600, 1600);
      smallUrl = await Uploader.image(small.bytes, small.mime, token);
      largeUrl = await Uploader.image(large.bytes, large.mime, token);
      smallW = small.width;
      smallH = small.height;
      largeW = large.width;
      largeH = large.height;
      (imageW, imageH) = await ImageTools.sizeOf(bytes);
      hash = images.first.encoded != null ? ImageTools.sha256OfDataUrl(bytes, images.first.encoded!.mime) : ImageTools.sha256OfText(images.first.url!);
    }
    onProgress(0.3);
    final urls = <String>[];
    for (var i = 0; i < images.length; i++) {
      final image = images[i];
      urls.add(image.url ?? await Uploader.image(image.encoded!.bytes, image.encoded!.mime, token));
      onProgress(0.3 + 0.5 * (i + 1) / images.length);
    }
    if (d.workType != 'WORK' && d.body.trim().isNotEmpty) {
      await Uploader.text(d.body, 'md', token, existingUrl: e.mdUrl);
    }
    final input = {
      ..._commonInput(d),
      'id': e.id,
      'entitle': w.str('enTitle'),
      'enExplanation': w.str('enDescription'),
      'mainImageSha256': hash,
      'imageUrls': urls,
      'imageWidth': imageW,
      'imageHeight': imageH,
      'smallThumbnailImageURL': smallUrl,
      'smallThumbnailImageWidth': smallW,
      'smallThumbnailImageHeight': smallH,
      'largeThumbnailImageURL': largeUrl,
      'largeThumbnailImageWidth': largeW,
      'largeThumbnailImageHeight': largeH,
      'thumbnailPosition': mainUnchanged ? w.number('thumbnailImagePosition') : 0,
      'ogpImageUrl': w.strOrNull('ogpThumbnailImageUrl'),
      'isBotGradingPublic': w.boolean('isBotGradingPublic'),
      'isBotGradingRankingEnabled': w.boolean('isBotGradingRankingEnabled'),
      // 修正依頼が来ている作品は、保存すると運営に修正完了が伝わる（Web と同じ）
      if (w.obj('moderatorReport')?.str('status') == 'UNHANDLED') 'correctionMessage': 'アプリから修正しました',
    };
    onProgress(0.85);
    if (postDryRun) {
      lastDryRunInput = input;
      if (kDebugMode) debugPrint('[post dry run] ${jsonEncode(input)}');
      onProgress(1);
      return e.id;
    }
    final data = await Api.mutate(
      r'mutation AppUpdateWork($input: UpdateWorkInput!) { updateWork(input: $input) { id } }',
      variables: {'input': input},
    );
    onProgress(1);
    return data.obj('updateWork')!.str('id');
  }

  static Future<void> delete(String id) async {
    await Api.mutate(
      r'mutation AppDeleteWork($input: DeleteWorkInput!) { deleteWork(input: $input) { id } }',
      variables: {
        'input': {'workId': id},
      },
    );
  }
}
