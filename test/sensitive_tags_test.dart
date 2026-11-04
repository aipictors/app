import 'package:aipictors/v2/core/sensitive_tags.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('おすすめに出さないタグ', () {
    for (final tag in const ['メスガキ', 'めすがき', 'ロリ', 'loli', 'JK', '10歳', 'NSFW', 'nude', 'pussy', 'big_breasts_nude', 'R18', 'エロ', '強姦', 'グロ']) {
      expect(SensitiveTags.isBlocked(tag), isTrue, reason: tag);
    }
  });

  test('巻き込まないタグ', () {
    for (final tag in const ['カロリー', 'グローブ', '風景', '猫', '魔女', 'グレープ', 'ファンタジー', '20歳']) {
      expect(SensitiveTags.isBlocked(tag), isFalse, reason: tag);
    }
  });
}
