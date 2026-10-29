import 'dart:async';
import 'dart:convert';

import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Web と同じ決まりごと（app/config.ts の generationFeature）
class GenRules {
  GenRules._();

  static const defaultModelId = '1';
  static const defaultPrompt = 'masterpiece, best quality, extremely detailed, anime, girl, skirt';
  static const minSteps = 9;
  static const maxSteps = 30;
  static const minScale = 6;
  static const maxScale = 15;
  static const maxPromptLength = 20000;

  static const samplers = [
    'Euler a',
    'Euler',
    'Heun',
    'DPM2',
    'DPM2 a',
    'DPM++ 2S a',
    'LMS Karras',
    'DPM2 a Karras',
    'DPM++ 2S a Karras',
    'DPM++ SDE Karras',
    'DPM++ 2M Karras',
    'DPM++ 2M SDE Karras',
    'DDIM',
  ];

  static const vaes = ['kl-f8-anime2', 'clearvae_v23', 'sdxl_vae', 'vae-ft-mse-840000-ema-pruned', 'None'];

  // 1 枚あたりのコイン（Web の generation-submit-view.tsx と同じ）
  static const standardCoin = 10;
  static const imageEditCoin = 50;
  static const geminiCoin = 50;
  static const gemini2Coin = 100;
  static const fluxSchnellCoin = 30;
  static const fluxProCoin = 50;

  static const sizesByType = <String, List<String>>{
    'SD1': ['SD1_384_960', 'SD1_512_768', 'SD1_512_512', 'SD1_768_512', 'SD1_960_384'],
    'SD2': ['SD2_768_1200', 'SD2_768_768', 'SD2_1200_768'],
    'SDXL': ['SD3_640_1536', 'SD3_832_1216', 'SD3_1024_1024', 'SD3_1216_832', 'SD3_1536_640'],
    'FLUX': ['SD4_896_1152', 'SD4_896_896', 'SD4_1152_896'],
    'SD5': ['SD3_832_1216', 'SD3_1024_1024', 'SD3_1216_832'],
    'GEMINI': ['SD3_832_1216', 'SD3_1024_1024', 'SD3_1216_832'],
  };

  static List<GenSize> sizes(String modelType) => (sizesByType[modelType] ?? sizesByType['SDXL']!).map(GenSize.parse).toList();

  static String defaultSize(String modelType) {
    if (modelType == 'SD1') return 'SD1_512_768';
    if (modelType == 'SD2') return 'SD2_768_768';
    if (modelType == 'FLUX') return 'SD4_896_896';
    return 'SD3_1024_1024';
  }

  /// モデルを変えたとき、今の向き（縦・横・正方形）に近いサイズへ寄せる
  static String convertSize(String sizeType, String modelType) {
    final options = sizes(modelType);
    if (options.any((s) => s.type == sizeType)) return sizeType;
    final current = GenSize.parse(sizeType);
    final r = current.width / current.height;
    GenSize best = GenSize.parse(defaultSize(modelType));
    var diff = double.infinity;
    for (final o in options) {
      final d = ((o.width / o.height) - r).abs();
      if (d < diff) {
        diff = d;
        best = o;
      }
    }
    return best.type;
  }

  static String defaultVae(String modelType) => switch (modelType) {
    'SD1' => 'vae-ft-mse-840000-ema-pruned',
    'SD2' => 'kl-f8-anime2',
    'SDXL' || 'FLUX' => 'sdxl_vae',
    'GEMINI' || 'SD5' => '',
    _ => 'vae-ft-mse-840000-ema-pruned',
  };

  static const _defaultNegatives = {'', 'EasyNegative', 'Mayng', 'negativeXL_D'};

  /// ネガティブプロンプトが既定値のままなら、モデルの種類に合わせて差し替える
  static String negativeFor(String modelType, String current) {
    if (!_defaultNegatives.contains(current.trim())) return current;
    return switch (modelType) {
      'SD1' => 'EasyNegative',
      'SD2' => 'Mayng',
      'SDXL' || 'FLUX' => 'negativeXL_D',
      'GEMINI' || 'SD5' => '',
      _ => 'EasyNegative',
    };
  }

