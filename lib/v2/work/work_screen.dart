import 'dart:convert';
import 'dart:math';

import 'package:aipictors/v2/core/sensitive_tags.dart';
import 'package:aipictors/v2/core/store_policy.dart';
import 'package:aipictors/v2/achievements/achievements_api.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/coins.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/debug_boot.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/support_tier.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/user/user_widgets.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/official_badge.dart';
import 'package:aipictors/v2/widgets/work_grid.dart';
import 'package:aipictors/v2/work/comments.dart';
import 'package:aipictors/v2/work/quick_stickers.dart';
import 'package:aipictors/v2/work/moderation.dart';
import 'package:aipictors/v2/work/support_sheet.dart';
import 'package:aipictors/v2/work/book_reader_screen.dart';
import 'package:aipictors/v2/work/work_extras.dart';
import 'package:aipictors/v2/work/work_promotion.dart';
import 'package:aipictors/v2/community/web_links.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:aipictors/v2/albums/albums_screen.dart';
import 'package:aipictors/v2/generation/generation_reference.dart';
import 'package:aipictors/v2/albums/folders_screen.dart';
import 'package:aipictors/v2/albums/album_api.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:aipictors/v2/widgets/zoomable_image.dart';

// 作品そのものの項目だけ。コメントと関連作品は別に読む（重いものを混ぜると、
// どれか 1 つが失敗しただけで作品が開けなくなるため）
const _workQuery = '''
query AppWork(\$id: ID!) {
  viewer { id user { id } }
  work(id: \$id) {
    id title enTitle description enDescription type rating isSensitive createdAt likesCount commentsCount viewsCount
    isLiked isCommentsEditable isGeneration accessType isBookmarked isMyRecommended isTagEditable
    style isPromotion relatedUrl strength otherGenerationParams
    dailyRanking weeklyRanking monthlyRanking
    aiDailyRanking { rank } aiWeeklyRanking { rank } aiMonthlyRanking { rank }
    isBotGradingEnabled isBotGradingPublic botEvaluationStatus botEvaluationPersonality
    imageURL imageWidth imageHeight url mdUrl isCaptionBeforeBody
    largeThumbnailImageURL
    subWorks { id imageUrl }
    tagNames
    promptAccessType prompt negativePrompt seed steps scale sampler vae clipSkip model
    dailyTheme { id title enTitle year month day }
    user { $userSummaryFields isFollowee biography enBiography followersCount worksCount }
  }
}''';

/// 作品の下に出すもの。失敗しても作品は開けるようにする
const _workExtrasQuery = '''
query AppWorkExtras(\$id: ID!) {
  viewer { id bookmarkFolderId currentPass { id type } }
  work(id: \$id) {
    id
    album { id title description }
    nextWork { id title rating isSensitive smallThumbnailImageURL }
    previousWork { id title rating isSensitive smallThumbnailImageURL }
    botEvaluation {
      cutenessScore coolnessScore beautyScore originalityScore compositionScore
      colorScore detailScore consistencyScore overallScore comment personality
    }
    user { id works(offset: 0, limit: 16, where: { ratings: [G, R15] }) { $workCardFields } }
    comments(offset: 0, limit: 3) {
      $commentFields
      responses(offset: 0, limit: 3) { $commentFields }
    }
    relatedWorks(offset: 0, limit: 24) { $workCardFields }
  }
}''';

