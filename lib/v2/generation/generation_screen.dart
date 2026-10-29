import 'dart:async';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/generation/generation_api.dart';
import 'package:aipictors/v2/generation/generation_controller.dart';
import 'package:aipictors/v2/generation/generation_debug.dart';
import 'package:aipictors/v2/generation/generation_form.dart';
import 'package:aipictors/v2/generation/generation_history.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/generation/lora_picker.dart';
import 'package:aipictors/v2/generation/model_picker.dart';
import 'package:aipictors/v2/generation/result_viewer.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 画像生成タブ（Web の /generation と同じことができる画面）
class GenerationScreen extends StatefulWidget {
  const GenerationScreen({super.key});

  @override
  State<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen> {
  final _controller = GenController();
  StreamSubscription<User?>? _auth;
  bool _loggedIn = Nav.isLoggedIn;
  int _tab = 0;
  bool _grantShown = false;
  bool _debugDone = false;

  @override
  void initState() {
    super.initState();
    _controller.start(loggedIn: _loggedIn);
    _controller.addListener(_onController);
    _auth = FirebaseAuth.instance.authStateChanges().listen((user) {
      final loggedIn = user != null;
      if (loggedIn == _loggedIn) return;
      setState(() => _loggedIn = loggedIn);
      if (loggedIn) {
        _controller.onLoggedIn();
      } else {
        _controller.onLoggedOut();
      }
    });
  }

  @override
  void dispose() {
    _auth?.cancel();
    _controller.removeListener(_onController);
    _controller.dispose();
    super.dispose();
  }

  void _onController() {
    if (kDebugMode && !_debugDone && GenDebug.action != null) _runDebugAction();
    final grant = _controller.grantMessage;
    if (grant != null && !_grantShown && mounted) {
      _grantShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.toast(grant, icon: Icons.toll_rounded);
      });
    }
  }

  /// 開発用: 画面に触れずに各状態を開く（debug_main.dart から）
  void _runDebugAction() {
    final c = _controller;
    if (c.catalog == null || c.viewer == null || c.historyLoading) return;
    _debugDone = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      switch (GenDebug.action) {
        case 'models':
          showModelPicker(context, c);
        case 'lora':
          showLoraPicker(context, c);
        case 'history':
          setState(() => _tab = 1);
        case 'viewer':
          if (c.results.isNotEmpty) openResultViewer(context, controller: c, initialIndex: 0, onReuse: _reuse);
        case 'terms':
          showTermsSheet(context, onAgree: c.signTerms);
        case 'generate':
          _generate();
      }
    });
  }

  void _reuse(GenResult r) {
    final catalog = _controller.catalog;
    if (catalog == null) return;
    _controller.settings.applyResult(r, catalog);
    setState(() => _tab = 0);
    context.toast('この設定を読み込みました', icon: Icons.replay_rounded);
  }

  Future<void> _generate() async {
    FocusScope.of(context).unfocus();
    final c = _controller;
    if (c.viewer != null && !c.viewer!.hasSignedTerms) {
      final agreed = await showTermsSheet(context, onAgree: c.signTerms);
      if (!agreed || !mounted) return;
    }
    Ds.impact();
    final block = await c.submit();
    if (!mounted) return;
    if (block == null) {
      Ds.success();
      context.toast('生成をはじめました', icon: Icons.auto_awesome_rounded);
      return;
    }
    switch (block.kind) {
      case GenBlockKind.coins:
        await showCoinShortageSheet(context, need: c.requestCost, have: c.coins?.total ?? 0);
      case GenBlockKind.plan:
        await showPlanRequiredSheet(context, block.message);
      case GenBlockKind.verification:
        await showVerificationSheet(context);
      case GenBlockKind.terms:
        final agreed = await showTermsSheet(context, onAgree: c.signTerms);
        if (agreed && mounted) await _generate();
      case GenBlockKind.message:
        context.toast(block.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loggedIn) {
      return Scaffold(
        body: SafeArea(
          child: LoginRequiredView(
            icon: Icons.auto_awesome_rounded,
            title: 'AI でイラストを生成しよう',
            message: '言葉を書くだけで、AI がイラストを描きます。\n無料のコインが毎日もらえるので、ログインしてすぐに試せます。',
            onLogin: () => Nav.login(context),
          ),
        ),
      );
    }
    return Scaffold(
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          final wide = MediaQuery.sizeOf(context).width >= 740;
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                _Header(controller: _controller),
                if (!wide) ...[
                  PillTabs(
                    labels: ['つくる', _controller.runningCount > 0 ? '履歴・生成中 ${_controller.runningCount}' : '履歴'],
                    index: _tab,
                    onChanged: (i) => setState(() => _tab = i),
                  ),
                  const SizedBox(height: 4),
                ],
                Expanded(child: wide ? _wideBody() : _narrowBody()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _narrowBody() {
    return Stack(
      children: [
        IndexedStack(
          index: _tab,
          children: [
            GenerationForm(
              controller: _controller,
              header: _RecentStrip(controller: _controller, onReuse: _reuse, onSeeAll: () => setState(() => _tab = 1)),
              bottomPadding: 150,
            ),
            GenerationHistory(controller: _controller, onReuse: _reuse, bottomPadding: 24),
          ],
        ),
        if (_tab == 0)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _GenerateBar(controller: _controller, onGenerate: _generate),
          ),
      ],
    );
  }

  Widget _wideBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: (MediaQuery.sizeOf(context).width * 0.5).clamp(380, 480).toDouble(),
          child: Stack(
            children: [
              GenerationForm(controller: _controller, bottomPadding: 150),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _GenerateBar(controller: _controller, onGenerate: _generate),
              ),
            ],
          ),
        ),
        VerticalDivider(width: 1, color: context.hairline),
        Expanded(
          child: GenerationHistory(controller: _controller, onReuse: _reuse),
        ),
      ],
    );
  }
}