  /// Gemini に渡すサイズ（Web の convertToGeminiImageSize と同じ）
  static String geminiSize(String sizeType) => switch (sizeType) {
    'SD1_512_512' => 'SQUARE_512',
    'SDXL_1024_1024' => 'SQUARE_1024',
    'SDXL_1024_768' || 'SD1_768_512' => 'LANDSCAPE',
    'SDXL_768_1024' || 'SD1_512_768' => 'PORTRAIT',
    _ => 'SQUARE_768',
  };

  static const randomPrompts = [
    'masterpiece, best quality, extremely',
    'girl,school uniform,long hair,beauty,black hair,blunt bangs,woman,slimbody,hiah quality,streight hair, slender',
    'girl,school uniform,bob cut,black hair,blunt bangs,beauty,woman,slim body,slender,high quality',
    'the cut up figs, a cool boy, good-looking guy, handsome man, shorthair, long sleeve, silver hair, white hair, red eyes, ikemen',
    'Gaogaigar,giant robot,giant mecha,golden body,golden lion,golden wings,golden drill,green crystal,giant golden hammer,masterpiece, best quality, extremely detailed, anime,orange eyes,golden tornado,golden storm',
  ];
}

/// 選んだ LoRA
class LoraPick {
  LoraPick({required this.name, required this.weight, this.label, this.thumbnailUrl});

  /// <lora:NAME:w> の NAME（みんなのモデルは user_xxx）
  final String name;
  double weight;
  final String? label;
  final String? thumbnailUrl;

  bool get isUserModel => name.startsWith('user_');

  Map<String, dynamic> toJson() => {'name': name, 'weight': weight, 'label': label, 'thumb': thumbnailUrl};

  static LoraPick? fromJson(Object? j) {
    if (j is! Map) return null;
    final name = j['name']?.toString() ?? '';
    if (name.isEmpty) return null;
    final w = j['weight'];
    return LoraPick(name: name, weight: w is num ? w.toDouble() : 1, label: j['label']?.toString(), thumbnailUrl: j['thumb']?.toString());
  }
}

/// 選んだみんなのモデル（チェックポイント）
class UserCheckpointPick {
  const UserCheckpointPick({required this.id, required this.name, required this.modelType, this.thumbnailUrl});

  final String id;
  final String name;
  final String modelType;
  final String? thumbnailUrl;

  String get checkpointName => 'user/$id.safetensors';

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'type': modelType, 'thumb': thumbnailUrl};

  static UserCheckpointPick? fromJson(Object? j) {
    if (j is! Map) return null;
    final id = j['id']?.toString() ?? '';
    if (id.isEmpty) return null;
    return UserCheckpointPick(
      id: id,
      name: j['name']?.toString() ?? 'みんなのモデル',
      modelType: j['type']?.toString() ?? 'SDXL',
      thumbnailUrl: j['thumb']?.toString(),
    );
  }
}

/// 生成の設定（端末に保存して次回も使う）
class GenSettings extends ChangeNotifier {
  static const _storageKey = 'v2.generation.settings';

  String modelId = GenRules.defaultModelId;
  String modelType = 'SD1';
  UserCheckpointPick? userCheckpoint;
  String prompt = GenRules.defaultPrompt;
  String negativePrompt = 'EasyNegative';
  String sizeType = 'SD1_512_768';
  int steps = 20;
  int scale = 7;
  String sampler = 'DPM++ 2M Karras';
  int seed = -1;
  int clipSkip = 2;
  String vae = 'vae-ft-mse-840000-ema-pruned';
  bool highRes = false;

  /// 日本語で書いたプロンプトを英語にして生成する（Web の「日本語で入力」）
  bool japanesePrompt = false;

  /// 1 回で作る枚数（null はまとめて＝上限）
  int? imagesPerRequest;
  List<LoraPick> loras = [];

  /// 前回の生成条件（Seed 固定で同じ条件の連続生成を防ぐ）
  String? lastRequestKey;

  Timer? _saveTimer;

  /// 実際にモデル種別として使う値（みんなのモデルを選んでいればその系統）
  String get effectiveType => userCheckpoint?.modelType ?? modelType;

  bool get isGemini => effectiveType == 'GEMINI' || effectiveType == 'SD5';

  void update(void Function(GenSettings s) change) {
    change(this);
    notifyListeners();
    _scheduleSave();
  }

  void selectModel(ImageModel model) {
    update((s) {
      s.userCheckpoint = null;
      s._applyModelType(model.id, model.type);
    });
  }

