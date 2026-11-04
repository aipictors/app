import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:aipictors/v2/core/api.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart' show Rect, Size;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

/// Web の MAX_IMAGE_FILE_SIZE_BYTES と同じ
const maxImageFileBytes = 32 * 1024 * 1024;

/// デバッグで作品・スタンプを作らずに送る内容だけを確かめる（--dart-define=postDryRun=true）
const postDryRun = kDebugMode && bool.fromEnvironment('postDryRun');

/// 縮小した画像
class EncodedImage {
  const EncodedImage(this.bytes, this.mime, this.width, this.height);

  final Uint8List bytes;
  final String mime;
  final int width;
  final int height;
}

/// 画像の読み取り・縮小
class ImageTools {
  ImageTools._();

  static String? _mimeOf(Uint8List b) {
    if (b.length > 8 && b[0] == 0x89 && b[1] == 0x50 && b[2] == 0x4E && b[3] == 0x47) return 'image/png';
    if (b.length > 3 && b[0] == 0xFF && b[1] == 0xD8) return 'image/jpeg';
    if (b.length > 12 && b[0] == 0x52 && b[1] == 0x49 && b[8] == 0x57 && b[9] == 0x45) return 'image/webp';
    return null;
  }

  static Future<(int, int)> sizeOf(Uint8List bytes) async {
    final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
    final descriptor = await ui.ImageDescriptor.encoded(buffer);
    final size = (descriptor.width, descriptor.height);
    descriptor.dispose();
    buffer.dispose();
    return size;
  }

  /// アップロードできる形式にそろえる（HEIC などは PNG にする）
  static Future<EncodedImage> normalize(Uint8List bytes) async {
    if (bytes.length > maxImageFileBytes) {
      throw const ApiException('32MB 以内の画像を選んでください');
    }
    try {
      final mime = _mimeOf(bytes);
      if (mime != null) {
        final (w, h) = await sizeOf(bytes);
        return EncodedImage(bytes, mime, w, h);
      }
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final png = await frame.image.toByteData(format: ui.ImageByteFormat.png);
      final result = EncodedImage(png!.buffer.asUint8List(), 'image/png', frame.image.width, frame.image.height);
      frame.image.dispose();
      codec.dispose();
      return result;
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException('この画像は読み込めませんでした');
    }
  }

  /// 一覧用サムネイル。短い辺 [shortSide]、長い辺は [maxLongSide] まで。元より大きくしない（Web の resizeThumbnail）
  static Future<EncodedImage> thumbnail(Uint8List bytes, int shortSide, int maxLongSide) async {
    final (w, h) = await sizeOf(bytes);
    final long = w >= h ? w : h;
    final short = w >= h ? h : w;
    final scale = [1.0, shortSide / short, maxLongSide / long].reduce((a, b) => a < b ? a : b);
    return resizeJpeg(bytes, (w * scale).round().clamp(1, 1 << 16));
  }

  /// 幅 [width] の JPEG にする。透過は白で埋める
  static Future<EncodedImage> resizeJpeg(Uint8List bytes, int width) async {
    final (w, h) = await sizeOf(bytes);
    final height = (h / w * width).round().clamp(1, 1 << 16);
    final codec = await ui.instantiateImageCodec(bytes, targetWidth: width, targetHeight: height);
    final frame = await codec.getNextFrame();
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    canvas.drawColor(const ui.Color(0xFFFFFFFF), ui.BlendMode.src);
    canvas.drawImage(frame.image, ui.Offset.zero, ui.Paint()..filterQuality = ui.FilterQuality.high);
    final flat = await recorder.endRecording().toImage(width, height);
    final raw = await flat.toByteData(format: ui.ImageByteFormat.rawRgba);
    flat.dispose();
    frame.image.dispose();
    codec.dispose();
    final jpeg = await compute(_encodeJpeg, _RawImage(raw!.buffer.asUint8List(), width, height));
    return EncodedImage(jpeg, 'image/jpeg', width, height);
  }

