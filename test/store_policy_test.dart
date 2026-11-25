import 'package:aipictors/v2/core/store_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() => StorePolicy.debugStrict = null);

  group('Android 版（strict）', () {
    setUp(() => StorePolicy.debugStrict = true);

    test('全年齢だけ出す', () {
      expect(StorePolicy.allowsRating('G', showR15: true), isTrue);
      expect(StorePolicy.allowsRating('R15', showR15: true), isFalse);
      expect(StorePolicy.allowsRating('R18', showR15: true), isFalse);
      expect(StorePolicy.allowsRating('R18G', showR15: true), isFalse);
    });

    test('性的な語を止める', () {
      for (final prompt in [
        '1girl, nsfw, smile',
        '(nude:1.2), beach',
        'masterpiece, Lingerie',
        '1girl, cleavage',
        'spread_legs',
        '水着の女の子',
        'おっぱい',
        '下着姿',
        'r18',
        '<lora:breasts_slider:1>, 1girl',
      ]) {
        expect(StorePolicy.blockedPromptWord(prompt), isNotNull, reason: prompt);
      }
    });

    test('ふつうの語は止めない', () {
      for (final prompt in [
        '1girl, smile, school background, cherry blossoms',
        'a hero with a brave face, cucumber salad',
        'カロリー控えめのケーキ',
        'landscape, mountains, sunset, 4k',
        '猫と桜',
        'masterpiece, best quality, (detailed eyes:1.2)',
      ]) {
        expect(StorePolicy.blockedPromptWord(prompt), isNull, reason: prompt);
      }
    });

    test('ネガティブに安全の語を足す', () {
      expect(StorePolicy.withSafetyNegative(''), StorePolicy.safetyNegative);
      expect(StorePolicy.withSafetyNegative('EasyNegative'), '${StorePolicy.safetyNegative}, EasyNegative');
    });
  });

  group('iOS 版', () {
    setUp(() => StorePolicy.debugStrict = false);

    test('R15 は設定に従い、R18 は出さない', () {
      expect(StorePolicy.allowsRating('R15', showR15: true), isTrue);
      expect(StorePolicy.allowsRating('R15', showR15: false), isFalse);
      expect(StorePolicy.allowsRating('R18', showR15: true), isFalse);
    });

    test('プロンプトもネガティブも変えない', () {
      expect(StorePolicy.blockedPromptWord('nsfw'), isNull);
      expect(StorePolicy.withSafetyNegative('EasyNegative'), 'EasyNegative');
    });
  });
}
