import 'package:aipictors/v2/core/list_like_count.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('既定は表示、保存した値を次の起動で読む', () async {
    SharedPreferences.setMockInitialValues({});
    await ListLikeCount.load();
    expect(ListLikeCount.hidden.value, isFalse);

    await ListLikeCount.setHidden(true);
    expect(ListLikeCount.hidden.value, isTrue);

    ListLikeCount.hidden.value = false;
    await ListLikeCount.load();
    expect(ListLikeCount.hidden.value, isTrue);

    await ListLikeCount.setHidden(false);
    ListLikeCount.hidden.value = true;
    await ListLikeCount.load();
    expect(ListLikeCount.hidden.value, isFalse);
  });

  testWidgets('作品カード: オフにすると ♡ と数を出さず、戻すと出る', (tester) async {
    ListLikeCount.hidden.value = false;
    final work = WorkSummary.fromJson({
      'id': '1',
      'title': 'テスト作品',
      'likesCount': 72,
      'isLiked': false,
      'user': {'id': '2', 'login': 'u', 'name': '作者'},
    });
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: SizedBox(width: 200, child: WorkCard(work: work)))));
    expect(find.text('72'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);

    ListLikeCount.hidden.value = true;
    await tester.pump();
    expect(find.text('72'), findsNothing);
    expect(find.byIcon(Icons.favorite_border_rounded), findsNothing);
    expect(find.text('テスト作品'), findsOneWidget);

    ListLikeCount.hidden.value = false;
    await tester.pump();
    expect(find.text('72'), findsOneWidget);
  });
}
