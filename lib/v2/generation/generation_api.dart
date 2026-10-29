import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:aipictors/v2/core/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

/// 生成画面で使う GraphQL（Web の /generation と同じもの）と、
/// www.aipictors.com の API（コイン残高・途中経過・みんなのモデル）
class GenApi {
  GenApi._();

  static const webOrigin = 'https://www.aipictors.com';

  static final _client = http.Client();

  // ---------------------------------------------------------------------------
  // GraphQL
  // ---------------------------------------------------------------------------

  /// モデル・LoRA・プロンプトの候補（Web の GenerationQueryContextQuery）
  static const contextQuery = r'''
query GenerationQueryContextQuery {
  imageLoraModels {
    id
    name
    description
    license
    triggerWord
    prompts
    slug
    thumbnailImageURL
    genre
  }
  imageModels {
    id
    name
    displayName
    category
    description
    explanation
    license
    prompts
    slug
    style
    thumbnailImageURL
    type
    isNew
  }
  negativePromptCategories {
    id
    name
    prompts { id name words }
  }
  promptCategories {
    id
    name
    prompts { id name words }
  }
}''';

  /// 規約の同意・プラン・残り枚数（Web の CurrentPassQuery + StatusQuery + ViewerUser）
  static const viewerQuery = r'''
query GenerationViewer {
  viewer {
    id
    currentPass { id type }
    isExistedPreviousPass
    lineUserId
    user {
      id
      nanoid
      hasSignedImageGenerationTerms
      generatedCount
    }
    remainingImageGenerationTasksCount
    inProgressImageGenerationTasksCount
    inProgressImageGenerationTasksCost
    inProgressImageGenerationReservedTasksCount
    remainingImageGenerationTasksTotalCount
    availableImageGenerationMaxTasksCount
    imageGenerationWaitCount
    availableImageGenerationLoraModelsCount
    availableConsecutiveImageGenerationsCount
    favoritedImageGenerationModels { id name type }
  }
  imageGenerationEngineStatus {
    normalTasksCount
    standardTasksCount
    normalPredictionGenerationWait
    standardPredictionGenerationWait
  }
}''';

  static const _resultFields = '''
    id
    nanoid
    status
    imageUrl
    thumbnailUrl
    completedAt
    estimatedSeconds
    rating
    isProtected
    prompt
    negativePrompt
    scale
    steps
    sampler
    seed
    clipSkip
    sizeType
    generationType
    t2tImageUrl
    t2tDenoisingStrengthSize
    upscaleSize
    vae
    width
    height
    model { id name type }
''';

  static const tasksQuery =
      '''
query ViewerImageGenerationTasks(\$offset: Int!, \$limit: Int!, \$where: ImageGenerationTasksWhereInput) {
  viewer {
    id
    imageGenerationTasks(offset: \$offset, limit: \$limit, where: \$where) {
      $_resultFields
      count
      isDeleted
    }
  }
}''';

  static const resultsQuery =
      '''
query ViewerImageGenerationResults(\$offset: Int!, \$limit: Int!, \$where: ImageGenerationResultsWhereInput) {
  viewer {
    id
    imageGenerationResults(offset: \$offset, limit: \$limit, where: \$where) {
      $_resultFields
    }
  }
}''';

  static const createTask = r'''
mutation CreateImageGenerationTask($input: CreateImageGenerationTaskInput!) {
  createImageGenerationTask(input: $input) { id nanoid status }
}''';

  static const createReservedTask = r'''
mutation CreateReservedImageGenerationTask($input: CreateReservedImageGenerationTaskInput!) {
  createReservedImageGenerationTask(input: $input) { id }
}''';

  static const createFluxTask = r'''
mutation CreateFluxImageGenerationTask($input: CreateFluxImageGenerationTaskInput!) {
  createFluxImageGenerationTask(input: $input) { id }
}''';

