import 'package:aipictors/features/account/functions/withdraw_account.dart';
import 'package:aipictors/features/config/functions/logout.dart';
import 'package:aipictors/features/login/functions/login_with_apple.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/settings/leave_survey.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 確認に入れるアカウントIDの先頭（6 文字まで。短い ID は全部）
String withdrawLoginPrefix(String login) => login.substring(0, login.length < 6 ? login.length : 6);

enum _LeaveStep { survey, choose, withdraw, paused }

/// 退会（Web の /settings/account/withdrawal と同じ流れ）
/// 理由のアンケート → 「一時停止（おすすめ）」か「退会」を選ぶ → 一時停止は課金の確認と停止 / 退会は今までの確認
class AccountDeleteScreen2 extends StatefulWidget {
  const AccountDeleteScreen2({super.key});

  @override
  State<AccountDeleteScreen2> createState() => _AccountDeleteScreen2State();
}

class _AccountDeleteScreen2State extends State<AccountDeleteScreen2> {
  final _prefix = TextEditingController();
  String? _login;
  String? _storeProvider;
  String? _error;
  bool _irreversible = false;
  bool _signOut = false;
  bool _deleting = false;
  _LeaveStep _step = _LeaveStep.survey;
  final _answer = LeaveSurveyAnswer(LeaveSurveyKind.account);

  /// 一時停止の前の課金の状態（NONE / STRIPE_ACTIVE / STRIPE_CANCEL_SCHEDULED / STORE / PREPAID）
  String _subscriptionState = 'NONE';
  bool _agreeCancel = false;
  bool _pausing = false;

