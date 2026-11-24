import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_settings.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 参照生成（Web の /generation?work=<id> と GenerationConfigRestoration）
// 作品の生成情報を生成画面に流し込む。Web はすべてそのまま入れるが、アプリは入れる項目を選べる。

const _refWorkQuery = '''
query AppReferenceWork(\$id: ID!) {
  work(id: \$id) {
    id title enTitle rating isGeneration promptAccessType
    generationModelId model prompt negativePrompt seed steps scale sampler vae clipSkip
    imageWidth imageHeight smallThumbnailImageURL
    user { $userSummaryFields }
  }
}''';

/// 参照する作品（生成に使う項目だけ）
class RefWork {
  const RefWork({
    required this.id,
    required this.title,
    this.thumbnailUrl,
    this.user,
    this.rating = 'G',
    this.isGeneration = false,
    this.generationModelId,
    this.modelName,
    this.prompt,
    this.negativePrompt,
    this.seed,
    this.steps,
    this.scale,
    this.sampler,
    this.vae,
    this.clipSkip,
    this.width = 0,
    this.height = 0,
  });

  final String id;
  final String title;
  final String? thumbnailUrl;
  final Map<String, dynamic>? user;
  final String rating;
  final bool isGeneration;
  final String? generationModelId;

  /// 作品に書かれたモデル名（アプリに無いときの案内に出す）
  final String? modelName;
  final String? prompt;
  final String? negativePrompt;
  final int? seed;
  final int? steps;
  final int? scale;
  final String? sampler;
  final String? vae;
  final int? clipSkip;
  final int width;
  final int height;

  String get userName => user?.str('name') ?? '';

  static String? _text(Object? v) {
    final s = v?.toString().trim();
    return s == null || s.isEmpty || s == 'null' ? null : s;
  }

  static int? _int(Object? v) => v is num ? v.toInt() : int.tryParse(v?.toString() ?? '');

  factory RefWork.fromJson(Map<String, dynamic> j) => RefWork(
    id: j.str('id'),
    title: localizedContent(j.str('title'), j.strOrNull('enTitle')),
    thumbnailUrl: j.strOrNull('smallThumbnailImageURL'),
    user: j.obj('user'),
    rating: j.str('rating', 'G'),
    isGeneration: j.boolean('isGeneration'),
    generationModelId: _text(j['generationModelId']),
    modelName: _text(j['model']),
    prompt: _text(j['prompt']),
    negativePrompt: _text(j['negativePrompt']),
    seed: _int(j['seed']),
    steps: _int(j['steps']),
    scale: _int(j['scale']),
    sampler: _text(j['sampler']),
    vae: _text(j['vae']),
    clipSkip: _int(j['clipSkip']),
    width: _int(j['imageWidth']) ?? 0,
    height: _int(j['imageHeight']) ?? 0,
  );

  static Future<RefWork> load(String id) async {
    final data = await Api.query(_refWorkQuery, variables: {'id': id});
    final w = data.obj('work');
    if (w == null) throw ApiException(tr('作品が見つかりませんでした', 'Work not found'));
    final work = RefWork.fromJson(w);
    // アプリは R18 を出さない
    if (work.rating == 'R18' || work.rating == 'R18G') throw ApiException(tr('この作品は参照できません', 'This work cannot be referenced'));
    return work;
  }
}

/// 引き継ぐ項目
enum RefField {
  prompt,
  negative,
  model,
  loras,
  size,
  params,
  seed;

  String get label => switch (this) {
    RefField.prompt => tr('プロンプト', 'Prompt'),
    RefField.negative => tr('ネガティブ', 'Negative'),
    RefField.model => tr('モデル', 'Model'),
    RefField.loras => 'LoRA',
    RefField.size => tr('サイズ', 'Size'),
    RefField.params => tr('詳細設定', 'Advanced'),
    RefField.seed => 'Seed',
  };

  IconData get icon => switch (this) {
    RefField.prompt => Icons.notes_rounded,
    RefField.negative => Icons.do_not_disturb_on_outlined,
    RefField.model => Icons.palette_outlined,
    RefField.loras => Icons.extension_outlined,
    RefField.size => Icons.aspect_ratio_rounded,
    RefField.params => Icons.tune_rounded,
    RefField.seed => Icons.casino_outlined,
  };
}

