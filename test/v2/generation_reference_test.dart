import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_reference.dart';
import 'package:aipictors/v2/generation/generation_settings.dart';
import 'package:flutter_test/flutter_test.dart';

GenCatalog _catalog() => GenCatalog.fromJson({
  'imageModels': [
    {'id': '1', 'name': 'blue_pencil-v10.safetensors', 'displayName': 'BluePencil', 'type': 'SD1'},
    {'id': '20', 'name': 'animagine-xl.safetensors', 'displayName': 'Animagine XL', 'type': 'SDXL'},
    {'id': '30', 'name': 'gemini', 'displayName': 'Gemini', 'type': 'GEMINI'},
  ],
  'imageLoraModels': [
    {'id': 'l1', 'name': 'flat2', 'description': '', 'genre': 'style', 'thumbnailImageURL': 'https://example.com/flat2.webp'},
  ],
  'promptCategories': [],
  'negativePromptCategories': [],
});

RefWork _work({String? modelId = '20', String? prompt = '<lora:flat2:0.6>, <lora:secret:1>, 1girl, smile', int? seed = 12345}) => RefWork.fromJson({
  'id': '100',
  'title': 'テスト',
  'isGeneration': true,
  'generationModelId': modelId,
  'model': 'mystery-model',
  'prompt': prompt,
  'negativePrompt': 'lowres',
  'seed': seed,
  'steps': 50,
  'scale': 8,
  'sampler': 'DPM++ 2M Karras',
  'vae': 'sdxl_vae',
  'clipSkip': 2,
  'imageWidth': 1664,
  'imageHeight': 2432,
});

void main() {
  test('作品の値を Web と同じ項目に分ける（LoRA は取り出して、アプリに無いものは別に）', () {
    final plan = ReferencePlan.build(_work(), _catalog());
    expect(plan.model?.id, '20');
    expect(plan.prompt, '1girl, smile');
    expect(plan.loras.map((l) => l.name), ['flat2']);
    expect(plan.loras.first.weight, 0.6);
    expect(plan.missingLoras, ['secret']);
    // Seed は既定では引き継がない（Web は -1 にする）
    expect(plan.defaults.contains(RefField.seed), false);
    expect(plan.defaults.containsAll([RefField.prompt, RefField.negative, RefField.model, RefField.loras, RefField.size, RefField.params]), true);
  });

  test('patch は範囲に収め、サンプラーと Schedule type を分ける', () {
    final plan = ReferencePlan.build(_work(), _catalog());
    final p = plan.patch({...plan.defaults, RefField.seed}, currentType: 'SD1');
    expect(p.model?.id, '20');
    expect(p.prompt, '1girl, smile');
    expect(p.negativePrompt, 'lowres');
    expect(p.steps, GenRules.maxSteps);
    expect(p.scale, 8);
    expect(p.sampler, 'DPM++ 2M');
    expect(p.scheduler, 'Karras');
    expect(p.vae, 'sdxl_vae');
    expect(p.seed, 12345);
    expect(p.loras?.length, 1);
    // SDXL の選択肢から縦長のサイズ
    expect(plan.resultSize(plan.defaults, 'SD1')?.type, 'SD3_832_1216');
  });

  test('選んでいない項目は変えない', () {
    final plan = ReferencePlan.build(_work(), _catalog());
    final p = plan.patch({RefField.prompt}, currentType: 'SD1');
    expect(p.prompt, '1girl, smile');
    expect(p.model, isNull);
    expect(p.negativePrompt, isNull);
    expect(p.steps, isNull);
    expect(p.seed, isNull);
    expect(p.size, isNull);
  });

  test('アプリに無いモデルは選べず、案内を出す', () {
    final plan = ReferencePlan.build(_work(modelId: '999'), _catalog());
    expect(plan.model, isNull);
    expect(plan.available(RefField.model), false);
    final warnings = plan.warnings(plan.defaults, currentType: 'SD1');
    expect(warnings.any((w) => w.contains('mystery-model')), true);
    expect(warnings.any((w) => w.contains('secret')), true);
    // モデルを変えないので、今の SD1 の選択肢でサイズを決める
    expect(plan.resultSize(plan.defaults, 'SD1')?.type, 'SD1_512_768');
  });

  test('LoRA を使えないモデル（Gemini）では LoRA と VAE を入れない', () {
    final plan = ReferencePlan.build(_work(modelId: '30'), _catalog());
    final p = plan.patch(plan.defaults, currentType: 'SD1');
    expect(p.model?.type, 'GEMINI');
    expect(p.loras, isNull);
    expect(p.vae, isNull);
    expect(plan.applied(plan.defaults, currentType: 'SD1').contains(RefField.loras), false);
    expect(plan.warnings(plan.defaults, currentType: 'SD1').length, 2);
  });

  test('プロンプトが非公開なら選べない', () {
    final plan = ReferencePlan.build(_work(prompt: null, seed: null), _catalog());
    expect(plan.available(RefField.prompt), false);
    expect(plan.available(RefField.loras), false);
    expect(plan.available(RefField.seed), false);
    expect(plan.hasAnything, true);
  });

  test('GenSettings に流し込み、元に戻せる', () {
    final s = GenSettings();
    addTearDown(s.dispose);
    final before = Map<String, dynamic>.of(s.toJson());
    final plan = ReferencePlan.build(_work(), _catalog());
    s.applyReference(plan.patch(plan.defaults, currentType: s.effectiveType));
    expect(s.modelId, '20');
    expect(s.modelType, 'SDXL');
    expect(s.prompt, '1girl, smile');
    expect(s.negativePrompt, 'lowres');
    expect(s.sizeType, 'SD3_832_1216');
    expect(s.loras.map((l) => l.name), ['flat2']);
    expect(s.steps, GenRules.maxSteps);
    expect(s.sampler, 'DPM++ 2M');
    expect(s.scheduler, 'Karras');
    expect(s.vae, 'sdxl_vae');
    expect(s.seed, -1);
    s.loadJson(before);
    expect(s.modelId, GenRules.defaultModelId);
    expect(s.prompt, GenRules.defaultPrompt);
    expect(s.loras, isEmpty);
    expect(s.sizeType, 'SD1_512_768');
  });

  test('みんなの LoRA（user_xxx）は一覧に無くても入れる', () {
    final plan = ReferencePlan.build(_work(prompt: '<lora:user_abc123:0.8>, 1girl'), _catalog());
    expect(plan.loras.map((l) => l.name), ['user_abc123']);
    expect(plan.missingLoras, isEmpty);
  });
}