/// 作品の詳細
class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key, required this.id});

  final String id;

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  Map<String, dynamic>? _work;
  String? _viewerId;
  String? _error;
  bool _liked = false;
  int _likes = 0;
  bool _following = false;
  final ScrollController? _debugScroll = DebugBoot.screenTab?.startsWith('comments') == true ? ScrollController() : null;
  final _mediaKey = GlobalKey(debugLabel: 'workMedia');
  final _infoKey = GlobalKey(debugLabel: 'workInfo');
  int _imageIndex = 0;
  List<CommentItem> _comments = [];
  List<WorkSummary> _related = [];
  String? _novelText;

  /// 作品の下回り（シリーズ・前後の作品・AI 評価・作者の他の作品）。失敗したら空
  Map<String, dynamic> _extras = const {};
  List<WorkSummary> _authorWorks = [];
  String? _randomTag;
  List<WorkSummary> _tagWorks = [];
  List<String> _tags = [];
  bool _bookmarked = false;
  String? _bookmarkFolderId;
  String? _passType;
  bool _recommended = false;

  /// 宣伝枠の状態（作者本人・公開中・全年齢の作品だけ読む）
  WorkPromotionStatus? _promotion;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load({bool isRetry = false}) async {
    setState(() => _error = null);
    try {
      final data = await Api.query(_workQuery, variables: {'id': widget.id});
      final w = data.obj('work');
      if (!mounted) return;
      if (w == null) {
        // サーバーが一時的に失敗することがあるので、1 回だけ自動でやり直す
        if (!isRetry) {
          await Future<void>.delayed(const Duration(milliseconds: 700));
          if (mounted) await _load(isRetry: true);
          return;
        }
        setState(() => _error = tr('作品を読み込めませんでした', "Couldn't load this work"));
        return;
      }
      // R18 はどの版でも、Android 版は全年齢でない作品・センシティブの欄の作品も開かない
      if (!AppContentFilter.allows(w.str('rating')) || (StorePolicy.strict && w.boolean('isSensitive'))) {
        setState(() => _error = tr('この作品は表示できません', "This work can't be shown"));
        return;
      }
      setState(() {
        _work = w;
        _viewerId = data.obj('viewer')?.obj('user')?.strOrNull('id');
        _liked = w.boolean('isLiked');
        _likes = w.integer('likesCount');
        _following = w.obj('user')?.boolean('isFollowee') ?? false;
        _bookmarked = w.boolean('isBookmarked');
        _recommended = w.boolean('isMyRecommended');
        _tags = (w['tagNames'] as List?)?.map((e) => e.toString()).where((e) => e.isNotEmpty && !(StorePolicy.strict && SensitiveTags.isBlocked(e))).toList() ?? [];
      });
      _loadExtras();
      _loadPromotion();
      // 開発用: 2 行目が promote なら宣伝のシートを開く（表示の確認用。リリース以外では買わない）
      if (DebugBoot.screenTab == 'promote') {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted && _canPromote) _openPromotion();
        });
      }
      // 開発用: 2 行目が sheet で始まればコメントのシートを開く（sheet:support は推しの欄も開く。表示の確認用）
      // 開発用: 2 行目が support なら推すシートを開く（表示の確認用。送信はしない）
      if (DebugBoot.screenTab == 'support') {
        Future.delayed(const Duration(seconds: 3), () {
          final user = _work?.obj('user');
          if (!mounted || user == null) return;
          showSupportSheet(
            context,
            userId: user.str('id'),
            userName: user.str('name'),
            iconUrl: user.strOrNull('iconUrl'),
            frame: AvatarFrame.fromJson(user.obj('avatarFrame')),
            showRewardNote: isCreatorRewardRating(_work?.strOrNull('rating')),
            originalWork: isOriginalWork(_work?['tagNames'] as List?),
          );
        });
      }
      if (DebugBoot.screenTab?.startsWith('sheet') == true) {
        Future.delayed(const Duration(seconds: 3), () {
          // sheet:reply なら一番上のコメントへの返信の状態で開く（表示の確認用）
          if (mounted) _openComments(replyTo: DebugBoot.screenTab == 'sheet:reply' ? _comments.firstOrNull : null);
        });
      }
      // 開発用: /tmp/aipictors-debug の 2 行目が comments ならコメント欄まで送る（表示の確認用）
      if (DebugBoot.screenTab?.startsWith('comments') == true) {
        Future.delayed(const Duration(seconds: 4), () {
          final c = _debugScroll;
          if (mounted && c != null && c.hasClients) c.jumpTo(c.position.maxScrollExtent * (double.tryParse(DebugBoot.screenTab!.substring(8).replaceFirst(':', '')) ?? 0.3));
        });
      }
      final md = w.strOrNull('mdUrl');
      if ((w.str('type') == 'NOVEL' || w.str('type') == 'COLUMN') && md != null) {
        http.get(Uri.parse(md)).then((r) {
          // 本文の置き場は content-type を返さないので、UTF-8 として読む（そのままだと文字化けする）
          if (mounted && r.statusCode == 200) {
            setState(() => _novelText = utf8.decode(r.bodyBytes, allowMalformed: true));
          }
        }).catchError((_) {});
      }
    } on ApiException catch (e) {
      if (!isRetry) {
        await Future<void>.delayed(const Duration(milliseconds: 700));
        if (mounted) await _load(isRetry: true);
        return;
      }
      if (mounted) setState(() => _error = e.message);
    }
  }

  /// コメントと関連作品。失敗しても作品の表示は止めない
  Future<void> _loadExtras() async {
    try {
      final data = await Api.query(_workExtrasQuery, variables: {'id': widget.id});
      final w = data.obj('work');
      if (!mounted || w == null) return;
      setState(() {
        _comments = w.list('comments').where((c) => !c.boolean('isMuted') && !c.boolean('isDeleted')).map(CommentItem.fromJson).toList();
        // 関連作品に開いている作品そのものが入ることがあるので除く
        _related = WorkSummary.listFrom(w.list('relatedWorks')).where((x) => x.id != widget.id).toList();
        _extras = w;
        _authorWorks = WorkSummary.listFrom(w.obj('user')?.list('works') ?? const []).where((x) => x.id != widget.id).toList();
        _bookmarkFolderId = data.obj('viewer')?.strOrNull('bookmarkFolderId');
        _passType = data.obj('viewer')?.obj('currentPass')?.strOrNull('type');
      });
    } on ApiException catch (_) {
      // 作品は見られるので、ここは黙って諦める
    }
    _loadTagWorks();
  }

  /// 「#タグ のおすすめ」（Web と同じく、作品のタグから 1 つ選ぶ。無ければ「女の子」）
  Future<void> _loadTagWorks() async {
    final tag = _randomTag ??= _tags.isEmpty ? '女の子' : _tags[Random().nextInt(_tags.length)];
    final rating = _work?.str('rating') == 'R15' && AppContentFilter.showR15 ? 'R15' : 'G';
    try {
      final data = await Api.query('''
query AppWorkTagWorks(\$where: WorksWhereInput) {
  tagWorks(offset: 0, limit: 16, where: \$where) { $workCardFields }
}''', variables: {
        'where': {
          'tagNames': [tag],
          'ratings': [rating],
          'isNowCreatedAt': true,
        },
      }, cacheFor: const Duration(minutes: 5));
      if (!mounted) return;
      setState(() => _tagWorks = WorkSummary.listFrom(data.list('tagWorks')).where((x) => x.id != widget.id).toList());
    } on ApiException catch (_) {}
  }

  Map<String, dynamic> get w => _work!;

  Map<String, dynamic> get user => w.obj('user') ?? const {};

  /// 出すタイトル・キャプション（英語表示で英語欄があれば英語。日本語表示は元のまま）
  static String _title(Map<String, dynamic> w) => localizedContent(w.str('title'), w.strOrNull('enTitle'));

  static String _description(Map<String, dynamic> w) => localizedContent(w.str('description').trim(), w.strOrNull('enDescription')).trim();

  bool get _isMine => _viewerId != null && _viewerId == user.str('id');

  /// 「宣伝する」を出すか（Web の WorkPromotionButton と同じく作者本人の公開中の作品。アプリは全年齢の枠だけ）
  bool get _canPromote => _isMine && canPromoteInApp(rating: w.strOrNull('rating'), accessType: w.strOrNull('accessType'), createdAt: w.integer('createdAt'));

  Future<void> _loadPromotion() async {
    if (!_canPromote) return;
    try {
      final s = await WorkPromotionApi.status();
      if (mounted) setState(() => _promotion = s);
    } catch (_) {
      // 宣伝の状態が読めなくても作品は見られる
    }
  }

  Future<void> _openPromotion() async {
    final endsAt = await showWorkPromotionSheet(
      context,
      workId: w.str('id'),
      title: _title(w),
      imageUrl: w.strOrNull('largeThumbnailImageURL') ?? (_images.isEmpty ? null : _images.first),
      userName: user.str('name'),
      userIconUrl: user.strOrNull('iconUrl'),
    );
    if (!mounted) return;
    if (endsAt == null) {
      _loadPromotion();
      return;
    }
    // 買えた: その場で「宣伝中・〇日まで」にする（読み直すと反映前のことがあるので、返ってきた終わりの時刻を使う）
    setState(() => _promotion = WorkPromotionStatus(
          plan: _promotion?.plan ?? const WorkPromotionPlan(),
          active: [
            ActiveWorkPromotion(slot: WorkPromotionSlot.general, workId: w.str('id'), endsAt: endsAt),
            ...?_promotion?.active.where((p) => p.slot != WorkPromotionSlot.general),
          ],
        ));
  }

  List<String> get _images {
    final main = w.strOrNull('imageURL') ?? w.strOrNull('largeThumbnailImageURL');
    return [
      if (main != null) main,
      ...w.list('subWorks').map((s) => s.strOrNull('imageUrl')).whereType<String>(),
    ];
  }

  Future<void> _toggleLike() async {
    if (!Nav.requireLogin(context)) return;
    final liked = !_liked;
    setState(() {
      _liked = liked;
      _likes += liked ? 1 : -1;
    });
    Ds.impact();
    try {
      await Api.mutate(
        liked
            ? r'mutation AppLikeWork($input: CreateWorkLikeInput!) { createWorkLike(input: $input) { id } }'
            : r'mutation AppUnlikeWork($input: DeleteWorkLikeInput!) { deleteWorkLike(input: $input) { id } }',
        variables: {
          'input': {'workId': w.str('id')},
        },
      );
      if (liked) AchievementsApi.requestCheck();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _liked = !liked;
        _likes += liked ? -1 : 1;
      });
      context.toast(e.message, error: true);
    }
  }

  /// ブックマーク（Web の WorkActionBookmark と同じく、既定のブックマークフォルダに入れる・外す）
  Future<void> _toggleBookmark() async {
    if (!Nav.requireLogin(context)) return;
    final folderId = _bookmarkFolderId;
    if (folderId == null) {
      // ブックマークフォルダがまだ読めていないときはフォルダを選んでもらう
      await showAddToFolderSheet(context, w.str('id'));
      return;
    }
    final next = !_bookmarked;
    setState(() => _bookmarked = next);
    Ds.impact();
    try {
      if (next) {
        await AlbumApi.addToFolder(folderId, w.str('id'));
      } else {
        await AlbumApi.removeFromFolder(folderId, w.str('id'));
      }
      if (mounted) context.toast(next ? tr('ブックマークに追加しました', 'Added to bookmarks') : tr('ブックマークから削除しました', 'Removed from bookmarks'));
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _bookmarked = !next);
      context.toast(e.message, error: true);
    }
  }

  /// 推薦（Web の RecommendButton。Aipictors＋の人だけ。ライトプランは自分の作品だけ）
  Future<void> _toggleRecommend() async {
    if (!Nav.requireLogin(context)) return;
    if (!_recommended) {
      final pass = _passType;
      if (pass != 'LITE' && pass != 'STANDARD' && pass != 'PREMIUM') {
        context.toast(tr('作品を推薦して、注目度をアップできます！Aipictors＋ユーザのみ対応しています', 'Recommend works to boost their visibility. Available to Aipictors+ users only.'));
        return;
      }
      if (pass == 'LITE' && !_isMine) {
        context.toast(tr('ライトプランユーザは自身の作品のみ推薦できます', 'Lite plan users can only recommend their own works'));
        return;
      }
    }
    final next = !_recommended;
    try {
      await Api.mutate(
        next
            ? r'mutation AppCreateRecommendedWork($input: CreateRecommendedWorkInput!) { createRecommendedWork(input: $input) { id } }'
            : r'mutation AppDeleteRecommendedWork($input: DeleteRecommendedWorkInput!) { deleteRecommendedWork(input: $input) }',
        variables: {
          'input': {'workId': w.str('id')},
        },
      );
      if (!mounted) return;
      setState(() => _recommended = next);
      context.toast(next ? tr('推薦しました', 'Recommended') : tr('推薦を取り消しました', 'Recommendation removed'));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  /// 画像の保存（Web の「ダウンロード」「一括ダウンロード」。共有シートの「画像を保存」から写真に入れる）
  Future<void> _saveImages({required bool all}) async {
    final urls = all ? _images : [_images[_imageIndex.clamp(0, _images.length - 1)]];
    if (urls.isEmpty) return;
    context.toast(tr('画像を読み込んでいます…', 'Loading image…'));
    try {
      final files = <XFile>[];
      for (var i = 0; i < urls.length; i++) {
        final f = await DefaultCacheManager().getSingleFile(urls[i]);
        files.add(XFile(f.path, name: urls.length > 1 ? '${w.str('id')}_${i + 1}.png' : '${w.str('id')}.png'));
      }
      if (!mounted) return;
      final box = context.findRenderObject() as RenderBox?;
      await Share.shareXFiles(files, sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size);
    } catch (_) {
      if (mounted) context.toast(tr('画像を読み込めませんでした。もう一度お試しください', 'Could not load the image. Please try again.'), error: true);
    }
  }

  Future<void> _addTags() async {
    if (!Nav.requireLogin(context)) return;
    final tags = await showAddTagsSheet(context, workId: w.str('id'), tags: _tags);
    if (tags != null && mounted) setState(() => _tags = tags);
  }

  void _share() {
    final url = 'https://www.aipictors.com/posts/${w.str('id')}';
    // iPad は共有シートの位置を渡さないと開けない
    final box = context.findRenderObject() as RenderBox?;
    Share.share(
      '${_title(w)} / ${user.str('name')}\n$url',
      sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
    );
  }

  void _openComments({bool compose = false, CommentItem? replyTo}) {
    showCommentsSheet(
      context,
      workId: w.str('id'),
      ownerId: user.str('id'),
      ownerName: user.str('name'),
      viewerId: _viewerId,
      rating: w.strOrNull('rating'),
      // プレミアムコインで推せるのはオリジナル作品だけ（タグで見る。API と同じ）
      originalWork: isOriginalWork(w['tagNames'] as List?),
      openComposer: compose,
      replyTo: replyTo,
      onChanged: _load,
    );
  }

  Future<void> _menu() async {
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.surfaceCard,
      builder: (context) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(leading: const Icon(Icons.ios_share_rounded), title: Text(tr('共有', 'Share')), onTap: () => Navigator.pop(context, 'share')),
          ListTile(leading: const Icon(Icons.link_rounded), title: Text(tr('リンクをコピー', 'Copy link')), onTap: () => Navigator.pop(context, 'copy')),
          if (_images.isNotEmpty && w.str('type') == 'WORK') ...[
            ListTile(leading: const Icon(Icons.download_rounded), title: Text(tr('画像を保存', 'Save image')), onTap: () => Navigator.pop(context, 'save')),
            if (_images.length > 1)
              ListTile(leading: const Icon(Icons.collections_outlined), title: Text(tr('すべての画像を保存（${_images.length}枚）', 'Save all images (${_images.length})')), onTap: () => Navigator.pop(context, 'saveAll')),
          ],
          if (Nav.isLoggedIn)
            ListTile(leading: const Icon(Icons.folder_outlined), title: Text(tr('フォルダに保存', 'Save to folder')), onTap: () => Navigator.pop(context, 'folder')),
          if (Nav.isLoggedIn)
            ListTile(
              leading: Icon(_recommended ? Icons.thumb_up_alt_rounded : Icons.thumb_up_alt_outlined),
              title: Text(_recommended ? tr('推薦済み（取り消す）', 'Recommended (undo)') : tr('推薦する', 'Recommend')),
              onTap: () => Navigator.pop(context, 'recommend'),
            ),
          if (_isMine) ...[
            ListTile(leading: const Icon(Icons.edit_outlined), title: Text(tr('作品を編集', 'Edit work')), onTap: () => Navigator.pop(context, 'edit')),
            if (_canPromote)
              ListTile(
                leading: const Icon(Icons.campaign_outlined),
                title: Text(_promotion?.activeFor(w.str('id')) != null ? tr('宣伝の状態を見る', 'Promotion status') : tr('宣伝する', 'Promote')),
                onTap: () => Navigator.pop(context, 'promote'),
              ),
            ListTile(leading: const Icon(Icons.collections_bookmark_outlined), title: Text(tr('シリーズに追加', 'Add to series')), onTap: () => Navigator.pop(context, 'album')),
            ListTile(
              leading: Icon(Icons.delete_outline_rounded, color: context.cs.error),
              title: Text(tr('作品を削除', 'Delete work'), style: TextStyle(color: context.cs.error)),
              onTap: () => Navigator.pop(context, 'delete'),
            ),
          ],
          if (!_isMine) ...[
            ListTile(leading: const Icon(Icons.flag_outlined), title: Text(tr('作品を通報', 'Report work')), onTap: () => Navigator.pop(context, 'report')),
            ListTile(leading: const Icon(Icons.volume_off_outlined), title: Text('${user.str('name')}さんをミュート'), onTap: () => Navigator.pop(context, 'mute')),
            ListTile(
              leading: Icon(Icons.block_rounded, color: context.cs.error),
              title: Text('${user.str('name')}さんをブロック', style: TextStyle(color: context.cs.error)),
              onTap: () => Navigator.pop(context, 'block'),
            ),
          ],
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case 'share':
        _share();
      case 'save':
        await _saveImages(all: false);
      case 'saveAll':
        await _saveImages(all: true);
      case 'recommend':
        await _toggleRecommend();
      case 'promote':
        await _openPromotion();
      case 'folder':
        await showAddToFolderSheet(context, w.str('id'));
      case 'album':
        await showAddToAlbumSheet(context, w.str('id'));
      case 'edit':
        final result = await context.push('/works/${w.str('id')}/update');
        if (!mounted) return;
        if (result == 'deleted') {
          context.pop();
        } else if (result != null) {
          _load();
        }
      case 'delete':
        if (!await showConfirmSheet(context, title: tr('この作品を削除しますか？', 'Delete this work?'), message: tr('元に戻せません', "This can't be undone"), destructive: true)) return;
        try {
          await PostApi.delete(w.str('id'));
          if (!mounted) return;
          context.toast(tr('削除しました', 'Deleted'));
          context.pop();
        } on ApiException catch (e) {
          if (mounted) context.toast(e.message, error: true);
        }
      case 'copy':
        await Clipboard.setData(ClipboardData(text: 'https://www.aipictors.com/posts/${w.str('id')}'));
        if (mounted) context.toast(tr('リンクをコピーしました', 'Link copied'));
      case 'report':
        await showReportSheet(context, target: ReportTarget.work, id: w.str('id'));
      case 'mute':
        if (await muteUser(context, user.str('id'), user.str('name')) && mounted) Navigator.of(context).maybePop();
      case 'block':
        if (await blockUser(context, user.str('id'), user.str('name')) && mounted) Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(appBar: AppBar(), body: StateView.error(_error!, onRetry: _load));
    }
    if (_work == null) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView(padding: const EdgeInsets.all(16), children: const [
          Skeleton(height: 420, radius: 20),
          SizedBox(height: 16),
          Skeleton(height: 22, width: 220, radius: 8),
          SizedBox(height: 12),
          Skeleton(height: 14, radius: 6),
          SizedBox(height: 8),
          Skeleton(height: 14, width: 260, radius: 6),
        ]),
      );
    }
    final images = _images;
    final isVideo = w.str('type') == 'VIDEO' && (w.strOrNull('url') ?? '').isNotEmpty;
    final isNovel = w.str('type') == 'NOVEL' || w.str('type') == 'COLUMN';
    // Web と同じく、返ってきた生成情報があれば出す（非公開は API が返さない。作者本人には返る）
    final hasGenerationInfo = _GenerationInfo.hasAny(w);
    final tags = _tags;
    // 前後の作品も、アプリで出せる年齢区分のものだけ
    bool shown(Map<String, dynamic>? x) => x != null && AppContentFilter.allows(x.str('rating')) && !(StorePolicy.strict && x.boolean('isSensitive'));
    final newer = shown(_extras.obj('nextWork')) ? _extras.obj('nextWork') : null;
    final older = shown(_extras.obj('previousWork')) ? _extras.obj('previousWork') : null;
    final album = _extras.obj('album');
    final relatedUrl = (w.strOrNull('relatedUrl') ?? '').trim();
    final width = MediaQuery.sizeOf(context).width;
    final mediaMax = width > 700 ? 700.0 : width;
    // 広い画面（折りたたみを開いた状態・iPad など）は左に画像、右に情報・コメント。小説など画像の無い作品は 1 列のまま
    final wide = isWideLayout(context) && (isVideo || images.isNotEmpty);
    final mediaAspect = w.integer('imageWidth') > 0 && w.integer('imageHeight') > 0 ? (w.integer('imageWidth') / w.integer('imageHeight')).clamp(0.6, 1.8) : 1.0;
    // 1 列⇔2 列が入れ替わっても、めくった位置・再生中の動画・開いた説明文を残す
    final Widget media = KeyedSubtree(
      key: _mediaKey,
      child: isVideo
                        ? _VideoBox(url: w.str('url'), poster: images.isNotEmpty ? images.first : null)
                        : images.isEmpty
                            ? const SizedBox(height: 12)
                            : _ImagePager(
                                images: images,
                                aspect: w.integer('imageWidth') > 0 && w.integer('imageHeight') > 0
                                    ? (w.integer('imageWidth') / w.integer('imageHeight')).clamp(0.6, 1.8)
                                    : 1,
                                onIndex: (i) => setState(() => _imageIndex = i),
                                index: _imageIndex,
                                onDoubleTap: () {
                                  if (!_liked) _toggleLike();
                                },
                              ),
    );
    final Widget info = Column(key: _infoKey, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        AccessTypeBanner(accessType: w.strOrNull('accessType'), createdAt: w.integer('createdAt')),
                        _ActionBar(
                          bookmarked: _bookmarked,
                          onBookmark: _isMine ? null : _toggleBookmark,
                          liked: _liked,
                          likes: _likes,
                          comments: w.integer('commentsCount'),
                          onLike: _toggleLike,
                          onComment: () => _openComments(),
                          onSupport: _isMine
                              ? null
                              : () => showSupportSheet(
                                    context,
                                    userId: user.str('id'),
                                    userName: user.str('name'),
                                    iconUrl: user.strOrNull('iconUrl'),
                                    frame: AvatarFrame.fromJson(user.obj('avatarFrame')),
                                    // R18 の作品の画面では報酬の一言を出さない
                                    showRewardNote: isCreatorRewardRating(w.strOrNull('rating')),
                                    originalWork: isOriginalWork(w['tagNames'] as List?),
                                  ),
                          onShare: _share,
                        ),
                        const SizedBox(height: 14),
                        // Aipictors で生成した作品は、生成情報を生成画面に読み込める（Web の work-article.tsx の「参照生成する」）
                        if (w.boolean('isGeneration')) ...[
                          ReferenceGenerateButton(workId: w.str('id'), title: _title(w), thumbnailUrl: w.strOrNull('largeThumbnailImageURL') ?? w.strOrNull('imageURL')),
                          const SizedBox(height: 14),
                        ],
                        // 英語表示: 英語のタイトルがあればそれ、無ければその場で訳す（訳せなければ元のまま）
                        AutoTranslatedText(
                          _title(w),
                          builder: (context, text) => Text(text, style: context.tt.headlineSmall?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.3)),
                        ),
                        const SizedBox(height: 6),
                        Wrap(spacing: 12, crossAxisAlignment: WrapCrossAlignment.center, children: [
                          _Meta(icon: Icons.schedule_rounded, text: relativeTime(w.integer('createdAt'))),
                          _Meta(icon: Icons.visibility_outlined, text: compactCount(w.integer('viewsCount'))),
                          if (w.str('rating') == 'R15') const Badge2('R15', color: Color(0xCCE2A21B)),
                          if (w.obj('dailyTheme') != null)
                            ActionChip(
                              avatar: const Icon(Icons.today_rounded, size: 16),
                              label: Text(tr('お題「${w.obj('dailyTheme')!.str('title')}」', 'Theme: ${localizedContent(w.obj('dailyTheme')!.str('title'), w.obj('dailyTheme')!.strOrNull('enTitle'))}')),
                              visualDensity: VisualDensity.compact,
                              onPressed: () {
                                final t = w.obj('dailyTheme')!;
                                context.push('/themes/${t.integer('year')}/${t.integer('month')}/${t.integer('day')}');
                              },
                            ),
                        ]),
                        if (_isMine) LikedUsersPanel(workId: w.str('id'), likesCount: _likes),
                        const SizedBox(height: 8),
                        WorkBadges(work: w),
                        if (_canPromote && _promotion != null) ...[
                          const SizedBox(height: 10),
                          if (_promotion!.activeFor(w.str('id')) case final active?)
                            Align(alignment: Alignment.centerLeft, child: WorkPromotionActiveBadge(endsAt: active.endsAt, onTap: _openPromotion))
                          else
                            WorkPromotionEntryTile(plan: _promotion!.plan, onTap: _openPromotion),
                        ],
                        const SizedBox(height: 14),
                        _UserRow(
                          user: user,
                          following: _following,
                          isMine: _isMine,
                          onFollowChanged: (v) => _following = v,
                        ),
                        if (_description(w).isNotEmpty) ...[
                          const SizedBox(height: 14),
                          // Web と同じく、キャプションは薄い下地の上に置く
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(Ds.s12),
                            decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.7), borderRadius: Ds.br(12)),
                            child: AutoTranslatedText(
                              _description(w),
                              builder: (context, text) => _ExpandableText(text),
                            ),
                          ),
                        ],
                        if (relatedUrl.isNotEmpty && relatedUrl != 'undefined') ...[
                          const SizedBox(height: 12),
                          InkWell(
                            borderRadius: Ds.br(12),
                            onTap: () => WebLinks.open(context, relatedUrl),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(Ds.s12),
                              decoration: BoxDecoration(borderRadius: Ds.br(12), border: Border.all(color: context.hairline)),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(tr('関連リンク', 'Related link'), style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 2),
                                Text(relatedUrl, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.cs.primary, fontSize: 13)),
                              ]),
                            ),
                          ),
                        ],
                        if (isNovel && _novelText != null) ...[
                          const SizedBox(height: 16),
                          _BookReaderButton(
                            workId: w.str('id'),
                            title: _title(w),
                            isNovel: w.str('type') == 'NOVEL',
                            args: BookReaderArgs(work: w, markdown: _novelText),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.6), borderRadius: Ds.br(16)),
                            child: SelectableText(_novelText!, style: const TextStyle(height: 1.9, fontSize: 15.5)),
                          ),
                        ],
                        if (tags.isNotEmpty || w.boolean('isTagEditable')) ...[
                          const SizedBox(height: 14),
                          Wrap(spacing: 8, runSpacing: 8, children: [
                            for (final t in tags)
                              Pressable(
                                onTap: () => Nav.tag(context, t),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                                  decoration: BoxDecoration(
                                    color: context.cs.primary.withValues(alpha: 0.1),
                                    borderRadius: Ds.br(16),
                                  ),
                                  child: Text('#$t', style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w700, fontSize: 13)),
                                ),
                              ),
                            // 作者がタグの追加を許可している作品は、見る人もタグを足せる（Web の WorkArticleTags の ＋）
                            if (w.boolean('isTagEditable'))
                              Pressable(
                                onTap: _addTags,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                  decoration: BoxDecoration(border: Border.all(color: context.cs.primary.withValues(alpha: 0.4)), borderRadius: Ds.br(16)),
                                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                                    Icon(Icons.add_rounded, size: 15, color: context.cs.primary),
                                    const SizedBox(width: 2),
                                    Text(tr('タグを追加', 'Add tag'), style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w700, fontSize: 13)),
                                  ]),
                                ),
                              ),
                          ]),
                        ],
                        if (_isMine && w.str('promptAccessType') == 'PRIVATE') ...[
                          const SizedBox(height: 14),
                          Row(children: [
                            Icon(Icons.shield_outlined, size: 18, color: context.muted),
                            const SizedBox(width: 6),
                            Expanded(child: Text(tr('生成情報は非公開状態です、ご自身のみ閲覧可能です', 'Generation information is private and only viewable by you.'), style: TextStyle(color: context.muted, fontSize: 13, fontWeight: FontWeight.w700))),
                          ]),
                        ],
                        if (hasGenerationInfo) ...[
                          const SizedBox(height: 16),
                          _GenerationInfo(work: w),
                        ],
                        if (_extras.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          AiEvaluationCard(work: {...w, 'botEvaluation': _extras['botEvaluation']}, isOwner: _isMine),
                        ],
                        if (newer != null || older != null) ...[
                          const SizedBox(height: 16),
                          WorkPrevNextBar(newer: newer, older: older),
                        ],
                        TitledWorkRow(
                          title: tr('${user.str('name')}さんの作品', 'More by ${user.str('name')}'),
                          works: _authorWorks,
                          inset: 0,
                          onMore: () => Nav.user(context, user.str('id')),
                        ),
                        if (album != null) ...[
                          const SizedBox(height: 12),
                          WorkAlbumCard(album: album),
                        ],
                        const SizedBox(height: 8),
                        _CommentsPreview(
                          workId: w.str('id'),
                          comments: _comments,
                          total: w.integer('commentsCount'),
                          viewerId: _viewerId,
                          editable: w.boolean('isCommentsEditable', true),
                          onOpen: () => _openComments(),
                          onCompose: () {
                            if (Nav.requireLogin(context)) _openComments(compose: true);
                          },
                          onReply: (c) {
                            if (Nav.requireLogin(context)) _openComments(replyTo: c);
                          },
                          onPosted: (c) => setState(() {
                            _comments = [c, ..._comments];
                            w['commentsCount'] = w.integer('commentsCount') + 1;
                          }),
                        ),
    ]);


    return Scaffold(
      body: Stack(children: [
        RefreshIndicator.adaptive(
          onRefresh: _load,
          edgeOffset: 80,
          child: CustomScrollView(
            controller: _debugScroll,
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            slivers: [
              SliverAppBar(
                pinned: true,
                title: AutoTranslatedText(
                  _title(w),
                  showLabel: false,
                  builder: (context, text) => Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
                actions: [
                  IconButton(onPressed: _share, icon: const Icon(Icons.ios_share_rounded)),
                  IconButton(onPressed: _menu, icon: const Icon(Icons.more_horiz_rounded)),
                ],
              ),
              if (wide)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: LayoutBuilder(builder: (context, box) {
                      // 画像は画面の高さに収まる大きさにする（縦長の作品でも情報と並んで見える）
                      final paneW = (box.maxWidth - 20) * 0.55;
                      final size = MediaQuery.sizeOf(context);
                      final maxH = size.height - MediaQuery.paddingOf(context).vertical - kToolbarHeight - 96;
                      final mediaW = (maxH * mediaAspect).clamp(240.0, paneW);
                      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SizedBox(
                          width: paneW,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(width: mediaW, child: ClipRRect(borderRadius: Ds.br(16), child: media)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(child: Padding(padding: const EdgeInsets.only(top: 6), child: info)),
                      ]);
                    }),
                  ),
                )
              else ...[
                SliverToBoxAdapter(
                  child: Center(
                    child: ConstrainedBox(constraints: BoxConstraints(maxWidth: mediaMax), child: media),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 760),
                      child: Padding(padding: const EdgeInsets.fromLTRB(16, 14, 16, 0), child: info),
                    ),
                  ),
                ),
              ],
              if (_tagWorks.isNotEmpty && _randomTag != null)
                SliverToBoxAdapter(
                  child: TitledWorkRow(
                    title: tr('#$_randomTag のおすすめ', 'More #$_randomTag'),
                    works: _tagWorks,
                    onMore: () => Nav.tag(context, _randomTag!),
                  ),
                ),
              if (_related.isNotEmpty) ...[
                SliverToBoxAdapter(child: SectionHeader(tr('関連作品', 'Related works'), icon: Icons.auto_awesome_mosaic_rounded)),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: gridColumns(context),
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 10,
                    childCount: _related.length,
                    itemBuilder: (context, i) => WorkCard(work: _related[i]),
                  ),
                ),
              ],
              SliverToBoxAdapter(child: SizedBox(height: 120 + MediaQuery.paddingOf(context).bottom)),
            ],
          ),
        ),
      ]),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 14, color: context.muted),
      const SizedBox(width: 4),
      Text(text, style: TextStyle(color: context.muted, fontSize: 12)),
    ]);
  }
}