  static const createGeminiTask = r'''
mutation CreateGeminiImageGenerationTask($input: CreateGeminiImageGenerationTaskInput!) {
  createGeminiImageGenerationTask(input: $input) { id nanoid status }
}''';

  static const signTerms = r'''
mutation SignImageGenerationTerms($input: SignImageGenerationTermsInput!) {
  signImageGenerationTerms(input: $input) { id }
}''';

  static const updateRating = r'''
mutation updateRatingImageGenerationResult($input: UpdateRatingImageGenerationResultInput!) {
  updateRatingImageGenerationResult(input: $input) { id rating }
}''';

  static const updateProtected = r'''
mutation updateProtectedImageGenerationResult($input: UpdateProtectedImageGenerationResultInput!) {
  updateProtectedImageGenerationResult(input: $input) { id isProtected }
}''';

  static const deleteResult = r'''
mutation deleteImageGenerationResult($input: DeleteImageGenerationResultInput!) {
  deleteImageGenerationResult(input: $input) { id }
}''';

  static const updateModelRating = r'''
mutation UpdateRatingImageGenerationModel($input: UpdateRatingImageGenerationModelInput!) {
  updateRatingImageGenerationModel(input: $input) {
    id
    userId
    favoritedImageGenerationModelIds
  }
}''';

  // ---------------------------------------------------------------------------
  // www.aipictors.com の API
  // ---------------------------------------------------------------------------

  static Future<Map<String, String>> _webHeaders({bool auth = true}) async {
    String? token;
    if (auth) {
      try {
        token = await FirebaseAuth.instance.currentUser?.getIdToken();
      } catch (_) {}
    }
    return {'accept': 'application/json', if (token != null) 'authorization': 'Bearer $token'};
  }

  static Future<Map<String, dynamic>?> _webGet(String path, {bool auth = true, Duration timeout = const Duration(seconds: 20)}) async {
    final http.Response response;
    try {
      response = await _client.get(Uri.parse('$webOrigin$path'), headers: await _webHeaders(auth: auth)).timeout(timeout);
    } on SocketException {
      throw const ApiException('通信できませんでした。電波の良いところでもう一度お試しください');
    } catch (_) {
      throw const ApiException('通信に失敗しました。もう一度お試しください');
    }
    Map<String, dynamic> json;
    try {
      json = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    } catch (_) {
      throw ApiException('サーバーからの応答を読めませんでした（${response.statusCode}）');
    }
    final error = json['error'];
    if (error != null && error.toString().isNotEmpty) {
      throw ApiException(error.toString());
    }
    final data = json['data'];
    return data is Map<String, dynamic> ? data : null;
  }

  /// コイン残高（Web の /api/coins/summary。その日の付与もここで行われる）
  static Future<CoinSummary?> coinSummary() async {
    final data = await _webGet('/api/coins/summary');
    if (data == null) return null;
    return CoinSummary.fromJson(data);
  }

  /// 生成中のタスクの途中経過（Web の /api/generation/progress）
  static Future<GenProgress?> progress(String nanoid, int previewId) async {
    try {
      final data = await _webGet(
        '/api/generation/progress?id=${Uri.encodeQueryComponent(nanoid)}&preview=$previewId',
        auth: false,
        timeout: const Duration(seconds: 8),
      );
      if (data == null) return null;
      return GenProgress.fromJson(data);
    } catch (_) {
      return null;
    }
  }

  /// みんなのモデル（公開）
  static Future<List<UserModel>> userModels({required String kind, String q = '', int offset = 0, int limit = 24}) async {
    final params = {'kind': kind, if (q.isNotEmpty) 'q': q, 'sort': 'popular', 'ratings': 'G,R15', 'offset': '$offset', 'limit': '$limit'};
    final query = params.entries.map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}').join('&');
    final data = await _webGet('/api/user-models?$query');
    final list = data?['models'];
    if (list is! List) return const [];
    return list.whereType<Map<String, dynamic>>().map(UserModel.fromJson).where((m) => m.status == 'READY').toList();
  }

  /// 自分のモデル
  static Future<List<UserModel>> myUserModels() async {
    final data = await _webGet('/api/user-models/mine');
    final list = data?['models'];
    if (list is! List) return const [];
    return list.whereType<Map<String, dynamic>>().map(UserModel.fromJson).where((m) => m.status == 'READY').toList();
  }
}

