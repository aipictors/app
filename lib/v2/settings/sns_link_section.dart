import 'dart:convert';
import 'dart:math';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// 紐付けられる SNS（Web の SNSConnectSection は Google と X。アプリは iPhone で Apple も）
class LinkProvider {
  const LinkProvider(this.id, this.name, this.icon);

  final String id;
  final String name;
  final IconData icon;
}

List<LinkProvider> get linkProviders => [
      const LinkProvider('google.com', 'Google', Icons.g_mobiledata_rounded),
      const LinkProvider('twitter.com', 'X (Twitter)', Icons.alternate_email_rounded),
      if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) const LinkProvider('apple.com', 'Apple', Icons.apple_rounded),
    ];

/// SNS アカウントの紐付けとログイン用のメールアドレス（Web の /settings/account の SNSConnectSection）
class SnsLinkSection extends StatefulWidget {
  const SnsLinkSection({super.key});

  @override
  State<SnsLinkSection> createState() => _SnsLinkSectionState();
}

class _SnsLinkSectionState extends State<SnsLinkSection> {
  /// providerId → providerUserUid
  Map<String, String>? _providers;
  String? _error;
  String? _busy;
  final _email = TextEditingController();
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(r'''
query AppViewerUserProviders {
  viewer { id user { id userProviders { providerId providerUserUid } } }
}''');
      final list = data.obj('viewer')?.obj('user')?.list('userProviders') ?? const [];
      if (!mounted) return;
      final map = {for (final p in list) p.str('providerId'): p.str('providerUserUid')};
      setState(() {
        _providers = map;
        _error = null;
        // ログイン用のアドレスはメールの連携だけから出す（プロフィールの連絡先メールとは別）
        _email.text = map['email'] ?? '';
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  /// 今のログインを変えないよう、別の Firebase アプリでサインインして uid だけ受け取る
  Future<String?> _signInUid(String providerId) async {
    final app = Firebase.apps.where((a) => a.name == 'account-link').firstOrNull ?? await Firebase.initializeApp(name: 'account-link', options: Firebase.app().options);
    final auth = FirebaseAuth.instanceFor(app: app);
    try {
      final UserCredential result;
      switch (providerId) {
        case 'google.com':
          final google = GoogleSignIn();
          final account = await google.signIn();
          if (account == null) return null;
          final tokens = await account.authentication;
          await google.signOut();
          result = await auth.signInWithCredential(GoogleAuthProvider.credential(accessToken: tokens.accessToken, idToken: tokens.idToken));
        case 'twitter.com':
          result = await auth.signInWithProvider(TwitterAuthProvider());
        case 'apple.com':
          final rawNonce = base64UrlEncode(List.generate(32, (_) => Random.secure().nextInt(256)));
          final apple = await SignInWithApple.getAppleIDCredential(
            scopes: const [],
            nonce: sha256.convert(utf8.encode(rawNonce)).toString(),
          );
          result = await auth.signInWithCredential(OAuthProvider('apple.com').credential(idToken: apple.identityToken, rawNonce: rawNonce, accessToken: apple.authorizationCode));
        default:
          return null;
      }
      return result.user?.uid;
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) return null;
      rethrow;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'web-context-canceled' || e.code == 'canceled' || e.code == 'user-cancelled') return null;
      rethrow;
    } finally {
      await auth.signOut().catchError((_) {});
    }
  }