class _ImagePager extends StatefulWidget {
  const _ImagePager({required this.images, required this.aspect, required this.onIndex, required this.index, required this.onDoubleTap});

  final List<String> images;
  final double aspect;
  final ValueChanged<int> onIndex;
  final int index;
  final VoidCallback onDoubleTap;

  @override
  State<_ImagePager> createState() => _ImagePagerState();
}

class _ImagePagerState extends State<_ImagePager> with SingleTickerProviderStateMixin {
  late final _heart = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  final _page = PageController();

  @override
  void dispose() {
    _heart.dispose();
    _page.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 次の画像を先に読み、めくったときに空白やちらつきを出さない
    for (final url in widget.images.skip(1).take(2)) {
      precacheImage(CachedNetworkImageProvider(url), context).ignore();
    }
  }

  void _showPage(int i) {
    if (_page.hasClients) _page.animateToPage(i, duration: Ds.normal, curve: Ds.curve);
  }

  void _precacheNext(int i) {
    for (final url in widget.images.skip(i + 1).take(1)) {
      precacheImage(CachedNetworkImageProvider(url), context).ignore();
    }
  }

  void _open(int index) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black,
      pageBuilder: (_, __, ___) => FullscreenImages(images: widget.images, initial: index),
      transitionsBuilder: (_, a, __, child) => FadeTransition(opacity: a, child: child),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;
    return Column(children: [
      AspectRatio(
        aspectRatio: widget.aspect,
        child: Stack(fit: StackFit.expand, children: [
          PageView.builder(
            controller: _page,
            itemCount: images.length,
            onPageChanged: (i) {
              widget.onIndex(i);
              _precacheNext(i);
            },
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => _open(i),
              onDoubleTap: () {
                widget.onDoubleTap();
                _heart.forward(from: 0);
                Ds.success();
              },
              child: Container(
                color: context.isDark ? Colors.black : const Color(0xFFF2F3F5),
                child: AppImage(images[i], fit: BoxFit.contain),
              ),
            ),
          ),
          IgnorePointer(
            child: AnimatedBuilder(
              animation: _heart,
              builder: (context, _) {
                final v = _heart.value;
                if (v == 0 || v == 1) return const SizedBox.shrink();
                final scale = Curves.elasticOut.transform((v * 1.6).clamp(0, 1));
                return Center(
                  child: Opacity(
                    opacity: (1 - (v - 0.6).clamp(0, 0.4) / 0.4),
                    child: Transform.scale(
                      scale: 0.6 + scale * 0.8,
                      child: const Icon(Icons.favorite_rounded, color: Ds.pink, size: 110, shadows: [Shadow(blurRadius: 24, color: Colors.black38)]),
                    ),
                  ),
                );
              },
            ),
          ),
          if (images.length > 1)
            Positioned(
              right: 12,
              top: 12,
              child: Badge2('${widget.index + 1} / ${images.length}'),
            ),
        ]),
      ),
      if (images.length > 1)
        SizedBox(
          height: 64,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            itemCount: images.length,
            separatorBuilder: (_, __) => const SizedBox(width: 6),
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => _showPage(i),
              child: AnimatedContainer(
                duration: Ds.fast,
                width: 54,
                decoration: BoxDecoration(
                  borderRadius: Ds.br(10),
                  border: Border.all(color: i == widget.index ? context.cs.primary : Colors.transparent, width: 2),
                ),
                child: AppImage(images[i], radius: 8, memCacheWidth: 160),
              ),
            ),
          ),
        ),
    ]);
  }
}

