import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/paged_list.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/user_name_row.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 設定の入口（Web の /settings）
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget link(IconData icon, String label, String path) => SettingsLink(icon: icon, label: label, onTap: () => context.push(path));
    return Scaffold(
      appBar: AppBar(title: const Text('設定', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ContentWidth(
        child: ListView(padding: const EdgeInsets.only(bottom: 60), children: [
          SettingsGroup(title: 'アカウント', children: [
            link(Icons.badge_outlined, 'プロフィール', '/settings/profile'),
            link(Icons.manage_accounts_outlined, 'アカウント設定', '/settings/account'),
            link(Icons.volunteer_activism_outlined, '応援コイン受け取り', '/settings/support-received'),
          ]),
          SettingsGroup(title: '表示と通知', children: [
            link(Icons.notifications_none_rounded, '通知・いいね', '/settings/notification'),
            link(Icons.visibility_outlined, '表示コンテンツ', '/settings/restriction'),
            link(Icons.palette_outlined, 'カラーテーマ', '/settings/color'),
          ]),
          SettingsGroup(title: 'タグとユーザー', children: [
            link(Icons.sell_outlined, 'お気に入りタグ', '/settings/followed/tags'),
            link(Icons.volume_off_outlined, 'ユーザーミュート', '/settings/muted/users'),
            link(Icons.block_rounded, 'ユーザーブロック', '/settings/blocked/users'),
            link(Icons.label_off_outlined, 'タグミュート', '/settings/muted/tags'),
          ]),
          SettingsGroup(children: [
            link(Icons.tune_rounded, 'その他の設定・ヘルプ', '/more'),
          ]),
        ]),
      ),
    );
  }
}

/// アカウント設定
class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  String? _login;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final u = await SettingsApi.viewerAccount();
      if (mounted) setState(() => _login = u?.str('login'));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('アカウント設定', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ContentWidth(
        child: ListView(children: [
          SettingsGroup(children: [
            SettingsLink(
              icon: Icons.alternate_email_rounded,
              label: 'ユーザーID',
              trailing: _login,
              onTap: () async {
                await context.push('/settings/account/login');
                _load();
              },
            ),
            SettingsLink(icon: Icons.lock_outline_rounded, label: 'パスワード', onTap: () => context.push('/settings/account/password')),
          ]),
          SettingsGroup(children: [
            SettingsLink(icon: Icons.person_off_outlined, label: '退会', destructive: true, onTap: () => context.push('/account/delete')),
          ]),
        ]),
      ),
    );
  }
}

/// ユーザーID の変更
class AccountLoginScreen extends StatefulWidget {
  const AccountLoginScreen({super.key});

  @override
  State<AccountLoginScreen> createState() => _AccountLoginScreenState();
}

class _AccountLoginScreenState extends State<AccountLoginScreen> {
  final _text = TextEditingController();
  String _current = '';
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    SettingsApi.viewerAccount().then((u) {
      if (!mounted) return;
      _current = u?.str('login') ?? '';
      _text.text = _current;
      setState(() {});
    }).catchError((_) {});
    _text.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  bool get _valid => RegExp(r'^[A-Za-z0-9_-]{1,32}$').hasMatch(_text.text.trim()) && _text.text.trim() != _current;

  Future<void> _save() async {
    final next = _text.text.trim();
    final ok = await showConfirmSheet(context, title: 'ユーザーID を変更しますか？', message: '@$_current → @$next\nプロフィールの URL も変わり、次回のログインから新しい ID を使います。', confirmLabel: '変更する');
    if (!ok || !mounted) return;
    setState(() => _saving = true);
    try {
      await SettingsApi.updateLogin(next);
      if (!mounted) return;
      Ds.success();
      context.toast('ユーザーID を変更しました');
      Navigator.of(context).maybePop();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ユーザーID', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ContentWidth(
        child: ListView(padding: const EdgeInsets.all(Ds.s16), children: [
          TextField(controller: _text, autocorrect: false, maxLength: 32, decoration: settingsField(context, 'ユーザーID', prefix: '@')),
          Text('半角英数字と _ - が使えます。', style: TextStyle(color: context.muted, fontSize: 12.5)),
          const SizedBox(height: Ds.s16),
          PrimaryButton(label: _saving ? '変更中…' : '変更する', onPressed: _saving || !_valid ? null : _save),
        ]),
      ),
    );
  }
}

/// パスワードの変更
class AccountPasswordScreen2 extends StatefulWidget {
  const AccountPasswordScreen2({super.key});

