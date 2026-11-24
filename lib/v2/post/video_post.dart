import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/upload.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

/// Web の MAX_VIDEO_FILE_SIZE_BYTES と同じ
const maxVideoFileBytes = 32 * 1024 * 1024;

/// Web の getVideoUploadLimits と同じ（サブスク加入で 1 本 60 秒・1 日 180 秒、ほかは 30 秒・60 秒）
class VideoUploadLimits {
  const VideoUploadLimits._(this.isSubscribed, this.maxDurationSeconds, this.dailyTotalDurationSeconds);

  factory VideoUploadLimits.of(String? passType) {
    final subscribed = passType == 'LITE' || passType == 'STANDARD' || passType == 'PREMIUM';
    return subscribed ? const VideoUploadLimits._(true, 60, 180) : const VideoUploadLimits._(false, 30, 60);
  }

  final bool isSubscribed;
  final int maxDurationSeconds;
  final int dailyTotalDurationSeconds;
}

/// 拡張子からアップロードの Content-Type を決める。Web は MP4 だけだが、iPhone で撮った動画は MOV なので MOV も受ける
/// （アップロード先の /api/upload-stream-video は video/* を Cloudflare Stream に渡すだけ）
String? videoMimeOf(String path) {
  final ext = path.split('.').last.toLowerCase();
  return switch (ext) {
    'mp4' || 'm4v' => 'video/mp4',
    'mov' => 'video/quicktime',
    _ => null,
  };
}

String formatVideoBytes(int bytes) {
  if (bytes >= 1024 * 1024) return '${(bytes / 1024 / 1024).toStringAsFixed(bytes >= 10 * 1024 * 1024 ? 0 : 1)}MB';
  return '${(bytes / 1024).ceil()}KB';
}

String formatVideoDuration(Duration d) {
  final s = d.inMilliseconds / 1000;
  if (s < 60) return tr('${s.toStringAsFixed(1)}秒', '${s.toStringAsFixed(1)}s');
  final whole = d.inSeconds;
  return '${whole ~/ 60}:${(whole % 60).toString().padLeft(2, '0')}';
}

/// 選んだ動画を投稿できないときの理由（選んだ時点で出す）。投稿できれば null
String? videoPickError({required String path, required int bytes, required Duration duration, required VideoUploadLimits limits}) {
  if (videoMimeOf(path) == null) return tr('MP4 か MOV の動画を選んでください', 'Choose an MP4 or MOV video');
  if (bytes > maxVideoFileBytes) {
    return tr(
      'この動画は${formatVideoBytes(bytes)}です。${formatVideoBytes(maxVideoFileBytes)}までの動画を選んでください',
      'This video is ${formatVideoBytes(bytes)}. Choose one up to ${formatVideoBytes(maxVideoFileBytes)}',
    );
  }
  if (duration <= Duration.zero) return tr('動画の長さを読み取れませんでした', 'Couldn\'t read the video length');
  // Web は video.duration > 上限 で弾く（ちょうど上限は通す）
  if (duration.inMilliseconds > limits.maxDurationSeconds * 1000) {
    return tr(
      'この動画は${formatVideoDuration(duration)}です。${limits.maxDurationSeconds}秒までの動画を選んでください',
      'This video is ${formatVideoDuration(duration)}. Choose one up to ${limits.maxDurationSeconds} seconds',
    );
  }
  return null;
}

/// Web と同じく秒は切り上げて送る
int videoDurationSecondsOf(Duration d) => (d.inMilliseconds / 1000).ceil();

/// サムネイルを選ぶ帯に並べるコマの時刻（両端を含めて等間隔、最後は終わりの少し手前）
List<Duration> stripFrameTimes(Duration duration, int count) {
  final ms = duration.inMilliseconds;
  if (ms <= 0 || count <= 0) return const [];
  final last = math.max(0, ms - 100);
  if (count == 1) return [Duration(milliseconds: last ~/ 2)];
  return [for (var i = 0; i < count; i++) Duration(milliseconds: (last * i / (count - 1)).round())];
}

/// 最初のサムネイルを試す順（Web の captureVideoThumbnail と同じく 真ん中 → 1/4 → 3/4 → 先頭付近）
List<Duration> initialThumbnailTimes(Duration duration) {
  final ms = duration.inMilliseconds;
  final maxMs = math.max(0, ms - 50);
  return [0.5, 0.25, 0.75, 0.05].map((r) => Duration(milliseconds: (ms * r).round().clamp(0, maxMs))).toList();
}