/// 全画面でピンチ拡大・左右スワイプ・下スワイプで閉じる
class FullscreenImages extends StatefulWidget {
  const FullscreenImages({super.key, required this.images, required this.initial});

  final List<String> images;
  final int initial;

  @override
  State<FullscreenImages> createState() => _FullscreenImagesState();
}

class _FullscreenImagesState extends State<FullscreenImages> {
  late final _pc = PageController(initialPage: widget.initial);
  late int _index = widget.initial;
  double _drag = 0;

  /// 拡大中と指 2 本で触れている間はページ送りと下スワイプを止め、ピンチと画像の移動を優先する
  bool _zoomed = false;

  @override
  void dispose() {
    _pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final opacity = (1 - _drag.abs() / 400).clamp(0.3, 1.0);
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: opacity),
      body: Stack(children: [
        GestureDetector(
          onVerticalDragUpdate: _zoomed ? null : (d) => setState(() => _drag += d.delta.dy),
          onVerticalDragEnd: _zoomed
              ? null
              : (d) {
                  if (_drag.abs() > 120 || d.velocity.pixelsPerSecond.dy.abs() > 900) {
                    Navigator.pop(context);
                  } else {
                    setState(() => _drag = 0);
                  }
                },
          child: Transform.translate(
            offset: Offset(0, _drag),
            child: PageView.builder(
              controller: _pc,
              physics: _zoomed ? const NeverScrollableScrollPhysics() : null,
              itemCount: widget.images.length,
              onPageChanged: (i) => setState(() {
                _index = i;
                _zoomed = false;
              }),
              itemBuilder: (context, i) => ZoomableImage(
                onZoomChanged: (z) {
                  if (z != _zoomed) setState(() => _zoomed = z);
                },
                child: Center(child: AppImage(widget.images[i], fit: BoxFit.contain)),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Row(children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded, color: Colors.white),
            ),
            const Spacer(),
            if (widget.images.length > 1)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text('${_index + 1} / ${widget.images.length}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              ),
          ]),
        ),
      ]),
    );
  }
}