  @override
  void initState() {
    super.initState();
    _load();
    _prefix.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _prefix.dispose();
    _answer.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(r'''
query AppWithdrawViewer {
  viewer { id user { id login } currentPass { id paymentProvider } accountPauseSubscriptionState }
}''');
      final v = data.obj('viewer');
      if (!mounted) return;
      setState(() {
        _login = v?.obj('user')?.str('login') ?? '';
        _storeProvider = v?.obj('currentPass')?.strOrNull('paymentProvider');
        _subscriptionState = v?.strOrNull('accountPauseSubscriptionState') ?? 'NONE';
        _error = null;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  String get _required => withdrawLoginPrefix(_login ?? '');
  bool get _matched => _required.isNotEmpty && _prefix.text.trim() == _required;
  bool get _canStart => _login != null && _matched && _irreversible && _signOut && !_deleting;

  /// アプリで買ったプランは Apple / Google が管理しているので、退会しても止まらない
  bool get _isStorePass => _storeProvider == 'APP_STORE' || _storeProvider == 'GOOGLE_PLAY';

  Future<void> _withdraw() async {
    final ok = await _finalConfirm();
    if (!ok || !mounted) return;
    setState(() => _deleting = true);
    try {
      if (isAppleUser() && !await revokeAppleToken()) {
        if (mounted) setState(() => _deleting = false);
        return;
      }
      await LeaveSurveyApi.sendAccountLeave(_answer, outcome: 'withdraw');
      await withdrawAccount();
      try {
        await logout();
      } catch (_) {
        // 退会はサーバーで完了しているので、ログアウトの失敗は無視する
      }
      if (!mounted) return;
      context.toast(tr('退会しました。ご利用ありがとうございました。', 'Your account has been deleted. Thank you for using Aipictors.'));
      context.go('/');
    } catch (e) {
      if (!mounted) return;
      setState(() => _deleting = false);
      context.toast(e is ApiException ? e.message : tr('退会処理に失敗しました', 'Failed to withdraw your account'), error: true);
    }
  }

  /// 最後の確認（Web の AlertDialog と同じく、もう一度チェックを入れる）
  Future<bool> _finalConfirm() async {
    var checked = false;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialog) => AlertDialog(
          title: Text(tr('本当に退会しますか？', 'Are you sure you want to withdraw?')),
          content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(tr('退会後は、アカウント情報を元に戻せません。作品は非公開になり、ログインも解除されます。', 'After withdrawal, your account information cannot be restored. Your works will become private and you will be signed out.')),
            const SizedBox(height: Ds.s12),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: checked,
              onChanged: (v) => setDialog(() => checked = v ?? false),
              title: Text(tr('上記を確認し、本当に退会することに同意します。', 'I have reviewed the above and want to withdraw my account.'), style: const TextStyle(fontSize: 14)),
            ),
          ]),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(tr('やめる', 'Cancel'))),
            TextButton(
              onPressed: checked ? () => Navigator.of(context).pop(true) : null,
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
              child: Text(tr('退会する', 'Withdraw')),
            ),
          ],
        ),
      ),
    );
    return result == true;
  }

  Widget _notice(BuildContext context, {required String title, required String body, required Color color}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: Ds.s12),
      padding: const EdgeInsets.all(Ds.s12),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.08), borderRadius: Ds.br(14), border: Border.all(color: color.withValues(alpha: 0.35))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(Icons.warning_amber_rounded, color: color, size: 20),
        const SizedBox(width: Ds.s8),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
            const SizedBox(height: Ds.s4),
            Text(body, style: TextStyle(color: context.muted, fontSize: 13, height: 1.5)),
          ]),
        ),
      ]),
    );
  }

  bool get _needsCancel => _subscriptionState == 'STRIPE_ACTIVE';

  Future<void> _pause() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr('アカウントを一時停止しますか？', 'Pause your account?')),
        content: Text(tr('停止するとログアウトします。再開するときは、もう一度ログインしてください。', "You'll be logged out. To come back, just log in again.") +
            (_needsCancel ? tr('有料プランは今の期間の終わりで終了します。', ' Your paid plan will end at the end of the current period.') : '')),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(tr('やめる', 'Cancel'))),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(tr('一時停止する', 'Pause'))),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _pausing = true);
    try {
      await LeaveSurveyApi.sendAccountLeave(_answer, outcome: 'pause');
      await Api.mutate(r'''
mutation AppPauseAccount($input: PauseAccountInput) {
  pauseAccount(input: $input)
}''', variables: {
        'input': {'cancelSubscription': _needsCancel},
      });
      try {
        await logout();
      } catch (_) {
        // 停止は済んでいる。次にログインしたときに再開の確認が出る
      }
      if (!mounted) return;
      setState(() {
        _pausing = false;
        _step = _LeaveStep.paused;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _pausing = false);
      context.toast(e is ApiException ? e.message : tr('一時停止できませんでした。時間をおいてもう一度お試しください。', "We couldn't pause your account. Please try again in a moment."), error: true);
    }
  }

  Widget _bullet(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(bottom: Ds.s4),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('・', style: TextStyle(color: context.muted, fontSize: 13)),
          Expanded(child: Text(text, style: TextStyle(color: context.muted, fontSize: 13, height: 1.5))),
        ]),
      );

  Widget _surveyBody(BuildContext context) {
    return ListenableBuilder(
      listenable: _answer,
      builder: (context, _) => ListView(padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 60), children: [
        Text(tr('退会する前に、理由を教えてください', 'Before you go, could you tell us why?'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        const SizedBox(height: Ds.s4),
        Text(
          tr('これからの改善に使わせていただきます。退会の代わりに、データを残したまま「一時停止」することもできます。',
              'Your answer helps us improve. Instead of deleting your account, you can also pause it and keep your data.'),
          style: TextStyle(color: context.muted, fontSize: 13, height: 1.5),
        ),
        const SizedBox(height: Ds.s12),
        LeaveSurveyFields(answer: _answer),
        const SizedBox(height: Ds.s16),
        FilledButton(
          style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
          onPressed: _answer.isComplete ? () => setState(() => _step = _LeaveStep.choose) : null,
          child: Text(tr('次へ', 'Next')),
        ),
      ]),
    );
  }

  Widget _chooseBody(BuildContext context) {
    final canPause = !_needsCancel || _agreeCancel;
    return ListView(padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 60), children: [
      Text(tr('退会の代わりに、一時停止もできます', 'You can pause your account instead'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
      const SizedBox(height: Ds.s12),
      Container(
        padding: const EdgeInsets.all(Ds.s12),
        decoration: BoxDecoration(color: Ds.sky.withValues(alpha: 0.08), borderRadius: Ds.br(14), border: Border.all(color: Ds.sky.withValues(alpha: 0.5))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            const Icon(Icons.pause_circle_outline_rounded, color: Ds.sky, size: 20),
            const SizedBox(width: Ds.s8),
            Text(tr('一時停止する（おすすめ）', 'Pause my account (recommended)'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
          ]),
          const SizedBox(height: Ds.s8),
          _bullet(context, tr('プロフィール・作品・コメントが、ほかの人から見えなくなります（検索・ランキング・タイムライン・おすすめなどにも出ません）', 'Your profile, works and comments are hidden from others (including search, rankings, timelines and recommendations)')),
          _bullet(context, tr('フォロー・いいね・コメントなど、ほかの人からの操作も受け付けません', "Others can't follow you, like or comment on your works")),
          _bullet(context, tr('作品・コイン・パスなどのデータは消えません。もう一度ログインすれば、いつでも元に戻せます（停止する前に非公開だった作品は非公開のまま）', 'Your works, coins and passes are kept. Log in again any time to restore everything (works that were private stay private)')),
          if (_needsCancel) ...[
            const SizedBox(height: Ds.s8),
            _notice(context,
                color: Ds.gold,
                title: tr('有料プランが自動で更新されます', 'Your paid plan renews automatically'),
                body: tr('停止中に料金がかからないよう、一時停止と同時にプランの解約を予約します。今の期間の終わりまではプランの特典が残り、それ以降の請求はありません。コインやパスはそのまま残ります。',
                    "So you aren't charged while paused, your plan will be set to cancel when you pause. You keep your plan until the end of the current period and won't be charged after that. Coins and passes are kept.")),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: _agreeCancel,
              onChanged: (v) => setState(() => _agreeCancel = v ?? false),
              title: Text(tr('プランの解約を予約して一時停止する', 'Cancel my plan at the end of the period and pause'), style: const TextStyle(fontSize: 14)),
            ),
          ],
          if (_subscriptionState == 'STRIPE_CANCEL_SCHEDULED')
            _bullet(context, tr('有料プランは解約予約済みです。今の期間の終わりで終了し、停止中に請求はありません。', "Your plan is already set to cancel at the end of the period, so you won't be charged while paused.")),
          if (_subscriptionState == 'STORE' || _isStorePass) ...[
            const SizedBox(height: Ds.s8),
            _notice(context,
                color: context.cs.error,
                title: tr('アプリで購入したプランは、ストアで解約してください', 'Cancel your app subscription in the store'),
                body: _storeProvider == 'GOOGLE_PLAY'
                    ? tr('一時停止しても Google Play の定期購入は止まりません。Google Play ストアの［お支払いと定期購入］→［定期購入］から解約してください。',
                        "Pausing doesn't stop your Google Play subscription. Cancel it in Google Play → Payments & subscriptions → Subscriptions.")
                    : tr('一時停止しても App Store の定期購入は止まりません。［設定］→［Apple ID］→［サブスクリプション］から解約してください。',
                        "Pausing doesn't stop your App Store subscription. Cancel it in Settings → Apple ID → Subscriptions.")),
          ],
          const SizedBox(height: Ds.s8),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            onPressed: canPause && !_pausing ? _pause : null,
            child: Text(_pausing ? tr('停止しています…', 'Pausing…') : tr('一時停止する', 'Pause my account')),
          ),
        ]),
      ),
      const SizedBox(height: Ds.s16),
      Container(
        padding: const EdgeInsets.all(Ds.s12),
        decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(14), border: Border.all(color: context.cs.outlineVariant)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            Icon(Icons.delete_outline_rounded, color: context.cs.error, size: 20),
            const SizedBox(width: Ds.s8),
            Text(tr('退会する', 'Delete my account'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
          ]),
          const SizedBox(height: Ds.s8),
          Text(tr('アカウント情報を削除し、作品は非公開になります。元には戻せません。', "Your account information is deleted and your works become private. This can't be undone."),
              style: TextStyle(color: context.muted, fontSize: 13, height: 1.5)),
          const SizedBox(height: Ds.s8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(foregroundColor: context.cs.error, minimumSize: const Size.fromHeight(44)),
            onPressed: () => setState(() => _step = _LeaveStep.withdraw),
            child: Text(tr('退会の手続きに進む', 'Continue to delete my account')),
          ),
        ]),
      ),
    ]);
  }

  Widget _pausedBody(BuildContext context) {
    return ListView(padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s24, Ds.s16, 60), children: [
      const Icon(Icons.pause_circle_outline_rounded, color: Ds.sky, size: 48),
      const SizedBox(height: Ds.s12),
      Text(tr('アカウントを一時停止しました', 'Your account is paused'), textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      const SizedBox(height: Ds.s8),
      Text(
        tr('プロフィール・作品・コメントは、ほかの人から見えなくなりました。データはそのまま残っています。\n再開するときは、同じ方法でもう一度ログインして「再開する」を押してください。',
            'Your profile, works and comments are now hidden from others. Your data is kept as is.\nTo come back, log in again the same way and press "Reactivate".'),
        textAlign: TextAlign.center,
        style: TextStyle(color: context.muted, fontSize: 13.5, height: 1.6),
      ),
      const SizedBox(height: Ds.s20),
      FilledButton(onPressed: () => context.go('/'), child: Text(tr('トップへ', 'Go to the top page'))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final login = _login;
    if (login != null && _step != _LeaveStep.withdraw) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(tr('退会', 'Delete account'), style: const TextStyle(fontWeight: FontWeight.w800)),
            leading: _step == _LeaveStep.choose ? BackButton(onPressed: () => setState(() => _step = _LeaveStep.survey)) : null,
          ),
          body: ContentWidth(
            child: switch (_step) {
              _LeaveStep.survey => _surveyBody(context),
              _LeaveStep.choose => _chooseBody(context),
              _ => _pausedBody(context),
            },
          ),
        ),
      );
    }
    return _withdrawBody(context);
  }

  Widget _withdrawBody(BuildContext context) {
    final login = _login;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr('退会', 'Delete account'), style: const TextStyle(fontWeight: FontWeight.w800)),
          leading: login != null ? BackButton(onPressed: () => setState(() => _step = _LeaveStep.choose)) : null,
        ),
        body: login == null
            ? (_error != null ? Center(child: StateView.error(_error!, onRetry: _load)) : const Center(child: CircularProgressIndicator()))
            : ContentWidth(
                child: ListView(padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 60), children: [
                  if (_isStorePass)
                    _notice(
                      context,
                      color: context.cs.error,
                      title: tr('アプリで購入したプランは、先にストアで解約してください', 'Cancel your app subscription in the store first'),
                      body: _storeProvider == 'APP_STORE'
                          ? tr('このプランは iPhone アプリ（App Store）で購入されたため、退会しても自動では解約されません。［設定］→［Apple ID］→［サブスクリプション］から解約してから退会してください。',
                              "This plan was bought in the iPhone app (App Store), so withdrawing won't cancel it. Cancel it in Settings → Apple ID → Subscriptions before withdrawing.")
                          : tr('このプランは Android アプリ（Google Play）で購入されたため、退会しても自動では解約されません。Google Play ストアの［お支払いと定期購入］→［定期購入］から解約してから退会してください。',
                              "This plan was bought in the Android app (Google Play), so withdrawing won't cancel it. Cancel it in Google Play → Payments & subscriptions → Subscriptions before withdrawing."),
                    ),
                  _notice(
                    context,
                    color: Ds.gold,
                    title: tr('退会すると元に戻せません', 'This action cannot be undone'),
                    body: tr(
                      '退会すると、アカウント情報は削除され、作品は非公開になります。スタンプ履歴は残りますが、どのユーザのものかは表示されなくなります。ウェブで加入中の有料プランは退会と同時に解約され、以降の請求は発生しません。\n同じSNS連携を使って再登録する場合は、新しいアカウントとして作成されます。',
                      'Withdrawing removes your account information and makes your works private. Sticker history remains, but it will no longer show which user it belonged to. Any plan you subscribed to on the web is canceled at the same time, and you will not be charged again.\nIf you register again with the same social account later, it will be created as a new account.',
                    ),
                  ),
                  const SizedBox(height: Ds.s8),
                  Text(tr('現在のアカウントID', 'Current account ID'), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
                  const SizedBox(height: Ds.s4),
                  SelectableText('@$login', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: Ds.s16),
                  Text(tr('確認のため、アカウントIDの先頭6文字を入力してください', 'To confirm, enter the first 6 characters of your account ID'), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
                  const SizedBox(height: Ds.s8),
                  TextField(
                    controller: _prefix,
                    maxLength: 6,
                    autocorrect: false,
                    enableSuggestions: false,
                    textCapitalization: TextCapitalization.none,
                    decoration: settingsField(context, tr('先頭6文字を入力', 'Enter the first 6 characters')).copyWith(
                      errorText: _prefix.text.isNotEmpty && !_matched && _prefix.text.length >= _required.length ? tr('アカウントIDの先頭と一致しません', "Doesn't match your account ID") : null,
                    ),
                  ),
                  Text(tr('アカウントIDが6文字未満の場合は、その全文字を入力してください。', 'If your account ID is shorter than 6 characters, enter the full ID.'), style: TextStyle(color: context.muted, fontSize: 12)),
                  const SizedBox(height: Ds.s8),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _irreversible,
                    onChanged: (v) => setState(() => _irreversible = v ?? false),
                    title: Text(tr('退会するとアカウント情報は元に戻せず、作品は非公開になることを理解しました。', 'I understand that withdrawing is irreversible and my works will become private.'), style: const TextStyle(fontSize: 14)),
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _signOut,
                    onChanged: (v) => setState(() => _signOut = v ?? false),
                    title: Text(tr('退会後はログインが解除され、同じSNS連携で再登録しても新しいアカウントになることを理解しました。', 'I understand that I will be signed out and re-registering with the same social account will create a new account.'), style: const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(height: Ds.s16),
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: context.cs.error, foregroundColor: context.cs.onError, minimumSize: const Size.fromHeight(48)),
                    onPressed: _canStart ? _withdraw : null,
                    child: Text(_deleting ? tr('退会しています…', 'Withdrawing…') : tr('退会する', 'Withdraw')),
                  ),
                ]),
              ),
      ),
    );
  }
}
