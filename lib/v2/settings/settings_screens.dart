import 'package:aipictors/v2/core/store_policy.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/grid_layout.dart';
import 'package:aipictors/v2/core/list_like_count.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/settings/sns_link_section.dart';
import 'package:aipictors/v2/settings/sticker_settings_list.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/paged_list.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/user_name_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aipictors/v2/notifications/push.dart';

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
      appBar: AppBar(title: Text(tr('アカウント設定', 'Account settings'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: ContentWidth(
        child: ListView(padding: const EdgeInsets.only(bottom: 60), children: [
          SettingsGroup(children: [
            SettingsLink(
              icon: Icons.alternate_email_rounded,
              label: tr('ユーザーID', 'User ID'),
              trailing: _login,
              onTap: () async {
                await context.push('/settings/account/login');
                _load();
              },
            ),
            SettingsLink(icon: Icons.lock_outline_rounded, label: tr('パスワード', 'Password'), onTap: () => context.push('/settings/account/password')),
          ]),
          // Web の /settings/account の「SNSアカウント紐付け」とログイン用のメールアドレス
          const SnsLinkSection(),
          SettingsGroup(children: [
            SettingsLink(icon: Icons.person_off_outlined, label: tr('退会', 'Delete account'), destructive: true, onTap: () => context.push('/settings/account/withdrawal')),
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

  /// アプリの通知の種類ごとのオン・オフ（読めるまでは null）
  PushPrefs? _prefs;
  bool _prefsBusy = false;

  @override
  void initState() {
    super.initState();
    loadSetting();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    try {
      final prefs = await Push.prefs();
      if (mounted) setState(() => _prefs = prefs);
    } on ApiException catch (_) {
      // 読めなければ種類の行は出さない（Push 自体のオン・オフは使える）
    }
  }

  Future<void> _savePref({bool? generation, bool? ranking, bool? digest}) async {
    final before = _prefs;
    setState(() {
      _prefsBusy = true;
      _prefs = PushPrefs(
        generation: generation ?? before?.generation ?? true,
        ranking: ranking ?? before?.ranking ?? true,
        digest: digest ?? before?.digest ?? true,
      );
    });
    try {
      final saved = await Push.savePrefs(generation: generation, ranking: ranking, digest: digest);
      if (mounted) setState(() => _prefs = saved);
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => _prefs = before);
        context.toast(e.message, error: true);
      }
    } finally {
      if (mounted) setState(() => _prefsBusy = false);
    }
  }

  bool get _pushOn => viewer?.obj('user')?.strOrNull('fcmToken') != null;

  Future<void> _setPush(bool on) async {
    setState(() => _pushBusy = true);
    try {
      if (!on) {
        await Push.disable();
        viewer?.obj('user')?['fcmToken'] = null;
        if (mounted) context.toast('Push通知をオフにしました');
      } else {
        if (!await Push.enable()) {
          if (mounted) context.toast('端末の設定で Aipictors の通知を許可してください', error: true);
          return;
        }
        viewer?.obj('user')?['fcmToken'] = 'on';
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
                  label: 'いいねの通知を受け取る',
                  value: s.boolean('isNotifyLike', true),
                  onChanged: saving ? null : (v) => saveSetting('isNotifyLike', v),
                ),
                SettingsSwitch(
                  label: '匿名いいねの通知を受け取る',
                  value: s.boolean('isNotifyAnonymousLike', true),
                  onChanged: saving ? null : (v) => saveSetting('isNotifyAnonymousLike', v),
                ),
                SettingsSwitch(
                  label: 'Push通知を受け取る',
                  subtitle: 'この端末に通知を送ります',
                  value: _pushOn,
                  onChanged: _pushBusy ? null : _setPush,
                ),
              ]),
              // アプリの通知の種類（しつこくならないように、それぞれ回数を決めて送る）
              if (_pushOn && _prefs != null)
                SettingsGroup(
                  title: tr('アプリの通知', 'App notifications'),
                  footer: tr('ランキングは 1 日 1 通、まとめは週 1 通までです。', 'Ranking news is at most once a day, and the summary once a week.'),
                  children: [
                    SettingsSwitch(
                      label: tr('生成が終わったとき', 'When generation finishes'),
                      subtitle: tr('アプリを閉じていてもお知らせします', 'Even when the app is closed'),
                      value: _prefs!.generation,
                      onChanged: _prefsBusy ? null : (v) => _savePref(generation: v),
                    ),
                    SettingsSwitch(
                      label: tr('作品がランキングに入ったとき', 'When your work makes the ranking'),
                      subtitle: tr('毎日お昼ごろ', 'Around noon'),
                      value: _prefs!.ranking,
                      onChanged: _prefsBusy ? null : (v) => _savePref(ranking: v),
                    ),
                    SettingsSwitch(
                      label: tr('1 週間の反応のまとめ', 'Weekly summary of reactions'),
                      subtitle: tr('日曜の夜。いいね・コメントがあった週だけ', 'Sunday evening, only when you got likes or comments'),
                      value: _prefs!.digest,
                      onChanged: _prefsBusy ? null : (v) => _savePref(digest: v),
                    ),
                  ],
                ),
              SettingsGroup(
                title: 'いいねの表示',
                footer: tr('いいねしたときに、作者への通知やいいね一覧で名前を出さないようにします。', 'Hides your name in author notifications and like lists when you like a work.'),
                children: [
                  SettingsSwitch(
                    label: tr('全年齢作品のいいねを匿名にする', 'Like all-ages works anonymously'),
                    value: s.boolean('isAnonymousLikeAllAges'),
                    onChanged: saving ? null : (v) => saveSetting('isAnonymousLikeAllAges', v),
                  ),
                  // Web の「R-15 作品のいいねを匿名にする」。R15 を表示している人だけ出す
                  if (s.str('preferenceRating', 'G') != 'G' && !StorePolicy.strict)
                    SettingsSwitch(
                      label: tr('R-15 作品のいいねを匿名にする', 'Like R-15 works anonymously'),
                      value: s.boolean('isAnonymousLikeR15'),
                      onChanged: saving ? null : (v) => saveSetting('isAnonymousLikeR15', v),
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
              // Android 版は全年齢の作品だけを出す（Google Play の決まり）
              if (StorePolicy.strict)
                SettingsGroup(
                  footer: tr('Android 版のアプリでは全年齢の作品だけを表示します。', 'The Android app shows all-ages works only.'),
                  children: const [],
                )
              else
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

/// スタンプの設定（デフォルトのスタンプを表示しない・以前のデフォルトも使う）。Web の /settings/sticker と同じ設定
class StickerSettingsScreen extends StatefulWidget {
  const StickerSettingsScreen({super.key});

  @override
  State<StickerSettingsScreen> createState() => _StickerSettingsScreenState();
}

class _StickerSettingsScreenState extends State<StickerSettingsScreen> with _SettingState {
  @override
  void initState() {
    super.initState();
    loadSetting();
  }

  @override
  Widget build(BuildContext context) {
    final s = setting;
    return Scaffold(
      appBar: AppBar(title: Text(tr('スタンプ', 'Stickers'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: settingPlaceholder() ??
          ContentWidth(
            child: StickerSettingsList(
              isHideDefault: s!.boolean('isHideDefaultStickers'),
              isShowLegacy: s.boolean('isShowLegacyDefaultStickers'),
              onHideDefaultChanged: saving ? null : (v) => saveSetting('isHideDefaultStickers', v),
              onShowLegacyChanged: saving ? null : (v) => saveSetting('isShowLegacyDefaultStickers', v),
              // Web の /settings/sticker は自分のスタンプの一覧も同じ画面に出す。アプリはマイスタンプの画面へ
              leading: [
                SettingsGroup(children: [
                  SettingsLink(icon: Icons.collections_bookmark_outlined, label: tr('マイスタンプ', 'My stickers'), subtitle: tr('作った・追加したスタンプの管理', 'Manage stickers you made or added'), onTap: () => context.push('/my/stickers')),
                  SettingsLink(icon: Icons.storefront_outlined, label: tr('スタンプ広場を見る', 'Browse the sticker square'), onTap: () => context.push('/stickers')),
                ]),
              ],
            ),
          ),
    );
  }
}

/// 推しの受け取り（パロディ作品などでお金に相当するものを受け取りたくない人向け）。Web の設定と同じ user_settings に保存する
/// - 推しを受け付けない: プレミアム・フリーとも推せない（推す画面に出さず、aipictors-api の推しでも断る）
/// - プレミアムコインでの推しを受け取らない: 推す画面でプレミアムコインを選べず、aipictors-api の推しでも断る
/// - 推しでフリーコインを受け取らない: フリーコインで推されても pt だけ付き、コインは届かない
class PremiumCoinSupportSettingsScreen extends StatefulWidget {
  const PremiumCoinSupportSettingsScreen({super.key});

  @override
  State<PremiumCoinSupportSettingsScreen> createState() => _PremiumCoinSupportSettingsScreenState();
}

class _PremiumCoinSupportSettingsScreenState extends State<PremiumCoinSupportSettingsScreen> with _SettingState {
  @override
  void initState() {
    super.initState();
    loadSetting();
  }

  @override
  Widget build(BuildContext context) {
    final s = setting;
    final isRejectAll = s?.boolean('isRejectCoinSupport') ?? false;
    return Scaffold(
      appBar: AppBar(title: Text(tr('推しの受け取り', 'Receiving support'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: settingPlaceholder() ??
          ContentWidth(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 0),
                child: Text(
                  tr('パロディ作品などで、お金に相当するものを受け取りたくないときに使います。', 'Use this if you do not want to receive anything equivalent to money, for example for parody works.'),
                  style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.5),
                ),
              ),
              SettingsGroup(children: [
                SettingsSwitch(
                  label: tr('推しを受け付けない', 'Do not accept support'),
                  subtitle: tr('オンにすると、プレミアムコイン・フリーコインとも、だれもあなたを推せなくなります。これまでに受け取った分はそのままです', 'When on, nobody can support you with premium or free coins. Support you already received stays as is.'),
                  value: isRejectAll,
                  onChanged: saving ? null : (v) => saveSetting('isRejectCoinSupport', v),
                ),
              ]),
              // 「推しを受け付けない」の間は、個別のスイッチは触れない（Web と同じ）
              SettingsGroup(children: [
                SettingsSwitch(
                  label: tr('プレミアムコインでの推しを受け取らない', 'Do not accept support with premium coins'),
                  subtitle: tr('オンにすると、あなたへの推しはフリーコインだけになります。これまでに受け取った分はそのままです', 'When on, support you receive is free coins only. What you already received stays as is.'),
                  value: s!.boolean('isRejectPremiumCoinSupport'),
                  onChanged: saving || isRejectAll ? null : (v) => saveSetting('isRejectPremiumCoinSupport', v),
                ),
                SettingsSwitch(
                  label: tr('推しでフリーコインを受け取らない', 'Do not receive free coins from support'),
                  subtitle: tr('オンにすると、フリーコインで推されても推しの pt だけが付き、フリーコインは届きません。これまでに受け取った分はそのままです', 'When on, support with free coins only adds support points and no free coins are given to you. Coins you already received stay as is.'),
                  value: s.boolean('isRejectFreeCoinSupportReceive'),
                  onChanged: saving || isRejectAll ? null : (v) => saveSetting('isRejectFreeCoinSupportReceive', v),
                ),
              ]),
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
          SettingsGroup(title: '作品一覧', children: [
            ValueListenableBuilder<bool>(
              valueListenable: ListLikeCount.hidden,
              builder: (context, hidden, _) => SettingsSwitch(
                label: '作品一覧にいいね数を表示する',
                subtitle: 'オフにすると、新着や検索などの一覧で ♡ と数を表示しません。作品を開いた画面では表示されます。この端末だけの設定です。',
                value: !hidden,
                onChanged: (v) => ListLikeCount.setHidden(!v),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: GridLayout.square,
              builder: (context, square, _) => SettingsSwitch(
                label: '作品一覧の画像を正方形にそろえる',
                subtitle: 'オンにすると、フォロー新着などの一覧で画像を 1:1 に切り取ってそろえます。ホームの右上のボタンでも切り替えられます。この端末だけの設定です。',
                value: square,
                onChanged: (v) => GridLayout.setSquare(v),
              ),
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
        header: blocked
            ? const Padding(padding: EdgeInsets.only(bottom: Ds.s4), child: _MuteBlockNote())
            : s == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: Ds.s12),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  // Web の /settings/muted/users の「ミュートとブロックの違い」
                  const _MuteBlockNote(),
                  SettingsGroup(
                    children: [
                      SettingsSwitch(
                        label: tr('ミュートしたユーザーの作品を表示する', "Show muted users' works"),
                        subtitle: tr('検索結果、タグ経由の作品一覧、スタンプ広場などでミュートしたユーザーの投稿を表示するか切り替えます。', 'Choose whether posts by muted users appear in search, tag lists, the sticker square and more.'),
                        value: s.boolean('isShowingMutedUsersWorks'),
                        onChanged: saving ? null : (v) => saveSetting('isShowingMutedUsersWorks', v),
                      ),
                      SettingsSwitch(
                        label: tr('ミュートしたユーザーのコメントを表示する', "Show muted users' comments"),
                        subtitle: tr('表示する場合は、最初は隠した状態で出ます。非表示にすると、ミュートしたユーザーのコメントやスタンプは一覧に出ません。', "When shown, they start out hidden. When off, muted users' comments and stickers don't appear."),
                        value: s.boolean('isShowingMutedUsersComments'),
                        onChanged: saving ? null : (v) => saveSetting('isShowingMutedUsersComments', v),
                      ),
                    ],
                  ),
                ]),
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

/// ミュートとブロックの違い（Web の /settings/muted/users の説明と同じ）
class _MuteBlockNote extends StatelessWidget {
  const _MuteBlockNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 0),
      padding: const EdgeInsets.all(Ds.s12),
      decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(14), border: Border.all(color: context.hairline)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(tr('ミュートとブロックの違い', 'Mute vs. block'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
        const SizedBox(height: Ds.s4),
        Text(
          tr(
            'ミュートは自分の画面だけで表示を減らす機能です。検索結果・タグ経由の作品一覧・コメント欄のスタンプやコメント・スタンプ広場などで相手を見えにくくできます。ブロックはそれに加えて、相互の交流自体を強く制限します。',
            'Mute only reduces what you see on your own screen: search results, tag lists, comments and stickers, the sticker square and more. Block also strongly restricts interaction between you and the other user.',
          ),
          style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.5),
        ),
      ]),
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
                maxLength: 40,
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

/// 応援コイン受け取り（累計と受け取り履歴。作品への推しは終了したので、推し付きコメントの一覧は出さない）
class SupportReceivedScreen extends StatefulWidget {
  const SupportReceivedScreen({super.key});

  @override
  State<SupportReceivedScreen> createState() => _SupportReceivedScreenState();
}

class _SupportReceivedScreenState extends State<SupportReceivedScreen> {
  SupportReceivedSummary? _summary;
  bool _summaryFailed = false;

  @override
  void initState() {
    super.initState();
    _loadSummary();
  }

  Future<void> _loadSummary() async {
    try {
      final s = await SettingsApi.supportReceivedSummary();
      if (mounted) {
        setState(() {
          _summary = s;
          _summaryFailed = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _summaryFailed = true);
    }
  }

  /// 累計と内訳（Web の /settings/support-received の上のカード）
  Widget _top(BuildContext context) {
    final s = _summary;
    Widget card(String title, String value, String detail, Color color) => Expanded(
          child: Container(
            padding: const EdgeInsets.all(Ds.s12),
            decoration: BoxDecoration(color: context.surfaceCard, borderRadius: Ds.br(14), border: Border.all(color: context.hairline)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11.5, fontWeight: FontWeight.w600)),
              const SizedBox(height: Ds.s4),
              s == null && !_summaryFailed
                  ? const Skeleton(height: 20, width: 60)
                  : Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: color)),
              const SizedBox(height: 2),
              Text(detail, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 11)),
            ]),
          ),
        );
    String n(int? v) => formatCount(v ?? 0);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, Ds.s8),
        child: Text(
          tr('受け取った応援コインの累計 pt と、フリー / プレミアムの内訳です。推しはユーザーへの推しだけで、これまでの作品経由の推しもここに入ります。ユーザーへのプレミアムコインの推しのうち有料分は、クリエイター報酬（銀行振込）の対象になります（R18・R18G の作品を公開している人は対象外）。',
              'Cumulative received support points with free/premium breakdowns. Support is now for users only, and past support through works is included here. Paid premium-coin support to you is eligible for Creator Rewards (bank payout), except for creators who have published R18 / R18G works.'),
          style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.5),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Ds.s16),
        child: Row(children: [
          card(tr('累計受取', 'Received'), '${n(s?.totalPt)} pt', tr('${n(s?.totalCoins)} コイン', '${n(s?.totalCoins)} coins'), context.cs.primary),
          const SizedBox(width: Ds.s8),
          card(tr('フリー', 'Free'), '${n(s?.freePt)} pt', tr('${n(s?.freeCoins)} コイン', '${n(s?.freeCoins)} coins'), Ds.sky),
          const SizedBox(width: Ds.s8),
          card(tr('プレミアム', 'Premium'), '${n(s?.premiumPt)} pt', tr('${n(s?.premiumCoins)} コイン', '${n(s?.premiumCoins)} coins'), Ds.gold),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(Ds.s4, Ds.s4, Ds.s4, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () => context.push('/settings/creator-rewards'),
            icon: const Icon(Icons.payments_outlined, size: 18),
            label: Text(tr('収益の受け取り（クリエイター報酬）', 'Rewards payout (Creator Rewards)')),
          ),
        ),
      ),
      const SizedBox(height: Ds.s8),
    ]);
  }

  Widget _transfers(BuildContext context) {
    final s = _summary;
    final items = s?.recent ?? const <SupportTransfer>[];
    return AppRefresh(
      onRefresh: _loadSummary,
      child: ListView(padding: const EdgeInsets.only(bottom: 80), children: [
        _top(context),
        if (_summaryFailed && s == null)
          StateView.error(tr('受け取り集計の読み込みに失敗しました', 'Failed to load received support summary'), onRetry: _loadSummary)
        else if (s == null)
          const SkeletonList()
        else if (items.isEmpty)
          StateView.empty(tr('まだ応援コインの受け取り履歴はありません', 'No received support history yet'), icon: Icons.volunteer_activism_outlined)
        else
          for (final t in items)
            ListTile(
              leading: Icon(Icons.monetization_on_rounded, color: t.isPremium ? Ds.gold : Ds.sky),
              title: Text(t.isPremium ? tr('プレミアム応援を受け取り', 'Received premium support') : tr('フリー応援を受け取り', 'Received free support'), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              subtitle: Text(formatJstDateTime(t.createdAt), style: TextStyle(color: context.muted, fontSize: 12)),
              trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(tr('${formatCount(t.coins)} コイン', '${formatCount(t.coins)} coins'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                Text('${formatCount(t.pt)} pt', style: TextStyle(color: context.muted, fontSize: 12)),
              ]),
            ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('応援コイン受け取り', 'Supports received'), style: const TextStyle(fontWeight: FontWeight.w800))),
      body: _transfers(context),
    );
  }
}