// -----------------------------------------------------------------------------
// データ
// -----------------------------------------------------------------------------

class ImageModel {
  const ImageModel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.category,
    required this.type,
    required this.style,
    required this.thumbnailUrl,
    required this.description,
    required this.isNew,
    required this.prompts,
  });

  final String id;

  /// 生成に渡す名前（xxx.safetensors [hash]）
  final String name;
  final String displayName;
  final String category;

  /// SD1 / SDXL / FLUX / GEMINI など
  final String type;
  final String style;
  final String? thumbnailUrl;
  final String description;
  final bool isNew;
  final List<String> prompts;

  factory ImageModel.fromJson(Map<String, dynamic> j) => ImageModel(
    id: j.str('id'),
    name: j.str('name'),
    displayName: j.str('displayName', j.str('name')),
    category: j.str('category'),
    type: j.str('type', 'SD1'),
    style: j.str('style'),
    thumbnailUrl: j.strOrNull('thumbnailImageURL'),
    description: j.str('description', j.str('explanation')),
    isNew: j.boolean('isNew'),
    prompts: (j['prompts'] is List) ? (j['prompts'] as List).map((e) => e.toString()).toList() : const [],
  );

  bool get isFlux => name == 'flux.1 schnell' || name == 'flux.1 pro' || type == 'FLUX';

  bool get isGemini => type == 'GEMINI' || type == 'SD5' || name.toLowerCase().contains('gemini');
}

class LoraModel {
  const LoraModel({required this.id, required this.name, required this.description, required this.genre, required this.thumbnailUrl, this.triggerWord});

  final String id;
  final String name;
  final String description;
  final String genre;
  final String? thumbnailUrl;
  final String? triggerWord;

  factory LoraModel.fromJson(Map<String, dynamic> j) => LoraModel(
    id: j.str('id'),
    name: j.str('name'),
    description: j.str('description'),
    genre: j.str('genre', 'その他'),
    thumbnailUrl: j.strOrNull('thumbnailImageURL'),
    triggerWord: j.strOrNull('triggerWord'),
  );
}

class PromptWord {
  const PromptWord(this.name, this.words);

  final String name;
  final List<String> words;
}

class PromptCategory {
  const PromptCategory(this.name, this.prompts);

  final String name;
  final List<PromptWord> prompts;

  factory PromptCategory.fromJson(Map<String, dynamic> j) => PromptCategory(
    j.str('name'),
    j.list('prompts').map((p) {
      final words = p['words'] is List ? (p['words'] as List).map((e) => e.toString()).toList() : <String>[];
      return PromptWord(p.str('name'), words);
    }).toList(),
  );
}

/// 生成画面の候補データ（モデル・LoRA・プロンプト）
class GenCatalog {
  const GenCatalog({required this.models, required this.loras, required this.promptCategories, required this.negativePromptCategories});

  final List<ImageModel> models;
  final List<LoraModel> loras;
  final List<PromptCategory> promptCategories;
  final List<PromptCategory> negativePromptCategories;

  factory GenCatalog.fromJson(Map<String, dynamic> j) => GenCatalog(
    models: j.list('imageModels').map(ImageModel.fromJson).toList(),
    loras: j.list('imageLoraModels').map(LoraModel.fromJson).toList(),
    promptCategories: j.list('promptCategories').map(PromptCategory.fromJson).toList(),
    negativePromptCategories: j.list('negativePromptCategories').map(PromptCategory.fromJson).toList(),
  );