/// 設定に入れる値（null は変えない）
class ReferencePatch {
  const ReferencePatch({this.model, this.prompt, this.loras, this.negativePrompt, this.size, this.steps, this.scale, this.sampler, this.scheduler, this.clipSkip, this.vae, this.seed});

  final ImageModel? model;
  final String? prompt;
  final List<LoraPick>? loras;
  final String? negativePrompt;

  /// 元の作品の縦横（モデルの選択肢から一番近い比率を選ぶ）
  final GenSize? size;
  final int? steps;
  final int? scale;
  final String? sampler;
  final String? scheduler;
  final int? clipSkip;
  final String? vae;
  final int? seed;
}

/// 作品とアプリのモデル一覧から、引き継げる項目を決める（画面に依らない部分）
class ReferencePlan {
  ReferencePlan._({
    required this.work,
    required this.model,
    required this.prompt,
    required this.loras,
    required this.missingLoras,
  });

  final RefWork work;

  /// アプリで選べるモデル（無ければ null）
  final ImageModel? model;

  /// LoRA の指定を除いたプロンプト
  final String prompt;

  /// アプリにある LoRA
  final List<LoraPick> loras;

  /// アプリに無い LoRA の名前
  final List<String> missingLoras;

  factory ReferencePlan.build(RefWork work, GenCatalog catalog) {
    final parsed = GenSettings.extractLoras(work.prompt ?? '');
    final known = <LoraPick>[];
    final missing = <String>[];
    for (final l in parsed.$2) {
      final m = catalog.lora(l.name);
      // みんなの LoRA（user_xxx）は一覧に無くても使える（アプリの LoRA 選択と同じ）
      if (m == null && l.isUserModel) {
        known.add(LoraPick(name: l.name, weight: l.weight));
      } else if (m == null) {
        missing.add(l.name);
      } else {
        known.add(LoraPick(name: l.name, weight: l.weight, label: m.name, thumbnailUrl: m.thumbnailUrl));
      }
    }
    return ReferencePlan._(work: work, model: _findModel(work, catalog), prompt: parsed.$1, loras: known, missingLoras: missing);
  }

  static ImageModel? _findModel(RefWork work, GenCatalog catalog) {
    final id = work.generationModelId;
    if (id != null) {
      final m = catalog.model(id);
      if (m != null) return m;
    }
    final name = work.modelName?.toLowerCase();
    if (name == null) return null;
    for (final m in catalog.models) {
      if (m.name.toLowerCase() == name || m.displayName.toLowerCase() == name) return m;
    }
    return null;
  }

  /// 作品に書かれたモデル名（アプリに無いときの案内用）
  String get workModelLabel => work.modelName ?? (work.generationModelId != null ? 'ID ${work.generationModelId}' : tr('不明', 'Unknown'));

  static bool supportsLora(String type) => type == 'SD1' || type == 'SD2' || type == 'SDXL';

  static bool supportsVae(String type) => type == 'SD1' || type == 'SD2' || type == 'SDXL';

  bool get hasParams => work.steps != null || work.scale != null || work.sampler != null || work.clipSkip != null;

  /// 項目を選べるか
  bool available(RefField f) => switch (f) {
    RefField.prompt => prompt.isNotEmpty,
    RefField.negative => work.negativePrompt != null,
    RefField.model => model != null,
    RefField.loras => loras.isNotEmpty,
    RefField.size => work.width > 0 && work.height > 0,
    RefField.params => hasParams,
    RefField.seed => (work.seed ?? 0) > 0,
  };

  /// 最初から選んでおく項目（Seed は Web と同じく毎回変える）
  Set<RefField> get defaults => {
    for (final f in RefField.values)
      if (f != RefField.seed && available(f)) f,
  };

  bool get hasAnything => RefField.values.any(available);

  /// 選んだ項目を反映したあとのモデルの種類
  String resultType(Set<RefField> on, String currentType) => on.contains(RefField.model) && model != null ? model!.type : currentType;

