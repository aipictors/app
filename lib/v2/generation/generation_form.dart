import 'dart:math' as math;

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/nav.dart';
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
import 'package:image_picker/image_picker.dart';

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
  bool _customOpen = false;

  /// 正方形のときにどちらの向きの比率を並べるか
  bool _landscapeList = false;
  final _scroll = ScrollController();

  GenController get c => widget.controller;

  GenSettings get s => c.settings;

  @override
  void initState() {
    super.initState();
    s.addListener(_syncText);
    if (kDebugMode && (GenDebug.action == 'custom' || GenDebug.action == 'landscape')) {
      // 開発用: サイズが見える位置まで送る
      Future.delayed(const Duration(milliseconds: 5000), () {
        if (mounted && _scroll.hasClients) _scroll.jumpTo(620);
      });
    }
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
            if (!s.isFlux) ...[_i2iCard(), const SizedBox(height: 12)],
            if (!s.isGemini && !s.isFlux) ...[_controlNetCard(), const SizedBox(height: 12)],
            if (!s.isGemini) _advancedCard(),
            const SizedBox(height: 16),
            Center(
              child: TextButton.icon(
                onPressed: _confirmReset,
                icon: const Icon(Icons.restart_alt_rounded, size: 18),
                label: Text(tr('設定を初期値に戻す', 'Reset settings')),
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
    final title = user?.name ?? model?.displayName ?? tr('モデルを選ぶ', 'Choose a model');
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
                    user != null ? tr('みんなのモデル', 'Community model') : tr('モデル', 'Model'),
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
                tooltip: tr('公式モデルに戻す', 'Back to official models'),
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
                tr('変更', 'Change'),
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
              _Label(icon: Icons.edit_rounded, text: tr('プロンプト', 'Prompt')),
              const Spacer(),
              if (_prompt.text.isNotEmpty)
                _MiniButton(
                  icon: Icons.backspace_outlined,
                  label: tr('クリア', 'Clear'),
                  onTap: () {
                    final before = s.prompt;
                    s.update((x) => x.prompt = '');
                    ScaffoldMessenger.maybeOf(context)
                      ?..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(tr('プロンプトを消しました', 'Prompt cleared')),
                          action: SnackBarAction(label: tr('元に戻す', 'Undo'), onPressed: () => s.update((x) => x.prompt = before)),
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
            decoration: _fieldDecoration(context, s.japanesePrompt ? tr('例: 青い髪の女の子、星空の下で微笑む', 'e.g. 青い髪の女の子、星空の下で微笑む') : tr('例: masterpiece, best quality, 1girl, blue hair, starry sky', 'e.g. masterpiece, best quality, 1girl, blue hair, starry sky')),
            buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _MiniButton(
                icon: Icons.add_circle_outline_rounded,
                label: tr('キーワード', 'Keywords'),
                onTap: catalog == null ? null : () => showPromptWords(context, categories: catalog.promptCategories, onAdd: (w) => _appendPrompt(_prompt, w)),
              ),
              const SizedBox(width: 6),
              if (c.model != null && c.model!.prompts.isNotEmpty && s.userCheckpoint == null)
                _MiniButton(icon: Icons.tips_and_updates_outlined, label: tr('おすすめ', 'Suggested'), onTap: () => _appendPrompt(_prompt, c.model!.prompts.join(', '))),
              const Spacer(),
              Text(
                '${_prompt.text.length}',
                style: TextStyle(fontSize: 12, color: context.muted, fontFeatures: const [FontFeature.tabularFigures()]),
              ),
            ],
          ),
          const SizedBox(height: 4),
          _SwitchRow(title: tr('日本語で入力する', 'Write in Japanese'), subtitle: tr('日本語のプロンプトを英語にしてから生成します', 'Translates a Japanese prompt into English before generating'), value: s.japanesePrompt, onChanged: (v) => s.update((x) => x.japanesePrompt = v)),
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
                    _Label(icon: Icons.do_not_disturb_on_outlined, text: tr('ネガティブプロンプト', 'Negative prompt')),
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
                        Text(tr('入れたくないものを書きます', 'Describe what you do not want'), style: TextStyle(fontSize: 12, color: context.muted)),
                        const SizedBox(height: 6),
                        TextField(
                          controller: _negative,
                          minLines: 2,
                          maxLines: 6,
                          maxLength: GenRules.maxPromptLength,
                          onChanged: (v) => s.update((x) => x.negativePrompt = v),
                          style: const TextStyle(fontSize: 14, height: 1.4),
                          decoration: _fieldDecoration(context, tr('例: EasyNegative, lowres, bad hands', 'e.g. EasyNegative, lowres, bad hands')),
                          buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _MiniButton(
                              icon: Icons.add_circle_outline_rounded,
                              label: tr('キーワード', 'Keywords'),
                              onTap: catalog == null
                                  ? null
                                  : () => showPromptWords(
                                      context,
                                      title: tr('ネガティブに足す', 'Add to negative'),
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
              _MiniButton(icon: Icons.add_rounded, label: tr('追加', 'Add'), onTap: () => showLoraPicker(context, c)),
            ],
          ),
          if (s.loras.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(tr('絵柄・効果を足せます（フラットな絵、背景をシンプルに など）', 'Add styles and effects (flat art, simple background, etc.)'), style: TextStyle(fontSize: 12, color: context.muted)),
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
    final type = s.effectiveType;
    final isCustom = GenRules.isCustomSize(s.sizeType);
    final canCustom = GenRules.canCustomSize(type);
    final current = GenSize.parse(s.sizeType);
    final showCustom = canCustom && (_customOpen || isCustom);
    final isLandscape = current.width == current.height ? _landscapeList : current.width > current.height;
    // 今の向きと正方形だけ並べる。逆の向きは「入替」で切り替える
    final sizes = GenRules.sizes(type).where((o) => o.width == o.height || (o.width > o.height) == isLandscape).toList();
    final overHighRes = !c.isPaid && GenRules.isOverFreeLimit(s.sizeType, highRes: true);
    if (s.highRes && overHighRes) {
      // 大きいサイズにしたら、選べなくなった高解像度は標準に戻す
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && s.highRes) s.update((x) => x.highRes = false);
      });
    }
    final m = s.highRes ? 2 : 1;
    final multiplier = GenRules.sizeMultiplier(s.sizeType);
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              _Label(icon: Icons.aspect_ratio_rounded, text: tr('サイズ', 'Size')),
              const Spacer(),
              Text(
                '${current.width * m} × ${current.height * m}',
                style: TextStyle(fontSize: 12, color: context.muted, fontWeight: FontWeight.w700),
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
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(onPressed: _swapSize, icon: const Icon(Icons.swap_horiz_rounded, size: 18), label: Text(tr('縦横を入替', 'Swap'))),
              ),
              if (canCustom) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _toggleCustom,
                    icon: Icon(showCustom ? Icons.close_rounded : Icons.tune_rounded, size: 18),
                    label: Text(showCustom ? tr('指定をやめる', 'Use presets') : tr('幅・高さを指定', 'Custom size')),
                  ),
                ),
              ],
            ],
          ),
          if (showCustom) ...[
            const SizedBox(height: 10),
            _CustomSizePanel(
              width: current.width,
              height: current.height,
              isPaid: c.isPaid,
              onChange: (w, h) => s.update((x) => x.sizeType = GenRules.toCustomSize(w, h)),
            ),
          ],
          if (multiplier > 1) ...[
            const SizedBox(height: 8),
            Text(tr('大きいサイズは 1 枚ずつ・コイン$multiplier倍です', 'Large sizes generate 1 at a time and cost ${multiplier}x coins'), style: TextStyle(fontSize: 12, color: context.muted)),
          ],
          if (!s.isGemini && s.effectiveType != 'FLUX') ...[
            const SizedBox(height: 10),
            _SwitchRow(
              title: tr('高解像度で生成する', 'High resolution'),
              subtitle: overHighRes ? tr('サブスクに入っていない場合、このサイズでは使えません（出力は 2048×2048 まで）', 'Not available at this size without a subscription (output up to 2048×2048)') : tr('2倍の大きさで生成します（1枚ずつ・コイン2倍）', 'Generates at 2x size (1 at a time, 2x coins)'),
              badge: '×2',
              value: s.highRes,
              onChanged: (v) {
                if (v && overHighRes) {
                  context.toast(tr('サブスクに入っていない場合、出力サイズは 2048×2048 までです', 'Without a subscription, output size is limited to 2048×2048'), error: true);
                  return;
                }
                s.update((x) => x.highRes = v);
              },
            ),
          ],
        ],
      ),
    );
  }

  void _swapSize() {
    Ds.tap();
    final current = GenSize.parse(s.sizeType);
    if (current.width == current.height) {
      setState(() => _landscapeList = !_landscapeList);
      return;
    }
    setState(() => _landscapeList = current.width < current.height);
    final isCustom = GenRules.isCustomSize(s.sizeType);
    final options = GenRules.sizes(s.effectiveType);
    final swapped = options.where((o) => o.width == current.height && o.height == current.width).firstOrNull;
    if (swapped != null && !isCustom) {
      s.update((x) => x.sizeType = swapped.type);
    } else if (GenRules.canCustomSize(s.effectiveType)) {
      s.update((x) => x.sizeType = GenRules.toCustomSize(current.height, current.width));
    }
  }

  void _toggleCustom() {
    Ds.tap();
    final current = GenSize.parse(s.sizeType);
    if (_customOpen || GenRules.isCustomSize(s.sizeType)) {
      setState(() => _customOpen = false);
      // 指定をやめるときは一番近い比率に戻す
      if (GenRules.isCustomSize(s.sizeType)) s.update((x) => x.sizeType = GenRules.nearestSize(x.effectiveType, current));
      return;
    }
    setState(() => _customOpen = true);
    s.update((x) => x.sizeType = GenRules.toCustomSize(GenRules.normalizeSide(current.width), GenRules.normalizeSide(current.height)));
  }

  // ---------------------------------------------------------------------------
  // 枚数
  // ---------------------------------------------------------------------------

  Widget _countCard() {
    final max = s.maxImagesPerRequest(c.model, isPaid: c.isPaid);
    final current = c.imagesPerRequest;
    final isPaid = c.isPaid;
    final reason = max > 1
        ? (s.seed != -1 && current > 1
              ? tr('Seed ${s.seed}〜${s.seed + current - 1} で $current 枚作ります（1枚目は今の Seed と同じ絵）', 'Makes $current images with Seed ${s.seed}–${s.seed + current - 1} (the first matches the current Seed)')
              : isPaid
              ? null
              : tr('無料は 2 枚まで。プランなら 4 枚まで', 'Up to 2 on the free plan, up to 4 with a plan'))
        : s.highRes
        ? tr('高解像度は 1 枚ずつ生成します', 'High resolution generates 1 at a time')
        : s.hasControlNet
        ? tr('ControlNet を使うときは 1 枚ずつ生成します', 'ControlNet generates 1 at a time')
        : s.generationType(isPaid: isPaid) != 'TEXT_TO_IMAGE'
        ? tr('画像から生成は 1 枚ずつ生成します', 'Image-to-image generates 1 at a time')
        : GenRules.sizeMultiplier(s.sizeType) > 1
        ? tr('大きいサイズは 1 枚ずつ生成します', 'Large sizes generate 1 at a time')
        : tr('このモデルは 1 枚ずつ生成します', 'This model generates 1 at a time');
    final canReserve = c.viewer?.isStandardOrPremium == true && !s.isFlux && s.i2iImage == null && !s.isGemini;
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              _Label(icon: Icons.burst_mode_rounded, text: tr('一度に作る枚数', 'Images per run')),
              const Spacer(),
              _CountSelector(
                max: math.max(max, 1),
                value: current,
                onChanged: (v) => s.update((x) {
                  if (x.seed != -1) {
                    x.fixedSeedImages = v;
                  } else {
                    x.imagesPerRequest = v == max ? null : v;
                  }
                }),
              ),
            ],
          ),
          if (reason != null) ...[const SizedBox(height: 6), Text(reason, style: TextStyle(fontSize: 12, color: context.muted))],
          if (canReserve) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                _Label(icon: Icons.schedule_rounded, text: tr('続けて依頼（予約生成）', 'Queue runs')),
                const Spacer(),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: s.generationCount > 1 ? () => s.update((x) => x.generationCount -= 1) : null,
                  icon: const Icon(Icons.remove_circle_outline_rounded),
                ),
                Text(tr('${s.generationCount} 回', '${s.generationCount}x'), style: const TextStyle(fontWeight: FontWeight.w800)),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: s.generationCount < (c.viewer?.remaining ?? 1).clamp(1, 30) ? () => s.update((x) => x.generationCount += 1) : null,
                  icon: const Icon(Icons.add_circle_outline_rounded),
                ),
              ],
            ),
            Text(tr('同時に生成できる数を超えた分は予約され、順番に生成します', 'Runs beyond your simultaneous limit are queued and generated in order'), style: TextStyle(fontSize: 12, color: context.muted)),
          ],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 画像から生成・ControlNet
  // ---------------------------------------------------------------------------

  Future<Uint8List?> _pickImage() async {
    try {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      return file == null ? null : await file.readAsBytes();
    } catch (_) {
      if (mounted) context.toast(tr('画像を読み込めませんでした。写真へのアクセスを確認してください', 'Could not load the image. Please check photo access.'), error: true);
      return null;
    }
  }

  Widget _i2iCard() {
    final image = s.i2iImage;
    final isGemini = s.effectiveType == 'GEMINI' || s.isGemini;
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              _Label(icon: Icons.image_rounded, text: tr('画像から生成', 'Image to image')),
              const Spacer(),
              if (!c.isPaid && !isGemini) Badge2(tr('ライト以上', 'Lite+'), color: Ds.purple),
            ],
          ),
          const SizedBox(height: 10),
          _ImagePickRow(
            image: image,
            label: tr('元にする画像を選ぶ', 'Choose a source image'),
            onPick: () async {
              final bytes = await _pickImage();
              if (bytes != null) s.update((x) => x.i2iImage = bytes);
            },
            onClear: () => s.update((x) => x.i2iImage = null),
          ),
          if (image != null) ...[
            const SizedBox(height: 6),
            Text(tr('今のサイズの比率で真ん中を切り抜いて使います（1枚ずつ）', 'The center is cropped to the current aspect ratio (1 at a time)'), style: TextStyle(fontSize: 12, color: context.muted)),
            if (!isGemini)
              _SliderRow(
                title: tr('変更度', 'Denoising strength'),
                help: tr('小さいほど元の画像に近く、大きいほど変わります', 'Lower stays closer to the original; higher changes more'),
                value: s.i2iStrength,
                min: 0.1,
                max: 1,
                label: s.i2iStrength.toStringAsFixed(2),
                onChanged: (v) => s.update((x) => x.i2iStrength = (v * 100).round() / 100),
              ),
          ],
        ],
      ),
    );
  }

  Widget _controlNetCard() {
    final image = s.controlNetImage;
    final module = s.controlNetModule;
    final showWeight = module != null && module != 'seg_ofade20k';
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _Label(icon: Icons.accessibility_new_rounded, text: 'ControlNet'),
          const SizedBox(height: 10),
          _ImagePickRow(
            image: image,
            label: tr('ポーズや構図の元になる画像を選ぶ', 'Choose an image for pose or composition'),
            onPick: () async {
              final bytes = await _pickImage();
              if (bytes == null) return;
              s.update((x) {
                x.controlNetImage = bytes;
                x.controlNetModule ??= 'openpose_full';
                x.controlNetModel = GenRules.controlNetModel(x.controlNetModule!, x.effectiveType);
              });
            },
            onClear: () => s.update((x) {
              x.controlNetImage = null;
              x.controlNetModule = null;
              x.controlNetModel = null;
            }),
          ),
          if (image != null) ...[
            _PickerRow(
              title: tr('種類', 'Type'),
              help: tr('元の画像のどこを使うか', 'What to take from the source image'),
              value: GenRules.controlNetModules.where((m) => m.$1 == module).firstOrNull?.$2 ?? tr('選んでください', 'Select'),
              onTap: () => _pickFrom(tr('ControlNet の種類', 'ControlNet type'), [for (final m in GenRules.controlNetModules) m.$2], GenRules.controlNetModules.where((m) => m.$1 == module).firstOrNull?.$2 ?? '', (label) {
                final picked = GenRules.controlNetModules.firstWhere((m) => m.$2 == label).$1;
                s.update((x) {
                  x.controlNetModule = picked;
                  x.controlNetModel = GenRules.controlNetModel(picked, x.effectiveType);
                });
              }),
            ),
            if (showWeight)
              _SliderRow(
                title: tr('強さ', 'Strength'),
                help: tr('元の画像にどれだけ従うか', 'How closely to follow the source image'),
                value: s.controlNetWeight,
                min: 0.1,
                max: 2,
                label: s.controlNetWeight.toStringAsFixed(1),
                onChanged: (v) => s.update((x) => x.controlNetWeight = (v * 10).round() / 10),
              ),
          ],
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
                  _Label(icon: Icons.tune_rounded, text: tr('詳細設定', 'Advanced')),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Steps ${s.steps} ・ Scale ${s.scale} ・ ${s.seed == -1 ? tr('Seed ランダム', 'Seed random') : 'Seed ${s.seed}'}',
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
                        if (!isFlux)
                          Wrap(
                            spacing: 8,
                            children: [
                              ActionChip(
                                label: Text(tr('標準', 'Standard')),
                                onPressed: () => s.update((x) {
                                  x.scale = 7;
                                  x.steps = 20;
                                  x.sampler = GenRules.defaultSampler;
                                  x.scheduler = null;
                                }),
                              ),
                              ActionChip(
                                label: Text(tr('turbo・lightning 用', 'For turbo/lightning')),
                                onPressed: () => s.update((x) {
                                  x.scale = 1;
                                  x.steps = 8;
                                  x.sampler = 'Euler';
                                  x.scheduler = 'SGM Uniform';
                                }),
                              ),
                            ],
                          ),
                        _SliderRow(
                          title: 'Steps',
                          help: tr('描き込みの回数。多いほど細かくなり、時間がかかります', 'Number of steps. More adds detail but takes longer'),
                          value: s.steps.toDouble(),
                          min: GenRules.minSteps.toDouble(),
                          max: GenRules.maxSteps.toDouble(),
                          label: '${s.steps}',
                          onChanged: (v) => s.update((x) => x.steps = v.round()),
                        ),
                        _SliderRow(
                          title: 'Scale',
                          help: tr('プロンプトにどれだけ従うか', 'How closely to follow the prompt'),
                          value: s.scale.toDouble(),
                          min: GenRules.minScale.toDouble(),
                          max: GenRules.maxScale.toDouble(),
                          label: '${s.scale}',
                          onChanged: (v) => s.update((x) => x.scale = v.round()),
                        ),
                        if (!isFlux) ...[
                          _PickerRow(
                            title: 'Sampler',
                            help: tr('ノイズの除去の手法', 'Denoising method'),
                            value: s.sampler,
                            onTap: () => _pickFrom('Sampler', GenRules.samplers, s.sampler, (v) => s.update((x) => x.sampler = v)),
                          ),
                          _PickerRow(
                            title: 'Schedule type',
                            help: tr('ノイズの減らし方（たいていは自動で大丈夫）', 'Noise schedule (Auto is usually fine)'),
                            value: s.scheduler ?? tr('自動', 'Auto'),
                            onTap: () => _pickFrom('Schedule type', [tr('自動', 'Auto'), ...GenRules.schedulers], s.scheduler ?? tr('自動', 'Auto'), (v) => s.update((x) => x.scheduler = v == tr('自動', 'Auto') ? null : v)),
                          ),
                          _SliderRow(
                            title: 'Clip Skip',
                            help: tr('プロンプトの解釈の深さ（多くのモデルは 2）', 'Prompt interpretation depth (2 for most models)'),
                            value: s.clipSkip.toDouble(),
                            min: 1,
                            max: 12,
                            label: '${s.clipSkip}',
                            onChanged: (v) => s.update((x) => x.clipSkip = v.round()),
                          ),
                          _PickerRow(
                            title: 'VAE',
                            help: tr('色合い・仕上げの調整', 'Adjusts color and finish'),
                            value: s.vae.isEmpty ? tr('自動', 'Auto') : s.vae,
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
              child: Text(tr('同じ Seed・同じ設定なら、同じ絵になります', 'The same Seed and settings produce the same image'), style: TextStyle(fontSize: 11.5, color: context.muted)),
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
                decoration: _fieldDecoration(context, tr('ランダム', 'Random')).copyWith(prefixIcon: Icon(locked ? Icons.lock_rounded : Icons.shuffle_rounded, size: 18)),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filledTonal(
              tooltip: tr('ランダムな Seed を入れる', 'Use a random Seed'),
              onPressed: () {
                Ds.impact();
                s.update((x) => x.seed = math.Random().nextInt(2147483647));
              },
              icon: const Icon(Icons.casino_rounded),
            ),
            const SizedBox(width: 4),
            IconButton.filledTonal(
              tooltip: tr('毎回ランダムにする', 'Random every time'),
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
        title: Text(tr('設定を初期値に戻しますか？', 'Reset settings?')),
        content: Text(tr('モデル・プロンプト・詳細設定が最初の状態になります', 'Model, prompt, and advanced settings will return to their defaults')),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialog).pop(false), child: Text(tr('やめる', 'Cancel'))),
          FilledButton(onPressed: () => Navigator.of(dialog).pop(true), child: Text(tr('戻す', 'Reset'))),
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
      x.sampler = GenRules.defaultSampler;
      x.scheduler = null;
      x.i2iImage = null;
      x.controlNetImage = null;
      x.controlNetModule = null;
      x.controlNetModel = null;
      x.generationCount = 1;
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

/// 幅と高さの指定（入力中は自由に打てて、確定したときに範囲へ収める）
class _CustomSizePanel extends StatefulWidget {
  const _CustomSizePanel({required this.width, required this.height, required this.isPaid, required this.onChange});

  final int width;
  final int height;
  final bool isPaid;
  final void Function(int width, int height) onChange;

  @override
  State<_CustomSizePanel> createState() => _CustomSizePanelState();
}

class _CustomSizePanelState extends State<_CustomSizePanel> {
  late final _w = TextEditingController(text: '${widget.width}');
  late final _h = TextEditingController(text: '${widget.height}');
  final _wFocus = FocusNode();
  final _hFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _wFocus.addListener(() {
      if (!_wFocus.hasFocus) _commit();
    });
    _hFocus.addListener(() {
      if (!_hFocus.hasFocus) _commit();
    });
  }

  @override
  void didUpdateWidget(covariant _CustomSizePanel old) {
    super.didUpdateWidget(old);
    if (!_wFocus.hasFocus && _w.text != '${widget.width}') _w.text = '${widget.width}';
    if (!_hFocus.hasFocus && _h.text != '${widget.height}') _h.text = '${widget.height}';
  }

  @override
  void dispose() {
    _w.dispose();
    _h.dispose();
    _wFocus.dispose();
    _hFocus.dispose();
    super.dispose();
  }

  void _commit() {
    final w = GenRules.normalizeSide(int.tryParse(_w.text) ?? widget.width);
    final h = GenRules.normalizeSide(int.tryParse(_h.text) ?? widget.height);
    _w.text = '$w';
    _h.text = '$h';
    if (w != widget.width || h != widget.height) widget.onChange(w, h);
  }

  void _longSide(int side) {
    Ds.tap();
    final scale = side / math.max(widget.width, widget.height);
    widget.onChange(GenRules.normalizeSide(widget.width * scale), GenRules.normalizeSide(widget.height * scale));
  }

  Widget _field(String label, TextEditingController controller, FocusNode focus) => Expanded(
    child: TextField(
      controller: controller,
      focusNode: focus,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
      onSubmitted: (_) => _commit(),
      decoration: _fieldDecoration(context, label).copyWith(labelText: label),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final pixels = widget.width * widget.height;
    final over = !widget.isPaid && pixels > GenRules.freeMaxPixels;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [_field(tr('幅', 'Width'), _w, _wFocus), const SizedBox(width: 8), _field(tr('高さ', 'Height'), _h, _hFocus)]),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(tr('長辺', 'Long side'), style: TextStyle(fontSize: 12, color: context.muted)),
            const SizedBox(width: 8),
            for (final side in const [1024, 1536, 2048])
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ChoiceChip(label: Text('$side'), selected: math.max(widget.width, widget.height) == side, onSelected: (_) => _longSide(side)),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          tr('${GenRules.customSizeMin}〜${GenRules.customSizeMax} の範囲で指定してください（8 の倍数にそろえます）。今のサイズは約 ${(pixels / 1000000).toStringAsFixed(1)} メガピクセルです。', 'Enter ${GenRules.customSizeMin}–${GenRules.customSizeMax} (rounded to a multiple of 8). The current size is about ${(pixels / 1000000).toStringAsFixed(1)} megapixels.'),
          style: TextStyle(fontSize: 12, color: context.muted, height: 1.4),
        ),
        if (over) ...[
          const SizedBox(height: 6),
          Text(tr('サブスクに入っていない場合は 2048×2048（約4メガピクセル）までです。', 'Without a subscription, the limit is 2048×2048 (about 4 megapixels).'), style: TextStyle(fontSize: 12, color: context.cs.error, fontWeight: FontWeight.w700)),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(onPressed: () => Nav.plans(context), child: Text(tr('プランを見る', 'See plans'))),
          ),
        ],
      ],
    );
  }
}

/// 画像を選ぶ行（選んだら縮小して表示し、消せる）
class _ImagePickRow extends StatelessWidget {
  const _ImagePickRow({required this.image, required this.label, required this.onPick, required this.onClear});

  final Uint8List? image;
  final String label;
  final VoidCallback onPick;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final bytes = image;
    if (bytes == null) {
      return OutlinedButton.icon(onPressed: onPick, icon: const Icon(Icons.add_photo_alternate_outlined), label: Text(label));
    }
    return Row(
      children: [
        ClipRRect(
          borderRadius: Ds.br(12),
          child: Image.memory(bytes, width: 72, height: 72, fit: BoxFit.cover, cacheWidth: 216),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(onPressed: onPick, child: Text(tr('画像を変える', 'Change image'))),
              TextButton(onPressed: onClear, child: Text(tr('画像を消す', 'Remove image'))),
            ],
          ),
        ),
      ],
    );
  }
}

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
