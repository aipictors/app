import 'dart:convert';

import 'package:aipictors/v2/generation/generation_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GenEntry.parsePending（Web の parseGenerationPendingPrompt と同じ）', () {
    const now = 1800000000000;

    test('保存した形をそのまま読む', () {
      expect(GenEntry.parsePending(jsonEncode({'prompt': 'cat', 'createdAt': now - 1000}), now), 'cat');
    });

    test('古いもの・空・壊れたもの・先の時刻は使わない', () {
      final old = jsonEncode({'prompt': 'cat', 'createdAt': now - GenEntry.pendingTtl.inMilliseconds - 1});
      expect(GenEntry.parsePending(old, now), isNull);
      expect(GenEntry.parsePending(jsonEncode({'prompt': '  ', 'createdAt': now}), now), isNull);
      expect(GenEntry.parsePending(jsonEncode({'prompt': 'cat', 'createdAt': now + 120000}), now), isNull);
      expect(GenEntry.parsePending('{', now), isNull);
      expect(GenEntry.parsePending(null, now), isNull);
      expect(GenEntry.parsePending('"cat"', now), isNull);
    });
  });

  test('containsJapanese（日本語なら「日本語で入力する」で生成）', () {
    expect(containsJapanese('桜の下で笑う女の子'), isTrue);
    expect(containsJapanese('ねこ'), isTrue);
    expect(containsJapanese('カワイイ'), isTrue);
    expect(containsJapanese('1girl, smile'), isFalse);
  });

  test('toEntryExamplePrompt（Web の toHomeExamplePrompt と同じ）', () {
    expect(toEntryExamplePrompt('1girl, <lora:foo:0.8>, smile,  , soft light'), '1girl, smile, soft light');
    expect(toEntryExamplePrompt('<LORA:x:1>\n\ncat ,  dog\n'), 'cat, dog');
    expect(toEntryExamplePrompt('<lora:only:1>'), '');
  });

  test('作例は 6〜8 枚で、ID・画像・プロンプトがそろっている（Web と同じデータ）', () {
    const all = GenEntryExample.all;
    expect(all.length, inInclusiveRange(6, 8));
    expect(all.map((e) => e.workId).toSet().length, all.length);
    for (final e in all) {
      expect(e.imageUrl.startsWith('https://files.aipictors.com/'), isTrue);
      expect(e.prompt.trim(), isNotEmpty);
      expect(e.prompt.contains('<lora:'), isFalse);
    }
  });

  test('作例の絞り込みは全年齢・プロンプト公開だけで、日単位で同じ条件', () {
    final now = DateTime.utc(2026, 11, 25, 15, 30);
    final popular = const GenEntryFilter.popular().where(now);
    expect(popular['ratings'], ['G']);
    expect(popular['isSensitive'], false);
    expect(popular['isPromptPublic'], true);
    expect(popular['orderBy'], 'LIKES_COUNT');
    expect(popular['createdAtAfter'], '2026-10-26T00:00:00.000Z');
    expect(const GenEntryFilter.latest().where(now)['orderBy'], 'DATE_CREATED');
    expect(const GenEntryFilter.latest().where(now)['createdAtAfter'], '2026-11-18T00:00:00.000Z');
    final tag = const GenEntryFilter.tag('猫').where(now);
    expect(tag['tagNames'], ['猫']);
    expect(tag['createdAtAfter'], '2026-08-27T00:00:00.000Z');
    expect(const GenEntryFilter.tag('猫'), const GenEntryFilter.tag('猫'));
  });
}
