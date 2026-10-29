import 'dart:math' as math;

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/generation/generation_debug.dart';
import 'package:aipictors/v2/generation/generation_settings.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/generation/lora_picker.dart';
import 'package:aipictors/v2/generation/model_picker.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 生成の設定フォーム（モデル・プロンプト・サイズ・詳細設定）
class GenerationForm extends StatefulWidget {
  const GenerationForm({super.key, required this.controller, this.header, this.bottomPadding = 140});

  final GenController controller;
  final Widget? header;
  final double bottomPadding;

  @override
  State<GenerationForm> createState() => _GenerationFormState();
}

class _GenerationFormState extends State<GenerationForm> {
  late final _prompt = TextEditingController(text: s.prompt);
  late final _negative = TextEditingController(text: s.negativePrompt);
  late final _seed = TextEditingController(text: s.seed == -1 ? '' : '${s.seed}');
  late bool _advancedOpen = kDebugMode && GenDebug.action == 'advanced';
  bool _negativeOpen = false;
  final _scroll = ScrollController();

  GenController get c => widget.controller;

  GenSettings get s => c.settings;

  @override
  void initState() {
    super.initState();
    s.addListener(_syncText);
    if (_advancedOpen) {
      // 開発用: 詳細設定が見える位置まで送る
      for (final ms in const [2500, 4000]) {
        Future.delayed(Duration(milliseconds: ms), () {
          if (mounted && _scroll.hasClients) _scroll.jumpTo(_scroll.position.maxScrollExtent);
        });
      }
    }
  }

  @override
  void dispose() {
    s.removeListener(_syncText);
    _prompt.dispose();
    _negative.dispose();
    _seed.dispose();
    _scroll.dispose();
    super.dispose();
  }

  /// 設定が外から変わったとき（再生成・保存の復元）に入力欄を合わせる
  void _syncText() {
    if (_prompt.text != s.prompt) {
      _prompt.value = TextEditingValue(text: s.prompt, selection: TextSelection.collapsed(offset: s.prompt.length));
    }
    if (_negative.text != s.negativePrompt) _negative.text = s.negativePrompt;
    final seedText = s.seed == -1 ? '' : '${s.seed}';
    if (_seed.text != seedText) _seed.text = seedText;
  }

  void _appendPrompt(TextEditingController field, String words, {bool negative = false}) {
    final current = field.text.trim();
    final next = current.isEmpty ? words : (current.endsWith(',') ? '$current $words' : '$current, $words');
    s.update((x) => negative ? x.negativePrompt = next : x.prompt = next);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: c,
      builder: (context, _) {
        final catalog = c.catalog;
        return ListView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 8, 16, widget.bottomPadding),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            if (widget.header != null) widget.header!,
            _modelCard(catalog),
            const SizedBox(height: 12),
            _promptCard(catalog),
            const SizedBox(height: 12),
            if (!s.isGemini && s.effectiveType != 'FLUX') ...[_loraCard(), const SizedBox(height: 12)],
            _sizeCard(),
            const SizedBox(height: 12),
            _countCard(),
            const SizedBox(height: 12),
            if (!s.isGemini) _advancedCard(),
            const SizedBox(height: 16),
            Center(
              child: TextButton.icon(
                onPressed: _confirmReset,
                icon: const Icon(Icons.restart_alt_rounded, size: 18),
                label: const Text('設定を初期値に戻す'),
                style: TextButton.styleFrom(foregroundColor: context.muted),
              ),
            ),
          ],
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // モデル
  // ---------------------------------------------------------------------------

