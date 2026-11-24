import 'package:aipictors/features/account/functions/withdraw_account.dart';
import 'package:aipictors/features/config/functions/logout.dart';
import 'package:aipictors/features/login/functions/login_with_apple.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 確認に入れるアカウントIDの先頭（6 文字まで。短い ID は全部）
String withdrawLoginPrefix(String login) => login.substring(0, login.length < 6 ? login.length : 6);

/// 退会（Web の /settings/account/withdrawal と同じ確認）
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

  @override
  void initState() {
    super.initState();
    _load();
    _prefix.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _prefix.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(r'''
query AppWithdrawViewer {
  viewer { id user { id login } currentPass { id paymentProvider } }
}''');
      final v = data.obj('viewer');
      if (!mounted) return;
      setState(() {
        _login = v?.obj('user')?.str('login') ?? '';
        _storeProvider = v?.obj('currentPass')?.strOrNull('paymentProvider');
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

  @override
  Widget build(BuildContext context) {
    final login = _login;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text(tr('退会', 'Delete account'), style: const TextStyle(fontWeight: FontWeight.w800))),
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
