import 'package:aipictors/v2/mypage/mypage_search.dart';
import 'package:aipictors/v2/settings/settings_catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _groups = [
  MyPageMenuGroup('作品', 'Works', [
    MyPageMenuItem(Icons.history_rounded, '閲覧履歴', 'History', path: '/my/views', keywords: ['えつらん', '最近見た']),
    MyPageMenuItem(Icons.bookmark_border_rounded, 'ブックマーク', 'Bookmarks', path: '/my/bookmarks'),
  ]),
  MyPageMenuGroup('サポート', 'Support', [
    MyPageMenuItem(Icons.help_outline_rounded, 'ヘルプ', 'Help', path: '/help'),
    MyPageMenuItem(Icons.monetization_on_outlined, 'コインを購入', 'Buy coins', searchOnly: true, onTap: _noop),
  ]),
];

void _noop() {}

List<String> _labels(String q) => searchMyPage(q, _groups).map((h) => h.menu?.ja ?? h.setting!.inner?.ja ?? h.setting!.item.ja).toList();

void main() {
  test('ひらがな・カタカナ・大文字小文字・全角・長音の違いを無視する', () {
    expect(normalizeSearchText('ブックマーク'), normalizeSearchText('ぶっくまく'));
    expect(normalizeSearchText('ＢＯＯＫ mark'), 'bookmark');
    expect(_labels('ぶっくまーく'), contains('ブックマーク'));
    expect(_labels('BOOKMARK'), contains('ブックマーク'));
    expect(_labels('ｂｏｏｋ'), contains('ブックマーク'));
  });

  test('項目名のほか内容（キーワード）・英語でも見つかる', () {
    expect(_labels('えつらん'), contains('閲覧履歴'));
    expect(_labels('history'), contains('閲覧履歴'));
    expect(_labels('コイン'), contains('コインを購入'));
  });

  test('空白で区切った言葉はすべて含むものだけ', () {
    expect(_labels('最近 見た'), ['閲覧履歴']);
    expect(_labels('最近 ぶっくまーく'), isEmpty);
  });

  test('設定の項目も出し、マイページと同じ行き先の設定は重ねない', () {
    final hits = searchMyPage('パスワード', _groups);
    expect(hits.map((h) => h.setting?.item.id), contains('password'));
    final help = searchMyPage('ヘルプ', _groups);
    expect(help.where((h) => h.menu?.path == '/help'), hasLength(1));
    expect(help.where((h) => h.setting?.item.id == 'help'), isEmpty);
  });

  test('空の検索は何も出さない', () {
    expect(searchMyPage('  　', _groups), isEmpty);
  });
}