  ImageModel? model(String id) {
    for (final m in models) {
      if (m.id == id) return m;
    }
    return null;
  }

  ImageModel? modelByName(String name) {
    for (final m in models) {
      if (m.name == name) return m;
    }
    return null;
  }

  LoraModel? lora(String name) {
    for (final l in loras) {
      if (l.name == name) return l;
    }
    return null;
  }

  static Future<GenCatalog> load() async {
    final data = await Api.query(GenApi.contextQuery, cacheFor: const Duration(hours: 6));
    return GenCatalog.fromJson(data);
  }
}

/// ログイン中の人の生成の状態
class GenViewer {
  const GenViewer({
    required this.userId,
    required this.nanoid,
    required this.hasSignedTerms,
    required this.generatedCount,
    required this.passType,
    required this.isExistedPreviousPass,
    required this.lineUserId,
    required this.remaining,
    required this.inProgress,
    required this.reserved,
    required this.maxTasks,
    required this.consecutive,
    required this.loraLimit,
    required this.waitCount,
    required this.favoriteModelIds,
    required this.engineWait,
  });

  final String userId;
  final String? nanoid;
  final bool hasSignedTerms;
  final int generatedCount;

  /// FREE は null（LITE / STANDARD / PREMIUM）
  final String? passType;
  final bool isExistedPreviousPass;
  final String? lineUserId;
  final int remaining;
  final int inProgress;
  final int reserved;
  final int maxTasks;
  final int consecutive;
  final int loraLimit;
  final int waitCount;
  final Set<String> favoriteModelIds;

  /// 混み具合（待ち件数の目安）
  final int engineWait;

  bool get isPaid => passType == 'LITE' || passType == 'STANDARD' || passType == 'PREMIUM';

  bool get isStandardOrPremium => passType == 'STANDARD' || passType == 'PREMIUM';

  String get planLabel => switch (passType) {
    'LITE' => 'ライト',
    'STANDARD' => 'スタンダード',
    'PREMIUM' => 'プレミアム',
    _ => '無料プラン',
  };

  factory GenViewer.fromJson(Map<String, dynamic> data) {
    final v = data.obj('viewer') ?? const <String, dynamic>{};
    final user = v.obj('user') ?? const <String, dynamic>{};
    final engine = data.obj('imageGenerationEngineStatus') ?? const <String, dynamic>{};
    final pass = v.obj('currentPass');
    final passType = pass?.strOrNull('type');
    final isStandard = passType == 'STANDARD' || passType == 'PREMIUM';
    return GenViewer(
      userId: user.str('id'),
      nanoid: user.strOrNull('nanoid'),
      hasSignedTerms: user.boolean('hasSignedImageGenerationTerms'),
      generatedCount: user.integer('generatedCount'),
      passType: passType,
      isExistedPreviousPass: v.boolean('isExistedPreviousPass'),
      lineUserId: v.strOrNull('lineUserId'),
      remaining: v.integer('remainingImageGenerationTasksCount'),
      inProgress: v.integer('inProgressImageGenerationTasksCount'),
      reserved: v.integer('inProgressImageGenerationReservedTasksCount'),
      maxTasks: v.integer('availableImageGenerationMaxTasksCount', 10),
      consecutive: v.integer('availableConsecutiveImageGenerationsCount'),
      loraLimit: v.integer('availableImageGenerationLoraModelsCount', 2),
      waitCount: v.integer('imageGenerationWaitCount'),
      favoriteModelIds: v.list('favoritedImageGenerationModels').map((m) => m.str('id')).toSet(),
      engineWait: isStandard ? engine.integer('standardPredictionGenerationWait') : engine.integer('normalPredictionGenerationWait'),
    );
  }

  static Future<GenViewer> load() async {
    final data = await Api.query(GenApi.viewerQuery);
    return GenViewer.fromJson(data);
  }
}