  /// [source] の [crop] の範囲を [size] 四方の透過 PNG にする（スタンプ用）
  static Future<EncodedImage> cropToSquarePng(Uint8List source, Rect crop, int size) async {
    final codec = await ui.instantiateImageCodec(source);
    final frame = await codec.getNextFrame();
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    canvas.drawImageRect(
      frame.image,
      crop,
      Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
      ui.Paint()..filterQuality = ui.FilterQuality.high,
    );
    final out = await recorder.endRecording().toImage(size, size);
    final png = await out.toByteData(format: ui.ImageByteFormat.png);
    out.dispose();
    frame.image.dispose();
    codec.dispose();
    return EncodedImage(png!.buffer.asUint8List(), 'image/png', size, size);
  }

  /// Web の sha256(base64) と同じ値（data URL の文字列を UTF-8 でハッシュする）
  static String sha256OfDataUrl(Uint8List bytes, String mime) {
    return sha256.convert(utf8.encode('data:$mime;base64,${base64Encode(bytes)}')).toString();
  }

  static String sha256OfText(String text) => sha256.convert(utf8.encode(text)).toString();

  /// PNG の parameters（AUTOMATIC1111 形式）から生成情報を読む。無ければ null
  static GenerationParams? readGenerationParams(Uint8List b) {
    if (_mimeOf(b) != 'image/png') return null;
    var i = 8;
    while (i + 8 < b.length) {
      final data = ByteData.sublistView(b, i);
      final length = data.getUint32(0);
      final type = String.fromCharCodes(b.sublist(i + 4, i + 8));
      if (type == 'IDAT' || type == 'IEND' || i + 8 + length > b.length) return null;
      if (type == 'tEXt' || type == 'iTXt') {
        final chunk = b.sublist(i + 8, i + 8 + length);
        final zero = chunk.indexOf(0);
        if (zero > 0 && String.fromCharCodes(chunk.sublist(0, zero)) == 'parameters') {
          var start = zero + 1;
          if (type == 'iTXt') {
            // 圧縮フラグ・方式・言語タグ・翻訳キーワードを飛ばす
            if (chunk[start] != 0) return null;
            start += 2;
            start = chunk.indexOf(0, start) + 1;
            start = chunk.indexOf(0, start) + 1;
          }
          return GenerationParams.parse(utf8.decode(chunk.sublist(start), allowMalformed: true));
        }
      }
      i += 12 + length;
    }
    return null;
  }
}

class _RawImage {
  const _RawImage(this.rgba, this.width, this.height);

  final Uint8List rgba;
  final int width;
  final int height;
}

Uint8List _encodeJpeg(_RawImage raw) {
  final image = img.Image.fromBytes(
    width: raw.width,
    height: raw.height,
    bytes: raw.rgba.buffer,
    numChannels: 4,
    order: img.ChannelOrder.rgba,
  );
  return img.encodeJpg(image, quality: 88);
}

/// 画像に埋め込まれた生成情報
class GenerationParams {
  GenerationParams({this.prompt, this.negativePrompt, this.seed, this.steps, this.sampler, this.model, this.modelHash, required this.source});

  final String? prompt;
  final String? negativePrompt;
  final String? seed;
  final String? steps;
  final String? sampler;
  final String? model;
  final String? modelHash;
  final String source;

