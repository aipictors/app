import 'dart:io';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:aipictors/v2/post/video_post.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

/// システムのピッカーで動画を 1 本選ぶ（写真の権限は要らない）
Future<XFile?> pickSystemVideo() {
  final platform = ImagePickerPlatform.instance;
  if (platform is ImagePickerAndroid) platform.useAndroidPhotoPicker = true;
  return ImagePicker().pickVideo(source: ImageSource.gallery);
}

/// 動画のコマを画像にする。[maxWidth] 0 は元の大きさ
Future<Uint8List?> captureVideoFrame(String path, Duration at, {int maxWidth = 0, bool png = false}) async {
  try {
    return await VideoThumbnail.thumbnailData(video: path, timeMs: at.inMilliseconds, maxWidth: maxWidth, imageFormat: png ? ImageFormat.PNG : ImageFormat.JPEG, quality: png ? 100 : 75);
  } catch (_) {
    return null;
  }
}

/// サムネイルにするコマ（元の大きさ。長い辺は 2048 まで）
Future<EncodedImage?> captureThumbnail(String path, Duration at, int videoWidth, int videoHeight) async {
  final maxWidth = videoWidth > 2048 || videoHeight > 2048 ? (2048 * videoWidth / (videoWidth > videoHeight ? videoWidth : videoHeight)).round() : 0;
  final bytes = await captureVideoFrame(path, at, maxWidth: maxWidth, png: true);
  if (bytes == null) return null;
  try {
    return await ImageTools.normalize(bytes);
  } catch (_) {
    return null;
  }
}

/// 最初のサムネイル。真っ黒なコマを避けて選ぶ（Web の captureVideoThumbnail と同じ順）
Future<(Duration, EncodedImage)?> captureInitialThumbnail(String path, Duration duration, int width, int height) async {
  for (final at in initialThumbnailTimes(duration)) {
    final small = await captureVideoFrame(path, at, maxWidth: 96);
    if (small == null) continue;
    if (await compute(isAlmostBlackBytes, small)) continue;
    final full = await captureThumbnail(path, at, width, height);
    if (full != null) return (at, full);
  }
  // どこも暗い動画は真ん中をそのまま使う
  final at = initialThumbnailTimes(duration).first;
  final full = await captureThumbnail(path, at, width, height);
  return full == null ? null : (at, full);
}

/// まだ動画を選んでいないときの枠。上限を先に見せる（Web の「MP4・32MBまで」「30秒まで」）
class VideoPickPanel extends StatelessWidget {
  const VideoPickPanel({super.key, required this.limits, required this.onPick, this.loading = false});

