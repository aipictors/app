/// 一般向けの画面（人気のタグ・候補）に出さないタグの判定。
/// Web の app/utils/sensitive-tag-filter.ts、is-sensitive-keyword.ts、prompt-tag-suggestions.ts の語をそのまま使う。
/// 誤判定で失うのは「おすすめに出ない」だけなので、迷う語は含める。作品やタグ画面そのものは隠さない。
class SensitiveTags {
  SensitiveTags._();

  static final _spaces = RegExp(r'\s+');
  static final _hiragana = RegExp('[ぁ-ゖ]');
  static final _fullWidth = RegExp('[！-～]');

  static String _normalize(String tag) => tag
      .replaceAllMapped(_fullWidth, (m) => String.fromCharCode(m[0]!.codeUnitAt(0) - 0xFEE0))
      .toLowerCase()
      .replaceAll(_spaces, '')
      .replaceAllMapped(_hiragana, (m) => String.fromCharCode(m[0]!.codeUnitAt(0) + 96));

  /// true のタグはおすすめや候補から除く
  static bool isBlocked(String tag) {
    final text = _normalize(tag);
    if (text.isEmpty) return false;
    if (_exact.contains(text)) return true;
    if (_loli.hasMatch(text) || _minorAge.hasMatch(text) || _grotesque.hasMatch(text)) return true;
    if (_terms.any(text.contains)) return true;
    if (_keywords.any((k) => k.hasMatch(tag))) return true;
    // Web の候補と同じく英語の語は _ で区切って見る
    return _explicit.hasMatch(text.replaceAll('-', '_'));
  }

  static const _exact = {'jk', 'jc', 'rape'};

  // 「カロリー」「グローブ」を巻き込まない
  static final _loli = RegExp('(^|[^カ])ロリ');
  static final _grotesque = RegExp(r'^(エロ)?グロ$');
  static final _minorAge = RegExp('(^|[^0-9])([0-9]|1[0-7])(歳|才|サイ)');

  static final _explicit = RegExp(r'(^|_)(sex|penis|testicle|testicles|vagina|pussy|clitoris|nipples?|areolae?|anus|anal|cum|cumdrip|ejaculation|erection|fellatio|cunnilingus|paizuri|masturbation|orgasm|rape|bondage|bdsm|nude|naked|topless|bottomless|pubic|genitals?|futanari|condom|dildo|vibrator|tentacle_sex|ahegao|lactation|bukkake|gangbang|handjob|footjob|blowjob|creampie|nsfw|hentai|uncensored|censored|mosaic_censoring|bar_censor|testicle_sucking|ballsack|cameltoe|spread_legs|spread_pussy|loli|lolicon|shota|shotacon|toddler|child_on_child)(_|$)');

