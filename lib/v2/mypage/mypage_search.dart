import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/settings/settings_catalog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// マイページの 1 行。メニューの表示と検索の両方で使う
class MyPageMenuItem {
  const MyPageMenuItem(this.icon, this.ja, this.en, {this.path, this.onTap, this.keywords = const [], this.searchOnly = false});

  final IconData icon;
  final String ja;
  final String en;

  /// 行き先。onTap があればそちらを使う（検索で設定の同じ行を重ねて出さないためにも使う）
  final String? path;
  final VoidCallback? onTap;

  /// 内容・別名・読み（日英どちらでも）。項目名に無い言葉で探されるもの
  final List<String> keywords;

  /// メニューには出さず、検索にだけ出す（プランとコインのカードなど）
  final bool searchOnly;

  String get label => tr(ja, en);

  void open(BuildContext context) => onTap != null ? onTap!() : context.push(path!);
}

class MyPageMenuGroup {
  const MyPageMenuGroup(this.ja, this.en, this.items);

  final String ja;
  final String en;
  final List<MyPageMenuItem> items;

  String get title => tr(ja, en);
}

/// 検索の結果の 1 件。マイページの行か設定の行のどちらか
class MyPageHit {
  const MyPageHit.menu(MyPageMenuItem this.menu, MyPageMenuGroup this.group) : setting = null;
  const MyPageHit.setting(SettingsHit this.setting)
      : menu = null,
        group = null;

  final MyPageMenuItem? menu;
  final MyPageMenuGroup? group;
  final SettingsHit? setting;
}

/// マイページの行（項目名・グループ名・内容）と設定の行（settings_catalog）で絞り込む。
/// 設定の行のうち、マイページに同じ行き先があるものは重ねて出さない
List<MyPageHit> searchMyPage(String query, List<MyPageMenuGroup> groups) {
  final terms = searchTerms(query);
  if (terms.isEmpty) return const [];
  final hits = <MyPageHit>[];
  for (final g in groups) {
    for (final item in g.items) {
      if (matchesSearch(terms, [item.ja, item.en, g.ja, g.en, ...item.keywords])) hits.add(MyPageHit.menu(item, g));
    }
  }
  final paths = {for (final g in groups) for (final i in g.items) if (i.path != null) i.path};
  for (final h in searchSettings(query, (i) => !i.debugOnly)) {
    if (h.inner == null && paths.contains(h.item.path)) continue;
    hits.add(MyPageHit.setting(h));
  }
  return hits;
}

/// 設定の行を開く。スイッチやその場の操作（言語・ログアウトなど）は、設定をその項目で検索した状態で開く
void openSettingsHit(BuildContext context, SettingsHit h) {
  final item = h.item;
  if (item.kind == SettingsKind.link && item.path != null) {
    context.push(item.path!);
  } else {
    context.push(Uri(path: '/settings', queryParameters: {'q': item.label}).toString());
  }
}