  /// 反映したあとのサイズ（縦横の数字）
  GenSize? resultSize(Set<RefField> on, String currentType) {
    if (!available(RefField.size)) return null;
    return GenSize.parse(GenRules.nearestSize(resultType(on, currentType), GenSize('', work.width, work.height)));
  }

  ReferencePatch patch(Set<RefField> on, {required String currentType}) {
    bool use(RefField f) => on.contains(f) && available(f);
    final type = resultType(on, currentType);
    final w = work;
    final sampler = w.sampler == null ? null : GenRules.splitSampler(w.sampler!);
    return ReferencePatch(
      model: use(RefField.model) ? model : null,
      prompt: use(RefField.prompt) ? prompt : null,
      loras: use(RefField.loras) && supportsLora(type) ? loras : null,
      negativePrompt: use(RefField.negative) ? w.negativePrompt : null,
      size: use(RefField.size) ? GenSize('', w.width, w.height) : null,
      steps: use(RefField.params) ? w.steps?.clamp(GenRules.minSteps, GenRules.maxSteps) : null,
      scale: use(RefField.params) ? w.scale?.clamp(GenRules.minScale, GenRules.maxScale) : null,
      sampler: use(RefField.params) ? sampler?.$1 : null,
      // 作品には Schedule type が残っていないので自動（昔の「DPM++ 2M Karras」は分ける）
      scheduler: use(RefField.params) ? sampler?.$2 : null,
      clipSkip: use(RefField.params) ? w.clipSkip?.clamp(1, 12) : null,
      vae: use(RefField.params) && supportsVae(type) && w.vae != null && GenRules.vaes.contains(w.vae) ? w.vae : null,
      seed: use(RefField.seed) ? w.seed : null,
    );
  }

  /// 実際に入った項目
  Set<RefField> applied(Set<RefField> on, {required String currentType}) {
    final type = resultType(on, currentType);
    return {
      for (final f in on)
        if (available(f) && (f != RefField.loras || supportsLora(type))) f,
    };
  }

  /// 流し込めなかったものの案内
  List<String> warnings(Set<RefField> on, {required String currentType}) {
    final type = resultType(on, currentType);
    return [
      if (model == null && (work.generationModelId != null || work.modelName != null))
        tr('モデル「$workModelLabel」はアプリにないため、今のモデルのままです', 'Model "$workModelLabel" is not available in the app, so your current model is kept'),
      if (missingLoras.isNotEmpty)
        tr('LoRA「${missingLoras.join('」「')}」はアプリにないため入れていません', 'LoRA ${missingLoras.join(', ')} not available in the app, so not added'),
      if (on.contains(RefField.loras) && loras.isNotEmpty && !supportsLora(type))
        tr('このモデルでは LoRA を使えないため入れていません', 'This model does not support LoRA, so it was not added'),
    ];
  }
}

/// 生成画面へ参照する作品を渡す（生成タブは常にあるので、ここに置いてタブを切り替える）
class GenReference {
  GenReference._();

  static final pending = ValueNotifier<RefRequest?>(null);

  static void request(String workId, {String? title, String? thumbnailUrl}) {
    if (workId.isEmpty) return;
    pending.value = RefRequest(workId, title: title, thumbnailUrl: thumbnailUrl);
  }

  /// 作品画面・カードの「この作品をもとに生成」
  static void open(BuildContext context, String workId, {String? title, String? thumbnailUrl}) {
    if (!Nav.requireLogin(context)) return;
    Ds.impact();
    request(workId, title: title, thumbnailUrl: thumbnailUrl);
    ProviderScope.containerOf(context, listen: false).read(homeTabIndexProvider.notifier).update(2);
    context.go('/');
  }
}

class RefRequest {
  const RefRequest(this.workId, {this.title, this.thumbnailUrl});

  final String workId;
  final String? title;
  final String? thumbnailUrl;
}

/// 生成画面で参照している作品
class ReferenceState {
  ReferenceState({required this.plan, required this.selected, required this.applied, required this.warnings, required this.before});