/// ほぼ真っ黒なコマか（Web の isAlmostBlack と同じ。平均の明るさが 4 未満）
bool isAlmostBlackImage(img.Image image) {
  final step = math.max(1, math.min(image.width, image.height) ~/ 32);
  var total = 0.0;
  var count = 0;
  for (var y = 0; y < image.height; y += step) {
    for (var x = 0; x < image.width; x += step) {
      final p = image.getPixel(x, y);
      total += p.r + p.g + p.b;
      count++;
    }
  }
  return count > 0 && total / (count * 3) < 4;
}

bool isAlmostBlackBytes(Uint8List bytes) {
  final image = img.decodeImage(bytes);
  return image != null && isAlmostBlackImage(image);
}

/// Cloudflare Stream の埋め込み URL は再生用の HLS に直す（作品画面と同じ）
String playableVideoUrl(String url) => url.contains('videodelivery.net') && !url.endsWith('.m3u8') ? '$url/manifest/video.m3u8' : url;

/// 端末から選んだ動画
class PickedVideo {
  const PickedVideo({required this.path, required this.mime, required this.bytes, required this.duration, required this.width, required this.height});

  final String path;
  final String mime;
  final int bytes;
  final Duration duration;
  final int width;
  final int height;

  int get durationSeconds => videoDurationSecondsOf(duration);
}

/// アップロードした動画
class UploadedVideo {
  const UploadedVideo(this.url, this.uid);

  final String url;
  final String? uid;
}

/// Web の app/utils/upload-public-video.ts と同じアップロード（送った量で進み具合を返す）
class VideoUploader {
  VideoUploader._();

  static const endpoint = 'https://www.aipictors.com/api/upload-stream-video';

  static Future<UploadedVideo> upload(String path, String mime, String token, {required void Function(double sent) onProgress}) async {
    if (postDryRun) {
      for (var i = 1; i <= 10; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 80));
        onProgress(i / 10);
      }
      return const UploadedVideo('https://iframe.videodelivery.net/dry-run', 'dry-run');
    }
    final file = File(path);
    final length = await file.length();
    final request = http.StreamedRequest('POST', Uri.parse(endpoint))
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Content-Type'] = mime
      ..contentLength = length;
    final client = http.Client();
    try {
      final responseFuture = client.send(request);
      var sent = 0;
      await for (final chunk in file.openRead()) {
        request.sink.add(chunk);
        sent += chunk.length;
        onProgress(sent / length);
      }
      unawaited(request.sink.close());
      // 送り終えてから Cloudflare Stream に渡すまで待つ。モバイル回線を考えて Web（120 秒）より長めに待つ
      final res = await responseFuture.timeout(const Duration(minutes: 5));
      final body = await res.stream.bytesToString();
      final json = body.isEmpty ? null : jsonDecode(body);
      final error = json is Map ? json['error'] : null;
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final data = json is Map ? json['data'] : null;
        final url = data is Map ? data['url'] : null;
        if (url is String && url.isNotEmpty) return UploadedVideo(url, data['uid'] is String ? data['uid'] as String : null);
      }
      throw ApiException(error is String && error.isNotEmpty ? error : tr('動画のアップロードに失敗しました', 'Video upload failed'));
    } on ApiException {
      rethrow;
    } on TimeoutException {
      throw ApiException(tr('動画のアップロードがタイムアウトしました。通信環境を確認してもう一度お試しください', 'Video upload timed out. Check your connection and try again'));
    } on FormatException {
      throw ApiException(tr('動画のアップロードに失敗しました', 'Video upload failed'));
    } catch (_) {
      throw ApiException(tr('動画のアップロードに失敗しました。通信環境を確認してもう一度お試しください', 'Video upload failed. Check your connection and try again'));
    } finally {
      client.close();
    }
  }
}

/// 送信の段階（進み具合の文言）
enum VideoPostPhase { thumbnail, video, creating }

String videoPostPhaseLabel(VideoPostPhase p) => switch (p) {
  VideoPostPhase.thumbnail => tr('サムネイルを準備中', 'Preparing thumbnail'),
  VideoPostPhase.video => tr('動画をアップロード中', 'Uploading video'),
  VideoPostPhase.creating => tr('作品を作成中', 'Creating work'),
};

/// アップロード済みのサムネイル
class VideoThumbnailUrls {
  const VideoThumbnailUrls({
    required this.mainUrl,
    required this.smallUrl,
    required this.smallWidth,
    required this.smallHeight,
    required this.largeUrl,
    required this.largeWidth,
    required this.largeHeight,
    required this.width,
    required this.height,
    required this.sha256,
  });