class _VideoBox extends StatefulWidget {
  const _VideoBox({required this.url, this.poster});

  final String url;
  final String? poster;

  @override
  State<_VideoBox> createState() => _VideoBoxState();
}

class _VideoBoxState extends State<_VideoBox> {
  late final VideoPlayerController _c = VideoPlayerController.networkUrl(Uri.parse(_playableUrl(widget.url)));

  /// 動画の url は Cloudflare Stream の埋め込み用なので、HLS の URL にして再生する
  static String _playableUrl(String url) => url.contains('videodelivery.net') && !url.endsWith('.m3u8') ? '$url/manifest/video.m3u8' : url;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _c.initialize().then((_) {
      if (!mounted) return;
      _c.setLooping(true);
      setState(() => _ready = true);
      _c.play();
    }).catchError((_) {});
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return AspectRatio(
        aspectRatio: 1,
        child: Stack(fit: StackFit.expand, children: [
          if (widget.poster != null) AppImage(widget.poster, fit: BoxFit.contain),
          const Center(child: CircularProgressIndicator.adaptive()),
        ]),
      );
    }
    return AspectRatio(
      aspectRatio: _c.value.aspectRatio,
      child: GestureDetector(
        onTap: () => setState(() => _c.value.isPlaying ? _c.pause() : _c.play()),
        child: Stack(fit: StackFit.expand, children: [
          VideoPlayer(_c),
          AnimatedOpacity(
            opacity: _c.value.isPlaying ? 0 : 1,
            duration: Ds.fast,
            child: const Center(child: Icon(Icons.play_circle_fill_rounded, size: 72, color: Colors.white70)),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: VideoProgressIndicator(_c, allowScrubbing: true)),
        ]),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.bookmarked,
    required this.onBookmark,
    required this.liked,
    required this.likes,
    required this.comments,
    required this.onLike,
    required this.onComment,
    required this.onSupport,
    required this.onShare,
  });

  final bool bookmarked;
  final VoidCallback? onBookmark;
  final bool liked;
  final int likes;
  final int comments;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback? onSupport;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _RoundAction(
        onTap: onLike,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          AnimatedSwitcher(
            duration: Ds.normal,
            transitionBuilder: (c, a) => ScaleTransition(scale: CurvedAnimation(parent: a, curve: Curves.elasticOut), child: c),
            child: Icon(
              liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              key: ValueKey(liked),
              color: liked ? Ds.pink : null,
            ),
          ),
          const SizedBox(width: 6),
          Text(compactCount(likes), style: const TextStyle(fontWeight: FontWeight.w800)),
        ]),
      ),
      const SizedBox(width: 8),
      _RoundAction(
        onTap: onComment,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.chat_bubble_outline_rounded),
          const SizedBox(width: 6),
          Text(compactCount(comments), style: const TextStyle(fontWeight: FontWeight.w800)),
        ]),
      ),
      // ブックマーク（自分の作品には出さない。Web の WorkActionBookmark）
      if (onBookmark != null) ...[
        const SizedBox(width: 8),
        Semantics(
          button: true,
          label: bookmarked ? tr('ブックマークから削除', 'Remove from bookmarks') : tr('ブックマークに追加', 'Add to bookmarks'),
          child: _RoundAction(
            onTap: onBookmark!,
            child: Icon(bookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, color: bookmarked ? context.cs.primary : null),
          ),
        ),
      ],
      const Spacer(),
      if (onSupport != null)
        Pressable(
          onTap: onSupport,
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              gradient: Ds.goldGradient,
              borderRadius: Ds.br(22),
              boxShadow: [BoxShadow(color: Ds.gold.withValues(alpha: 0.35), blurRadius: 14, offset: const Offset(0, 6))],
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.volunteer_activism_rounded, color: Colors.white, size: 20),
              const SizedBox(width: 6),
              Text(tr('推す', 'Support'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
            ]),
          ),
        ),
    ]);
  }
}