  @override
  State<AccountPasswordScreen2> createState() => _AccountPasswordScreen2State();
}

class _AccountPasswordScreen2State extends State<AccountPasswordScreen2> {
  final _current = TextEditingController();
  final _next = TextEditingController();
  final _confirm = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    for (final c in [_current, _next, _confirm]) {
      c.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _current.dispose();
    _next.dispose();
    _confirm.dispose();
    super.dispose();
  }

  bool get _valid => _current.text.isNotEmpty && _next.text.length >= 8 && _next.text == _confirm.text;

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await SettingsApi.updatePassword(_current.text, _next.text);
      if (!mounted) return;
      Ds.success();
      context.toast('パスワードを変更しました');
      Navigator.of(context).maybePop();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget field(TextEditingController c, String label) => Padding(
          padding: const EdgeInsets.only(bottom: Ds.s12),
          child: TextField(controller: c, obscureText: true, autocorrect: false, enableSuggestions: false, decoration: settingsField(context, label)),
        );
    final mismatch = _confirm.text.isNotEmpty && _next.text != _confirm.text;
    return Scaffold(
      appBar: AppBar(title: const Text('パスワード', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ContentWidth(
        child: ListView(padding: const EdgeInsets.all(Ds.s16), children: [
          field(_current, '今のパスワード'),
          field(_next, '新しいパスワード（8文字以上）'),
          field(_confirm, '新しいパスワード（確認）'),
          if (mismatch) Text('新しいパスワードが一致していません', style: TextStyle(color: context.cs.error, fontSize: 12.5)),
          const SizedBox(height: Ds.s8),
          PrimaryButton(label: _saving ? '変更中…' : '変更する', onPressed: _saving || !_valid ? null : _save),
        ]),
      ),
    );
  }
}

/// 設定を読み、スイッチを押したらすぐ保存する画面の共通部分
mixin _SettingState<T extends StatefulWidget> on State<T> {
  Map<String, dynamic>? setting;
  Map<String, dynamic>? viewer;
  String? loadError;
  bool saving = false;

  Future<void> loadSetting() async {
    setState(() => loadError = null);
    try {
      final data = await SettingsApi.userSetting();
      if (!mounted) return;
      setState(() {
        setting = data.obj('userSetting');
        viewer = data.obj('viewer');
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => loadError = e.message);
    }
  }

  /// 先に画面を変えて、失敗したら戻す
  Future<void> saveSetting(String key, Object value, {Map<String, dynamic>? target}) async {
    final map = target ?? setting;
    if (map == null) return;
    final before = map[key];
    setState(() {
      map[key] = value;
      saving = true;
    });
    try {
      await SettingsApi.updateSetting({key: value});
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => map[key] = before);
        context.toast(e.message, error: true);
      }
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  Widget? settingPlaceholder() {
    if (loadError != null) return Center(child: StateView.error(loadError!, onRetry: loadSetting));
    if (setting == null) {
      return const Padding(padding: EdgeInsets.all(Ds.s16), child: Column(children: [Skeleton(height: 64, radius: 18), SizedBox(height: Ds.s12), Skeleton(height: 64, radius: 18)]));
    }
    return null;
  }
}

/// 通知・いいね・Push（Web の /settings/notification と /settings/push-notification）
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> with _SettingState {
  bool _pushBusy = false;

  @override
  void initState() {
    super.initState();
    loadSetting();
  }

  bool get _pushOn => viewer?.obj('user')?.strOrNull('fcmToken') != null;

  Future<void> _setPush(bool on) async {
    setState(() => _pushBusy = true);
    try {
      if (!on) {
        await SettingsApi.updateFcmToken(null);
        viewer?.obj('user')?['fcmToken'] = null;
        if (mounted) context.toast('Push通知をオフにしました');
      } else {
        final messaging = FirebaseMessaging.instance;
        final permission = await messaging.requestPermission(alert: true, sound: true, badge: true);
        if (permission.authorizationStatus == AuthorizationStatus.denied) {
          if (mounted) context.toast('端末の設定で Aipictors の通知を許可してください', error: true);
          return;
        }
        final token = await messaging.getToken();
        if (token == null) throw ApiException('Push通知の登録に失敗しました');
        await SettingsApi.updateFcmToken(token);
        viewer?.obj('user')?['fcmToken'] = token;
        if (mounted) context.toast('Push通知をオンにしました');
      }
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } catch (_) {
      if (mounted) context.toast('Push通知の登録に失敗しました', error: true);
    } finally {
      if (mounted) setState(() => _pushBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = setting;
    return Scaffold(
      appBar: AppBar(title: const Text('通知・いいね', style: TextStyle(fontWeight: FontWeight.w800))),
      body: settingPlaceholder() ??
          ContentWidth(
            child: ListView(children: [
              SettingsGroup(title: '通知', children: [
                SettingsSwitch(
                  label: 'コメントの通知を受け取る',
                  value: s!.boolean('isNotifyComment'),
                  onChanged: saving ? null : (v) => saveSetting('isNotifyComment', v),
                ),
                SettingsSwitch(
                  label: 'Push通知を受け取る',
                  subtitle: 'この端末に通知を送ります',
                  value: _pushOn,
                  onChanged: _pushBusy ? null : _setPush,
                ),
              ]),
              SettingsGroup(
                title: 'いいねの表示',
                footer: 'サムネイルからいいねしたときに使います。',
                children: [
                  SettingsSwitch(
                    label: '作品のいいねを匿名にする',
                    value: s.boolean('isAnonymousLikeAllAges'),
                    onChanged: saving ? null : (v) => saveSetting('isAnonymousLikeAllAges', v),
                  ),
                ],
              ),
            ]),
          ),
    );
  }
}

/// 表示コンテンツ（Web の /settings/restriction。アプリでは R18 は選べない）
class RestrictionSettingsScreen extends StatefulWidget {
  const RestrictionSettingsScreen({super.key});

  @override
  State<RestrictionSettingsScreen> createState() => _RestrictionSettingsScreenState();
}

class _RestrictionSettingsScreenState extends State<RestrictionSettingsScreen> with _SettingState {
  @override
  void initState() {
    super.initState();
    loadSetting();
  }

  @override
  Widget build(BuildContext context) {
    final s = setting;
    final rating = s?.str('preferenceRating') ?? 'G';
    final isWebRange = rating == 'R18' || rating == 'R18G';
    return Scaffold(
      appBar: AppBar(title: const Text('表示コンテンツ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: settingPlaceholder() ??
          ContentWidth(
            child: ListView(children: [
              SettingsGroup(
                footer: isWebRange ? 'この項目は Web の設定で決まっています。アプリでは全年齢と R15 の作品だけを表示します。' : 'アプリでは全年齢と R15 の作品だけを表示します。',
                children: [
                  SettingsSwitch(
                    label: 'R15 の作品を表示する',
                    value: rating != 'G',
                    onChanged: saving || isWebRange
                        ? null
                        : (v) async {
                            await saveSetting('preferenceRating', v ? 'R15' : 'G');
                            AppContentFilter.showR15 = setting?.str('preferenceRating') != 'G';
                          },
                  ),
                ],
              ),
            ]),
          ),
    );
  }
}

/// カラーテーマ
class ColorSettingsScreen extends ConsumerWidget {
  const ColorSettingsScreen({super.key});

  static const _colors = <(String?, String, Color)>[
    (null, '標準', Ds.blue),
    ('green', '緑', Colors.green),
    ('red', '赤', Colors.red),
    ('yellow', '黄', Colors.yellow),
    ('purple', '紫', Colors.purple),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);
    final notifier = ref.read(configProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('カラーテーマ', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ContentWidth(
        child: ListView(children: [
          SettingsGroup(title: 'モード', children: [
            Padding(
              padding: const EdgeInsets.all(Ds.s12),
              child: SizedBox(
                width: double.infinity,
                child: SegmentedButton<ThemeMode>(
                  showSelectedIcon: false,
                  segments: const [
                    ButtonSegment(value: ThemeMode.system, label: Text('自動')),
                    ButtonSegment(value: ThemeMode.light, label: Text('ライト')),
                    ButtonSegment(value: ThemeMode.dark, label: Text('ダーク')),
                  ],
                  selected: {config.themeMode},
                  onSelectionChanged: (s) => notifier.updateThemeMode(s.first),
                ),
              ),
            ),
          ]),
          SettingsGroup(title: '色', children: [
            Padding(
              padding: const EdgeInsets.all(Ds.s16),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                for (final c in _colors)
                  Pressable(
                    onTap: () => notifier.updateColorScheme(c.$1),
                    child: Column(children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: c.$3,
                          shape: BoxShape.circle,
                          border: Border.all(color: _isSelected(config.themeColor, c.$3, c.$1) ? context.cs.onSurface : Colors.transparent, width: 2.5),
                        ),
                      ),
                      const SizedBox(height: Ds.s4),
                      Text(c.$2, style: TextStyle(color: context.muted, fontSize: 12)),
                    ]),
                  ),
              ]),
            ),
          ]),
        ]),
      ),
    );
  }

  bool _isSelected(Color? current, Color color, String? name) => name == null ? current == null : current == color;
}

/// ユーザーのミュート・ブロックの一覧
class ManagedUsersScreen extends StatefulWidget {
  const ManagedUsersScreen({super.key, required this.blocked});