  final String mainUrl;
  final String smallUrl;
  final int smallWidth;
  final int smallHeight;
  final String largeUrl;
  final int largeWidth;
  final int largeHeight;
  final int width;
  final int height;
  final String sha256;
}

/// 動画の新規投稿で送る input（Web の toVideoWorkInput と同じ。生成情報・AI 評価は送らない）
Map<String, dynamic> videoCreateInput(PostDraft d, VideoThumbnailUrls t, UploadedVideo video, int durationSeconds) => {
  ...PostApi.commonInput(d),
  'prompt': null,
  'negativePrompt': null,
  'seed': null,
  'sampler': null,
  'strength': null,
  'noise': null,
  'modelName': null,
  'modelHash': null,
  'otherGenerationParams': null,
  'pngInfo': null,
  'type': 'WORK',
  'mainImageSha256': t.sha256,
  'imageUrls': [t.mainUrl],
  'smallThumbnailImageURL': t.smallUrl,
  'smallThumbnailImageWidth': t.smallWidth,
  'smallThumbnailImageHeight': t.smallHeight,
  'largeThumbnailImageURL': t.largeUrl,
  'largeThumbnailImageWidth': t.largeWidth,
  'largeThumbnailImageHeight': t.largeHeight,
  'videoUrl': video.url,
  'videoDurationSeconds': durationSeconds,
  'streamUid': video.uid,
  'ogpImageUrl': null,
  'imageWidth': t.width,
  'imageHeight': t.height,
  'accessGenerationType': 'PUBLIC',
};

/// 動画の更新で送る input（Web の posts.$post.animation.edit と同じ。動画とテイストは元のまま、サムネイルだけ差し替えられる）
Map<String, dynamic> videoUpdateInput(EditingWork e, PostDraft d, VideoThumbnailUrls t) {
  final w = e.json;
  return {
    ...PostApi.commonInput(d),
    'id': e.id,
    'entitle': w.str('enTitle'),
    'enExplanation': w.str('enDescription'),
    'prompt': null,
    'negativePrompt': null,
    'seed': null,
    'sampler': null,
    'strength': null,
    'noise': null,
    'modelName': null,
    'modelHash': null,
    'otherGenerationParams': null,
    'pngInfo': null,
    'imageStyle': w.str('style', 'ILLUSTRATION'),
    'type': 'VIDEO',
    'mainImageSha256': t.sha256,
    'imageUrls': [t.largeUrl],
    'smallThumbnailImageURL': t.smallUrl,
    'smallThumbnailImageWidth': t.smallWidth,
    'smallThumbnailImageHeight': t.smallHeight,
    'largeThumbnailImageURL': t.largeUrl,
    'largeThumbnailImageWidth': t.largeWidth,
    'largeThumbnailImageHeight': t.largeHeight,
    'thumbnailPosition': t.largeUrl == w.str('largeThumbnailImageURL') ? w.number('thumbnailImagePosition') : 0,
    'videoUrl': w.str('url'),
    'streamUid': w.strOrNull('streamUid'),
    'ogpImageUrl': w.strOrNull('ogpThumbnailImageUrl'),
    'imageWidth': t.width,
    'imageHeight': t.height,
    'accessGenerationType': 'PUBLIC',
    // 修正依頼が来ている作品は、保存すると運営に修正完了が伝わる（画像の編集と同じ）
    if (w.obj('moderatorReport')?.str('status') == 'UNHANDLED') 'correctionMessage': 'アプリから修正しました',
  };
}

String? validateVideoPost(PostDraft d, {required bool hasVideo, required bool hasThumbnail}) {
  if (d.title.trim().isEmpty) return tr('タイトルを入力してください', 'Enter a title');
  if (d.title.length > maxTitleLength) return tr('タイトルは$maxTitleLength文字以内で入力してください', 'Title must be up to $maxTitleLength characters');
  if (d.caption.length > maxCaptionLength) return tr('キャプションは$maxCaptionLength文字以内で入力してください', 'Caption must be up to $maxCaptionLength characters');
  if (!hasVideo) return tr('動画ファイルを選択してください', 'Please select a video file');
  if (!hasThumbnail) return tr('サムネイルを選んでください', 'Choose a thumbnail');
  if (d.rating == 'R18' || d.rating == 'R18G') return tr('この年齢種別の作品はアプリから編集できません', 'Works with this age rating can\'t be edited in the app');
  return null;
}

