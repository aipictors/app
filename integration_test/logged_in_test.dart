import 'dart:async';
import 'dart:io';

import 'package:aipictors/router.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/sensitive_tags.dart';
import 'package:aipictors/v2/explore/explore_api.dart';
import 'package:aipictors/v2/generation/generation_history.dart';
import 'package:aipictors/v2/generation/generation_sheets.dart';
import 'package:aipictors/v2/plans/iap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:integration_test/integration_test.dart';

import 'support/harness.dart';

/// 審査用アカウントでログインした状態で全体を押して回る。
/// mutation はすべて記録だけで送らない（Qa.boot）。mockSend でメッセージも送らない。投稿は dry run
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('logged in tour', (tester) async {
    final qa = Qa(tester);
    final picker = FakeImagePicker();
    ImagePickerPlatform.instance = picker;
    await qa.boot();

    String? workId;

    await qa.step('起動してログイン済み', () async {
      await qa.waitFor(find.byType(NavigationBar), timeout: const Duration(seconds: 90));
      expect(FirebaseAuth.instance.currentUser, isNotNull);
      await qa.shot('home');
    });

    for (final (i, name) in const [(0, 'ホーム'), (1, '探す'), (2, '生成'), (3, '通知'), (4, 'マイページ')]) {
      await qa.step('タブ: $name', () async {
        await qa.tab(i);
        await qa.idle(const Duration(seconds: 3));
        qa.expectNoError(name);
        await qa.shot('tab-$i');
      });
    }

    await qa.step('探す: 人気のタグに露骨なタグがなく写真なし', () async {
      final tags = await ExploreApi.popularTags(limit: 48);
      expect(tags.where((t) => SensitiveTags.isBlocked(t.name)), isEmpty);
      expect(tags.where((t) => t.thumbnailUrl != null), isEmpty);
      expect(SensitiveTags.isBlocked('#メスガキ'.substring(1)), isTrue);
      expect(SensitiveTags.isBlocked('カロリー'), isFalse);
    });

    // ------ 作品 ------
    await qa.step('ホームから作品を開く', () async {
      await qa.tab(0);
      await qa.tapText('新着');
      final cards = find.byWidgetPredicate((w) => w.runtimeType.toString() == 'WorkCard');
      await qa.waitFor(cards);
      await qa.tap(cards);
      await qa.idle(const Duration(seconds: 3));
      expect(qa.location, contains('/works/'));
      workId = RegExp(r'/works/(\w+)').firstMatch(qa.location)?.group(1);
      await qa.shot('work');
    });

    await qa.step('作品: 画像ビューアを開いて閉じる', () async {
      await qa.waitFor(find.byIcon(Icons.favorite_border_rounded).evaluate().isNotEmpty ? find.byIcon(Icons.favorite_border_rounded) : find.byIcon(Icons.favorite_rounded));
      final images = find.byWidgetPredicate((w) => w.runtimeType.toString() == 'AppImage');
      await qa.tap(images);
      await qa.idle(const Duration(seconds: 2));
      await qa.shot('work-viewer');
      final close = find.byIcon(Icons.close_rounded);
      await qa.tap(close);
      await qa.idle();
    });

    await qa.step('作品: いいねを押す（送らない）', () async {
      final before = qa.mutations.length;
      final icon = find.byIcon(Icons.favorite_border_rounded).hitTestable();
      if (icon.evaluate().isEmpty) {
        await tester.tap(find.byIcon(Icons.favorite_rounded).hitTestable().first);
      } else {
        await tester.tap(icon.first);
      }
      await qa.idle();
      expect(qa.mutations.length, before + 1);
      expect(qa.mutations.last, anyOf('AppLikeWork', 'AppUnlikeWork'));
    });

    await qa.step('作品: コメント欄と返信入力（送らない）', () async {
      await tester.tap(find.byIcon(Icons.chat_bubble_outline_rounded).hitTestable().first);
      await qa.idle(const Duration(seconds: 2));
      await qa.waitFor(find.byType(TextField));
      await qa.shot('comment-sheet');
      final reply = find.text('返信');
      if (reply.evaluate().isNotEmpty) {
        await tester.tap(reply.first, warnIfMissed: false);
        await qa.idle();
      }
      await tester.enterText(find.byType(TextField).last, 'QA の入力（送りません）');
      await qa.idle();
      await tester.tap(find.byIcon(Icons.arrow_upward_rounded).hitTestable().first, warnIfMissed: false);
      await qa.idle(const Duration(seconds: 2));
      await qa.shot('comment-send');
      expect(qa.mutations.last, isNot(anyOf('AppLikeWork', 'AppUnlikeWork')));
      await hideKeyboard(tester);
      await qa.idle();
      await qa.dismissSheet();
    });

    await qa.step('作品: 通報シート', () async {
      await qa.waitFor(find.byIcon(Icons.more_horiz_rounded));
      final menu = find.byIcon(Icons.more_horiz_rounded).hitTestable();
      await tester.tap(menu.first);
      await qa.idle();
      await qa.tapText('作品を通報');
      await qa.waitFor(find.text('通報する'));
      await qa.shot('report-sheet');
      await qa.dismissSheet();
    });

    await qa.step('作品: ミュートの確認', () async {
      await tester.tap(find.byIcon(Icons.more_horiz_rounded).hitTestable().first);
      await qa.idle();
      await qa.tap(find.textContaining('をミュート'));
      await qa.idle();
      await qa.shot('mute-sheet');
      await qa.dismissSheet();
    });

    await qa.step('作品: ブロックの確認', () async {
      await tester.tap(find.byIcon(Icons.more_horiz_rounded).hitTestable().first);
      await qa.idle();
      await qa.tap(find.textContaining('をブロック'));
      await qa.idle();
      await qa.shot('block-sheet');
      await qa.dismissSheet();
    });

    await qa.step('戻るで元の画面に戻る（OS の戻る）', () async {
      final at = qa.location;
      expect(at, contains('/works/'));
      await qa.systemBack();
      expect(qa.location, isNot(at));
    });

    if (isAndroid) {
      await qa.step('Android: 戻るキー（adb）で 1 画面戻る', () async {
        await qa.open('/rankings');
        await qa.hardwareBack();
        expect(qa.location, isNot(contains('/rankings')));
      });
      await qa.step('Android 16: 端まで描画し、下のタブがナビゲーションバーと重ならない', () async {
        await qa.goHome();
        final view = tester.view;
        final height = view.physicalSize.height / view.devicePixelRatio;
        final padding = view.padding.bottom / view.devicePixelRatio;
        final box = tester.getRect(find.byType(NavigationBar));
        expect(box.bottom, moreOrLessEquals(height, epsilon: 1));
        expect(box.height, greaterThanOrEqualTo(64));
        // ignore: avoid_print
        print('[QA] edge-to-edge bottomInset=$padding navBar=$box height=$height');
      });
    }

    // ------ 通知 ------
    await qa.step('通知: タブと未返信の絞り込み', () async {
      await qa.goHome();
      await qa.tab(3);
      await qa.idle(const Duration(seconds: 2));
      for (final label in const ['返信', 'いいね', 'フォロー', '入賞', 'コイン', '運営']) {
        await qa.tapPill(label);
        await qa.idle(const Duration(seconds: 2));
        qa.expectNoError(label);
      }
      await qa.tapPill('コメント', leftward: true);
      await qa.idle(const Duration(seconds: 2));
      await qa.tapText('未返信');
      await qa.idle(const Duration(seconds: 2));
      qa.expectNoError('未返信');
      await qa.shot('notifications-unreplied');
      await qa.tapText('返信済み');
      await qa.idle(const Duration(seconds: 2));
      await qa.tapText('すべて');
      await qa.idle();
    });

    // ------ 設定 ------
    await qa.step('マイページから設定へ', () async {
      await qa.tab(4);
      await qa.tap(find.byTooltip('設定'));
      await qa.waitFor(find.text('プロフィール'));
      await qa.shot('settings');
    });
    for (final label in const ['プロフィール', 'アカウント設定', '応援コイン受け取り', '通知・いいね', '表示コンテンツ', 'カラーテーマ', 'お気に入りタグ', 'ユーザーミュート', 'ユーザーブロック', 'タグミュート', 'その他の設定・ヘルプ']) {
      await qa.step('設定: $label', () async {
        final at = qa.location;
        await qa.scrollTapText(label);
        await qa.idle(const Duration(seconds: 2));
        expect(qa.location, isNot(at), reason: '$label を押しても移動しない');
        qa.expectNoError(label);
        await qa.shot('settings-${label.hashCode}');
        await qa.back();
        expect(qa.location, at);
      });
    }

    await qa.step('設定: 退会の画面が開ける（退会はしない）', () async {
      await qa.open('/settings/account', until: find.text('退会'));
      await qa.scrollTapText('退会');
      await qa.idle(const Duration(seconds: 2));
      expect(qa.location, contains('delete'));
      await qa.shot('account-delete');
      await qa.back();
      await qa.back();
    });

    // ------ 投稿 ------
    await qa.step('投稿: 画像を選ぶ・並べ替え・dry run', () async {
      await qa.open('/works/create', until: find.text('画像を選ぶ'));
      picker.pending = [await syntheticPng(640, 480, Colors.teal), await syntheticPng(480, 640, Colors.indigo)];
      await qa.tapText('画像を選ぶ');
      await qa.idle(const Duration(seconds: 2));
      expect(picker.calls, 1);
      await qa.waitFor(find.byTooltip('取り除く'));
      expect(find.byTooltip('取り除く').evaluate().length, 2);
      await qa.shot('post-picked');

      // 2 枚目を長押しで先頭へ
      final list = find.byType(ReorderableListView);
      final images = find.descendant(of: list, matching: find.byType(Image));
      final first = tester.getCenter(images.at(0));
      final second = tester.getCenter(images.at(1));
      final gesture = await tester.startGesture(second);
      await qa.idle(const Duration(milliseconds: 800));
      await gesture.moveTo(first - const Offset(60, 0));
      await qa.idle(const Duration(milliseconds: 400));
      await gesture.up();
      await qa.idle();
      await qa.shot('post-reordered');

      await tester.enterText(find.byType(TextField).first, 'QA dry run');
      await hideKeyboard(tester);
    });

    await qa.step('投稿: 送信（dry run のダイアログが出て作品は作らない）', () async {
      await hideKeyboard(tester);
      final submit = find.byWidgetPredicate((w) => w.runtimeType.toString() == 'PrimaryButton').hitTestable();
      await qa.tap(submit);
      await qa.waitFor(find.textContaining('dry run'), timeout: const Duration(seconds: 40));
      await qa.shot('post-dry-run');
      await qa.tapText('閉じる');
      await qa.back();
    });

    // ------ スタンプ ------
    await qa.step('スタンプ: 広場と詳細', () async {
      await qa.open('/stickers', until: find.text('スタンプ広場'));
      await qa.idle(const Duration(seconds: 3));
      await qa.shot('stickers');
      final items = find.descendant(of: find.byType(GridView), matching: find.byType(InkWell));
      if (items.evaluate().isNotEmpty) {
        await qa.tap(items);
        await qa.idle(const Duration(seconds: 2));
        await qa.shot('sticker-detail');
        await qa.back();
      }
      await qa.back();
    });

    await qa.step('スタンプ: 作成の切り抜き（送らない）', () async {
      await qa.open('/my/stickers/create', until: find.text('画像を選ぶ'));
      picker.pending = [await syntheticPng(600, 400, Colors.orange)];
      await qa.tapText('画像を選ぶ');
      await qa.idle(const Duration(seconds: 2));
      await qa.shot('sticker-crop');
      await qa.back();
    });

    await qa.step('フォルダ: マイページの行から開き、作成の入力は取り消せる', () async {
      await qa.open('/my/folders');
      await qa.tap(find.byType(FloatingActionButton));
      await qa.waitFor(find.text('新しいフォルダ'));
      await qa.shot('folder-create');
      await qa.dismissSheet();
      await qa.back();
    });

    await qa.step('シリーズ: 作成の画面が開く（作らない）', () async {
      await qa.open('/viewer/albums');
      await qa.tap(find.byType(FloatingActionButton));
      await qa.idle(const Duration(seconds: 2));
      expect(qa.location, contains('/albums/create'));
      await qa.shot('album-create');
      await qa.back();
      await qa.back();
    });

    // ------ シリーズ・フォルダ ------
    for (final (route, name) in const [('/albums', 'シリーズ（全体）'), ('/viewer/albums', 'シリーズ（自分）'), ('/viewer/folders', 'フォルダ'), ('/my/likes', 'いいね'), ('/my/bookmarks', 'ブックマーク'), ('/my/histories', '履歴'), ('/my/reports', '通報履歴'), ('/my/stickers', 'マイスタンプ'), ('/viewer/works', '自分の作品'), ('/achievements', '実績')]) {
      await qa.step('開く: $name', () async {
        await qa.open(route);
        await qa.shot('open${route.replaceAll('/', '-')}');
        await qa.back();
      });
    }

    // ------ 生成 ------
    await qa.step('生成: 入れ替え・サイズ指定・履歴の絞り込み', () async {
      await qa.goHome();
      await qa.tab(2);
      await qa.idle(const Duration(seconds: 3));
      final swap = find.byIcon(Icons.swap_horiz_rounded);
      await qa.scrollTo(swap);
      await qa.tap(swap);
      await qa.tap(find.text('幅・高さを指定'));
      await qa.idle();
      await qa.waitFor(find.text('指定をやめる'));
      await qa.shot('gen-custom-size');
      await qa.tap(find.text('指定をやめる'));
      await qa.waitFor(find.text('幅・高さを指定'));
      // つくる → 履歴
      final pills = find.textContaining('履歴');
      await qa.tap(pills);
      await qa.idle(const Duration(seconds: 3));
      qa.expectNoError('履歴');
      await qa.tap(find.text('保護中'));
      await qa.idle(const Duration(seconds: 2));
      await qa.shot('gen-history-protected');
      await qa.tap(find.text('保護中'));
      await qa.idle();
      await qa.tap(find.text('つくる'));
    });

    await qa.step('生成: 結果の「投稿」で画像とプロンプトが入る', () async {
      await qa.tap(find.textContaining('履歴'));
      await qa.idle(const Duration(seconds: 3));
      final tiles = find.byType(ResultTile);
      if (tiles.evaluate().isEmpty) {
        // ignore: avoid_print
        print('[QA] SKIP 生成の結果がないので投稿の引き継ぎは未確認');
        await qa.tap(find.text('つくる'));
        return;
      }
      await qa.tap(tiles);
      await qa.idle(const Duration(seconds: 2));
      await qa.shot('gen-viewer');
      await qa.tap(find.text('投稿'));
      await qa.waitFor(find.byTooltip('取り除く'), timeout: const Duration(seconds: 40));
      expect(qa.location, contains('generation='));
      await qa.shot('gen-post-prefill');
      // 生成情報は入力済みなので最初から開いている
      await qa.scrollTo(find.text('生成情報（プロンプトなど）'));
      await qa.scrollTo(find.text('モデル名'));
      final filled = tester.widgetList<TextField>(find.byType(TextField, skipOffstage: false)).where((f) => (f.controller?.text ?? '').length > 3);
      expect(filled, isNotEmpty, reason: 'プロンプトが入っていない');
      await qa.shot('gen-post-prefill-params');
      await qa.back();
      await qa.idle();
      await qa.back();
      await qa.tap(find.text('つくる'));
    });

    await qa.step('生成: 本人確認のシートに Web への導線がない', () async {
      final context = tester.element(find.byType(NavigationBar));
      unawaited(showVerificationSheet(context));
      await qa.waitFor(find.text('本人確認をお願いします'));
      await qa.shot('gen-verification');
      expect(find.textContaining('Web で'), findsNothing);
      await qa.tapText('閉じる');
      await qa.idle();
      expect(find.text('本人確認をお願いします'), findsNothing);
    });

    await qa.step('生成: プランの画面（商品なしの表示）', () async {
      await qa.open('/plans', wait: const Duration(seconds: 6));
      await qa.shot('plans');
      final hasStripeText = find.textContaining(RegExp('Stripe|クレジットカード|Web で購入|ブラウザで購入'));
      expect(hasStripeText, findsNothing);
      await qa.scrollTo(find.text('Aipictors 利用規約'));
      await qa.shot('plans-bottom');
      await qa.back();
      // ignore: avoid_print
      print('[QA] iap supported=${Iap.supported}');
    });

    // ------ コミュニティ ------
    for (final (route, name) in const [('/rankings', 'ランキング'), ('/ai-rankings', 'AI ランキング'), ('/coin-rankings', 'コインランキング'), ('/support-rankings', '応援ランキング'), ('/tags', 'タグ'), ('/themes', 'お題'), ('/themes/proposals', 'お題の提案'), ('/releases', 'リリース'), ('/announcements', 'お知らせ'), ('/events', 'イベント'), ('/models', 'モデル'), ('/models/library', 'モデルライブラリ'), ('/messages', 'メッセージ'), ('/help', 'ヘルプ'), ('/guideline', 'ガイドライン'), ('/roadmap', 'ロードマップ'), ('/notifications', '通知（単体）')]) {
      await qa.step('開く: $name', () async {
        await qa.open(route, wait: const Duration(seconds: 4));
        await qa.shot('open${route.replaceAll('/', '-')}');
        await qa.back();
      });
    }

    await qa.step('お問い合わせ: 入力して送信（mock）', () async {
      await qa.open('/support/chat', until: find.byType(TextField), wait: const Duration(seconds: 4));
      await tester.enterText(find.byType(TextField).last, 'QA の相談');
      await qa.idle();
      await qa.tap(find.byTooltip('送信'));
      await qa.waitFor(find.textContaining('デバッグ中なので送信していません'));
      await qa.shot('support-chat');
      await qa.back();
    });

    await qa.step('メッセージ: 公式との画面（mock 送信はしない画面確認）', () async {
      await qa.open('/messages', wait: const Duration(seconds: 3));
      await qa.back();
    });

    await qa.step('リリース: 1 件開く', () async {
      await qa.open('/releases', wait: const Duration(seconds: 4));
      final tiles = find.byType(InkWell).hitTestable();
      if (tiles.evaluate().length > 3) {
        final at = qa.location;
        await tester.tap(tiles.at(2), warnIfMissed: false);
        await qa.idle(const Duration(seconds: 3));
        if (qa.location != at) {
          await qa.shot('release-detail');
          await qa.back();
        }
      }
      await qa.back();
    });

    await qa.step('メッセージ: 入力して送信（mock）', () async {
      await qa.open('/messages/1', wait: const Duration(seconds: 3));
      final input = find.byType(TextField);
      await qa.waitFor(input);
      final before = qa.mutations.length;
      await tester.enterText(input.last, 'QA（送りません）');
      await qa.idle();
      await tester.tap(find.byIcon(Icons.send_rounded).hitTestable().first, warnIfMissed: false);
      await qa.idle(const Duration(seconds: 2));
      expect(qa.mutations.length, before, reason: 'mockSend なのに mutation が出た');
      await qa.shot('message-mock');
      await hideKeyboard(tester);
      await qa.back();
    });

    await qa.step('探す: クイックリンクを順に押して戻る', () async {
      await qa.goHome();
      await qa.tab(1);
      await qa.idle(const Duration(seconds: 2));
      for (final label in const ['新着', 'タグ', '2D', '2.5D', '3D', 'ランキング', 'AI ランキング', '推しランキング', 'お題', 'イベント', '小説', 'ノート', '動画', 'シリーズ', 'モデル']) {
        final at = qa.location;
        final link = find.text(label).hitTestable();
        await qa.waitFor(link, why: label, timeout: const Duration(seconds: 6));
        await tester.tap(link.first, warnIfMissed: false);
        await qa.idle(const Duration(seconds: 2));
        expect(qa.location, isNot(at), reason: '$label を押しても移動しない');
        qa.expectNoError(label);
        await qa.back();
        await qa.idle();
      }
    }, timeout: const Duration(seconds: 240));

    await qa.step('ホーム: 上のタブ', () async {
      await qa.goHome();
      await qa.tab(0);
      for (final label in const ['新着', 'フォロー新着', 'タグ新着', 'おすすめ']) {
        await qa.tapPill(label, leftward: label == 'おすすめ');
        await qa.idle(const Duration(seconds: 2));
        qa.expectNoError(label);
      }
    });

    await qa.step('探す: 人気のタグを押すとタグの画面が開く', () async {
      await qa.goHome();
      await qa.tab(1);
      await qa.idle(const Duration(seconds: 2));
      await qa.scrollToTop();
      final cards = find.byWidgetPredicate((w) => w.runtimeType.toString() == 'TagCard');
      await qa.scrollTo(cards);
      await qa.tap(cards);
      await qa.idle(const Duration(seconds: 3));
      expect(qa.location, contains('/tags/'));
      expect(find.byType(ErrorWidget), findsNothing);
      await qa.shot('tag-from-card');
      await qa.back();
    });

    await qa.step('検索: 入力して結果を開く', () async {
      await qa.open('/search', wait: const Duration(seconds: 2));
      await qa.tap(find.textContaining('作品・タグ・ユーザーを検索'));
      await qa.idle();
      await tester.enterText(find.byType(TextField).last, '猫');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await qa.idle(const Duration(seconds: 4));
      expect(find.byType(ErrorWidget), findsNothing);
      await qa.shot('search-submitted');
      await hideKeyboard(tester);
      await qa.goHome();
    });

    await qa.step('検索・タグ・ユーザー', () async {
      await qa.open('/search/${Uri.encodeComponent('猫')}', wait: const Duration(seconds: 4));
      await qa.shot('search');
      await qa.back();
      await qa.open('/tags/${Uri.encodeComponent('猫')}', wait: const Duration(seconds: 4));
      await qa.shot('tag');
      await qa.back();
      await qa.open('/search', wait: const Duration(seconds: 3));
      await qa.shot('search-input');
      await qa.back();
    });

    await qa.step('マイページ: 各行を押して戻る（投稿の行まで）', () async {
      await qa.goHome();
      await qa.tab(4);
      await qa.idle(const Duration(seconds: 2));
      await qa.scrollToTop();
      for (final label in const ['自分のページ', 'いいねした作品', 'シリーズ', 'ブックマーク', 'フォルダ', '閲覧履歴', '自分の作品', '作品の履歴', 'フォロー中', 'フォロワー', 'スタンプ', '実績', 'メッセージ', 'お知らせ', 'イベント', 'モデル', 'お問い合わせ', 'ヘルプ', 'ガイドライン', '利用規約', 'プライバシーポリシー', 'ロードマップ', 'プロフィールを編集', '運営からのお知らせ']) {
        final at = qa.location;
        await qa.scrollTapText(label);
        await qa.idle(const Duration(seconds: 2));
        if (qa.location == at) throw TestFailure('$label を押しても移動しない');
        qa.expectNoError(label);
        await qa.back();
        await qa.idle();
      }
    }, timeout: const Duration(seconds: 300));

    // 使わない import の警告を避けつつ、後片付けの確認
    await qa.step('作品 id を取れた', () async {
      expect(workId, isNotNull);
      expect(Platform.isIOS || Platform.isAndroid, isTrue);
      expect(Api.debugMutationHandler, isNotNull);
      expect(routerConfig, isNotNull);
    });

    qa.finish();
    expect(qa.failures, isEmpty);
  }, timeout: const Timeout(Duration(minutes: 45)));
}
