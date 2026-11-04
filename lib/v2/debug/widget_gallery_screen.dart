import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/status_balloon.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:aipictors/v2/widgets/user_name_row.dart';
import 'package:flutter/material.dart';

/// 共通部品の見本（デバッグビルドだけ）。枠は本番の一覧をそのまま並べ、Web と見比べる
class WidgetGalleryScreen extends StatefulWidget {
  const WidgetGalleryScreen({super.key});

  @override
  State<WidgetGalleryScreen> createState() => _WidgetGalleryScreenState();
}

class _WidgetGalleryScreenState extends State<WidgetGalleryScreen> {
  static const _samples = [
    AvatarFrame(frameType: 'GRADIENT', backgroundStyle: 'linear-gradient(135deg, #ff97bc, #84bbff)'),
    AvatarFrame(frameType: 'AURORA', backgroundStyle: 'linear-gradient(120deg, #92f0c9 0%, #84bbff 50%, #d2a2ff 100%)'),
    AvatarFrame(frameType: 'PEARL_SHINE', backgroundStyle: 'radial-gradient(circle at 30% 30%, #ffffff, rgba(210, 162, 255, 0.8) 60%, #84bbff)'),
    AvatarFrame(frameType: 'STARLIGHT', backgroundStyle: 'conic-gradient(from 0deg, gold, #fff 25%, gold 50%, #fff 75%, gold)', borderPadding: 4),
  ];

  late final Future<List<AvatarFrame>> _frames = _load();

  Future<List<AvatarFrame>> _load() async {
    final data = await Api.query('query AppFrameGallery { userAvatarFrames { frameType backgroundStyle borderPadding overlayImageUrl } }');
    return data.list('userAvatarFrames').map(AvatarFrame.fromJson).whereType<AvatarFrame>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('共通部品の見本')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: Ds.s32),
        children: [
          const SectionHeader('絵文字まじりの文字'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Ds.s16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('🏅 実績「はじめての保存」を達成しました！ フリーコイン10枚'),
              SizedBox(height: Ds.s8),
              Text('絵文字なしの文字 123'),
              SizedBox(height: Ds.s8),
              Text('ありがとう😊 English 中文 한국어'),
            ]),
          ),
          const SectionHeader('アイコン枠（本番の一覧）'),
          FutureBuilder<List<AvatarFrame>>(
            future: _frames,
            builder: (context, snapshot) {
              final frames = snapshot.data;
              if (frames == null) return const SizedBox(height: 240, child: SkeletonGrid(count: 12, maxExtent: 70, aspect: 1));
              return Padding(
                padding: const EdgeInsets.all(Ds.s16),
                child: Wrap(spacing: 22, runSpacing: 22, children: [
                  for (final f in [..._samples, ...frames]) UserAvatar(url: null, frame: f, size: 48),
                ]),
              );
            },
          ),
          const SectionHeader('名前'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Ds.s16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              UserNameRow(name: '公式アカウント', isOfficial: true),
              SizedBox(height: Ds.s8),
              UserNameRow(name: 'モデレーター', isModerator: true),
              SizedBox(height: Ds.s8),
              UserNameRow(name: 'レベルあり', level: 12),
            ]),
          ),
          const SectionHeader('吹き出し'),
          const Padding(
            padding: EdgeInsets.all(Ds.s16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: StatusBalloon('新しい絵を描いています。週末に投稿する予定なので、よかったら見に来てください！長い文は 2 行で省略します'),
            ),
          ),
          const SectionHeader('ボタン・チップ', trailing: '見本', onMore: null),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Ds.s16),
            child: Column(children: [
              PrimaryButton(label: '主なボタン', icon: Icons.check_rounded, onPressed: () => context.toast('トーストの見本')),
              const SizedBox(height: Ds.s8),
              SecondaryButton(label: '控えめなボタン', onPressed: () => showConfirmSheet(context, title: '確認のシート', message: 'この操作は取り消せません', confirmLabel: '削除する', destructive: true)),
              const SizedBox(height: Ds.s12),
              Wrap(spacing: Ds.s8, children: [
                const AppChip('選択中', selected: true),
                AppChip('チップ', icon: Icons.tag_rounded, onTap: () {}),
              ]),
            ]),
          ),
          const SectionHeader('状態'),
          const SizedBox(height: 200, child: SkeletonList(count: 3)),
          StateView.empty('まだ何もありません', message: '空のときの表示', compact: true),
          StateView.error('エラーのときの表示', onRetry: () {}),
        ],
      ),
    );
  }
}