  final VideoUploadLimits limits;
  final VoidCallback onPick;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: loading ? null : onPick,
      child: Container(
        height: 200,
        decoration: BoxDecoration(color: context.skeleton, borderRadius: Ds.br(16)),
        padding: const EdgeInsets.all(Ds.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading) ...[
              const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2.5)),
              const SizedBox(height: Ds.s12),
              Text(
                tr('動画を読み込み中…', 'Loading video…'),
                style: TextStyle(color: context.muted, fontWeight: FontWeight.w700),
              ),
            ] else ...[
              Icon(Icons.video_library_outlined, size: 36, color: context.cs.primary),
              const SizedBox(height: Ds.s8),
              Text(tr('動画を選ぶ', 'Choose a video'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
              const SizedBox(height: Ds.s8),
              Text(
                tr(
                  'MP4・MOV／${formatVideoBytes(maxVideoFileBytes)}まで／${limits.maxDurationSeconds}秒まで',
                  'MP4 or MOV / up to ${formatVideoBytes(maxVideoFileBytes)} / up to ${limits.maxDurationSeconds}s',
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5, color: context.muted, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: Ds.s4),
              Text(
                tr('無料ユーザは1日合計60秒まで、サブスク加入ユーザは1日合計180秒まで', 'Free users: up to 60 total seconds/day. Subscribers: up to 180 total seconds/day.'),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: context.muted),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 選んだ動画のプレビュー。タップで再生・一時停止、右下で音のオンオフ
class VideoPreviewCard extends StatefulWidget {
  const VideoPreviewCard({super.key, required this.controller, this.info, this.onReplace, this.onRemove});

  final VideoPlayerController controller;

  /// 長さ・大きさなどの小さな表示
  final String? info;
  final VoidCallback? onReplace;
  final VoidCallback? onRemove;

  @override
  State<VideoPreviewCard> createState() => _VideoPreviewCardState();
}

class _VideoPreviewCardState extends State<VideoPreviewCard> {
  VideoPlayerController get _c => widget.controller;

  @override
  void initState() {
    super.initState();
    _c.addListener(_tick);
  }

  @override
  void didUpdateWidget(VideoPreviewCard old) {
    super.didUpdateWidget(old);
    if (old.controller != widget.controller) {
      old.controller.removeListener(_tick);
      _c.addListener(_tick);
    }
  }

  @override
  void dispose() {
    _c.removeListener(_tick);
    super.dispose();
  }

  void _tick() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final v = _c.value;
    final ratio = v.isInitialized && v.aspectRatio > 0 ? v.aspectRatio : 16 / 9;
    return ClipRRect(
      borderRadius: Ds.br(16),
      child: ColoredBox(
        color: Colors.black,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 360),
          child: Center(
            child: AspectRatio(
              aspectRatio: ratio,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (v.isInitialized) VideoPlayer(_c) else const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => v.isPlaying ? _c.pause() : _c.play(),
                    child: AnimatedOpacity(
                      opacity: v.isPlaying ? 0 : 1,
                      duration: Ds.slow,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(Ds.s12),
                          decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.45), shape: BoxShape.circle),
                          child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 36),
                        ),
                      ),
                    ),
                  ),
                  if (widget.onReplace != null || widget.onRemove != null)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Row(
                        children: [
                          if (widget.onReplace != null) _OverlayButton(icon: Icons.swap_horiz_rounded, tooltip: tr('別の動画にする', 'Choose another video'), onTap: widget.onReplace!),
                          if (widget.onRemove != null) ...[const SizedBox(width: 6), _OverlayButton(icon: Icons.close_rounded, tooltip: tr('取り除く', 'Remove'), onTap: widget.onRemove!)],
                        ],
                      ),
                    ),
                  Positioned(
                    left: 8,
                    right: 8,
                    bottom: 6,
                    child: Row(
                      children: [
                        if (widget.info != null) Badge2(widget.info!),
                        const Spacer(),
                        _OverlayButton(icon: v.volume == 0 ? Icons.volume_off_rounded : Icons.volume_up_rounded, tooltip: tr('音', 'Sound'), onTap: () => _c.setVolume(v.volume == 0 ? 1 : 0)),
                      ],
                    ),
                  ),
                  if (v.isInitialized && v.duration > Duration.zero)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: LinearProgressIndicator(value: (v.position.inMilliseconds / v.duration.inMilliseconds).clamp(0.0, 1.0), minHeight: 2, backgroundColor: Colors.white24),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OverlayButton extends StatelessWidget {
  const _OverlayButton({required this.icon, required this.tooltip, required this.onTap});

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.black.withValues(alpha: 0.5),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }
}

/// サムネイルにするコマを選ぶ帯。コマを並べ、指でなぞって位置を決める
class VideoFrameStrip extends StatefulWidget {
  const VideoFrameStrip({super.key, required this.path, required this.duration, required this.value, required this.onScrub, required this.onScrubEnd});

  final String path;
  final Duration duration;
  final Duration value;

  /// なぞっている間（プレビューをその位置に送る）
  final ValueChanged<Duration> onScrub;

  /// 指を離したとき（そのコマをサムネイルにする）
  final ValueChanged<Duration> onScrubEnd;

  static const frameCount = 10;

  @override
  State<VideoFrameStrip> createState() => _VideoFrameStripState();
}