class _RoundAction extends StatelessWidget {
  const _RoundAction({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(22)),
        child: child,
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow({required this.user, required this.following, required this.isMine, required this.onFollowChanged});

  final Map<String, dynamic> user;
  final bool following;
  final bool isMine;
  final ValueChanged<bool> onFollowChanged;

  String get _bio => localizedContent(user.str('biography').trim(), user.strOrNull('enBiography')?.replaceAll("\\'", "'")).trim();

  @override
  Widget build(BuildContext context) {
    return Pressable(
      scale: 0.99,
      onTap: () => Nav.user(context, user.str('id')),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.surfaceCard,
          borderRadius: Ds.br(18),
          border: Border.all(color: context.hairline),
        ),
        child: Row(children: [
          UserAvatar.json(user, size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Flexible(child: Text(user.str('name'), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15))),
                if (user.boolean('isOfficial') || user.boolean('isModerator')) ...[const SizedBox(width: 4), OfficialBadge(isOfficial: user.boolean('isOfficial'), isModerator: user.boolean('isModerator'))],
              ]),
              // Web の WorkUser と同じく、フォロワー数と投稿数
              Text(
                tr('フォロワー ${compactCount(user.integer('followersCount'))} · 投稿 ${compactCount(user.integer('worksCount'))}', '${compactCount(user.integer('followersCount'))} followers · ${compactCount(user.integer('worksCount'))} posts'),
                style: TextStyle(color: context.muted, fontSize: 12),
              ),
              if (_bio.isNotEmpty) ...[
                const SizedBox(height: 4),
                AutoTranslatedText(_bio, showLabel: false, builder: (context, text) => Text(text, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.muted, fontSize: 12, height: 1.4))),
              ],
            ]),
          ),
          // フォロー一覧・ユーザー画面と同じボタン（押した瞬間に切り替え、解除は確認してから）
          if (!isMine) ...[
            const SizedBox(width: 8),
            FollowButton(userId: user.str('id'), isFollowing: following, compact: true, onChanged: onFollowChanged),
          ],
        ]),
      ),
    );
  }
}

