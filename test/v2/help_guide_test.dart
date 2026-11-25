import 'package:aipictors/v2/community/help_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('使い方ガイドの章は Web と同じく 4 コマ・日英の文がそろう', () async {
    final guide = await HelpGuide.load();
    expect(guide.sections.length, 14);
    final groups = guide.groups.map((g) => g.id).toSet();
    for (final s in guide.sections) {
      expect(groups, contains(s.group), reason: s.id);
      expect(s.panels.length, 4, reason: s.id);
      for (final t in [s.title, s.mangaTitle, s.lead, ...s.points, for (final p in s.panels) p.caption, for (final p in s.panels) ...p.bubbles.map((b) => b.text)]) {
        expect(t.ja, isNotEmpty, reason: s.id);
        expect(t.en, isNotEmpty, reason: s.id);
      }
      for (final p in s.panels) {
        expect(p.image, matches(RegExp(r'^[a-z]+-[1-4]$')), reason: s.id);
        for (final b in p.bubbles) {
          expect(['tl', 'tr', 'bl', 'br', 'tc'], contains(b.at), reason: s.id);
        }
      }
    }
  });

  test('アプリでは別の支払い方法を案内しない', () async {
    final guide = await HelpGuide.load();
    final all = guide.sections.expand((s) => [...s.points, s.lead, for (final f in s.faqs) f.a]).map((t) => '${t.ja} ${t.en}').join();
    expect(all, isNot(contains('PayPay')));
  });
}