  static GenerationParams? parse(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return null;
    final lines = trimmed.split('\n');
    final lastIsParams = lines.last.startsWith('Steps:');
    final body = lastIsParams ? lines.sublist(0, lines.length - 1) : lines;
    final at = body.indexWhere((l) => l.startsWith('Negative prompt:'));
    final prompt = (at < 0 ? body : body.sublist(0, at)).join('\n').trim();
    final negative = at < 0 ? null : body.sublist(at).join('\n').replaceFirst('Negative prompt:', '').trim();
    final values = <String, String>{};
    if (lastIsParams) {
      for (final part in lines.last.split(', ')) {
        final colon = part.indexOf(':');
        if (colon > 0) values[part.substring(0, colon).trim()] = part.substring(colon + 1).trim();
      }
    }
    return GenerationParams(
      prompt: prompt.isEmpty ? null : prompt,
      negativePrompt: negative == null || negative.isEmpty ? null : negative,
      seed: values['Seed'],
      steps: values['Steps'],
      sampler: values['Sampler'],
      model: values['Model'],
      modelHash: values['Model hash'],
      source: trimmed,
    );
  }
}

/// Web の app/utils/upload-public-image.ts と同じアップロード
class Uploader {
  Uploader._();

  static const _imageEndpoint = 'https://uploader.aipictors.com/';
  static const _textEndpoint = 'https://text-uploader.aipictors.com/';
  static final _client = http.Client();

  /// アップロード用のトークン（viewer.token）
  static Future<String> token() async {
    final data = await Api.query('query AppViewerToken { viewer { id token } }');
    final token = data.obj('viewer')?.strOrNull('token');
    if (token == null) throw const ApiException('ログイン情報を取得できませんでした。ログインし直してください');
    return token;
  }

  static int _dryRunCount = 0;

  static Future<String> image(Uint8List bytes, String mime, String token) async {
    if (postDryRun) return 'https://dry-run.invalid/${_dryRunCount++}-${bytes.length}.${mime.split('/').last}';
    return _put(Uri.parse(_imageEndpoint), bytes, mime, token, '画像');
  }

  /// 本文（Markdown）のアップロード。[existingUrl] を渡すと同じファイルを上書きする
  static Future<String> text(String text, String extension, String token, {String? existingUrl}) async {
    if (postDryRun) return 'https://dry-run.invalid/${_dryRunCount++}.$extension';
    final fileId = existingUrl?.split('/').last ?? _randomId();
    final mime = extension == 'md' ? 'text/markdown' : 'text/plain';
    return _put(
      Uri.parse(_textEndpoint).replace(queryParameters: {'fileid': fileId}),
      Uint8List.fromList(utf8.encode(text)),
      mime,
      token,
      '本文',
    );
  }

  static String _randomId() {
    final now = DateTime.now().microsecondsSinceEpoch;
    return sha256.convert(utf8.encode('$now')).toString().substring(0, 32);
  }

  static Future<String> _put(Uri url, Uint8List bytes, String mime, String token, String label) async {
    // モバイルの回線は揺れるので、通信の失敗は 1 回だけやり直す
    for (var attempt = 0;; attempt++) {
      try {
        final res = await _client
            .put(url, headers: {'Authorization': 'Bearer $token', 'Content-Type': mime}, body: bytes)
            .timeout(const Duration(seconds: 90));
        final json = res.body.isEmpty ? null : jsonDecode(utf8.decode(res.bodyBytes));
        if (res.statusCode >= 200 && res.statusCode < 300) {
          final url = json is Map && json['data'] is Map ? json['data']['url'] : null;
          if (url is String && url.isNotEmpty) return url;
          throw ApiException('$labelのアップロードに失敗しました');
        }
        final error = json is Map ? json['error'] : null;
        throw ApiException(error is String && error.isNotEmpty ? error : '$labelのアップロードに失敗しました');
      } on ApiException {
        rethrow;
      } on FormatException {
        throw ApiException('$labelのアップロードに失敗しました');
      } catch (e) {
        if (attempt == 0 && (e is SocketException || e is http.ClientException)) continue;
        throw ApiException('$labelのアップロードがタイムアウトしました。通信環境を確認してもう一度お試しください');
      }
    }
  }
}

/// [Size] を画面の計算に使うための小さな助け
extension SizeOfImage on EncodedImage {
  Size get size => Size(width.toDouble(), height.toDouble());
}