class _ExpandableText extends StatefulWidget {
  const _ExpandableText(this.text);

  final String text;

  @override
  State<_ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<_ExpandableText> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final long = widget.text.length > 140 || '\n'.allMatches(widget.text).length > 4;
    return GestureDetector(
      onTap: long ? () => setState(() => _open = !_open) : null,
      child: AnimatedSize(
        duration: Ds.normal,
        alignment: Alignment.topCenter,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // URL は押すと開く（Web の parseTextWithLinks と同じ）
          LinkifiedText(
            widget.text,
            maxLines: _open || !long ? null : 4,
            style: const TextStyle(height: 1.6, fontSize: 14.5),
          ),
          if (long)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(_open ? tr('閉じる', 'Show less') : tr('続きを読む', 'Read more'), style: TextStyle(color: context.cs.primary, fontWeight: FontWeight.w700)),
            ),
        ]),
      ),
    );
  }
}

class _GenerationInfo extends StatelessWidget {
  const _GenerationInfo({required this.work});

  final Map<String, dynamic> work;

  static bool _has(Object? v) => v != null && v.toString().trim().isNotEmpty && v.toString() != 'null' && v.toString() != '0';

  /// Web の WorkArticleGenerationParameters と同じ項目のどれかがあれば出す
  static bool hasAny(Map<String, dynamic> w) =>
      ['prompt', 'negativePrompt', 'steps', 'scale', 'seed', 'sampler', 'strength', 'otherGenerationParams'].any((k) => _has(w[k]));

