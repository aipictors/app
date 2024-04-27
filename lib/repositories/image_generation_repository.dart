import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ローカルストレージ
class ImageGenerationRepository {
  const ImageGenerationRepository();

  static SharedPreferences? instance;

  static activate() async {
    instance = await SharedPreferences.getInstance();
  }

  /// 生成枚数
  int get count {
    return instance!.getInt('generation_count') ?? 1;
  }

  Future updateCount(int? value) async {
    if (value == null) {
      await instance!.remove('generation_count');
      return;
    }
    await instance!.setInt('generation_count', value);
  }

  /// 生成方法
  GImageGenerationType get type {
    final value = instance!.getString('generation_type');
    for (final item in GImageGenerationType.values) {
      if (item.name == value) {
        return item;
      }
    }
    return GImageGenerationType.TEXT_TO_IMAGE;
  }

  Future updateType(GImageGenerationType? value) async {
    if (value == null) {
      await instance!.remove('generation_type');
      return;
    }
    await instance!.setString('generation_type', value.name);
  }

  /// モデル
  String get model {
    return instance!.getString('generation_model') ?? '';
  }

  Future updateModel(String? value) async {
    if (value == null) {
      await instance!.remove('generation_model');
      return;
    }
    await instance!.setString('generation_model', value);
  }

  /// VAE
  String get vae {
    return instance!.getString('generation_vae') ?? '';
  }

  Future updateVae(String? value) async {
    if (value == null) {
      await instance!.remove('generation_vae');
      return;
    }
    await instance!.setString('generation_vae', value);
  }

  /// プロンプト
  String get prompt {
    return instance!.getString('generation_prompt') ?? '';
  }

  Future updatePrompt(String? value) async {
    if (value == null) {
      await instance!.remove('generation_prompt');
      return;
    }
    await instance!.setString('generation_prompt', value);
  }

  /// ネガティブプロンプト
  String get negativePrompt {
    return instance!.getString('generation_negative_prompt') ?? '';
  }

  Future updateNegativePrompt(String? value) async {
    if (value == null) {
      await instance!.remove('generation_negative_prompt');
      return;
    }
    await instance!.setString('generation_negative_prompt', value);
  }

  /// seed
  int get seed {
    return instance!.getInt('generation_seed') ?? -1;
  }

  Future updateSeed(int? value) async {
    if (value == null) {
      await instance!.remove('generation_seed');
      return;
    }
    await instance!.setInt('generation_seed', value);
  }

  /// steps
  int get steps {
    return instance!.getInt('generation_steps') ?? 20;
  }

  Future updateSteps(int? value) async {
    if (value == null) {
      await instance!.remove('generation_steps');
      return;
    }
    await instance!.setInt('generation_steps', value);
  }

  /// scale
  int get scale {
    return instance!.getInt('generation_scale') ?? 7;
  }

  Future updateScale(int? value) async {
    if (value == null) {
      await instance!.remove('generation_scale');
      return;
    }
    await instance!.setInt('generation_scale', value);
  }

  /// sampler
  String get sampler {
    return instance!.getString('generation_sampler') ?? '';
  }

  Future updateSampler(String? value) async {
    if (value == null) {
      await instance!.remove('generation_sampler');
      return;
    }
    await instance!.setString('generation_sampler', value);
  }

  /// 画像のサイズ
  GImageGenerationSizeType get sizeType {
    final value = instance!.getString('generation_size_type');
    for (final item in GImageGenerationSizeType.values) {
      if (item.name == value) {
        return item;
      }
    }
    return GImageGenerationSizeType.SD1_512_512;
  }

  Future updateSizeType(GImageGenerationSizeType? value) async {
    if (value == null) {
      await instance!.remove('generation_size_type');
      return;
    }
    await instance!.setString('generation_size_type', value.name);
  }
}
