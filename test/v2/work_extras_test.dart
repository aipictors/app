import 'package:aipictors/v2/work/work_extras.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('splitLinks', () {
    test('URL だけを切り出す（Web の parseTextWithLinks と同じく空白まで）', () {
      final parts = splitLinks('見てね https://example.com/a?b=1 と http://x.jp\n次の行');
      expect(parts.map((p) => p.text).toList(), ['見てね ', 'https://example.com/a?b=1', ' と ', 'http://x.jp', '\n次の行']);
      expect(parts.map((p) => p.isUrl).toList(), [false, true, false, true, false]);
    });

    test('URL が無ければそのまま 1 つ', () {
      final parts = splitLinks('こんにちは');
      expect(parts.length, 1);
      expect(parts.first.isUrl, false);
    });

    test('空の文は空', () {
      expect(splitLinks(''), isEmpty);
    });
  });

  test('aiScoreBand は Web と同じ区切り', () {
    expect(aiScoreBand(95).label, '圧巻');
    expect(aiScoreBand(90).label, '圧巻');
    expect(aiScoreBand(89).label, 'とても良い');
    expect(aiScoreBand(70).label, '良い');
    expect(aiScoreBand(60).label, 'いい感じ');
    expect(aiScoreBand(59).label, '伸びしろあり');
  });

  test('スタイル・対象年齢の文言', () {
    expect(styleText('SEMI_REAL'), 'セミリアル');
    expect(styleText(null), isNull);
    expect(ratingText('G'), '全年齢');
    expect(ratingText('R15'), 'R-15');
  });
}
