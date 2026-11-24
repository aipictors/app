import 'package:aipictors/v2/my/my_filters.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('自分の作品の条件（Web の my.posts と同じ where）', () {
    test('既定は新しい順・アプリで出せる年齢だけ', () {
      final q = MyPostsQuery();
      final w = q.where('u1');
      expect(w['orderBy'], 'DATE_CREATED');
      expect(w['sort'], 'DESC');
      expect(w['ratings'], ['G', 'R15']);
      expect(w.containsKey('accessTypes'), isFalse);
      expect(w.containsKey('search'), isFalse);
      expect(q.isFiltered, isFalse);
    });

    test('絞り込みを入れると where に入り、解除で消える', () {
      final q = MyPostsQuery()
        ..accessType = 'LIMITED'
        ..workType = 'NOVEL'
        ..rating = 'G'
        ..search = '猫'
        ..sort = myWorkSortOptions.firstWhere((o) => o.orderBy == 'BOOKMARKS_COUNT' && o.sort == 'ASC');
      final w = q.where('u1');
      expect(w['accessTypes'], ['LIMITED']);
      expect(w['workTypes'], ['NOVEL']);
      expect(w['ratings'], ['G']);
      expect(w['search'], '猫');
      expect(w['searchInTags'], isTrue);
      expect(w['orderBy'], 'BOOKMARKS_COUNT');
      expect(w['sort'], 'ASC');
      q.clearFilters();
      expect(q.isFiltered, isFalse);
      // 並び順は絞り込みではないので残す
      expect(q.sort.orderBy, 'BOOKMARKS_COUNT');
    });

    test('並び順は 12 通り', () => expect(myWorkSortOptions.length, 12));
  });

  group('渡せる URL（Web の toPostUrl）', () {
    final now = DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000);
    test('公開は id、限定公開は uuid', () {
      expect(shareableWorkUrl(id: '1', accessType: 'PUBLIC', createdAt: 1600000000, now: now), 'https://www.aipictors.com/posts/1');
      expect(shareableWorkUrl(id: '1', accessType: 'LIMITED', uuid: 'abc', createdAt: 1600000000, now: now), 'https://www.aipictors.com/posts/abc');
    });
    test('非公開・下書き・予約は渡せない', () {
      expect(shareableWorkUrl(id: '1', accessType: 'PRIVATE', createdAt: 1600000000, now: now), isNull);
      expect(shareableWorkUrl(id: '1', accessType: 'DRAFT', createdAt: 1600000000, now: now), isNull);
      expect(shareableWorkUrl(id: '1', accessType: 'PUBLIC', createdAt: 1800000000, now: now), isNull);
    });
  });

  test('3 桁カンマ', () {
    expect(commaCount(0), '0');
    expect(commaCount(1234567), '1,234,567');
  });

  group('AI モデル名の表記ゆれ（Web の filter-ai-models と同じ）', () {
    const models = [NamedOption('1', 'Krea 2'), NamedOption('2', 'FLUX.2'), NamedOption('3', 'Animagine XL')];
    test('大文字小文字・全角半角・空白・記号を無視して探す', () {
      expect(filterAiModels(models, 'krea2').map((m) => m.id), ['1']);
      expect(filterAiModels(models, 'ｆｌｕｘ２').map((m) => m.id), ['2']);
      expect(filterAiModels(models, '').length, 3);
    });
    test('同じ名前のモデルがあれば追加できない', () {
      expect(canAddAiModel(models, 'KREA-2'), isFalse);
      expect(canAddAiModel(models, '  '), isFalse);
      expect(canAddAiModel(models, 'Pony'), isTrue);
    });
  });
}
