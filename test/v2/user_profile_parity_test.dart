import 'package:aipictors/v2/user/user_actions.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:aipictors/v2/user/user_tabs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('開始の年月は日本時間で数える', () {
    // 2022-10-31 15:30 UTC = 2022-11-01 00:30 JST
    expect(startedMonthLabel(DateTime.utc(2022, 10, 31, 15, 30).millisecondsSinceEpoch ~/ 1000), '2022/11');
    expect(startedMonthLabel(0), '');
  });

  test('英語の表示では英語の自己紹介を使い、無ければいつもの自己紹介', () {
    UserProfile make(String en) => UserProfile.fromJson({'id': '1', 'login': 'a', 'name': 'A', 'biography': 'こんにちは', 'enBiography': en}, const {});
    expect(make('Hello').biographyFor(english: true), 'Hello');
    expect(make('Hello').biographyFor(english: false), 'こんにちは');
    expect(make('').biographyFor(english: true), 'こんにちは');
  });

  test('一覧の行は相手からのフォローも読む', () {
    expect(UserRowData.fromJson({'id': '1', 'login': 'a', 'name': 'A', 'isFollower': true}).isFollower, isTrue);
    expect(UserRowData.fromJson({'id': '1', 'login': 'a', 'name': 'A'}).isFollower, isFalse);
  });

  test('X で共有: Web と同じ文・URL・ハッシュタグ', () {
    final uri = userShareXUrl(login: 'p-mei', name: 'めい', english: false);
    expect(uri.host, 'x.com');
    expect(uri.path, '/intent/post');
    expect(uri.queryParameters['text'], 'AIイラスト投稿サイトAipictors めいのマイページ\n');
    expect(uri.queryParameters['url'], 'https://www.aipictors.com/users/p-mei\n');
    expect(uri.queryParameters['hashtags'], 'Aipictors,AIIllust');
  });

  test('モデルの一覧は R18 を除く', () {
    expect(ModelCell.fromJson({'id': 'm', 'name': 'x', 'kind': 'LORA', 'rating': 'G', 'useCount': 3})?.useCount, 3);
    expect(ModelCell.fromJson({'id': 'm', 'name': 'x', 'rating': 'R18'}), isNull);
    expect(ModelCell.fromJson({'id': 'm', 'name': 'x', 'rating': 'R18G'}), isNull);
  });
}
