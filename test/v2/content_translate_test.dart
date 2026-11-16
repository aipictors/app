import 'dart:convert';

import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

Map<String, dynamic> _work({String title = '夕焼けの猫', String? enTitle}) => {
      'id': '1',
      'title': title,
      'enTitle': enTitle,
      'rating': 'G',
      'largeThumbnailImageURL': 'https://example.com/a.webp',
    };

/// 訳した文を「EN(元の文)」で返す翻訳。呼ばれた回数と送られた文を数える
(MockClient, List<String>) _fakeTranslator({bool fail = false}) {
  final sent = <String>[];
  final client = MockClient((req) async {
    final text = req.url.queryParameters['text']!;
    sent.add(text);
    if (fail) return http.Response('error', 500);
    final out = text.split('\n§§§\n').map((t) => 'EN($t)').join('\n§§§\n');
    return http.Response.bytes(utf8.encode(jsonEncode({'code': 200, 'text': out})), 200);
  });
  return (client, sent);
}

Widget _app(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  tearDown(() => L10n.override = null);

  group('英語欄の優先', () {
    test('英語表示: 英語のタイトルがあればそれ、空なら元の文', () {
      L10n.override = 'en';
      expect(WorkSummary.fromJson(_work(enTitle: 'Sunset Cat')).title, 'Sunset Cat');
      expect(WorkSummary.fromJson(_work(enTitle: '  ')).title, '夕焼けの猫');
      expect(WorkSummary.fromJson(_work()).title, '夕焼けの猫');
      expect(localizedContent('説明', 'Caption'), 'Caption');
    });

    test('日本語表示: 英語欄があっても元の文のまま', () {
      L10n.override = 'ja';
      expect(WorkSummary.fromJson(_work(enTitle: 'Sunset Cat')).title, '夕焼けの猫');
      expect(localizedContent('説明', 'Caption'), '説明');
    });

    test('自動で訳すのは英語表示の日本語を含む文だけ', () {
      L10n.override = 'en';
      expect(shouldAutoTranslate('かわいい！'), isTrue);
      expect(shouldAutoTranslate('So cute!'), isFalse);
      expect(shouldAutoTranslate(''), isFalse);
      L10n.override = 'ja';
      expect(shouldAutoTranslate('かわいい！'), isFalse);
    });
  });

  group('翻訳', () {
    test('近いタイミングの文は 1 回にまとめ、同じ文は二度訳さない', () async {
      final (client, sent) = _fakeTranslator();
      final t = ContentTranslator(client: client, persist: false);
      final results = await Future.wait([t.translate('かわいい'), t.translate('すごい'), t.translate('かわいい')]);
      expect(results, ['EN(かわいい)', 'EN(すごい)', 'EN(かわいい)']);
      expect(sent, hasLength(1));
      expect(await t.translate('かわいい'), 'EN(かわいい)');
      expect(sent, hasLength(1));
    });

    test('日本語を含まない文・長すぎる文は送らない', () async {
      final (client, sent) = _fakeTranslator();
      final t = ContentTranslator(client: client, persist: false);
      expect(await t.translate('Nice work!'), isNull);
      expect(await t.translate('あ' * 1000), isNull);
      expect(sent, isEmpty);
    });

    test('失敗したら null（元の文を出す）', () async {
      final (client, _) = _fakeTranslator(fail: true);
      final t = ContentTranslator(client: client, persist: false);
      expect(await t.translate('かわいい'), isNull);
    });
  });

  group('AutoTranslatedText', () {
    Widget build(ContentTranslator t, String text) =>
        _app(AutoTranslatedText(text, translator: t, builder: (context, s) => Text(s)));

    testWidgets('英語表示: 訳した文と「Translated」、タップで原文', (tester) async {
      L10n.override = 'en';
      final (client, _) = _fakeTranslator();
      await tester.pumpWidget(build(ContentTranslator(client: client, persist: false), 'すてきな作品です'));
      expect(find.text('すてきな作品です'), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump();
      expect(find.text('EN(すてきな作品です)'), findsOneWidget);
      expect(find.text('Translated · Show original'), findsOneWidget);
      await tester.tap(find.text('Translated · Show original'));
      await tester.pump();
      expect(find.text('すてきな作品です'), findsOneWidget);
    });

    testWidgets('英語表示で翻訳が失敗したら元の文のまま（Translated は出さない）', (tester) async {
      L10n.override = 'en';
      final (client, _) = _fakeTranslator(fail: true);
      await tester.pumpWidget(build(ContentTranslator(client: client, persist: false), 'すてきな作品です'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump();
      expect(find.text('すてきな作品です'), findsOneWidget);
      expect(find.textContaining('Translated'), findsNothing);
    });

    testWidgets('日本語表示では訳さない（翻訳を呼ばない）', (tester) async {
      L10n.override = 'ja';
      final (client, sent) = _fakeTranslator();
      await tester.pumpWidget(build(ContentTranslator(client: client, persist: false), 'すてきな作品です'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump();
      expect(find.text('すてきな作品です'), findsOneWidget);
      expect(find.textContaining('Translated'), findsNothing);
      expect(sent, isEmpty);
    });
  });
}
