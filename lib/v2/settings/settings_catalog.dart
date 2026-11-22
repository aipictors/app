import 'package:aipictors/v2/core/l10n.dart';
import 'package:flutter/material.dart';

/// 設定トップの行の種類
enum SettingsKind {
  /// path の画面へ行く
  link,

  /// その場で切り替えるスイッチ（設定トップの画面が値を持つ）
  toggle,

  /// その場の操作（言語・キャッシュ削除など）
  action,
}

/// サブ画面の中の項目。検索だけに使い、押すと親の画面へ行く
class SettingsInner {
  const SettingsInner(this.ja, this.en, [this.keywords = const []]);

  final String ja;
  final String en;
  final List<String> keywords;

  String get label => tr(ja, en);
}

/// 設定の 1 行。設定トップの表示と検索の両方でこの定義を使う
class SettingsItem {
  const SettingsItem({
    required this.id,
    required this.icon,
    required this.ja,
    required this.en,
    this.kind = SettingsKind.link,
    this.path,
    this.keywords = const [],
    this.inner = const [],
    this.loginOnly = false,
    this.debugOnly = false,
  });

  final String id;
  final IconData icon;
  final String ja;
  final String en;
  final SettingsKind kind;
  final String? path;

  /// 別名（日英どちらでも）。項目名に無い言葉で探されるもの
  final List<String> keywords;

  /// path の画面の中にある項目
  final List<SettingsInner> inner;
  final bool loginOnly;
  final bool debugOnly;

  String get label => tr(ja, en);
}

class SettingsSection {
  const SettingsSection({required this.id, this.ja, this.en, required this.items});

  final String id;
  final String? ja;
  final String? en;
  final List<SettingsItem> items;

  String? get title => ja == null ? null : tr(ja!, en!);
}