/// 見出し（タイトル・プラン・コイン残高）
class _Header extends StatelessWidget {
  const _Header({required this.controller});

  final GenController controller;

  @override
  Widget build(BuildContext context) {
    final v = controller.viewer;
    final coins = controller.coins;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 12, 10),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (r) => Ds.brandGradient.createShader(r),
            child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('画像生成', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.4)),
                if (v != null)
                  Text(
                    v.engineWait > 0 ? '${v.planLabel} ・ 混み具合: 待ち ${v.engineWait} 件' : v.planLabel,
                    style: TextStyle(fontSize: 11.5, color: context.muted, fontWeight: FontWeight.w600),
                  ),
              ],
            ),
          ),
          Pressable(
            onTap: () => _showCoins(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                gradient: Ds.goldGradient,
                borderRadius: Ds.br(20),
                boxShadow: [BoxShadow(color: Ds.gold.withValues(alpha: 0.35), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.toll_rounded, color: Colors.white, size: 18),
                  const SizedBox(width: 5),
                  coins == null
                      ? const SizedBox(
                          width: 26,
                          height: 12,
                          child: LinearProgressIndicator(color: Colors.white, backgroundColor: Colors.white24),
                        )
                      : Text(
                          compactCount(coins.total),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCoins(BuildContext context) {
    final coins = controller.coins;
    final v = controller.viewer;
    showGenSheet(
      context,
      builder: (sheet) => SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('コイン', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text('生成するとコインを使います。フリーコインから先に使われます。', style: TextStyle(color: context.muted, fontSize: 13)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _CoinBox(label: 'フリーコイン', value: coins?.free, note: '毎日付与・当日24:00まで'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _CoinBox(label: 'プレミアムコイン', value: coins?.premium, note: 'プラン・購入分', premium: true),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(16)),
                child: Column(
                  children: [
                    _kv(context, 'プラン', v?.planLabel ?? '-'),
                    _kv(context, '1枚あたり', '${controller.settings.coinPerImage(controller.model)} コイン${controller.settings.highRes ? '（高解像度）' : ''}'),
                    _kv(context, '同時に生成できる数', v == null ? '-' : '${v.consecutive}'),
                    _kv(context, '使える LoRA の数', v == null ? '-' : '${v.loraLimit}'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GradientButton(
                label: v?.isPaid == true ? 'プランを確認する' : 'Aipictors+ でコインを増やす',
                icon: Icons.workspace_premium_rounded,
                onPressed: () {
                  Navigator.of(sheet).pop();
                  Nav.plans(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _kv(BuildContext context, String k, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Text(k, style: TextStyle(color: context.muted, fontSize: 13)),
        const Spacer(),
        Text(v, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
      ],
    ),
  );
}

class _CoinBox extends StatelessWidget {
  const _CoinBox({required this.label, required this.value, required this.note, this.premium = false});

  final String label;
  final int? value;
  final String note;
  final bool premium;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(gradient: premium ? Ds.brandGradient : Ds.goldGradient, borderRadius: Ds.br(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
          ),
          const SizedBox(height: 6),
          Text(
            value == null ? '-' : '$value',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26),
          ),
          Text(note, style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 10.5)),
        ],
      ),
    );
  }
}

/// 「つくる」の上に出す、生成中と最近の結果
class _RecentStrip extends StatelessWidget {
  const _RecentStrip({required this.controller, required this.onReuse, required this.onSeeAll});

  final GenController controller;
  final ValueChanged<GenResult> onReuse;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    final c = controller;
    final running = [if (c.sendingCount > 0) null, ...c.running.where((t) => t.isRunning)];
    final recent = c.results.take(12).toList();
    if (running.isEmpty && recent.isEmpty) return const SizedBox.shrink();
    const h = 150.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(running.isNotEmpty ? '生成中' : '最近の生成', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
              const Spacer(),
              TextButton(onPressed: onSeeAll, child: const Text('すべて見る')),
            ],
          ),
          SizedBox(
            height: h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: running.length + recent.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                if (i < running.length) {
                  final t = running[i];
                  final aspect = (t?.aspect ?? 2 / 3).clamp(0.5, 1.5);
                  return SizedBox(
                    width: h * aspect,
                    child: GeneratingCard(task: t, progress: t?.nanoid == null ? null : c.progress[t!.nanoid], height: h),
                  );
                }
                final index = i - running.length;
                final r = recent[index];
                return SizedBox(
                  width: h * r.aspect.clamp(0.5, 1.5),
                  child: ResultTile(
                    result: r,
                    height: h,
                    onTap: () => openResultViewer(context, controller: c, initialIndex: index, onReuse: onReuse),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 下に固定の生成ボタン（使うコインと残高）
class _GenerateBar extends StatelessWidget {
  const _GenerateBar({required this.controller, required this.onGenerate});

  final GenController controller;
  final VoidCallback onGenerate;

  @override
  Widget build(BuildContext context) {
    final c = controller;
    final count = c.imagesPerRequest;
    final cost = c.requestCost;
    final coins = c.coins;
    final short = coins != null && coins.total < cost;
    final v = c.viewer;
    final label = c.submitting
        ? '送信中…'
        : v != null && !v.hasSignedTerms
        ? '規約を確認して生成'
        : count > 1
        ? '生成する ×$count枚'
        : '生成する';
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0),
          ],
          stops: const [0, 0.7, 1],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (v != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(short ? Icons.warning_amber_rounded : Icons.toll_rounded, size: 14, color: short ? Ds.pink : Ds.gold),
                  const SizedBox(width: 4),
                  Text(
                    coins == null ? '使うコイン $cost' : '使うコイン $cost ・ 残り ${coins.total}',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: short ? Ds.pink : context.muted),
                  ),
                  if (v.inProgress > 0) ...[
                    const SizedBox(width: 8),
                    Text(
                      '・ 生成中 ${v.inProgress}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: context.muted),
                    ),
                  ],
                ],
              ),
            ),
          Pressable(
            onTap: c.submitting || c.catalog == null || v == null ? null : onGenerate,
            child: AnimatedOpacity(
              duration: Ds.fast,
              opacity: c.catalog == null || v == null ? 0.5 : 1,
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  gradient: Ds.brandGradient,
                  borderRadius: Ds.br(28),
                  boxShadow: [BoxShadow(color: const Color(0xFF6D5DF6).withValues(alpha: 0.35), blurRadius: 20, offset: const Offset(0, 8))],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 48),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (c.submitting)
                            const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white))
                          else
                            const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              label,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 56,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: Ds.br(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.toll_rounded, color: Colors.white, size: 14),
                          const SizedBox(width: 3),
                          Text(
                            '$cost',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
