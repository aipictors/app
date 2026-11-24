import 'package:aipictors/v2/post/post_api.dart';
import 'package:aipictors/v2/post/video_post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

void main() {
  group('上限（Web の getVideoUploadLimits と同じ）', () {
    test('サブスク加入は 1 本 60 秒・1 日 180 秒、ほかは 30 秒・60 秒', () {
      for (final t in ['LITE', 'STANDARD', 'PREMIUM']) {
        final l = VideoUploadLimits.of(t);
        expect((l.isSubscribed, l.maxDurationSeconds, l.dailyTotalDurationSeconds), (true, 60, 180));
      }
      for (final t in [null, 'TWO_DAYS', 'FREE']) {
        final l = VideoUploadLimits.of(t);
        expect((l.isSubscribed, l.maxDurationSeconds, l.dailyTotalDurationSeconds), (false, 30, 60));
      }
    });

    test('ファイルは 32MB まで', () => expect(maxVideoFileBytes, 32 * 1024 * 1024));
  });

  group('選んだ時点の判定', () {
    final free = VideoUploadLimits.of(null);
    String? check(String path, int bytes, int ms) => videoPickError(path: path, bytes: bytes, duration: Duration(milliseconds: ms), limits: free);

    test('MP4・MOV は通し、ほかは形式で弾く', () {
      expect(check('/a/b.mp4', 1000, 5000), isNull);
      expect(check('/a/b.MOV', 1000, 5000), isNull);
      expect(check('/a/b.m4v', 1000, 5000), isNull);
      expect(check('/a/b.webm', 1000, 5000), contains('MP4'));
      expect(videoMimeOf('x.MP4'), 'video/mp4');
      expect(videoMimeOf('x.mov'), 'video/quicktime');
    });

    test('大きさの上限を超えると、その動画の大きさと上限を伝える', () {
      expect(check('a.mp4', maxVideoFileBytes, 5000), isNull);
      final e = check('a.mp4', 40 * 1024 * 1024, 5000)!;
      expect(e, contains('40MB'));
      expect(e, contains('32MB'));
    });

    test('長さはちょうど上限まで通し、超えると長さと上限を伝える', () {
      expect(check('a.mp4', 1, 30000), isNull);
      final e = check('a.mp4', 1, 30400)!;
      expect(e, contains('30.4'));
      expect(e, contains('30'));
      expect(videoPickError(path: 'a.mp4', bytes: 1, duration: const Duration(seconds: 45), limits: VideoUploadLimits.of('STANDARD')), isNull);
    });

    test('長さが読めない動画は弾く', () => expect(check('a.mp4', 1, 0), isNotNull));

    test('送る秒数は切り上げ（Web の Math.ceil）', () {
      expect(videoDurationSecondsOf(const Duration(milliseconds: 12001)), 13);
      expect(videoDurationSecondsOf(const Duration(seconds: 12)), 12);
    });
  });

  group('サムネイルのコマ', () {
    test('帯のコマは先頭から終わりの少し手前まで等間隔', () {
      final t = stripFrameTimes(const Duration(milliseconds: 10100), 11);
      expect(t.length, 11);
      expect(t.first, Duration.zero);
      expect(t.last, const Duration(seconds: 10));
      expect(t[5], const Duration(seconds: 5));
      expect(stripFrameTimes(Duration.zero, 10), isEmpty);
    });

    test('最初は 真ん中 → 1/4 → 3/4 → 先頭付近 の順に試す（Web と同じ）', () {
      expect(initialThumbnailTimes(const Duration(seconds: 20)).map((d) => d.inMilliseconds), [10000, 5000, 15000, 1000]);
    });

    test('ほぼ真っ黒なコマを見分ける', () {
      final black = img.Image(width: 64, height: 64);
      expect(isAlmostBlackImage(black), isTrue);
      final gray = img.Image(width: 64, height: 64)..clear(img.ColorRgb8(40, 40, 40));
      expect(isAlmostBlackImage(gray), isFalse);
    });
  });

  test('Cloudflare Stream の URL は HLS にして再生する', () {
    expect(playableVideoUrl('https://iframe.videodelivery.net/abc'), 'https://iframe.videodelivery.net/abc/manifest/video.m3u8');
    expect(playableVideoUrl('https://example.com/a.mp4'), 'https://example.com/a.mp4');
  });

  const thumbs = VideoThumbnailUrls(
    mainUrl: 'https://img/main.png',
    smallUrl: 'https://img/s.jpg',
    smallWidth: 400,
    smallHeight: 711,
    largeUrl: 'https://img/l.jpg',
    largeWidth: 600,
    largeHeight: 1067,
    width: 1080,
    height: 1920,
    sha256: 'hash',
  );

  test('新規投稿の input は Web の toVideoWorkInput と同じ項目', () {
    final d = PostDraft()
      ..title = ' 動画 '
      ..tags = ['a']
      ..prompt = '送らない'
      ..workType = 'VIDEO';
    final input = videoCreateInput(d, thumbs, const UploadedVideo('https://iframe.videodelivery.net/u1', 'u1'), 13);
    expect(input['title'], '動画');
    expect(input['type'], 'WORK');
    expect(input['rating'], 'G');
    expect(input['prompt'], isNull);
    expect(input['pngInfo'], isNull);
    expect(input['imageUrls'], ['https://img/main.png']);
    expect(input['videoUrl'], 'https://iframe.videodelivery.net/u1');
    expect(input['streamUid'], 'u1');
    expect(input['videoDurationSeconds'], 13);
    expect(input['mainImageSha256'], 'hash');
    expect((input['imageWidth'], input['imageHeight']), (1080, 1920));
    expect(input['accessGenerationType'], 'PUBLIC');
    expect(input.containsKey('isBotGradingEnabled'), isFalse);
  });

  test('更新の input は動画・テイストを元のまま、type は VIDEO（Web の animation.edit）', () {
    final e = EditingWork({
      'id': '9',
      'style': 'REAL',
      'url': 'https://iframe.videodelivery.net/u9',
      'streamUid': 'u9',
      'largeThumbnailImageURL': 'https://img/l.jpg',
      'thumbnailImagePosition': 12,
      'ogpThumbnailImageUrl': null,
      'enTitle': 'en',
      'enDescription': '',
      'moderatorReport': {'status': 'UNHANDLED'},
    });
    final d = PostDraft()
      ..title = 't'
      ..imageStyle = 'ILLUSTRATION'
      ..workType = 'VIDEO';
    final input = videoUpdateInput(e, d, thumbs);
    expect(input['id'], '9');
    expect(input['type'], 'VIDEO');
    expect(input['imageStyle'], 'REAL');
    expect(input['videoUrl'], 'https://iframe.videodelivery.net/u9');
    expect(input['streamUid'], 'u9');
    expect(input['imageUrls'], ['https://img/l.jpg']);
    expect(input['thumbnailPosition'], 12);
    expect(input['entitle'], 'en');
    expect(input['correctionMessage'], isNotNull);
  });

  test('必須の確認（タイトル → 動画 → サムネイル）', () {
    final d = PostDraft()..workType = 'VIDEO';
    expect(validateVideoPost(d, hasVideo: true, hasThumbnail: true), isNotNull);
    d.title = 't';
    expect(validateVideoPost(d, hasVideo: false, hasThumbnail: false), contains('動画'));
    expect(validateVideoPost(d, hasVideo: true, hasThumbnail: false), contains('サムネイル'));
    expect(validateVideoPost(d, hasVideo: true, hasThumbnail: true), isNull);
    d.rating = 'R18';
    expect(validateVideoPost(d, hasVideo: true, hasThumbnail: true), isNotNull);
  });
}