  final ReferencePlan plan;
  final Set<RefField> selected;
  final Set<RefField> applied;
  final List<String> warnings;

  /// 流し込む前の設定（元に戻す）
  final Map<String, dynamic> before;
}

/// 作品画面の「参照生成する」（Web の work-article.tsx と同じく、Aipictors で生成した作品だけ）
class ReferenceGenerateButton extends StatelessWidget {
  const ReferenceGenerateButton({super.key, required this.workId, this.title, this.thumbnailUrl});

  final String workId;
  final String? title;
  final String? thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: () => GenReference.open(context, workId, title: title, thumbnailUrl: thumbnailUrl),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: Ds.br(16),
          gradient: LinearGradient(colors: [Ds.blue.withValues(alpha: 0.12), Ds.purple.withValues(alpha: 0.12), Ds.pink.withValues(alpha: 0.12)]),
          border: Border.all(color: Ds.purple.withValues(alpha: 0.25)),
        ),
        child: Row(children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(12)),
            child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(tr('この作品をもとに生成', 'Generate from this work'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
              const SizedBox(height: 1),
              Text(tr('プロンプトやモデルを選んで読み込めます', 'Load the prompt, model and more'), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 12)),
            ]),
          ),
          Icon(Icons.chevron_right_rounded, color: context.muted),
        ]),
      ),
    );
  }
}

/// 生成画面の上に出す「参照中の作品」
class ReferenceBanner extends StatelessWidget {
  const ReferenceBanner({super.key, this.state, this.loading, required this.onClose, this.onUndo, this.onEdit});

  final ReferenceState? state;

  /// 読み込み中（タブを切り替えた直後）
  final RefRequest? loading;
  final VoidCallback onClose;
  final VoidCallback? onUndo;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final s = state;
    final work = s?.plan.work;
    final title = work?.title ?? loading?.title ?? '';
    final thumb = work?.thumbnailUrl ?? loading?.thumbnailUrl;
    final workId = work?.id ?? loading?.workId ?? '';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(10, 10, 4, 10),
      decoration: BoxDecoration(
        color: context.surfaceCard,
        borderRadius: Ds.br(16),
        border: Border.all(color: Ds.purple.withValues(alpha: 0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Pressable(
            onTap: workId.isEmpty ? null : () => Nav.work(context, workId),
            child: thumb == null
                ? Container(width: 48, height: 48, decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(10)))
                : AppImage(thumb, width: 48, height: 48, radius: 10, memCacheWidth: 150),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                ShaderMask(shaderCallback: (r) => Ds.brandGradient.createShader(r), child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 13)),
                const SizedBox(width: 4),
                Text(tr('参照中の作品', 'Referencing'), style: TextStyle(color: context.muted, fontSize: 11, fontWeight: FontWeight.w700)),
              ]),
              const SizedBox(height: 2),
              Text(title.isEmpty ? tr('無題', 'Untitled') : title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
              if (work != null && work.userName.isNotEmpty) ...[
                const SizedBox(height: 3),
                Row(children: [
                  UserAvatar.json(work.user, size: 16),
                  const SizedBox(width: 5),
                  Flexible(child: Text(work.userName, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 12))),
                ]),
              ] else if (s == null) ...[
                const SizedBox(height: 4),
                Row(children: [
                  const SizedBox(width: 12, height: 12, child: CircularProgressIndicator(strokeWidth: 2)),
                  const SizedBox(width: 6),
                  Text(tr('作品の生成情報を読み込み中…', 'Loading generation info…'), style: TextStyle(color: context.muted, fontSize: 12)),
                ]),
              ],
            ]),
          ),
          IconButton(
            tooltip: tr('参照を外す', 'Remove reference'),
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.close_rounded, color: context.muted, size: 20),
            onPressed: onClose,
          ),
        ]),
        if (s != null && s.applied.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(spacing: 6, runSpacing: 6, children: [
            for (final f in RefField.values)
              if (s.applied.contains(f)) _AppliedChip(field: f),
          ]),
        ],
        if (s != null && s.warnings.isNotEmpty) ...[
          const SizedBox(height: 8),
          for (final w in s.warnings)
            Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 3),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.info_outline_rounded, size: 15, color: Ds.gold),
                const SizedBox(width: 5),
                Expanded(child: Text(w, style: TextStyle(fontSize: 12, height: 1.4, color: context.cs.onSurface.withValues(alpha: 0.8)))),
              ]),
            ),
        ],
        if (s != null && (onEdit != null || onUndo != null))
          Row(children: [
            if (onEdit != null)
              TextButton.icon(
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact, textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                onPressed: onEdit,
                icon: const Icon(Icons.checklist_rounded, size: 16),
                label: Text(tr('項目を選び直す', 'Change items')),
              ),
            if (onUndo != null)
              TextButton.icon(
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact, textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                onPressed: onUndo,
                icon: const Icon(Icons.undo_rounded, size: 16),
                label: Text(tr('読み込む前に戻す', 'Undo')),
              ),
          ]),
      ]),
    );
  }
}