class VideoPostApi {
  VideoPostApi._();

  /// 動画の上限を決めるパス（viewer.currentPass.type）
  static Future<String?> passType() async {
    try {
      final data = await Api.query('query AppVideoPass { viewer { id currentPass { id type } } }', cacheFor: const Duration(minutes: 5));
      return data.obj('viewer')?.obj('currentPass')?.strOrNull('type');
    } on ApiException {
      return null;
    }
  }

  static Future<VideoThumbnailUrls> _uploadThumbnail(EncodedImage thumb, String token) async {
    final small = await ImageTools.thumbnail(thumb.bytes, 400, 1200);
    final large = await ImageTools.thumbnail(thumb.bytes, 600, 1600);
    final mainUrl = await Uploader.image(thumb.bytes, thumb.mime, token);
    final smallUrl = await Uploader.image(small.bytes, small.mime, token);
    final largeUrl = await Uploader.image(large.bytes, large.mime, token);
    return VideoThumbnailUrls(
      mainUrl: mainUrl,
      smallUrl: smallUrl,
      smallWidth: small.width,
      smallHeight: small.height,
      largeUrl: largeUrl,
      largeWidth: large.width,
      largeHeight: large.height,
      width: thumb.width,
      height: thumb.height,
      sha256: ImageTools.sha256OfDataUrl(thumb.bytes, thumb.mime),
    );
  }

  static void _dryRun(Map<String, dynamic> input) {
    PostApi.lastDryRunInput = input;
    if (kDebugMode) debugPrint('[post dry run] ${jsonEncode(input)}');
  }

  /// 新規投稿。サムネイル → 動画の順にアップロードしてから作品を作る（Web の use-post-image-submit の動画）
  static Future<String> create(PostDraft d, PickedVideo video, EncodedImage thumbnail, {required void Function(VideoPostPhase phase, double progress) onProgress}) async {
    final token = await Uploader.token();
    onProgress(VideoPostPhase.thumbnail, 0.05);
    final thumbs = await _uploadThumbnail(thumbnail, token);
    onProgress(VideoPostPhase.video, 0.2);
    final uploaded = await VideoUploader.upload(video.path, video.mime, token, onProgress: (v) => onProgress(VideoPostPhase.video, 0.2 + 0.7 * v));
    final input = videoCreateInput(d, thumbs, uploaded, video.durationSeconds);
    onProgress(VideoPostPhase.creating, 0.92);
    if (postDryRun) {
      _dryRun(input);
      onProgress(VideoPostPhase.creating, 1);
      return 'dry-run';
    }
    return PostApi.createWithRetry(input, thumbs.sha256, Future<void>.delayed, (v) => onProgress(VideoPostPhase.creating, v));
  }

  /// 更新。サムネイルを変えたときだけアップロードし直す
  static Future<String> update(EditingWork e, PostDraft d, EncodedImage? newThumbnail, {required void Function(VideoPostPhase phase, double progress) onProgress}) async {
    final w = e.json;
    VideoThumbnailUrls thumbs;
    if (newThumbnail == null) {
      final large = w.str('largeThumbnailImageURL');
      thumbs = VideoThumbnailUrls(
        mainUrl: large,
        smallUrl: w.str('smallThumbnailImageURL'),
        smallWidth: w.integer('smallThumbnailImageWidth'),
        smallHeight: w.integer('smallThumbnailImageHeight'),
        largeUrl: large,
        largeWidth: w.integer('largeThumbnailImageWidth'),
        largeHeight: w.integer('largeThumbnailImageHeight'),
        // Web は元の大きいサムネイルの URL と大きさをそのまま使う
        width: w.integer('largeThumbnailImageWidth'),
        height: w.integer('largeThumbnailImageHeight'),
        sha256: ImageTools.sha256OfText(large),
      );
    } else {
      final token = await Uploader.token();
      onProgress(VideoPostPhase.thumbnail, 0.1);
      thumbs = await _uploadThumbnail(newThumbnail, token);
    }
    final input = videoUpdateInput(e, d, thumbs);
    onProgress(VideoPostPhase.creating, 0.85);
    if (postDryRun) {
      _dryRun(input);
      onProgress(VideoPostPhase.creating, 1);
      return e.id;
    }
    final data = await Api.mutate(r'mutation AppUpdateVideoWork($input: UpdateWorkInput!) { updateWork(input: $input) { id } }', variables: {'input': input});
    onProgress(VideoPostPhase.creating, 1);
    return data.obj('updateWork')!.str('id');
  }
}