  void selectUserCheckpoint(UserModel model, GenCatalog catalog) {
    update((s) {
      // サイズ・コイン計算のため、同じ系統の公式モデルを裏で選んでおく（Web と同じ）
      final current = catalog.model(s.modelId);
      final anchor = (current != null && current.type == model.modelType)
          ? current
          : catalog.models.firstWhere((m) => m.type == model.modelType, orElse: () => current ?? catalog.models.first);
      s._applyModelType(anchor.id, anchor.type);
      s.userCheckpoint = UserCheckpointPick(id: model.id, name: model.name, modelType: model.modelType, thumbnailUrl: model.thumbnailUrl);
    });
  }

  void _applyModelType(String id, String type) {
    final typeChanged = type != modelType;
    modelId = id;
    modelType = type;
    sizeType = GenRules.convertSize(sizeType, type);
    if (typeChanged) vae = GenRules.defaultVae(type);
    negativePrompt = GenRules.negativeFor(type, negativePrompt);
    if (type == 'GEMINI' || type == 'SD5' || type == 'FLUX') {
      highRes = false;
      loras = [];
    }
  }

  /// 履歴の設定をそのまま使う（「この設定で再生成」）
  void applyResult(GenResult r, GenCatalog catalog) {
    update((s) {
      final official = catalog.model(r.modelId) ?? catalog.modelByName(r.modelName);
      final userMatch = RegExp(r'^user/([A-Za-z0-9_-]+)\.safetensors$').firstMatch(r.modelName);
      if (official != null) {
        s.userCheckpoint = null;
        s._applyModelType(official.id, official.type);
      } else if (userMatch != null) {
        s.userCheckpoint = UserCheckpointPick(id: userMatch.group(1)!, name: 'みんなのモデル', modelType: r.modelType == 'SD1' ? 'SD1' : 'SDXL');
      }
      final parsed = extractLoras(r.prompt);
      s.prompt = parsed.$1;
      s.loras = parsed.$2.map((l) {
        final known = catalog.lora(l.name);
        return LoraPick(name: l.name, weight: l.weight, label: known?.name, thumbnailUrl: known?.thumbnailUrl);
      }).toList();
      s.negativePrompt = r.negativePrompt;
      s.sizeType = GenRules.convertSize(r.sizeType, s.effectiveType);
      s.steps = r.steps.clamp(GenRules.minSteps, GenRules.maxSteps);
      s.scale = r.scale.clamp(GenRules.minScale, GenRules.maxScale);
      if (GenRules.samplers.contains(r.sampler)) s.sampler = r.sampler;
      s.seed = r.seed;
      s.clipSkip = r.clipSkip.clamp(1, 12);
      if (r.vae != null && GenRules.vaes.contains(r.vae)) s.vae = r.vae!;
      s.highRes = r.isHighRes;
    });
  }

  /// プロンプトから <lora:name:w> を取り出す
  static (String, List<LoraPick>) extractLoras(String text) {
    final picks = <LoraPick>[];
    final re = RegExp(r'<lora:([^:>]+)(?::([-\d.]+))?>\s*,?\s*');
    final rest = text.replaceAllMapped(re, (m) {
      picks.add(LoraPick(name: m.group(1)!.trim(), weight: double.tryParse(m.group(2) ?? '') ?? 1));
      return '';
    }).trim();
    return (rest.replaceAll(RegExp(r'^,\s*|,\s*$'), ''), picks);
  }

  /// 送る直前のプロンプト（LoRA を Web と同じ書き方で足す）
  String composePrompt(String base) {
    if (loras.isEmpty) return base;
    final tags = loras.map((l) => '<lora:${l.name}:${_fmt(l.weight)}>').join(' ');
    return base.isEmpty ? tags : '$tags, $base';
  }

  static String _fmt(double w) {
    final r = (w * 10).round() / 10;
    return r == r.roundToDouble() ? r.toStringAsFixed(0) : r.toStringAsFixed(1);
  }

  // ---------------------------------------------------------------------------
  // コイン・枚数
  // ---------------------------------------------------------------------------

  /// 1 回で作れる枚数の上限（サーバーと同じ決まり）
  int maxImagesPerRequest(ImageModel? model, {required bool isPaid}) {
    final key = (userCheckpoint?.checkpointName ?? model?.name ?? '').toLowerCase();
    if (key.startsWith('flux') || key.contains('gemini') || isGemini || effectiveType == 'FLUX') return 1;
    if (highRes) return 1;
    if (seed != -1) return 1;
    return isPaid ? 4 : 2;
  }

