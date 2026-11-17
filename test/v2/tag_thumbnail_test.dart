import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('人気のタグのサムネイルは全年齢（G）の作品だけ使う', () {
    expect(tagThumbnailIfAllAges({'rating': 'G', 'smallThumbnailImageURL': 'https://x/a.webp'}), 'https://x/a.webp');
    for (final r in ['R15', 'R18', 'R18G', null]) {
      expect(tagThumbnailIfAllAges({'rating': r, 'smallThumbnailImageURL': 'https://x/a.webp'}), isNull);
    }
    expect(tagThumbnailIfAllAges({'rating': 'G', 'smallThumbnailImageURL': ''}), isNull);
    expect(tagThumbnailIfAllAges(null), isNull);
  });
}