  Widget _modelCard(GenCatalog? catalog) {
    if (catalog == null) {
      if (c.catalogError != null) {
        return _Card(child: StateView.error(c.catalogError!, onRetry: c.loadCatalog));
      }
      return const Skeleton(height: 96, radius: 20);
    }
    final user = s.userCheckpoint;
    final model = c.model;
    final title = user?.name ?? model?.displayName ?? 'モデルを選ぶ';
    final thumb = user?.thumbnailUrl ?? model?.thumbnailUrl;
    final type = s.effectiveType;
    return Pressable(
      onTap: () => showModelPicker(context, c),
      scale: 0.98,
      child: _Card(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(gradient: Ds.brandGradient, borderRadius: Ds.br(16)),
              child: AppImage(thumb, width: 68, height: 68, radius: 14, memCacheWidth: 220),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user != null ? 'みんなのモデル' : 'モデル',
                    style: TextStyle(fontSize: 12, color: context.muted, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    children: [
                      Badge2(typeLabel(type), color: typeColor(type)),
                      if (user == null && model != null) Badge2(categoryLabel(model.category), color: context.muted.withValues(alpha: 0.6)),
                      if (user == null && (model?.isNew ?? false)) const Badge2('NEW', color: Ds.pink),
                    ],
                  ),
                ],
              ),
            ),
            if (user != null)
              IconButton(
                tooltip: '公式モデルに戻す',
                onPressed: () {
                  Ds.tap();
                  final m = c.model;
                  if (m != null) s.selectModel(m);
                },
                icon: const Icon(Icons.close_rounded),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(color: context.cs.primary.withValues(alpha: 0.1), borderRadius: Ds.br(20)),
              child: Text(
                '変更',
                style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w800, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // プロンプト
  // ---------------------------------------------------------------------------

  Widget _promptCard(GenCatalog? catalog) {
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const _Label(icon: Icons.edit_rounded, text: 'プロンプト'),
              const Spacer(),
              if (_prompt.text.isNotEmpty)
                _MiniButton(
                  icon: Icons.backspace_outlined,
                  label: 'クリア',
                  onTap: () {
                    final before = s.prompt;
                    s.update((x) => x.prompt = '');
                    ScaffoldMessenger.maybeOf(context)
                      ?..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: const Text('プロンプトを消しました'),
                          action: SnackBarAction(label: '元に戻す', onPressed: () => s.update((x) => x.prompt = before)),
                        ),
                      );
                  },
                ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _prompt,
            minLines: 3,
            maxLines: 8,
            maxLength: GenRules.maxPromptLength,
            onChanged: (v) => s.update((x) => x.prompt = v),
            style: const TextStyle(fontSize: 15, height: 1.45),
            decoration: _fieldDecoration(context, s.japanesePrompt ? '例: 青い髪の女の子、星空の下で微笑む' : '例: masterpiece, best quality, 1girl, blue hair, starry sky'),
            buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _MiniButton(
                icon: Icons.add_circle_outline_rounded,
                label: 'キーワード',
                onTap: catalog == null ? null : () => showPromptWords(context, categories: catalog.promptCategories, onAdd: (w) => _appendPrompt(_prompt, w)),
              ),
              const SizedBox(width: 6),
              if (c.model != null && c.model!.prompts.isNotEmpty && s.userCheckpoint == null)
                _MiniButton(icon: Icons.tips_and_updates_outlined, label: 'おすすめ', onTap: () => _appendPrompt(_prompt, c.model!.prompts.join(', '))),
              const Spacer(),
              Text(
                '${_prompt.text.length}',
                style: TextStyle(fontSize: 12, color: context.muted, fontFeatures: const [FontFeature.tabularFigures()]),
              ),
            ],
          ),
          const SizedBox(height: 4),
          _SwitchRow(title: '日本語で入力する', subtitle: '日本語のプロンプトを英語にしてから生成します', value: s.japanesePrompt, onChanged: (v) => s.update((x) => x.japanesePrompt = v)),
          if (!s.isGemini) ...[
            Divider(color: context.hairline, height: 16),
            Pressable(
              haptic: false,
              scale: 1,
              onTap: () => setState(() => _negativeOpen = !_negativeOpen),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    const _Label(icon: Icons.do_not_disturb_on_outlined, text: 'ネガティブプロンプト'),
                    const SizedBox(width: 8),
                    if (!_negativeOpen)
                      Expanded(
                        child: Text(
                          s.negativePrompt,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: context.muted),
                        ),
                      )
                    else
                      const Spacer(),
                    AnimatedRotation(
                      turns: _negativeOpen ? 0.5 : 0,
                      duration: Ds.normal,
                      child: Icon(Icons.expand_more_rounded, color: context.muted),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: Ds.normal,
              curve: Ds.curve,
              alignment: Alignment.topCenter,
              child: !_negativeOpen
                  ? const SizedBox(width: double.infinity)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 6),
                        Text('入れたくないものを書きます', style: TextStyle(fontSize: 12, color: context.muted)),
                        const SizedBox(height: 6),
                        TextField(
                          controller: _negative,
                          minLines: 2,
                          maxLines: 6,
                          maxLength: GenRules.maxPromptLength,
                          onChanged: (v) => s.update((x) => x.negativePrompt = v),
                          style: const TextStyle(fontSize: 14, height: 1.4),
                          decoration: _fieldDecoration(context, '例: EasyNegative, lowres, bad hands'),
                          buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _MiniButton(
                              icon: Icons.add_circle_outline_rounded,
                              label: 'キーワード',
                              onTap: catalog == null
                                  ? null
                                  : () => showPromptWords(
                                      context,
                                      title: 'ネガティブに足す',
                                      categories: catalog.negativePromptCategories,
                                      onAdd: (w) => _appendPrompt(_negative, w, negative: true),
                                    ),
                            ),
                            const Spacer(),
                            Text('${_negative.text.length}', style: TextStyle(fontSize: 12, color: context.muted)),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // LoRA
  // ---------------------------------------------------------------------------

  Widget _loraCard() {
    final limit = c.viewer?.loraLimit ?? 2;
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const _Label(icon: Icons.layers_rounded, text: 'LoRA'),
              const SizedBox(width: 6),
              Text(
                '${s.loras.length}/$limit',
                style: TextStyle(fontSize: 12, color: context.muted, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              _MiniButton(icon: Icons.add_rounded, label: '追加', onTap: () => showLoraPicker(context, c)),
            ],
          ),
          if (s.loras.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('絵柄・効果を足せます（フラットな絵、背景をシンプルに など）', style: TextStyle(fontSize: 12, color: context.muted)),
            ),
          for (final l in s.loras) ...[
            const SizedBox(height: 10),
            _LoraRow(
              pick: l,
              onChanged: (w) => s.update((_) => l.weight = w),
              onRemove: () {
                Ds.tap();
                s.update((x) => x.loras = x.loras.where((e) => e != l).toList());
              },
            ),
          ],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // サイズ
  // ---------------------------------------------------------------------------

  Widget _sizeCard() {
    final sizes = GenRules.sizes(s.effectiveType);
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const _Label(icon: Icons.aspect_ratio_rounded, text: 'サイズ'),
              const Spacer(),
              Builder(
                builder: (context) {
                  final cur = GenSize.parse(s.sizeType);
                  final m = s.highRes ? 2 : 1;
                  return Text(
                    '${cur.width * m} × ${cur.height * m}',
                    style: TextStyle(fontSize: 12, color: context.muted, fontWeight: FontWeight.w700),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 92,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final size = sizes[i];
                final selected = size.type == s.sizeType;
                final r = size.width / size.height;
                const box = 44.0;
                final w = r >= 1 ? box : box * r;
                final h = r >= 1 ? box / r : box;
                return Pressable(
                  onTap: () => s.update((x) => x.sizeType = size.type),
                  child: AnimatedContainer(
                    duration: Ds.normal,
                    width: 74,
                    decoration: BoxDecoration(
                      color: selected ? context.cs.primary.withValues(alpha: 0.1) : context.skeleton.withValues(alpha: 0.6),
                      borderRadius: Ds.br(16),
                      border: Border.all(color: selected ? context.cs.primary : Colors.transparent, width: 1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 48,
                          child: Center(
                            child: AnimatedContainer(
                              duration: Ds.normal,
                              width: w,
                              height: h,
                              decoration: BoxDecoration(
                                gradient: selected ? Ds.brandGradient : null,
                                color: selected ? null : context.muted.withValues(alpha: 0.25),
                                borderRadius: Ds.br(5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          size.ratioLabel,
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: selected ? context.cs.primary : null),
                        ),
                        Text('${size.width}×${size.height}', style: TextStyle(fontSize: 9.5, color: context.muted)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (!s.isGemini && s.effectiveType != 'FLUX') ...[
            const SizedBox(height: 10),
            _SwitchRow(
              title: '高解像度で生成する',
              subtitle: '2倍の大きさで生成します（1枚ずつ・コイン2倍）',
              badge: '×2',
              value: s.highRes,
              onChanged: (v) => s.update((x) => x.highRes = v),
            ),
          ],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 枚数
  // ---------------------------------------------------------------------------

  Widget _countCard() {
    final max = s.maxImagesPerRequest(c.model, isPaid: c.isPaid);
    final current = c.imagesPerRequest;
    final reason = s.highRes
        ? '高解像度は 1 枚ずつ生成します'
        : s.seed != -1
        ? 'Seed を決めているときは 1 枚ずつ生成します'
        : max == 1
        ? 'このモデルは 1 枚ずつ生成します'
        : c.isPaid
        ? null
        : 'Aipictors+ なら一度に 4 枚まで';
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const _Label(icon: Icons.burst_mode_rounded, text: '一度に作る枚数'),
              const Spacer(),
              _CountSelector(max: math.max(max, 1), value: current, onChanged: (v) => s.update((x) => x.imagesPerRequest = v == max ? null : v)),
            ],
          ),
          if (reason != null) ...[const SizedBox(height: 6), Text(reason, style: TextStyle(fontSize: 12, color: context.muted))],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 詳細設定
  // ---------------------------------------------------------------------------

  Widget _advancedCard() {
    final isFlux = s.effectiveType == 'FLUX';
    return _Card(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Pressable(
            scale: 1,
            onTap: () => setState(() => _advancedOpen = !_advancedOpen),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
              child: Row(
                children: [
                  const _Label(icon: Icons.tune_rounded, text: '詳細設定'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Steps ${s.steps} ・ Scale ${s.scale} ・ ${s.seed == -1 ? 'Seed ランダム' : 'Seed ${s.seed}'}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: context.muted),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _advancedOpen ? 0.5 : 0,
                    duration: Ds.normal,
                    child: Icon(Icons.expand_more_rounded, color: context.muted),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: Ds.normal,
            curve: Ds.curve,
            alignment: Alignment.topCenter,
            child: !_advancedOpen
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _SliderRow(
                          title: 'Steps',
                          help: '描き込みの回数。多いほど細かくなり、時間がかかります',
                          value: s.steps.toDouble(),
                          min: GenRules.minSteps.toDouble(),
                          max: GenRules.maxSteps.toDouble(),
                          label: '${s.steps}',
                          onChanged: (v) => s.update((x) => x.steps = v.round()),
                        ),
                        _SliderRow(
                          title: 'Scale',
                          help: 'プロンプトにどれだけ従うか',
                          value: s.scale.toDouble(),
                          min: GenRules.minScale.toDouble(),
                          max: GenRules.maxScale.toDouble(),
                          label: '${s.scale}',
                          onChanged: (v) => s.update((x) => x.scale = v.round()),
                        ),
                        if (!isFlux) ...[
                          _PickerRow(
                            title: 'Sampler',
                            help: 'ノイズの除去の手法',
                            value: s.sampler,
                            onTap: () => _pickFrom('Sampler', GenRules.samplers, s.sampler, (v) => s.update((x) => x.sampler = v)),
                          ),
                          _SliderRow(
                            title: 'Clip Skip',
                            help: 'プロンプトの解釈の深さ（多くのモデルは 2）',
                            value: s.clipSkip.toDouble(),
                            min: 1,
                            max: 12,
                            label: '${s.clipSkip}',
                            onChanged: (v) => s.update((x) => x.clipSkip = v.round()),
                          ),
                          _PickerRow(
                            title: 'VAE',
                            help: '色合い・仕上げの調整',
                            value: s.vae.isEmpty ? '自動' : s.vae,
                            onTap: () => _pickFrom('VAE', GenRules.vaes, s.vae, (v) => s.update((x) => x.vae = v)),
                          ),
                        ],
                        const SizedBox(height: 8),
                        _seedRow(),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _seedRow() {
    final locked = s.seed != -1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Seed', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(width: 6),
            Expanded(
              child: Text('同じ Seed・同じ設定なら、同じ絵になります', style: TextStyle(fontSize: 11.5, color: context.muted)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _seed,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                onChanged: (v) => s.update((x) => x.seed = int.tryParse(v) ?? -1),
                decoration: _fieldDecoration(context, 'ランダム').copyWith(prefixIcon: Icon(locked ? Icons.lock_rounded : Icons.shuffle_rounded, size: 18)),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filledTonal(
              tooltip: 'ランダムな Seed を入れる',
              onPressed: () {
                Ds.impact();
                s.update((x) => x.seed = math.Random().nextInt(2147483647));
              },
              icon: const Icon(Icons.casino_rounded),
            ),
            const SizedBox(width: 4),
            IconButton.filledTonal(
              tooltip: '毎回ランダムにする',
              onPressed: locked
                  ? () {
                      Ds.tap();
                      s.update((x) => x.seed = -1);
                    }
                  : null,
              icon: const Icon(Icons.lock_open_rounded),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickFrom(String title, List<String> values, String current, ValueChanged<String> onPick) async {
    final picked = await showGenSheet<String>(
      context,
      builder: (sheet) => SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(title, style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final v in values)
                      ListTile(
                        title: Text(v),
                        trailing: v == current ? Icon(Icons.check_rounded, color: context.cs.primary) : null,
                        onTap: () => Navigator.of(sheet).pop(v),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (picked != null) {
      Ds.tap();
      onPick(picked);
    }
  }

  Future<void> _confirmReset() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('設定を初期値に戻しますか？'),
        content: const Text('モデル・プロンプト・詳細設定が最初の状態になります'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialog).pop(false), child: const Text('やめる')),
          FilledButton(onPressed: () => Navigator.of(dialog).pop(true), child: const Text('戻す')),
        ],
      ),
    );
    if (ok != true) return;
    final catalog = c.catalog;
    s.update((x) {
      x.userCheckpoint = null;
      x.prompt = GenRules.defaultPrompt;
      x.negativePrompt = '';
      x.loras = [];
      x.steps = 20;
      x.scale = 7;
      x.sampler = 'DPM++ 2M Karras';
      x.seed = -1;
      x.clipSkip = 2;
      x.highRes = false;
      x.japanesePrompt = false;
      x.imagesPerRequest = null;
    });
    final m = catalog?.model(GenRules.defaultModelId);
    if (m != null) s.selectModel(m);
    s.update((x) => x.sizeType = GenRules.defaultSize(x.effectiveType));
  }
}

InputDecoration _fieldDecoration(BuildContext context, String hint) => InputDecoration(
  hintText: hint,
  hintStyle: TextStyle(color: context.muted.withValues(alpha: 0.7)),
  filled: true,
  fillColor: context.skeleton.withValues(alpha: 0.7),
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  border: OutlineInputBorder(borderRadius: Ds.br(14), borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(
    borderRadius: Ds.br(14),
    borderSide: BorderSide(color: context.cs.primary, width: 1.5),
  ),
);

class _Card extends StatelessWidget {
  const _Card({required this.child, this.padding = const EdgeInsets.all(14)});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: context.surfaceCard,
        borderRadius: Ds.br(20),
        border: Border.all(color: context.hairline),
        boxShadow: context.isDark ? null : [BoxShadow(color: Colors.black.withValues(alpha: 0.035), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: child,
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: context.cs.primary),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
      ],
    );
  }
}

class _MiniButton extends StatelessWidget {
  const _MiniButton({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(16)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: context.cs.onSurface.withValues(alpha: 0.75)),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: context.cs.onSurface.withValues(alpha: 0.8)),
            ),
          ],
        ),
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({required this.title, required this.subtitle, required this.value, required this.onChanged, this.badge});

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                  ),
                  if (badge != null) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(gradient: Ds.goldGradient, borderRadius: Ds.br(8)),
                      child: Text(
                        badge!,
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ],
              ),
              Text(subtitle, style: TextStyle(fontSize: 11.5, color: context.muted)),
            ],
          ),
        ),
        Switch.adaptive(
          value: value,
          onChanged: (v) {
            Ds.tap();
            onChanged(v);
          },
        ),
      ],
    );
  }
}

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.title,
    required this.help,
    required this.value,
    required this.min,
    required this.max,
    required this.label,
    required this.onChanged,
  });

  final String title;
  final String help;
  final double value;
  final double min;
  final double max;
  final String label;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(help, style: TextStyle(fontSize: 11.5, color: context.muted)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                constraints: const BoxConstraints(minWidth: 40),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: context.cs.primary.withValues(alpha: 0.1), borderRadius: Ds.br(10)),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w800, color: context.cs.primary),
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(trackHeight: 4, overlayShape: const RoundSliderOverlayShape(overlayRadius: 16)),
            child: Slider(
              value: value.clamp(min, max),
              min: min,
              max: max,
              divisions: (max - min).round(),
              onChanged: (v) {
                if (v.round() != value.round()) Ds.tap();
                onChanged(v);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PickerRow extends StatelessWidget {
  const _PickerRow({required this.title, required this.help, required this.value, required this.onTap});

  final String title;
  final String help;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Pressable(
        onTap: onTap,
        scale: 0.98,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.7), borderRadius: Ds.br(14)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(help, style: TextStyle(fontSize: 11, color: context.muted)),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Icon(Icons.unfold_more_rounded, size: 18, color: context.muted),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountSelector extends StatelessWidget {
  const _CountSelector({required this.max, required this.value, required this.onChanged});

  final int max;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(14)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 1; i <= 4; i++)
            Pressable(
              onTap: i <= max ? () => onChanged(i) : null,
              child: AnimatedContainer(
                duration: Ds.normal,
                width: 40,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(gradient: i == value ? Ds.brandGradient : null, borderRadius: Ds.br(11)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (i > max) Icon(Icons.lock_rounded, size: 11, color: context.muted.withValues(alpha: 0.5)),
                    Text(
                      '$i',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: i == value ? Colors.white : (i <= max ? null : context.muted.withValues(alpha: 0.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _LoraRow extends StatelessWidget {
  const _LoraRow({required this.pick, required this.onChanged, required this.onRemove});

  final LoraPick pick;
  final ValueChanged<double> onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 4, 2),
      decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(16)),
      child: Column(
        children: [
          Row(
            children: [
              AppImage(pick.thumbnailUrl, width: 36, height: 36, radius: 10, memCacheWidth: 120),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  pick.label ?? pick.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                pick.weight.toStringAsFixed(1),
                style: TextStyle(fontWeight: FontWeight.w800, color: context.cs.primary),
              ),
              IconButton(visualDensity: VisualDensity.compact, onPressed: onRemove, icon: const Icon(Icons.close_rounded, size: 18)),
            ],
          ),
          Slider(
            value: pick.weight.clamp(-1, 1),
            min: -1,
            max: 1,
            divisions: 20,
            onChanged: (v) {
              Ds.tap();
              onChanged((v * 10).round() / 10);
            },
          ),
        ],
      ),
    );
  }
}