  int imagesFor(ImageModel? model, {required bool isPaid}) {
    final max = maxImagesPerRequest(model, isPaid: isPaid);
    final selected = imagesPerRequest;
    if (selected == null) return max;
    return selected.clamp(1, max);
  }

  /// 1 枚あたりのコイン
  int coinPerImage(ImageModel? model) {
    final key = (model?.name ?? modelId).toLowerCase();
    if (userCheckpoint == null) {
      if (key == 'flux.1 pro') return GenRules.fluxProCoin;
      if (key == 'flux.1 schnell') return GenRules.fluxSchnellCoin;
      if (isGemini || key.contains('gemini')) {
        final is31 = key.contains('gemini-3.1') || key.contains('gemininanobanana2');
        return is31 ? GenRules.gemini2Coin : GenRules.geminiCoin;
      }
    }
    return GenRules.standardCoin * (highRes ? 2 : 1);
  }

  int requestCost(ImageModel? model, {required bool isPaid}) => coinPerImage(model) * imagesFor(model, isPaid: isPaid);

  // ---------------------------------------------------------------------------
  // 保存
  // ---------------------------------------------------------------------------

  Map<String, dynamic> toJson() => {
    'modelId': modelId,
    'modelType': modelType,
    'userCheckpoint': userCheckpoint?.toJson(),
    'prompt': prompt,
    'negativePrompt': negativePrompt,
    'sizeType': sizeType,
    'steps': steps,
    'scale': scale,
    'sampler': sampler,
    'seed': seed,
    'clipSkip': clipSkip,
    'vae': vae,
    'highRes': highRes,
    'japanesePrompt': japanesePrompt,
    'imagesPerRequest': imagesPerRequest,
    'loras': loras.map((l) => l.toJson()).toList(),
  };

  Future<void> restore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_storageKey);
      if (raw == null) return;
      final j = jsonDecode(raw);
      if (j is! Map<String, dynamic>) return;
      modelId = j['modelId']?.toString() ?? modelId;
      modelType = j['modelType']?.toString() ?? modelType;
      userCheckpoint = UserCheckpointPick.fromJson(j['userCheckpoint']);
      prompt = j['prompt']?.toString() ?? prompt;
      negativePrompt = j['negativePrompt']?.toString() ?? negativePrompt;
      sizeType = j['sizeType']?.toString() ?? sizeType;
      steps = (j['steps'] is int ? j['steps'] as int : steps).clamp(GenRules.minSteps, GenRules.maxSteps);
      scale = (j['scale'] is int ? j['scale'] as int : scale).clamp(GenRules.minScale, GenRules.maxScale);
      sampler = j['sampler']?.toString() ?? sampler;
      seed = j['seed'] is int ? j['seed'] as int : seed;
      clipSkip = (j['clipSkip'] is int ? j['clipSkip'] as int : clipSkip).clamp(1, 12);
      vae = j['vae']?.toString() ?? vae;
      highRes = j['highRes'] == true;
      japanesePrompt = j['japanesePrompt'] == true;
      imagesPerRequest = j['imagesPerRequest'] is int ? j['imagesPerRequest'] as int : null;
      loras = (j['loras'] is List ? j['loras'] as List : const []).map(LoraPick.fromJson).whereType<LoraPick>().toList();
      notifyListeners();
    } catch (_) {
      // 壊れた保存データは無視して既定値で始める
    }
  }

  /// 存在しないモデルを指していたら既定に戻す
  void validate(GenCatalog catalog) {
    final model = catalog.model(modelId);
    if (model == null) {
      final fallback = catalog.model(GenRules.defaultModelId) ?? (catalog.models.isEmpty ? null : catalog.models.first);
      if (fallback != null) {
        _applyModelType(fallback.id, fallback.type);
      }
    } else if (model.type != modelType) {
      _applyModelType(model.id, model.type);
    }
    sizeType = GenRules.convertSize(sizeType, effectiveType);
    if (!GenRules.samplers.contains(sampler)) sampler = 'DPM++ 2M Karras';
    notifyListeners();
  }

  void _scheduleSave() {
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(milliseconds: 400), save);
  }

  Future<void> save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_storageKey, jsonEncode(toJson()));
    } catch (_) {}
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    super.dispose();
  }
}