class CoinSummary {
  const CoinSummary({required this.free, required this.premium, required this.granted, required this.grantedCoins});

  final int free;
  final int premium;
  final bool granted;
  final int grantedCoins;

  int get total => free + premium;

  factory CoinSummary.fromJson(Map<String, dynamic> j) {
    final free = j.integer('freeBalance').clamp(0, 1 << 31);
    final premium = j.integer('premiumBalance').clamp(0, 1 << 31);
    return CoinSummary(
      free: free,
      premium: premium,
      granted: j.boolean('granted'),
      grantedCoins: j.integer('grantedFreeCoins') + j.integer('grantedPremiumCoins'),
    );
  }
}

class GenProgress {
  const GenProgress({
    required this.state,
    required this.progress,
    required this.eta,
    required this.preview,
    required this.previewId,
    required this.queuePosition,
  });

  /// waiting / queued / active / completed
  final String state;

  /// 0〜1
  final double progress;
  final double? eta;

  /// data:image/...;base64,...
  final String? preview;
  final int previewId;
  final int? queuePosition;

  factory GenProgress.fromJson(Map<String, dynamic> j) => GenProgress(
    state: j.str('state', 'waiting'),
    progress: j.number('progress').clamp(0, 1).toDouble(),
    eta: j['eta'] is num ? (j['eta'] as num).toDouble() : null,
    preview: j.strOrNull('preview'),
    previewId: j.integer('previewId', -1),
    queuePosition: j['queuePosition'] is num ? (j['queuePosition'] as num).toInt() : null,
  );
}

/// 生成履歴の 1 件（生成中のタスクも同じ形で持つ）
class GenResult {
  GenResult({
    required this.id,
    required this.nanoid,
    required this.status,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.completedAt,
    required this.estimatedSeconds,
    required this.rating,
    required this.isProtected,
    required this.prompt,
    required this.negativePrompt,
    required this.scale,
    required this.steps,
    required this.sampler,
    required this.seed,
    required this.clipSkip,
    required this.sizeType,
    required this.generationType,
    required this.upscaleSize,
    required this.vae,
    required this.width,
    required this.height,
    required this.modelId,
    required this.modelName,
    required this.modelType,
    this.count = 1,
    this.isTask = false,
  });

  final String id;
  final String? nanoid;
  String status;
  final String? imageUrl;
  final String? thumbnailUrl;
  final int completedAt;
  final int? estimatedSeconds;
  int rating;
  bool isProtected;
  final String prompt;
  final String negativePrompt;
  final int scale;
  final int steps;
  final String sampler;
  final int seed;
  final int clipSkip;
  final String sizeType;
  final String generationType;
  final double? upscaleSize;
  final String? vae;
  final int width;
  final int height;
  final String modelId;
  final String modelName;
  final String modelType;
  final int count;
  final bool isTask;

  bool get isDone => status == 'DONE';

  bool get isError => status == 'ERROR' || status == 'CANCELED';

  bool get isRunning => status == 'IN_PROGRESS' || status == 'PENDING' || status == 'RESERVED';

  bool get isHighRes => (upscaleSize ?? 0) > 1;

  double get aspect {
    if (width > 0 && height > 0) return width / height;
    final size = GenSize.parse(sizeType);
    return size.width / size.height;
  }