  final bool blocked;

  @override
  State<ManagedUsersScreen> createState() => _ManagedUsersScreenState();
}

class _ManagedUsersScreenState extends State<ManagedUsersScreen> with _SettingState {
  late final PagedController<UserSummary> _users = PagedController(
    pageSize: 30,
    idOf: (u) => u.id,
    fetch: widget.blocked ? SettingsApi.blockedUsers : SettingsApi.mutedUsers,
  );

  @override
  void initState() {
    super.initState();
    if (!widget.blocked) loadSetting();
  }

  @override
  void dispose() {
    _users.dispose();
    super.dispose();
  }

  Future<void> _remove(UserSummary u) async {
    final blocked = widget.blocked;
    final ok = await showConfirmSheet(context, title: blocked ? '${u.name}さんのブロックを解除しますか？' : '${u.name}さんのミュートを解除しますか？', confirmLabel: '解除する');
    if (!ok) return;
    try {
      if (blocked) {
        await UserApi.block(u.id, false);
      } else {
        await UserApi.mute(u.id, false);
      }
      _users.removeWhere((x) => x.id == u.id);
      Api.clearCache();
      if (mounted) context.toast('解除しました');
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final blocked = widget.blocked;
    final s = setting;
    return Scaffold(
      appBar: AppBar(title: Text(blocked ? 'ユーザーブロック' : 'ユーザーミュート', style: const TextStyle(fontWeight: FontWeight.w800))),
      body: PagedList<UserSummary>(
        controller: _users,
        emptyTitle: blocked ? 'ブロックしているユーザーはいません' : 'ミュートしているユーザーはいません',
        emptyIcon: blocked ? Icons.block_rounded : Icons.volume_off_outlined,
        header: blocked || s == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: Ds.s12),
                child: SettingsGroup(
                  footer: 'オフにすると、ミュートした人の作品やコメントを隠します。',
                  children: [
                    SettingsSwitch(
                      label: '作品を表示する',
                      value: s.boolean('isShowingMutedUsersWorks'),
                      onChanged: saving ? null : (v) => saveSetting('isShowingMutedUsersWorks', v),
                    ),
                    SettingsSwitch(
                      label: 'コメントを表示する',
                      value: s.boolean('isShowingMutedUsersComments'),
                      onChanged: saving ? null : (v) => saveSetting('isShowingMutedUsersComments', v),
                    ),
                  ],
                ),
              ),
        itemBuilder: (context, u) => ListTile(
          leading: UserAvatar.summary(u, size: 40),
          title: UserNameRow.summary(u, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text('@${u.login.replaceFirst(RegExp(r'^@+'), '')}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 12)),
          trailing: OutlinedButton(onPressed: () => _remove(u), child: const Text('解除')),
          onTap: () => Nav.user(context, u.id),
        ),
      ),
    );
  }
}

/// タグのミュート・お気に入りの一覧
class ManagedTagsScreen extends StatefulWidget {
  const ManagedTagsScreen({super.key, required this.followed});