  static final _keywords = <RegExp>[
    RegExp(r'r18$', caseSensitive: false),
    RegExp(r'18禁$', caseSensitive: false),
    RegExp(r'エロ$', caseSensitive: false),
    RegExp(r'ero$', caseSensitive: false),
    RegExp(r'nsfw$', caseSensitive: false),
    RegExp(r'porn$', caseSensitive: false),
    RegExp(r'nude$', caseSensitive: false),
    RegExp(r'nudity$', caseSensitive: false),
    RegExp(r'fetish$', caseSensitive: false),
    RegExp(r'hentai$', caseSensitive: false),
    RegExp(r'sex$', caseSensitive: false),
    RegExp(r'裸$', caseSensitive: false),
    RegExp(r'陵辱$', caseSensitive: false),
    RegExp(r'アダルト$', caseSensitive: false),
    RegExp(r'adult$', caseSensitive: false),
    RegExp(r'セクシー$', caseSensitive: false),
    RegExp(r'sexiness$', caseSensitive: false),
    RegExp(r'性行為$', caseSensitive: false),
    RegExp(r'レイプ$', caseSensitive: false),
    RegExp(r'れいぷ$', caseSensitive: false),
    RegExp(r'rape$', caseSensitive: false),
    RegExp(r'強姦$', caseSensitive: false),
    RegExp(r'強制わいせつ$', caseSensitive: false),
    RegExp(r'強制猥褻$', caseSensitive: false),
    RegExp(r'脱糞$', caseSensitive: false),
    RegExp(r'defecation$', caseSensitive: false),
    RegExp(r'排泄$', caseSensitive: false),
    RegExp(r'セックス$', caseSensitive: false),
    RegExp(r'せっくす$', caseSensitive: false),
    RegExp(r'おっぱい', caseSensitive: false),
    RegExp(r'パイズリ', caseSensitive: false),
    RegExp(r'乳首', caseSensitive: false),
    RegExp(r'乳輪', caseSensitive: false),
    RegExp(r'乳首責め', caseSensitive: false),
    RegExp(r'精子$', caseSensitive: false),
    RegExp(r'射精$', caseSensitive: false),
    RegExp(r'精液$', caseSensitive: false),
    RegExp(r'フェラ', caseSensitive: false),
    RegExp(r'フェラチオ', caseSensitive: false),
    RegExp(r'クンニ', caseSensitive: false),
    RegExp(r'クンニリングス', caseSensitive: false),
    RegExp(r'アナル', caseSensitive: false),
    RegExp(r'アナルセックス', caseSensitive: false),
    RegExp(r'肛門', caseSensitive: false),
    RegExp(r'肛門セックス', caseSensitive: false),
    RegExp(r'オナニー', caseSensitive: false),
    RegExp(r'自慰', caseSensitive: false),
    RegExp(r'自慰行為', caseSensitive: false),
    RegExp(r'無修正', caseSensitive: false),
    RegExp(r'裏ビデオ', caseSensitive: false),
    RegExp(r'\bAV\b', caseSensitive: false),
    RegExp(r'巨乳', caseSensitive: false),
    RegExp(r'痴女', caseSensitive: false),
    RegExp(r'痴漢', caseSensitive: false),
    RegExp(r'中出し', caseSensitive: false),
    RegExp(r'パイパン', caseSensitive: false),
    RegExp(r'顔射', caseSensitive: false),
    RegExp(r'69|シックスナイン', caseSensitive: false),
    RegExp(r'3P', caseSensitive: false),
    RegExp(r'\bSM\b', caseSensitive: false),
    RegExp(r'ハードコア', caseSensitive: false),
    RegExp(r'緊縛', caseSensitive: false),
    RegExp(r'拘束', caseSensitive: false),
    RegExp(r'レズ', caseSensitive: false),
    RegExp(r'同性愛', caseSensitive: false),
    RegExp(r'痴態', caseSensitive: false),
    RegExp(r'コスプレSEX|コスプレセックス', caseSensitive: false),
  ];

  static const _terms = <String>[
  'ヨウジョ',
  '幼女',
  '幼児',
  '幼稚',
  '乳児',
  '女児',
  '男児',
  '児童',
  '園児',
  '保育園',
  '小学',
  '中学',
  '高校生',
  '女子高',
  '女子校生',
  '未成年',
  '未就学',
  '子供',
  '子ドモ',
  'コドモ',
  'キッズ',
  '赤チャン',
  'ショタ',
  'メスガキ',
  'ランドセル',
  '体操服',
  'ブルマ',
  'スク水',
  'スクール水着',
  'セーラー服',
  '学生服',
  '制服',
  '学校',
  '学園',
  '教室',
  '放課後',
  'school',
  'ツルペタ',
  '援交',
  '援助交際',
  'loli',
  'shota',
  'child',
  'underage',
  'preteen',
  'toddler',
  'schoolgirl',
  'schoolboy',
  'kpop',
  'k-pop',
  '実在',
  '芸能人',
  '女優',
  '俳優',
  'グラドル',
  'アナウンサー',
  '政治家',
  'ディープフェイク',
  'deepfake',
  'レイプ',
  '強姦',
  '陵辱',
  '凌辱',
  '輪姦',
  '睡眠姦',
  '盗撮',
  '痴漢',
  'r18g',
  'r-18g',
  'グロテスク',
  'リョナ',
  '猟奇',
  '欠損',
  '四肢切断',
  '切断',
  '死体',
  '内臓',
  'guro',
  'gore',
  ];
}