  factory GenResult.fromJson(Map<String, dynamic> j, {bool isTask = false}) {
    final model = j.obj('model') ?? const <String, dynamic>{};
    return GenResult(
      id: j.str('id'),
      nanoid: j.strOrNull('nanoid'),
      status: j.str('status', 'DONE'),
      imageUrl: j.strOrNull('imageUrl'),
      thumbnailUrl: j.strOrNull('thumbnailUrl'),
      completedAt: j.integer('completedAt'),
      estimatedSeconds: j['estimatedSeconds'] is num ? (j['estimatedSeconds'] as num).toInt() : null,
      rating: j.integer('rating'),
      isProtected: j.boolean('isProtected'),
      prompt: j.str('prompt'),
      negativePrompt: j.str('negativePrompt'),
      scale: j.integer('scale', 7),
      steps: j.integer('steps', 20),
      sampler: j.str('sampler'),
      seed: j.number('seed', -1).round(),
      clipSkip: j.integer('clipSkip', 2),
      sizeType: j.str('sizeType', 'SD1_512_768'),
      generationType: j.str('generationType', 'TEXT_TO_IMAGE'),
      upscaleSize: j['upscaleSize'] is num ? (j['upscaleSize'] as num).toDouble() : null,
      vae: j.strOrNull('vae'),
      width: j.integer('width'),
      height: j.integer('height'),
      modelId: model.str('id'),
      modelName: model.str('name'),
      modelType: model.str('type', 'SD1'),
      count: j.integer('count', 1),
      isTask: isTask,
    );
  }
}

/// サイズ（SD3_832_1216 など）
class GenSize {
  const GenSize(this.type, this.width, this.height);

  final String type;
  final int width;
  final int height;

  static GenSize parse(String type) {
    final parts = type.split('_');
    if (parts.length >= 3) {
      final w = int.tryParse(parts[parts.length - 2]);
      final h = int.tryParse(parts[parts.length - 1]);
      if (w != null && h != null && w > 0 && h > 0) return GenSize(type, w, h);
    }
    return GenSize(type, 512, 768);
  }

  /// 近い比率の表記（832×1216 → 2:3）
  String get ratioLabel {
    const ratios = [
      [1, 1], [2, 3], [3, 2], [3, 4], [4, 3], [9, 16], [16, 9], [5, 12], [12, 5], [2, 5], [5, 2], [5, 7], [7, 5], //
    ];
    final r = width / height;
    var best = ratios.first;
    var bestDiff = double.infinity;
    for (final c in ratios) {
      final d = (_ln(r) - _ln(c[0] / c[1])).abs();
      if (d < bestDiff) {
        bestDiff = d;
        best = c;
      }
    }
    return '${best[0]}:${best[1]}';
  }

  static double _ln(double x) => math.log(x);
}

/// みんなのモデル（チェックポイント / LoRA）
class UserModel {
  const UserModel({
    required this.id,
    required this.kind,
    required this.name,
    required this.baseModel,
    required this.thumbnailUrl,
    required this.triggerWords,
    required this.recommendedWeight,
    required this.status,
    required this.useCount,
    required this.authorName,
  });

  final String id;

  /// CHECKPOINT / LORA
  final String kind;
  final String name;

  /// SD1.5 / SDXL / PONY / ILLUSTRIOUS / NOOBAI / OTHER
  final String baseModel;
  final String? thumbnailUrl;
  final String triggerWords;
  final double recommendedWeight;
  final String status;
  final int useCount;
  final String? authorName;

  /// 生成画面のモデル種別
  String get modelType => baseModel == 'SD1.5' ? 'SD1' : 'SDXL';

  /// 生成リクエストの model に入れる名前
  String get checkpointName => 'user/$id.safetensors';

  /// プロンプトの <lora:NAME:w> に入れる名前
  String get loraName => 'user_$id';

  factory UserModel.fromJson(Map<String, dynamic> j) {
    final user = j.obj('user');
    final w = j['recommendedWeight'];
    return UserModel(
      id: j.str('id'),
      kind: j.str('kind'),
      name: j.str('name'),
      baseModel: j.str('baseModel', 'SDXL'),
      thumbnailUrl: j.strOrNull('thumbnailUrl'),
      triggerWords: j.str('triggerWords'),
      recommendedWeight: w is num ? w.toDouble().clamp(-1, 1).toDouble() : 0.8,
      status: j.str('status', 'READY'),
      useCount: j.integer('useCount'),
      authorName: user?.strOrNull('name'),
    );
  }
}