class _VideoFrameStripState extends State<VideoFrameStrip> {
  final List<Uint8List?> _frames = List.filled(VideoFrameStrip.frameCount, null);
  Duration? _dragging;

  @override
  void initState() {
    super.initState();
    _loadFrames();
  }

  @override
  void didUpdateWidget(VideoFrameStrip old) {
    super.didUpdateWidget(old);
    if (old.path != widget.path) {
      _frames.fillRange(0, _frames.length, null);
      _loadFrames();
    }
  }

  Future<void> _loadFrames() async {
    final path = widget.path;
    final times = stripFrameTimes(widget.duration, VideoFrameStrip.frameCount);
    for (var i = 0; i < times.length; i++) {
      final bytes = await captureVideoFrame(path, times[i], maxWidth: 120);
      if (!mounted || path != widget.path) return;
      setState(() => _frames[i] = bytes);
    }
  }

  Duration _at(double dx, double width) {
    final ratio = (dx / width).clamp(0.0, 1.0);
    final ms = (widget.duration.inMilliseconds - 100).clamp(0, 1 << 31);
    return Duration(milliseconds: (ms * ratio).round());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final width = box.maxWidth;
        final current = _dragging ?? widget.value;
        final totalMs = widget.duration.inMilliseconds <= 0 ? 1 : widget.duration.inMilliseconds;
        const handleWidth = 40.0;
        final left = ((current.inMilliseconds / totalMs) * width - handleWidth / 2).clamp(0.0, width - handleWidth);
        void move(double dx) {
          final at = _at(dx, width);
          setState(() => _dragging = at);
          widget.onScrub(at);
        }

        void end() {
          final at = _dragging;
          setState(() => _dragging = null);
          if (at != null) widget.onScrubEnd(at);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragStart: (d) => move(d.localPosition.dx),
              onHorizontalDragUpdate: (d) => move(d.localPosition.dx),
              onHorizontalDragEnd: (_) => end(),
              onTapDown: (d) => move(d.localPosition.dx),
              onTapUp: (_) => end(),
              child: SizedBox(
                height: 64,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      top: 6,
                      bottom: 6,
                      child: ClipRRect(
                        borderRadius: Ds.br(8),
                        child: Row(
                          children: [
                            for (final f in _frames)
                              Expanded(
                                child: f == null ? ColoredBox(color: context.skeleton) : Image.memory(f, fit: BoxFit.cover, gaplessPlayback: true, height: double.infinity),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: left,
                      top: 0,
                      bottom: 0,
                      width: handleWidth,
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: Ds.br(8),
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 6)],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Ds.s4),
            Row(
              children: [
                Text(
                  formatVideoDuration(current),
                  style: TextStyle(fontSize: 12, color: context.muted, fontFeatures: const [FontFeature.tabularFigures()]),
                ),
                const Spacer(),
                Text(tr('なぞってサムネイルのコマを選ぶ', 'Drag to choose the thumbnail frame'), style: TextStyle(fontSize: 12, color: context.muted)),
              ],
            ),
          ],
        );
      },
    );
  }
}

/// 選んだサムネイルの小さな表示
class VideoThumbnailTile extends StatelessWidget {
  const VideoThumbnailTile({super.key, this.image, this.url, this.loading = false});

  final EncodedImage? image;
  final String? url;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: Ds.br(12),
            child: image != null
                ? Image.memory(image!.bytes, fit: BoxFit.cover, cacheWidth: 300, gaplessPlayback: true)
                : url != null
                ? AppImage(url, memCacheWidth: 300)
                : ColoredBox(color: context.skeleton),
          ),
          if (loading)
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.black38, borderRadius: Ds.br(12)),
              child: const Center(
                child: SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)),
              ),
            ),
          Positioned(left: 4, top: 4, child: Badge2(tr('サムネイル', 'Thumbnail'))),
        ],
      ),
    );
  }
}

/// ファイルの大きさを読む（読めなければ 0）
Future<int> fileLength(String path) async {
  try {
    return await File(path).length();
  } catch (_) {
    return 0;
  }
}