  @override
  Widget build(BuildContext context) {
    Widget block(String label, String? text) {
      if (text == null || text.trim().isEmpty) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(label, style: TextStyle(color: context.muted, fontSize: 12, fontWeight: FontWeight.w700)),
            const Spacer(),
            InkWell(
              borderRadius: Ds.br(10),
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: text));
                if (context.mounted) context.toast(tr('$labelをコピーしました', 'Copied $label'), icon: Icons.copy_rounded);
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.copy_rounded, size: 14, color: context.cs.primary),
                  const SizedBox(width: 4),
                  Text(tr('コピー', 'Copy'), style: TextStyle(color: context.cs.primary, fontSize: 12, fontWeight: FontWeight.w700)),
                ]),
              ),
            ),
          ]),
          const SizedBox(height: 4),
          Text(text, maxLines: 6, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, height: 1.45)),
        ]),
      );
    }

    final params = <(String, String?)>[
      (tr('モデル', 'Model'), work.strOrNull('model')),
      ('Steps', work['steps']?.toString()),
      ('Scale', work['scale']?.toString()),
      ('Sampler', work.strOrNull('sampler')),
      ('Seed', work['seed']?.toString()),
      ('Strength', work['strength']?.toString()),
      ('VAE', work.strOrNull('vae')),
    ].where((p) => p.$2 != null && p.$2!.isNotEmpty && p.$2 != 'null').toList();

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        borderRadius: Ds.br(18),
        border: Border.all(color: context.hairline),
        color: context.surfaceCard,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          ShaderMask(shaderCallback: (r) => Ds.brandGradient.createShader(r), child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 20)),
          const SizedBox(width: 6),
          Text(tr('生成情報', 'Generation info'), style: context.tt.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
        ]),
        block(tr('プロンプト', 'Prompt'), work.strOrNull('prompt')),
        block(tr('ネガティブプロンプト', 'Negative prompt'), work.strOrNull('negativePrompt')),
        block(tr('その他', 'Other'), work.strOrNull('otherGenerationParams')),
        if (params.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(spacing: 6, runSpacing: 6, children: [
            for (final p in params)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(10)),
                child: Text('${p.$1}: ${p.$2}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ),
          ]),
        ],
      ]),
    );
  }
}

class _CommentsPreview extends StatefulWidget {
  const _CommentsPreview({
    required this.workId,
    required this.comments,
    required this.total,
    required this.viewerId,
    required this.editable,
    required this.onOpen,
    required this.onCompose,
    required this.onReply,
    required this.onPosted,
  });

  final String workId;
  final List<CommentItem> comments;
  final int total;
  final String? viewerId;
  final bool editable;
  final VoidCallback onOpen;
  final VoidCallback onCompose;
  final ValueChanged<CommentItem> onReply;

  /// すぐ送れるスタンプで送ったコメント
  final ValueChanged<CommentItem> onPosted;

  @override
  State<_CommentsPreview> createState() => _CommentsPreviewState();
}

class _CommentsPreviewState extends State<_CommentsPreview> {
  String? _sendingId;

  Future<void> _sendSticker(Map<String, dynamic> sticker) async {
    if (_sendingId != null || !Nav.requireLogin(context)) return;
    setState(() => _sendingId = sticker.str('id'));
    try {
      final comment = await postStickerComment(workId: widget.workId, sticker: sticker);
      Ds.success();
      widget.onPosted(comment);
      if (mounted) context.toast(tr('スタンプを送りました', 'Sticker sent'));
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _sendingId = null);
    }
  }

  Future<void> _openAll() async {
    if (!Nav.requireLogin(context)) return;
    final picked = await showStickerPicker(context);
    if (picked != null) await _sendSticker(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 4),
        child: Row(children: [
          Text(tr('コメント', 'Comments'), style: context.tt.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(width: 6),
          Text('${widget.total}', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700)),
          const Spacer(),
          if (widget.total > 0) TextButton(onPressed: widget.onOpen, child: Text(tr('すべて見る', 'See all'))),
        ]),
      ),
      // 入力欄はコメントの上（下にあると、まずほかの人のコメントを通り過ぎることになる）
      if (widget.editable) ...[
        const SizedBox(height: 6),
        Pressable(
          scale: 0.99,
          onTap: widget.onCompose,
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(23)),
            child: Row(children: [
              Icon(Icons.edit_outlined, size: 18, color: context.muted),
              const SizedBox(width: 8),
              Text(tr('コメントを書く', 'Write a comment'), style: TextStyle(color: context.muted)),
              const Spacer(),
              const Icon(Icons.monetization_on_outlined, size: 20, color: Ds.gold),
            ]),
          ),
        ),
        // Web と同じく、入力欄のすぐ下に押すとすぐ送れるスタンプ（ピン留め・最近使った）
        if (Nav.isLoggedIn) ...[
          const SizedBox(height: 8),
          QuickStickerTray(dense: true, onSend: _sendSticker, onOpenAll: _openAll, sendingId: _sendingId),
        ],
        const SizedBox(height: 10),
      ],
      for (final c in widget.comments)
        CommentTile(key: ValueKey(c.id), comment: c, viewerId: widget.viewerId, onReply: widget.editable ? widget.onReply : null),
    ]);
  }
}

/// 本のように読む（Web と同じ読み方を選べる画面を開く）
class _BookReaderButton extends StatelessWidget {
  const _BookReaderButton({required this.workId, required this.title, required this.isNovel, this.args});

  final String workId;
  final String title;
  final bool isNovel;
  final BookReaderArgs? args;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Pressable(
      scale: 0.99,
      onTap: () => context.push('/works/$workId/reader?title=${Uri.encodeQueryComponent(title)}', extra: args),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: Ds.br(16),
          border: Border.all(color: isDark ? const Color(0x1AFFE7B0) : const Color(0x26A1662F)),
          gradient: LinearGradient(
            colors: isDark
                ? const [Color(0xFF2A2620), Color(0xFF211D18)]
                : const [Color(0xFFFBF6EA), Color(0xFFF3E8D0)],
          ),
        ),
        child: Row(children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(color: Color(0xFFB4383A), shape: BoxShape.circle),
            child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                tr('本のように読む', 'Read like a book'),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: isDark ? const Color(0xFFEADFCB) : const Color(0xFF3B2F22),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                isNovel
                    ? tr('縦書き・見開き・しおり・文字の大きさ。折りたたみやタブレットは見開きで', 'Vertical text, spreads, bookmarks, font size. Spreads on foldables and tablets')
                    : tr('見開き・しおり・文字の大きさ。タブレットや折りたたみにも', 'Spreads, bookmarks, font size. Great on tablets and foldables'),
                style: TextStyle(
                  fontSize: 11.5,
                  height: 1.35,
                  color: (isDark ? const Color(0xFFEADFCB) : const Color(0xFF3B2F22)).withValues(alpha: 0.75),
                ),
              ),
            ]),
          ),
          Icon(Icons.chevron_right_rounded, color: (isDark ? const Color(0xFFEADFCB) : const Color(0xFF3B2F22)).withValues(alpha: 0.6)),
        ]),
      ),
    );
  }
}