  /// true ならお気に入りタグ、false ならミュートのタグ
  final bool followed;

  @override
  State<ManagedTagsScreen> createState() => _ManagedTagsScreenState();
}

class _ManagedTagsScreenState extends State<ManagedTagsScreen> {
  final _input = TextEditingController();
  bool _adding = false;
  late final PagedController<String> _tags = PagedController(
    pageSize: 50,
    idOf: (t) => t,
    fetch: widget.followed ? SettingsApi.followedTags : SettingsApi.mutedTags,
  );

  @override
  void dispose() {
    _input.dispose();
    _tags.dispose();
    super.dispose();
  }

  Future<void> _add() async {
    final name = _input.text.trim().replaceFirst(RegExp(r'^#'), '');
    if (name.isEmpty || _adding) return;
    setState(() => _adding = true);
    try {
      if (widget.followed) {
        await SettingsApi.followTag(name, true);
      } else {
        await SettingsApi.muteTag(name, true);
      }
      _input.clear();
      Api.clearCache();
      await _tags.refresh();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _adding = false);
    }
  }

  Future<void> _remove(String name) async {
    try {
      if (widget.followed) {
        await SettingsApi.followTag(name, false);
      } else {
        await SettingsApi.muteTag(name, false);
      }
      Api.clearCache();
      _tags.removeWhere((t) => t == name);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final followed = widget.followed;
    return Scaffold(
      appBar: AppBar(title: Text(followed ? 'お気に入りタグ' : 'タグミュート', style: const TextStyle(fontWeight: FontWeight.w800))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, Ds.s8),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: _input,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _add(),
                decoration: settingsField(context, followed ? 'タグを追加' : 'ミュートするタグ', prefix: '#'),
              ),
            ),
            const SizedBox(width: Ds.s8),
            FilledButton(onPressed: _adding ? null : _add, child: const Text('追加')),
          ]),
        ),
        Expanded(
          child: PagedList<String>(
            controller: _tags,
            emptyTitle: followed ? 'お気に入りのタグはありません' : 'ミュートしているタグはありません',
            emptyMessage: followed ? 'タグをお気に入りにすると、ここに並びます' : 'ミュートしたタグの作品は一覧に出なくなります',
            emptyIcon: followed ? Icons.sell_outlined : Icons.label_off_outlined,
            itemBuilder: (context, tag) => ListTile(
              leading: const Icon(Icons.tag_rounded),
              title: Text(tag, style: const TextStyle(fontWeight: FontWeight.w600)),
              trailing: IconButton(tooltip: '解除', icon: const Icon(Icons.close_rounded), onPressed: () => _remove(tag)),
              onTap: followed ? () => Nav.tag(context, tag) : null,
            ),
          ),
        ),
      ]),
    );
  }
}