/// 設定の全項目。ログアウト・退会・プロフィールの見出しは設定トップの画面が別に描く（検索には含める）
const settingsCatalog = <SettingsSection>[
  SettingsSection(id: 'account', ja: 'アカウント', en: 'Account', items: [
    SettingsItem(
      id: 'profile',
      icon: Icons.badge_outlined,
      ja: 'プロフィールを編集',
      en: 'Edit profile',
      path: '/settings/profile',
      loginOnly: true,
      keywords: ['プロフィール', 'profile', 'アイコン', 'icon', 'ヘッダー', 'header', '名前', 'name', '自己紹介', 'bio'],
      inner: [
        SettingsInner('表示名', 'Display name'),
        SettingsInner('自己紹介', 'Biography'),
        SettingsInner('アイコン画像', 'Icon image'),
        SettingsInner('ヘッダー画像', 'Header image'),
        SettingsInner('ステータス（吹き出し）', 'Status balloon', ['status']),
        SettingsInner('リンク・連絡先', 'Links & contact', ['SNS', 'X', 'Twitter', 'Instagram', 'メール', 'mail']),
        SettingsInner('ピックアップ作品', 'Pickup works', ['pickup', 'featured']),
      ],
    ),
    SettingsItem(
      id: 'login',
      icon: Icons.alternate_email_rounded,
      ja: 'ユーザーID',
      en: 'User ID',
      path: '/settings/account/login',
      loginOnly: true,
      keywords: ['ID', 'ログインID', 'login', 'username', 'ユーザー名', 'アカウント', 'account'],
    ),
    SettingsItem(
      id: 'password',
      icon: Icons.lock_outline_rounded,
      ja: 'パスワード',
      en: 'Password',
      path: '/settings/account/password',
      loginOnly: true,
      keywords: ['パスワード変更', 'password', 'pass', 'ぱすわーど', 'アカウント', 'account', 'セキュリティ', 'security'],
    ),
  ]),
  SettingsSection(id: 'display', ja: '表示と通知', en: 'Display & notifications', items: [
    SettingsItem(
      id: 'notification',
      icon: Icons.notifications_none_rounded,
      ja: '通知・いいね',
      en: 'Notifications & likes',
      path: '/settings/notification',
      loginOnly: true,
      keywords: ['通知', 'notification', 'notify', 'プッシュ', 'push', 'お知らせ', 'alert'],
      inner: [
        SettingsInner('コメントの通知を受け取る', 'Comment notifications', ['コメント', 'comment']),
        SettingsInner('いいねの通知を受け取る', 'Like notifications', ['いいね', 'like']),
        SettingsInner('匿名いいねの通知を受け取る', 'Anonymous like notifications', ['匿名', 'anonymous']),
        SettingsInner('Push通知を受け取る', 'Push notifications', ['プッシュ', 'push']),
        SettingsInner('作品のいいねを匿名にする', 'Like works anonymously', ['匿名', 'anonymous', 'いいね', 'like']),
      ],
    ),
    SettingsItem(
      id: 'theme',
      icon: Icons.palette_outlined,
      ja: 'テーマ',
      en: 'Theme',
      path: '/settings/color',
      keywords: ['カラーテーマ', 'color', 'colour', 'ダーク', 'dark', 'ライト', 'light', 'ダークモード', 'dark mode', 'モード', 'mode', '色', '外観', 'appearance'],
      inner: [
        SettingsInner('モード（自動・ライト・ダーク）', 'Mode (auto, light, dark)', ['ダークモード', 'dark mode', 'ライト', 'light', '自動', 'system']),
        SettingsInner('アクセントの色', 'Accent color', ['色', 'color', '緑', '赤', '黄', '紫', 'green', 'red', 'yellow', 'purple']),
      ],
    ),
    SettingsItem(
      id: 'language',
      icon: Icons.translate_rounded,
      ja: '言語',
      en: 'Language',
      kind: SettingsKind.action,
      keywords: ['言語切り替え', 'language', 'lang', '日本語', 'Japanese', 'English', '英語', '中文', 'Tiếng Việt', 'Français', 'Italiano'],
    ),
    SettingsItem(
      id: 'r15',
      icon: Icons.visibility_outlined,
      ja: 'R15 の作品を表示する',
      en: 'Show R15 works',
      kind: SettingsKind.toggle,
      path: '/settings/restriction',
      loginOnly: true,
      keywords: ['表示コンテンツ', 'content', 'R15', 'センシティブ', 'sensitive', '年齢', 'age', 'レーティング', 'rating', '制限', 'restriction'],
    ),
    SettingsItem(
      id: 'likeCount',
      icon: Icons.favorite_border_rounded,
      ja: '一覧にいいね数を表示する',
      en: 'Show like counts in lists',
      kind: SettingsKind.toggle,
      keywords: ['いいね数', 'like count', 'likes', 'ハート', 'heart', '♡'],
    ),
    SettingsItem(
      id: 'sticker',
      icon: Icons.emoji_emotions_outlined,
      ja: 'スタンプ',
      en: 'Stickers',
      path: '/settings/sticker',
      loginOnly: true,
      keywords: ['sticker', 'stamp', 'スタンプ設定'],
      inner: [
        SettingsInner('デフォルトのスタンプを表示しない', 'Hide default stickers', ['デフォルト', 'default']),
        SettingsInner('以前のデフォルトのスタンプも使う', 'Also use previous default stickers', ['デフォルト', 'default', 'legacy']),
      ],
    ),
  ]),
  SettingsSection(id: 'privacy', ja: 'ミュート・ブロック', en: 'Mute & block', items: [
    SettingsItem(
      id: 'mutedUsers',
      icon: Icons.volume_off_outlined,
      ja: 'ユーザーミュート',
      en: 'Muted users',
      path: '/settings/muted/users',
      loginOnly: true,
      keywords: ['ミュート', 'mute', 'muted', '非表示', 'hide'],
      inner: [
        SettingsInner('ミュートした人の作品を表示する', "Show muted users' works", ['ミュート', 'mute']),
        SettingsInner('ミュートした人のコメントを表示する', "Show muted users' comments", ['ミュート', 'mute']),
      ],
    ),
    SettingsItem(
      id: 'blockedUsers',
      icon: Icons.block_rounded,
      ja: 'ユーザーブロック',
      en: 'Blocked users',
      path: '/settings/blocked/users',
      loginOnly: true,
      keywords: ['ブロック', 'block', 'blocked', '拒否'],
    ),
    SettingsItem(
      id: 'mutedTags',
      icon: Icons.label_off_outlined,
      ja: 'タグミュート',
      en: 'Muted tags',
      path: '/settings/muted/tags',
      loginOnly: true,
      keywords: ['ミュート', 'mute', 'タグ', 'tag', '非表示', 'hide'],
    ),
    SettingsItem(
      id: 'followedTags',
      icon: Icons.sell_outlined,
      ja: 'お気に入りタグ',
      en: 'Favorite tags',
      path: '/settings/followed/tags',
      loginOnly: true,
      keywords: ['タグ', 'tag', 'お気に入り', 'favorite', 'フォロー', 'follow'],
    ),
  ]),
  SettingsSection(id: 'rewards', ja: '応援と収益', en: 'Support & rewards', items: [
    SettingsItem(
      id: 'supportReceived',
      icon: Icons.volunteer_activism_outlined,
      ja: '応援コイン受け取り',
      en: 'Supports received',
      path: '/settings/support-received',
      loginOnly: true,
      keywords: ['応援', 'support', 'コイン', 'coin'],
    ),
    SettingsItem(
      id: 'creatorRewards',
      icon: Icons.payments_outlined,
      ja: '収益の受け取り',
      en: 'Rewards payout',
      path: '/settings/creator-rewards',
      loginOnly: true,
      keywords: ['収益', 'reward', 'payout', '振込', '口座', 'bank', '報酬'],
    ),
    SettingsItem(
      id: 'requestPlans',
      icon: Icons.storefront_outlined,
      ja: 'リクエストとプラン',
      en: 'Requests & plans',
      path: '/settings/requests',
      loginOnly: true,
      keywords: ['リクエスト', 'request', '依頼', 'プラン', 'plan', '受付', 'commission'],
    ),
    SettingsItem(
      id: 'premiumCoinSupport',
      icon: Icons.do_not_disturb_on_outlined,
      ja: 'プレミアムコインでの推し',
      en: 'Premium coin support',
      path: '/settings/premium-coin-support',
      loginOnly: true,
      keywords: ['推し', 'プレミアムコイン', 'premium', 'coin', '受け取らない'],
    ),
  ]),
  SettingsSection(id: 'help', ja: 'ヘルプと規約', en: 'Help & legal', items: [
    SettingsItem(id: 'help', icon: Icons.help_outline_rounded, ja: 'ヘルプ', en: 'Help', path: '/help', keywords: ['help', '使い方', 'FAQ', 'よくある質問']),
    SettingsItem(
      id: 'contact',
      icon: Icons.support_agent_rounded,
      ja: 'お問い合わせ',
      en: 'Contact us',
      path: '/support/chat',
      keywords: ['問い合わせ', 'contact', 'support', 'サポート', '要望', 'feedback', '不具合', 'bug'],
    ),
    SettingsItem(id: 'guideline', icon: Icons.gavel_rounded, ja: 'ガイドライン', en: 'Guidelines', path: '/guideline', keywords: ['guideline', 'ルール', 'rule']),
    SettingsItem(id: 'terms', icon: Icons.description_outlined, ja: '利用規約', en: 'Terms of use', path: '/terms', keywords: ['規約', 'terms', 'tos']),
    SettingsItem(id: 'eula', icon: Icons.article_outlined, ja: '使用許諾契約（EULA）', en: 'EULA', path: '/terms/eula', keywords: ['EULA', '規約', 'license agreement']),
    SettingsItem(id: 'privacy', icon: Icons.privacy_tip_outlined, ja: 'プライバシーポリシー', en: 'Privacy policy', path: '/privacy', keywords: ['プライバシー', 'privacy', '個人情報']),
    SettingsItem(id: 'license', icon: Icons.copyright_outlined, ja: 'ライセンス', en: 'Licenses', path: '/license', keywords: ['license', 'OSS', 'オープンソース']),
    SettingsItem(id: 'surveys', icon: Icons.cookie_outlined, ja: '調査協力', en: 'Surveys', path: '/surveys', keywords: ['調査', 'survey', 'アンケート']),
  ]),
  SettingsSection(id: 'other', ja: 'その他', en: 'Other', items: [
    SettingsItem(
      id: 'cache',
      icon: Icons.cleaning_services_outlined,
      ja: 'キャッシュを削除',
      en: 'Clear cache',
      kind: SettingsKind.action,
      keywords: ['キャッシュ', 'cache', 'キャッシュクリア', '削除', 'clear', '容量', 'storage', '動作が重い'],
    ),
    SettingsItem(id: 'debug', icon: Icons.code_rounded, ja: 'デバッグ', en: 'Debug', path: '/debug', debugOnly: true, keywords: ['debug', 'デバッグモード']),
  ]),
];