  Future<void> _link(LinkProvider p) async {
    if (_busy != null) return;
    setState(() => _busy = p.id);
    try {
      final uid = await _signInUid(p.id);
      if (uid == null) return;
      await Api.mutate(r'''
mutation AppLinkUserProvider($input: LinkUserProviderInput!) {
  linkUserProvider(input: $input) { id providerId providerUserUid }
}''', variables: {
        'input': {'providerId': p.id, 'providerUserUid': uid},
      });
      Api.clearCache();
      Ds.success();
      if (mounted) context.toast(tr('${p.name}アカウントを紐付けました', 'Linked ${p.name} account'));
      await _load();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (e) {
      if (mounted) context.toast(tr('紐付けに失敗しました', 'Failed to link account'), error: true);
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  Future<void> _unlink(LinkProvider p) async {
    if (_busy != null) return;
    final ok = await showConfirmSheet(
      context,
      title: tr('${p.name}の紐付けを解除しますか？', 'Unlink ${p.name}?'),
      message: tr('解除すると、この${p.name}アカウントではログインできなくなります。ユーザーIDとパスワードでのログインはそのまま使えます。', 'You will no longer be able to log in with this ${p.name} account. Logging in with your user ID and password still works.'),
      confirmLabel: tr('紐付け解除', 'Unlink'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    setState(() => _busy = p.id);
    try {
      await Api.mutate(r'''
mutation AppUnlinkUserProvider($input: UnlinkUserProviderInput!) {
  unlinkUserProvider(input: $input)
}''', variables: {
        'input': {'providerId': p.id},
      });
      Api.clearCache();
      if (mounted) context.toast(tr('${p.name}アカウントの紐付けを解除しました', 'Unlinked ${p.name} account'));
      await _load();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  Future<void> _sendEmailLink() async {
    final email = _email.text.trim();
    if (email.isEmpty) {
      context.toast(tr('メールアドレスを入力してください', 'Enter your email address'), error: true);
      return;
    }
    setState(() => _sending = true);
    try {
      await Api.mutate(r'''
mutation AppSendEmailAuthLinkForSettings($input: SendEmailAuthLinkInput!) {
  sendEmailAuthLink(input: $input)
}''', variables: {
        'input': {'email': email},
      });
      if (mounted) {
        context.toast(tr('確認メールを送信しました。メール内のリンクを開くとメールログインが有効になります。', 'Verification email sent. Open the link in the email to enable email login.'));
      }
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final providers = _providers;
    if (providers == null) {
      return _error != null
          ? Padding(padding: const EdgeInsets.all(Ds.s16), child: StateView.error(_error!, onRetry: _load))
          : const Padding(padding: EdgeInsets.all(Ds.s16), child: Column(children: [Skeleton(height: 140, radius: 18), SizedBox(height: Ds.s12), Skeleton(height: 120, radius: 18)]));
    }
    final currentEmail = providers['email'];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SettingsGroup(
        title: tr('ログイン用のメールアドレス', 'Login email'),
        footer: tr(
          '確認メールのリンクを開くと、そのメールアドレスでログインできるようになります。ログイン用のアドレスはプロフィールには公開されません。プロフィールに載せる連絡先メールは、プロフィールの編集で別に設定できます。',
          'Open the verification email link to enable login with that address. Your login email is never shown on your profile. To show a contact email, set it separately in Edit profile.',
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(Ds.s12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              TextField(
                controller: _email,
                enabled: !_sending,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: settingsField(context, tr('メールアドレス', 'Email address')),
              ),
              const SizedBox(height: Ds.s8),
              FilledButton(onPressed: _sending ? null : _sendEmailLink, child: Text(_sending ? tr('送信中…', 'Sending…') : tr('確認メールを送信', 'Send verification email'))),
              const SizedBox(height: Ds.s8),
              Text(
                currentEmail != null && currentEmail.isNotEmpty ? tr('いまログインに使えるアドレス: $currentEmail', 'Current login email: $currentEmail') : tr('メールでのログインはまだ設定されていません', "Email login isn't set up yet"),
                style: TextStyle(color: context.muted, fontSize: 12.5),
              ),
            ]),
          ),
          SettingsLink(icon: Icons.badge_outlined, label: tr('プロフィールを編集', 'Edit profile'), onTap: () => context.push('/settings/profile')),
        ],
      ),
      SettingsGroup(
        title: tr('SNSアカウント紐付け', 'Link SNS accounts'),
        footer: tr('SNSアカウントを紐付けると、そのアカウントでログインできるようになります。', 'Link your SNS accounts to enable login with those accounts.'),
        children: [
          for (final p in linkProviders)
            ListTile(
              leading: Icon(p.icon, color: context.muted, size: 28),
              title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              subtitle: Text(
                providers.containsKey(p.id) ? tr('紐付け済み', 'Linked') : tr('未連携', 'Not linked'),
                style: TextStyle(color: providers.containsKey(p.id) ? context.cs.primary : context.muted, fontSize: 12.5),
              ),
              trailing: _busy == p.id
                  ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))
                  : providers.containsKey(p.id)
                      ? OutlinedButton(onPressed: _busy != null ? null : () => _unlink(p), child: Text(tr('紐付け解除', 'Unlink')))
                      : FilledButton(onPressed: _busy != null ? null : () => _link(p), child: Text(tr('紐付ける', 'Link'))),
            ),
        ],
      ),
    ]);
  }
}