/// 応援コイン受け取り（応援の付いたコメントの一覧）
class SupportReceivedScreen extends StatefulWidget {
  const SupportReceivedScreen({super.key});

  @override
  State<SupportReceivedScreen> createState() => _SupportReceivedScreenState();
}

class _SupportReceivedScreenState extends State<SupportReceivedScreen> {
  final _items = PagedController<SupportedComment>(pageSize: 30, idOf: (c) => c.id, fetch: SettingsApi.receivedSupport);

  @override
  void dispose() {
    _items.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('応援コイン受け取り', style: TextStyle(fontWeight: FontWeight.w800))),
      body: PagedList<SupportedComment>(
        controller: _items,
        emptyTitle: 'まだ応援はありません',
        emptyMessage: '作品に応援コインが届くと、ここに並びます',
        emptyIcon: Icons.volunteer_activism_outlined,
        itemBuilder: (context, c) {
          final canOpen = c.workId != null && !c.isAdult;
          return InkWell(
            onTap: canOpen ? () => Nav.work(context, c.workId!) : null,
            child: Padding(
              padding: const EdgeInsets.all(Ds.s12),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (c.user != null) UserAvatar.summary(c.user!, size: 40, tappable: true) else const SizedBox(width: 40, height: 40),
                const SizedBox(width: Ds.s12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    if (c.user != null) UserNameRow.summary(c.user!, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    if (c.text.isNotEmpty) Padding(padding: const EdgeInsets.only(top: Ds.s4), child: Text(c.text, maxLines: 4, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, height: 1.35))),
                    if (c.stickerUrl != null) Padding(padding: const EdgeInsets.only(top: Ds.s4), child: SizedBox(width: 64, height: 64, child: AppImage(c.stickerUrl, fit: BoxFit.contain, memCacheWidth: 192))),
                    const SizedBox(height: Ds.s4),
                    Row(children: [
                      Badge2('${c.coins}コイン', icon: Icons.monetization_on_rounded, color: Ds.gold),
                      const SizedBox(width: Ds.s8),
                      Text(relativeTime(c.createdAt), style: TextStyle(color: context.muted, fontSize: 12)),
                    ]),
                  ]),
                ),
                if (canOpen && c.workThumbnail != null) ...[
                  const SizedBox(width: Ds.s8),
                  SizedBox(width: 52, height: 52, child: AppImage(c.workThumbnail, radius: 10, memCacheWidth: 156)),
                ],
              ]),
            ),
          );
        },
      ),
    );
  }
}
