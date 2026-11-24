import 'dart:async';

import 'package:aipictors/config.dart';
import 'package:aipictors/features/config/utils/get_device_info.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/repositories/hive_repository.dart';
import 'package:aipictors/utils/to_locale.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/list_like_count.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/settings/settings_catalog.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/user_name_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';

const _viewerQuery = '''
query AppSettingsViewer {
  viewer { id user { $userSummaryFields } }
}''';

const _languages = <(String, String)>[
  ('ja', '日本語'),
  ('en', 'English'),
  ('vi', 'Tiếng Việt'),
  ('zh_cn', '简体中文'),
  ('zh_tw', '繁体中文'),
  ('it', 'Italiano'),
  ('fr', 'Français'),
];

/// 設定のトップ（Web の /settings）。項目は settings_catalog.dart の一覧から作り、検索も同じ一覧を使う
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key, this.initialQuery});

  /// /settings?q=… で検索した状態で開く
  final String? initialQuery;

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late final _search = TextEditingController(text: widget.initialQuery ?? '');
  StreamSubscription<User?>? _authSub;
  UserSummary? _user;
  Map<String, dynamic>? _setting;
  bool _loadingUser = true;
  bool _saving = false;
  String _device = '';

  @override
  void initState() {
    super.initState();
    _search.addListener(() => setState(() {}));
    _authSub = FirebaseAuth.instance.authStateChanges().listen((_) => _load());
    getDeviceInfo().then((v) {
      if (mounted) setState(() => _device = v);
    }).catchError((_) {});
  }

  @override
  void dispose() {
    _authSub?.cancel();
    _search.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    if (!Nav.isLoggedIn) {
      if (mounted) {
        setState(() {
          _user = null;
          _setting = null;
          _loadingUser = false;
        });
      }
      return;
    }
    try {
      final results = await Future.wait([Api.query(_viewerQuery), SettingsApi.userSetting()]);
      if (!mounted) return;
      final u = results[0].obj('viewer')?.obj('user');
      setState(() {
        _user = u == null ? null : UserSummary.fromJson(u);
        _setting = results[1].obj('userSetting');
        _loadingUser = false;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _loadingUser = false);
      context.toast(e.message, error: true);
    }
  }

  bool _visible(SettingsItem item) {
    if (item.loginOnly && !Nav.isLoggedIn) return false;
    if (item.debugOnly && !ref.read(configProvider).isDebugMode) return false;
    return true;
  }

  Future<void> _open(SettingsItem item) async {
    FocusScope.of(context).unfocus();
    switch (item.id) {
      case 'language':
        return _pickLanguage();
      case 'cache':
        return _clearCache();
      case 'logout':
        return _logout();
    }
    final path = item.path;
    if (path == null) return;
    await context.push(path);
    // 戻ったら、トップに出している値（ユーザーID・推しの設定など）を読み直す
    if (mounted && Nav.isLoggedIn) _load();
  }

  Future<void> _logout() async {
    final ok = await showConfirmSheet(
      context,
      title: tr('ログアウトしますか？', 'Log out?'),
      message: _user == null ? null : '${_user!.name}（@${_user!.login}）',
      confirmLabel: tr('ログアウト', 'Log out'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await FirebaseAuth.instance.signOut();
      Api.clearCache();
      if (mounted) context.toast(tr('ログアウトしました', 'Logged out'));
    } catch (_) {
      if (mounted) context.toast(tr('ログアウトできませんでした', 'Could not log out'), error: true);
    }
  }

  Future<void> _clearCache() async {
    await HiveRepository.clear();
    await DefaultCacheManager().emptyCache();
    Api.clearCache();
    if (mounted) context.toast(tr('キャッシュを削除しました', 'Cache cleared'));
  }

  Future<void> _pickLanguage() async {
    final current = ref.read(configProvider).language;
    final code = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => ListView(shrinkWrap: true, padding: const EdgeInsets.only(bottom: Ds.s16), children: [
        for (final l in _languages)
          ListTile(
            title: Text(l.$2, style: const TextStyle(fontWeight: FontWeight.w600)),
            trailing: l.$1 == current ? Icon(Icons.check_rounded, color: context.cs.primary) : null,
            onTap: () => Navigator.of(context).pop(l.$1),
          ),
      ]),
    );
    if (code == null || code == current || !mounted) return;
    ref.read(configProvider.notifier).updateLanguage(code);
    I18n.of(context).locale = toLocale(code);
    L10n.reset();
    setState(() {});
    context.toast(tr('言語を切り替えました。一部の画面はアプリを開き直すと切り替わります', 'Language changed. Some screens update after restarting the app.'));
  }

  Future<void> _setR15(bool on) async {
    final s = _setting;
    if (s == null) return;
    final before = s['preferenceRating'];
    setState(() {
      s['preferenceRating'] = on ? 'R15' : 'G';
      _saving = true;
    });
    try {
      await SettingsApi.updateSetting({'preferenceRating': s['preferenceRating']});
      AppContentFilter.showR15 = on;
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => s['preferenceRating'] = before);
        context.toast(e.message, error: true);
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  /// 右側に出す今の値
  String? _valueOf(SettingsItem item) {
    final config = ref.watch(configProvider);
    switch (item.id) {
      case 'theme':
        return switch (config.themeMode) {
          ThemeMode.light => tr('ライト', 'Light'),
          ThemeMode.dark => tr('ダーク', 'Dark'),
          ThemeMode.system => tr('自動', 'Auto'),
        };
      case 'language':
        final code = config.language;
        for (final l in _languages) {
          if (code.startsWith(l.$1)) return l.$2;
        }
        return tr('端末に合わせる', 'Device');
      case 'login':
        return _user == null ? null : '@${_user!.login}';
      case 'premiumCoinSupport':
        final s = _setting;
        if (s == null) return null;
        return s.boolean('isRejectPremiumCoinSupport') ? tr('受け取らない', 'Off') : tr('受け取る', 'On');
    }
    return null;
  }

  Widget _row(SettingsItem item, {String? subtitle}) {
    if (item.kind == SettingsKind.toggle) return _toggle(item, subtitle: subtitle);
    return SettingsLink(
      icon: item.icon,
      label: item.label,
      subtitle: subtitle,
      trailing: _valueOf(item),
      chevron: item.kind == SettingsKind.link || item.id == 'language',
      onTap: () => _open(item),
    );
  }

  Widget _toggle(SettingsItem item, {String? subtitle}) {
    switch (item.id) {
      case 'r15':
        final rating = _setting?.str('preferenceRating') ?? 'G';
        final isWebRange = rating == 'R18' || rating == 'R18G';
        return SettingsSwitch(
          icon: item.icon,
          label: item.label,
          subtitle: subtitle ?? (isWebRange ? tr('Web の設定で決まっています', 'Set on the web') : null),
          value: rating != 'G',
          onChanged: _setting == null || _saving || isWebRange ? null : _setR15,
        );
      case 'likeCount':
        return ValueListenableBuilder<bool>(
          valueListenable: ListLikeCount.hidden,
          builder: (context, hidden, _) => SettingsSwitch(
            icon: item.icon,
            label: item.label,
            subtitle: subtitle ?? tr('この端末だけの設定です', 'This device only'),
            value: !hidden,
            onChanged: (v) => ListLikeCount.setHidden(!v),
          ),
        );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(configProvider);
    final query = _search.text.trim();
    return Scaffold(
      appBar: AppBar(title: Text(tr('設定', 'Settings'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: ContentWidth(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(bottom: 60),
            children: [
              _searchField(),
              if (query.isNotEmpty) ..._results(query) else ..._sections(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, 0),
      child: TextField(
        controller: _search,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: tr('設定を検索', 'Search settings'),
          prefixIcon: Icon(Icons.search_rounded, color: context.muted),
          suffixIcon: _search.text.isEmpty
              ? null
              : IconButton(tooltip: tr('消す', 'Clear'), icon: const Icon(Icons.close_rounded), onPressed: _search.clear),
          isDense: true,
          filled: true,
          fillColor: context.surfaceCard,
          contentPadding: const EdgeInsets.symmetric(vertical: Ds.s12),
          border: OutlineInputBorder(borderRadius: Ds.br(14), borderSide: BorderSide(color: context.hairline)),
          enabledBorder: OutlineInputBorder(borderRadius: Ds.br(14), borderSide: BorderSide(color: context.hairline)),
        ),
      ),
    );
  }

  List<Widget> _results(String query) {
    final hits = searchSettings(query, _visible);
    if (hits.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.all(Ds.s32),
          child: Column(children: [
            Icon(Icons.search_off_rounded, size: 40, color: context.muted),
            const SizedBox(height: Ds.s8),
            Text(tr('「$query」に当たる設定はありません', 'No settings match "$query"'), textAlign: TextAlign.center, style: TextStyle(color: context.muted)),
          ]),
        ),
      ];
    }
    return [
      SettingsGroup(title: tr('検索結果', 'Results'), children: [
        for (final h in hits)
          if (h.inner != null)
            SettingsLink(icon: h.item.icon, label: h.inner!.label, subtitle: h.item.label, onTap: () => _open(h.item))
          else if (h.item.id == 'logout')
            SettingsLink(icon: h.item.icon, label: h.item.label, destructive: true, chevron: false, onTap: _logout)
          else
            _row(h.item, subtitle: h.section?.title),
      ]),
    ];
  }

  List<Widget> _sections() {
    final loggedIn = Nav.isLoggedIn;
    return [
      _accountHeader(),
      for (final s in settingsCatalog)
        if (s.items.any((i) => _visible(i) && i.id != 'profile'))
          SettingsGroup(title: s.title, children: [
            for (final i in s.items)
              if (_visible(i) && i.id != 'profile') _row(i),
          ]),
      if (loggedIn) ...[
        SettingsGroup(children: [
          SettingsLink(icon: settingsLogoutItem.icon, label: settingsLogoutItem.label, destructive: true, chevron: false, onTap: _logout),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: Ds.s8),
          child: Center(
            child: TextButton(
              onPressed: () => _open(settingsDeleteAccountItem),
              child: Text(settingsDeleteAccountItem.label, style: TextStyle(color: context.muted, fontSize: 13, decoration: TextDecoration.underline, decorationColor: context.muted)),
            ),
          ),
        ),
      ],
      _versionFooter(),
    ];
  }

  Widget _accountHeader() {
    final card = BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(18), border: Border.all(color: context.hairline));
    if (!Nav.isLoggedIn) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s16, Ds.s16, 0),
        child: Container(
          decoration: card,
          padding: const EdgeInsets.all(Ds.s16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.account_circle_outlined, size: 40, color: context.muted),
              const SizedBox(width: Ds.s12),
              Expanded(
                child: Text(
                  tr('ログインすると、通知やミュート、アカウントの設定ができます', 'Log in to manage notifications, mutes, and your account.'),
                  style: const TextStyle(fontWeight: FontWeight.w600, height: 1.4),
                ),
              ),
            ]),
            const SizedBox(height: Ds.s12),
            PrimaryButton(label: tr('ログイン', 'Log in'), icon: Icons.login_rounded, onPressed: () => Nav.login(context)),
          ]),
        ),
      );
    }
    final u = _user;
    if (u == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s16, Ds.s16, 0),
        child: _loadingUser ? const Skeleton(height: 80, radius: 18) : const SizedBox.shrink(),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s16, Ds.s16, 0),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: card,
          child: InkWell(
            borderRadius: Ds.br(18),
            onTap: () {
              Ds.tap();
              _open(settingsCatalog.first.items.firstWhere((i) => i.id == 'profile'));
            },
            child: Padding(
              padding: const EdgeInsets.all(Ds.s12),
              child: Row(children: [
                UserAvatar.summary(u, size: 56),
                const SizedBox(width: Ds.s12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    UserNameRow(name: u.name, isOfficial: u.isOfficial, isModerator: u.isModerator, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                    const SizedBox(height: Ds.s2),
                    Text('@${u.login}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 13)),
                    const SizedBox(height: Ds.s2),
                    Text(tr('プロフィールを編集', 'Edit profile'), style: TextStyle(color: context.cs.primary, fontSize: 12.5, fontWeight: FontWeight.w600)),
                  ]),
                ),
                Icon(Icons.chevron_right_rounded, color: context.muted),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _versionFooter() {
    final text = 'Aipictors ${DefaultConfig.versionText}${_device.isEmpty ? '' : '\n$_device'}';
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s16, Ds.s16, 0),
      child: GestureDetector(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: text.replaceAll('\n', ', ')));
          context.toast(tr('バージョンをコピーしました', 'Version copied'));
        },
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(color: context.muted, fontSize: 12, height: 1.5)),
      ),
    );
  }
}
