import 'dart:async';

import 'package:aipictors/features/config/functions/logout.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// アカウントを一時停止している人がログインしたら「アカウントは一時停止中です。再開しますか？」を出す（Web の AccountPauseWatcher と同じ）
/// 停止中は API が再開・退会など以外の操作を断るので、閉じられない。再開するか、停止したままログアウトするか
/// MaterialApp の builder（Navigator の外）に置くので、ダイアログではなく画面の上に重ねる
class AccountPauseWatcher extends StatefulWidget {
  const AccountPauseWatcher({super.key, required this.child});

  final Widget child;

  /// テストで差し替える
  @visibleForTesting
  static Stream<String?> Function() uidChanges = () => FirebaseAuth.instance.authStateChanges().map((u) => u?.uid);

  @override
  State<AccountPauseWatcher> createState() => _AccountPauseWatcherState();
}

class _AccountPauseWatcherState extends State<AccountPauseWatcher> with WidgetsBindingObserver {
  StreamSubscription<String?>? _authSub;
  String? _uid;
  bool _paused = false;
  bool _busy = false;
  int? _pausedAt;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _authSub = AccountPauseWatcher.uidChanges().listen((uid) {
      if (uid == _uid) return;
      _uid = uid;
      if (uid == null) {
        if (mounted) setState(() => _paused = false);
        return;
      }
      _check();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _authSub?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 別の端末（Web）で停止・再開したときも、アプリに戻ったら合わせる
    if (state == AppLifecycleState.resumed && _uid != null) _check();
  }

  Future<void> _check() async {
    try {
      final data = await Api.query(r'''
query AppAccountPause {
  viewer { id isAccountPaused accountPausedAt }
}''');
      final viewer = data.obj('viewer');
      if (!mounted) return;
      setState(() {
        _paused = viewer?.boolean('isAccountPaused') ?? false;
        final at = viewer?['accountPausedAt'];
        _pausedAt = at is num ? at.toInt() : null;
      });
    } catch (_) {
      // 読めなければ出さない（停止中なら API が操作を断る）
    }
  }

  Future<void> _resume() async {
    setState(() => _busy = true);
    try {
      await Api.mutate(r'''
mutation AppResumeAccount {
  resumeAccount
}''');
      if (!mounted) return;
      setState(() {
        _busy = false;
        _paused = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _busy = false);
    }
  }

  Future<void> _logout() async {
    setState(() => _busy = true);
    try {
      await logout();
    } catch (_) {}
    if (mounted) setState(() => _busy = false);
  }

  String _date(int seconds) {
    final d = DateTime.fromMillisecondsSinceEpoch(seconds * 1000).toLocal();
    return tr('${d.year}年${d.month}月${d.day}日', '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}');
  }

  @override
  Widget build(BuildContext context) {
    if (!_paused) return widget.child;
    final cs = Theme.of(context).colorScheme;
    final muted = cs.onSurface.withValues(alpha: 0.65);
    return Stack(children: [
      widget.child,
      Positioned.fill(child: ModalBarrier(color: Colors.black.withValues(alpha: 0.55), dismissible: false)),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(Ds.s24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Material(
              color: cs.surface,
              borderRadius: Ds.br(20),
              child: Padding(
                padding: const EdgeInsets.all(Ds.s20),
                child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Row(children: [
                    const Icon(Icons.pause_circle_outline_rounded, color: Ds.sky),
                    const SizedBox(width: Ds.s8),
                    Expanded(child: Text(tr('アカウントは一時停止中です', 'Your account is paused'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17))),
                  ]),
                  const SizedBox(height: Ds.s8),
                  Text(tr('再開しますか？', 'Would you like to reactivate it?'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  const SizedBox(height: Ds.s8),
                  if (_pausedAt != null) Text('${tr('停止した日', 'Paused on')}: ${_date(_pausedAt!)}', style: TextStyle(color: muted, fontSize: 13)),
                  const SizedBox(height: Ds.s4),
                  Text(
                    tr('再開すると、プロフィール・作品・コメントがまたほかの人に見えるようになります（停止する前に非公開だった作品は非公開のままです）。停止したままにする場合は、ログアウトしてください。',
                        'When you reactivate, your profile, works and comments become visible to others again (works that were private before you paused stay private). To stay paused, log out.'),
                    style: TextStyle(color: muted, fontSize: 13, height: 1.5),
                  ),
                  const SizedBox(height: Ds.s16),
                  FilledButton(
                    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(46)),
                    onPressed: _busy ? null : _resume,
                    child: Text(_busy ? tr('お待ちください…', 'Please wait…') : tr('再開する', 'Reactivate')),
                  ),
                  const SizedBox(height: Ds.s8),
                  TextButton(onPressed: _busy ? null : _logout, child: Text(tr('停止したままログアウト', 'Stay paused and log out'))),
                ]),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