class _AppliedChip extends StatelessWidget {
  const _AppliedChip({required this.field});

  final RefField field;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 3, 8, 3),
      decoration: BoxDecoration(color: context.cs.primary.withValues(alpha: 0.1), borderRadius: Ds.br(10)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.check_rounded, size: 13, color: context.cs.primary),
        const SizedBox(width: 3),
        Text(field.label, style: TextStyle(color: context.cs.primary, fontSize: 11.5, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}

/// 引き継ぐ項目を選ぶシート。null は取り消し
Future<Set<RefField>?> showReferenceSheet(BuildContext context, {required ReferencePlan plan, required String currentType, required String currentModelName, Set<RefField>? initial}) {
  return showModalBottomSheet<Set<RefField>>(
    context: context,
    showDragHandle: true,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (sheet) => _ReferenceSheet(plan: plan, currentType: currentType, currentModelName: currentModelName, initial: initial ?? plan.defaults),
  );
}

class _ReferenceSheet extends StatefulWidget {
  const _ReferenceSheet({required this.plan, required this.currentType, required this.currentModelName, required this.initial});

  final ReferencePlan plan;
  final String currentType;
  final String currentModelName;
  final Set<RefField> initial;

  @override
  State<_ReferenceSheet> createState() => _ReferenceSheetState();
}

class _ReferenceSheetState extends State<_ReferenceSheet> {
  late final Set<RefField> _on = widget.initial.where(widget.plan.available).toSet();


  String? _value(RefField f) {
    final p = widget.plan;
    final w = p.work;
    switch (f) {
      case RefField.prompt:
        return p.prompt.isEmpty ? null : p.prompt;
      case RefField.negative:
        return w.negativePrompt;
      case RefField.model:
        return p.model?.displayName;
      case RefField.loras:
        return p.loras.map((l) => '${l.label ?? l.name} ×${l.weight}').join('、');
      case RefField.size:
        final s = p.resultSize(_on, widget.currentType);
        return s == null ? null : '${s.width} × ${s.height}';
      case RefField.params:
        return [
          if (w.steps != null) 'Steps ${w.steps}',
          if (w.scale != null) 'Scale ${w.scale}',
          if (w.sampler != null) w.sampler!,
          if (w.clipSkip != null) 'Clip skip ${w.clipSkip}',
          if (w.vae != null) 'VAE ${w.vae}',
        ].join(' · ');
      case RefField.seed:
        return w.seed?.toString();
    }
  }

  /// 選べないときの理由・補足
  String? _note(RefField f) {
    final p = widget.plan;
    final type = p.resultType(_on, widget.currentType);
    if (!p.available(f)) {
      return switch (f) {
        RefField.prompt => tr('プロンプトが公開されていません', 'Prompt is not public'),
        RefField.negative => tr('ネガティブプロンプトがありません', 'No negative prompt'),
        RefField.model => p.work.generationModelId != null || p.work.modelName != null ? tr('「${p.workModelLabel}」はアプリにありません。今のモデル（${widget.currentModelName}）のままです', '"${p.workModelLabel}" is not in the app. Keeping ${widget.currentModelName}') : tr('モデルの情報がありません', 'No model info'),
        RefField.loras => p.missingLoras.isNotEmpty ? tr('「${p.missingLoras.join('」「')}」はアプリにありません', '${p.missingLoras.join(', ')} not in the app') : tr('LoRA は使われていません', 'No LoRA used'),
        RefField.size => tr('サイズの情報がありません', 'No size info'),
        RefField.params => tr('詳細設定の情報がありません', 'No advanced settings'),
        RefField.seed => tr('Seed が公開されていません', 'Seed is not public'),
      };
    }
    return switch (f) {
      RefField.loras when !ReferencePlan.supportsLora(type) => tr('選んでいるモデルでは LoRA を使えません', 'The selected model does not support LoRA'),
      RefField.loras when p.missingLoras.isNotEmpty => tr('「${p.missingLoras.join('」「')}」はアプリにないので入りません', '${p.missingLoras.join(', ')} not in the app'),
      RefField.size => tr('近い比率のサイズにします', 'Uses the closest aspect ratio'),
      RefField.seed => tr('オンにすると元の作品に近い絵になりやすくなります', 'Turn on to get closer to the original'),
      _ => null,
    };
  }

  /// アプリに無くて入れられないもの（黄色で出す）
  bool _isWarning(RefField f) {
    final p = widget.plan;
    return switch (f) {
      RefField.model => p.model == null && (p.work.generationModelId != null || p.work.modelName != null),
      RefField.loras => p.missingLoras.isNotEmpty || (p.loras.isNotEmpty && !ReferencePlan.supportsLora(p.resultType(_on, widget.currentType))),
      _ => false,
    };
  }

  void _toggle(RefField f, bool on) {
    Ds.tap();
    setState(() => on ? _on.add(f) : _on.remove(f));
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.plan;
    final w = p.work;
    final count = p.applied(_on, currentType: widget.currentType).length;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.85),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
          child: Row(children: [
            AppImage(w.thumbnailUrl, width: 52, height: 52, radius: 12, memCacheWidth: 160),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(tr('この作品をもとに生成', 'Generate from this work'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 2),
                Text(
                  '${w.title.isEmpty ? tr('無題', 'Untitled') : w.title}${w.userName.isEmpty ? '' : ' / ${w.userName}'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: context.muted, fontSize: 13),
                ),
              ]),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
          child: Text(tr('生成画面に読み込む項目を選んでください。いまの入力は上書きされます。', 'Choose what to load. Your current input will be replaced.'), style: TextStyle(color: context.muted, fontSize: 12.5)),
        ),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            children: [
              for (final f in RefField.values) _row(f),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: GradientButton(
              label: count == 0 ? tr('項目を選んでください', 'Choose items') : tr('$count 項目を読み込む', 'Load $count items'),
              icon: Icons.auto_awesome_rounded,
              onPressed: count == 0 ? null : () => Navigator.pop(context, Set<RefField>.of(_on)),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _row(RefField f) {
    final p = widget.plan;
    final enabled = p.available(f);
    final on = enabled && _on.contains(f);
    final value = enabled ? _value(f) : null;
    final note = _note(f);
    return Opacity(
      opacity: enabled ? 1 : 0.7,
      child: InkWell(
        borderRadius: Ds.br(14),
        onTap: enabled ? () => _toggle(f, !on) : null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(color: on ? context.cs.primary.withValues(alpha: 0.12) : context.skeleton, borderRadius: Ds.br(10)),
              child: Icon(f.icon, size: 18, color: on ? context.cs.primary : context.muted),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 1),
                Text(f.label, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                if (value != null && value.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(value, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.5, height: 1.4, color: context.cs.onSurface.withValues(alpha: 0.8))),
                ],
                if (note != null) ...[
                  const SizedBox(height: 2),
                  Text(note, style: TextStyle(fontSize: 11.5, height: 1.4, color: _isWarning(f) ? Ds.gold : context.muted)),
                ],
              ]),
            ),
            Switch.adaptive(value: on, onChanged: enabled ? (v) => _toggle(f, v) : null),
          ]),
        ),
      ),
    );
  }
}
