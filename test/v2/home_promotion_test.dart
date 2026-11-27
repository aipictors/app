import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/store_policy.dart';
import 'package:aipictors/v2/home/home_promotion.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:aipictors/v2/work/work_promotion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> _work(String id, {String rating = 'G', String? relatedUrl, bool isPromotion = true}) => {
      'id': id,
      'title': '作品$id',
      'rating': rating,
      'isPromotion': isPromotion,
      'largeThumbnailImageURL': 'https://example.com/$id.webp',
      'largeThumbnailImageWidth': 800,
      'largeThumbnailImageHeight': 600,
      'relatedUrl': relatedUrl,
      'user': {'id': 'u$id', 'login': 'u$id', 'name': '作者$id'},
    };

void main() {
  // flutter test は Android として動くので、iOS と同じ表示（R15 を出す）で確かめる
  setUp(() => StorePolicy.debugStrict = false);
  tearDown(() => StorePolicy.debugStrict = null);

  test('「詳しく見る」は http/https の URL だけ（Web の isValidUrl と同じ）', () {
    expect(isPromotionLinkUrl('https://example.com'), isTrue);
    expect(isPromotionLinkUrl('http://example.com/a'), isTrue);
    expect(isPromotionLinkUrl('undefined'), isFalse);
    expect(isPromotionLinkUrl('javascript:alert(1)'), isFalse);
    expect(isPromotionLinkUrl(''), isFalse);
    expect(isPromotionLinkUrl(null), isFalse);
  });

  test('宣伝作品: API の並びのまま、R18・R18G は除き、関連リンクは正しい URL だけ', () {
    final works = promotionWorksFrom([
      _work('1', relatedUrl: ' https://example.com/shop '),
      _work('2', rating: 'R18', relatedUrl: 'https://example.com'),
      _work('3', rating: 'R15', relatedUrl: 'undefined'),
      _work('4', rating: 'R18G'),
      _work('5'),
    ]);
    expect(works.map((w) => w.work.id), ['1', '3', '5']);
    expect(works[0].relatedUrl, 'https://example.com/shop');
    expect(works[1].relatedUrl, isNull);
    expect(works[2].relatedUrl, isNull);
  });

  test('一覧の作品は isPromotion を読む', () {
    expect(WorkSummary.fromJson(_work('1')).isPromotion, isTrue);
    expect(WorkSummary.fromJson(_work('1', isPromotion: false)).isPromotion, isFalse);
    expect(WorkSummary.fromJson({'id': '1'}).isPromotion, isFalse);
    expect(workCardFields, contains('isPromotion'));
  });

  testWidgets('宣伝作品もおすすめも無ければ欄を出さない', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: HomePromotionSection(works: []))));
    expect(find.text('おすすめ作品'), findsNothing);
  });

  test('おすすめ作品: 宣伝の件数によらず段ぴったり（宣伝は隠さず、入りきらなければ段を増やす）', () {
    expect(homePicksTotal(0, 12, 2), 4);
    expect(homePicksTotal(1, 12, 2), 4);
    expect(homePicksTotal(1, 12, 3), 6);
    expect(homePicksTotal(5, 12, 2), 6);
    expect(homePicksTotal(6, 12, 3), 6);
    // おすすめが足りなければ段を減らす（宣伝の段は残す）
    expect(homePicksTotal(1, 2, 2), 2);
    expect(homePicksTotal(1, 0, 2), 2);
    expect(homePicksTotal(0, 1, 2), 0);
  });

  testWidgets('おすすめ作品: 宣伝が先頭で PR の印付き、残りはおすすめ（印なし）で 2 列 × 2 段を埋める', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final works = promotionWorksFrom([_work('1')]);
    // 宣伝と同じ作品はおすすめから除く
    final fills = WorkSummary.listFrom([_work('1', isPromotion: false), for (final id in ['2', '3', '4', '5']) _work(id, isPromotion: false)]);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: SingleChildScrollView(child: HomePromotionSection(works: works, fillWorks: fills)))));
    expect(find.text('おすすめ作品'), findsOneWidget);
    final cards = find.byType(PromotionWorkCard);
    expect(cards, findsNWidgets(4));
    expect(tester.widget<PromotionWorkCard>(cards.at(0)).isPlain, isFalse);
    expect(tester.widget<PromotionWorkCard>(cards.at(0)).item.work.id, '1');
    expect([for (var i = 1; i < 4; i++) tester.widget<PromotionWorkCard>(cards.at(i)).item.work.id], ['2', '3', '4']);
    expect([for (var i = 1; i < 4; i++) tester.widget<PromotionWorkCard>(cards.at(i)).isPlain], [true, true, true]);
    // PR の印は宣伝のカードと見出しの説明だけ
    expect(find.descendant(of: cards.at(0), matching: find.byType(WorkPromotionMark)), findsOneWidget);
    for (var i = 1; i < 4; i++) {
      expect(find.descendant(of: cards.at(i), matching: find.byType(WorkPromotionMark)), findsNothing);
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('宣伝の欄: 見出し・2 列のカード・リンクのあるものだけ「詳しく見る」', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final works = promotionWorksFrom([_work('1', relatedUrl: 'https://example.com'), _work('2'), _work('3')]);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: SingleChildScrollView(child: HomePromotionSection(works: works)))));
    expect(find.text('おすすめ作品'), findsOneWidget);
    expect(find.byType(PromotionWorkCard), findsNWidgets(3));
    expect(find.text('詳しく見る'), findsOneWidget);
    // 1 行目は 2 枚が横に並ぶ
    final a = tester.getTopLeft(find.byType(PromotionWorkCard).at(0));
    final b = tester.getTopLeft(find.byType(PromotionWorkCard).at(1));
    final c = tester.getTopLeft(find.byType(PromotionWorkCard).at(2));
    expect(a.dy, b.dy);
    expect(c.dy, greaterThan(a.dy));
    expect(tester.takeException(), isNull);
  });

  testWidgets('作品カード: 宣伝作品だけ PR のしるし', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Row(children: [
          SizedBox(width: 180, child: WorkCard(work: WorkSummary.fromJson(_work('1')))),
          SizedBox(width: 180, child: WorkCard(work: WorkSummary.fromJson(_work('2', isPromotion: false)))),
        ]),
      ),
    ));
    expect(find.byType(WorkPromotionMark), findsOneWidget);
    expect(find.descendant(of: find.byType(WorkCard).first, matching: find.text('PR')), findsOneWidget);
  });
}