/// トップで別に描く行（検索にだけ出す）
const settingsLogoutItem = SettingsItem(
  id: 'logout',
  icon: Icons.logout_rounded,
  ja: 'ログアウト',
  en: 'Log out',
  kind: SettingsKind.action,
  loginOnly: true,
  keywords: ['ログアウト', 'サインアウト', 'logout', 'log out', 'sign out', 'signout', 'ろぐあうと'],
);

const settingsDeleteAccountItem = SettingsItem(
  id: 'deleteAccount',
  icon: Icons.person_off_outlined,
  ja: '退会',
  en: 'Delete account',
  path: '/account/delete',
  loginOnly: true,
  keywords: ['退会', 'アカウント削除', 'アカウントを削除', '削除', 'delete', 'delete account', '解約', 'withdraw'],
);

/// 検索の結果の 1 件
class SettingsHit {
  const SettingsHit(this.item, this.section, [this.inner]);

  final SettingsItem item;
  final SettingsSection? section;

  /// サブ画面の中の項目に当たったとき
  final SettingsInner? inner;
}

String _norm(String s) {
  // 小文字にし、カタカナをひらがなに寄せ、空白を除く
  final lower = s.toLowerCase().replaceAll(RegExp(r'\s+'), '');
  return String.fromCharCodes(lower.runes.map((c) => c >= 0x30A1 && c <= 0x30F6 ? c - 0x60 : c));
}

bool _matches(String q, Iterable<String> words) => words.any((w) => _norm(w).contains(q));

/// 項目名（日英）・別名・サブ画面の中の項目で絞り込む。visible で表示できない項目（ログイン前など）を除く
List<SettingsHit> searchSettings(String query, bool Function(SettingsItem) visible) {
  final q = _norm(query);
  if (q.isEmpty) return const [];
  final hits = <SettingsHit>[];
  void check(SettingsItem item, SettingsSection? section) {
    if (!visible(item)) return;
    if (_matches(q, [item.ja, item.en, ...item.keywords])) {
      hits.add(SettingsHit(item, section));
    }
    for (final inner in item.inner) {
      if (_matches(q, [inner.ja, inner.en, ...inner.keywords])) hits.add(SettingsHit(item, section, inner));
    }
  }

  for (final s in settingsCatalog) {
    for (final item in s.items) {
      check(item, s);
    }
  }
  check(settingsLogoutItem, null);
  check(settingsDeleteAccountItem, null);
  return hits;
}
