import 'package:flutter/foundation.dart';

/// ストアのコンテンツの決まりに合わせる切り替え。
/// Google Play は性的なコンテンツ（下着・きわどいポーズを含む）と、AI での性的な画像の生成を認めないので、
/// Android 版は全年齢（G）の作品だけを出し、生成では性的な語を止めて安全のためのネガティブを足す。iOS は今までどおり。
class StorePolicy {
  StorePolicy._();

  /// Google Play 版（Android）のとき true
  static bool get strict => _override ?? (!kIsWeb && defaultTargetPlatform == TargetPlatform.android);

  /// テスト用に切り替える
  @visibleForTesting
  static set debugStrict(bool? value) => _override = value;
  static bool? _override;

  /// この年齢区分の作品をアプリで出してよいか（R18 はどの版でも出さない）
  static bool allowsRating(String? rating, {required bool showR15}) {
    final r = rating ?? 'G';
    if (r == 'G') return true;
    if (r == 'R15') return !strict && showR15;
    return false;
  }

  /// 生成で止める語（Android 版のみ）。英語のタグ・日本語の語のどちらも見る
  static final _promptBlocked = RegExp(
    r'(^|[^a-z])(nsfw|nude|nudity|naked|topless|bottomless|nipples?|areolae?|breasts?|boobs?|cleavage|underboob|sideboob|lingerie|underwear|panties|panty|pantsu|bra|thong|g-string|bikini|swimsuit|see-through|sheer|wet_clothes|upskirt|pantyshot|cameltoe|crotch|groin|pubic|genitals?|penis|vagina|pussy|sex|sexy|seductive|erotic|ero|hentai|porn|lewd|fetish|bdsm|bondage|orgasm|masturbat\w*|spread_legs|spread legs|ahegao|cum|creampie|loli|lolicon|shota|shotacon|r18|r-18|r15|r-15)([^a-z]|$)',
    caseSensitive: false,
  );

  static final _promptBlockedJa = RegExp(
    r'(裸|全裸|半裸|ヌード|乳首|乳輪|おっぱい|巨乳|爆乳|胸元|谷間|下着|パンツ|パンチラ|ブラジャー|ランジェリー|水着|ビキニ|スク水|透け|エロ|えっち|エッチ|セックス|性行為|性器|股間|陰部|フェラ|オナニー|自慰|射精|精液|中出し|レイプ|陵辱|凌辱|緊縛|(?<!カ)ロリ|ショタ|幼女|児童|未成年|R18|R-18|R15|R-15|１８禁|18禁)',
    caseSensitive: false,
  );

  /// 生成のプロンプトに Android 版で止める語があれば、その語を返す
  static String? blockedPromptWord(String prompt) {
    if (!strict) return null;
    final text = prompt.replaceAll(RegExp(r'[()\[\]{}<>:]'), ' ');
    final en = _promptBlocked.firstMatch(text.toLowerCase());
    if (en != null) return en.group(2);
    final ja = _promptBlockedJa.firstMatch(text);
    return ja?.group(0);
  }

  /// Android 版で生成のネガティブプロンプトの先頭に足す語
  static const safetyNegative = 'nsfw, nude, naked, nipples, sex, explicit, underwear, lingerie, panties, cleavage, see-through, suggestive, erotic, sexual content';

  /// Android 版ならネガティブプロンプトに安全のための語を足す
  static String withSafetyNegative(String negative) {
    if (!strict) return negative;
    final n = negative.trim();
    return n.isEmpty ? safetyNegative : '$safetyNegative, $n';
  }
}
