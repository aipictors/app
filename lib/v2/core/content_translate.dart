import 'dart:async';
import 'dart:convert';

import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// 漢字・かなを含むか（Web の comment-auto-translate.ts と同じ範囲）
final _japanese = RegExp('[぀-ヿ㐀-䶿一-鿿]');

bool hasJapanese(String? text) => text != null && _japanese.hasMatch(text);

/// 作品のタイトル・キャプションなど。英語表示で英語欄があればそれ、無ければ元の文。日本語表示は元の文のまま
String localizedContent(String ja, String? en) {
  if (L10n.isJa) return ja;
  final e = en?.trim() ?? '';
  return e.isNotEmpty ? e : ja;
}

/// 英語表示のときに自動で翻訳する文か（日本語表示・漢字かなの無い文は訳さない）
bool shouldAutoTranslate(String? text) => !L10n.isJa && hasJapanese(text) && text!.trim().isNotEmpty;

/// 表示した文をその場で英語にする。Web の翻訳ボタン・コメントの自動翻訳と同じ Google Apps Script（無料、
/// サイト全体で 1 日の回数に上限がある）を使い、近いタイミングの文は 1 回にまとめ、同じ文は端末に覚えて二度訳さない。
/// 訳せなければ null（元の文を出す）
class ContentTranslator {
  ContentTranslator({http.Client? client, this.persist = true}) : _client = client;

  static ContentTranslator instance = ContentTranslator();

  static const endpoint =
      'https://script.google.com/macros/s/AKfycbw1D0NqYxBiJvN00CZLCnoDIpWtK_cib_JDY7sva_Mlwr-XVjabRSWDooBBvVlgZUPU/exec';
  static const _separator = '\n§§§\n';

  /// URL に入る長さ（日本語は 1 文字 9 バイトになる）。これより長い文は訳さない
  static const maxEncodedLength = 8000;

  /// 起動中に翻訳する数の上限（サイト全体で 1 日の回数に上限があるため）
  static const maxTextsPerSession = 300;

  /// 端末に覚えておく数
  static const _maxStored = 400;
  static const _prefsKey = 'v2_content_translations';

  final http.Client? _client;
  final bool persist;

  final Map<String, Future<String?>> _cache = {};
  Map<String, String>? _stored;
  final List<(String, Completer<String?>)> _pending = [];
  Timer? _timer;
  int _requested = 0;

  /// 前に訳したもの（すぐ出せるときだけ。無ければ null）
  String? cached(String text) => _stored?[text];

  Future<String?> translate(String text) {
    final key = text.trim();
    if (!hasJapanese(key)) return Future.value(null);
    final hit = _cache[key];
    if (hit != null) return hit;
    final future = _lookup(key);
    _cache[key] = future;
    return future;
  }

  Future<String?> _lookup(String text) async {
    final stored = await _loadStored();
    final s = stored[text];
    if (s != null) return s;
    if (_requested >= maxTextsPerSession || Uri.encodeQueryComponent(text).length > maxEncodedLength) return null;
    _requested++;
    final completer = Completer<String?>();
    _pending.add((text, completer));
    _timer ??= Timer(const Duration(milliseconds: 80), _flush);
    final result = await completer.future;
    if (result == null) _cache.remove(text); // 失敗は覚えない（次に開いたときにもう一度）
    return result;
  }

  Future<Map<String, String>> _loadStored() async {
    final s = _stored;
    if (s != null) return s;
    final map = <String, String>{};
    if (persist) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final raw = prefs.getString(_prefsKey);
        if (raw != null) {
          (jsonDecode(raw) as Map<String, dynamic>).forEach((k, v) {
            if (v is String) map[k] = v;
          });
        }
      } catch (_) {}
    }
    return _stored ??= map;
  }

  Future<void> _save(Map<String, String> added) async {
    final stored = await _loadStored();
    for (final e in added.entries) {
      stored.remove(e.key);
      stored[e.key] = e.value;
    }
    while (stored.length > _maxStored) {
      stored.remove(stored.keys.first);
    }
    if (!persist) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, jsonEncode(stored));
    } catch (_) {}
  }

  void _flush() {
    _timer = null;
    final items = List.of(_pending);
    _pending.clear();
    var batch = <(String, Completer<String?>)>[];
    var length = 0;
    for (final item in items) {
      final itemLength = Uri.encodeQueryComponent(item.$1).length;
      if (batch.isNotEmpty && length + itemLength > maxEncodedLength) {
        unawaited(_translateBatch(batch));
        batch = [];
        length = 0;
      }
      batch.add(item);
      length += itemLength + 30;
    }
    if (batch.isNotEmpty) unawaited(_translateBatch(batch));
  }

  /// まとめて 1 回で訳す。区切りの数が合わなければ全部 null（元の文のまま）
  Future<void> _translateBatch(List<(String, Completer<String?>)> batch) async {
    List<String>? parts;
    try {
      final uri = Uri.parse(endpoint).replace(queryParameters: {
        'text': batch.map((e) => e.$1).join(_separator),
        'source': 'ja',
        'target': 'en',
      });
      final get = _client?.get ?? http.get;
      final res = await get(uri, headers: {'User-Agent': 'Mozilla/5.0'}).timeout(const Duration(seconds: 20));
      if (res.statusCode == 200) {
        final data = jsonDecode(utf8.decode(res.bodyBytes));
        if (data is Map && data['code'] == 200 && data['text'] is String) {
          final split = (data['text'] as String).split(RegExp(r'\s*§§§\s*')).map((e) => e.trim()).toList();
          if (split.length == batch.length && split.every((e) => e.isNotEmpty)) parts = split;
        }
      }
    } catch (_) {}
    final added = <String, String>{};
    for (var i = 0; i < batch.length; i++) {
      final value = parts?[i];
      if (value != null) added[batch[i].$1] = value;
      batch[i].$2.complete(value);
    }
    if (added.isNotEmpty) await _save(added);
  }
}

/// 英語表示のとき、日本語の文を自動で英語にして出す。訳したものには小さく「Translated · Show original」。
/// 日本語表示・日本語を含まない文・訳せなかった文は、[original] をそのまま出す
class AutoTranslatedText extends StatefulWidget {
  const AutoTranslatedText(this.original, {super.key, required this.builder, this.translator, this.showLabel = true});

  final String original;

  /// 出す文から中身を作る（SelectableText や「続きを読む」付きなど、呼ぶ側の見た目のまま）
  final Widget Function(BuildContext context, String text) builder;

  final ContentTranslator? translator;

  /// 「Translated · Show original」を出すか（見出しのバーなど狭い所は出さない）
  final bool showLabel;

  @override
  State<AutoTranslatedText> createState() => _AutoTranslatedTextState();
}

class _AutoTranslatedTextState extends State<AutoTranslatedText> {
  String? _translated;
  bool _showOriginal = false;

  ContentTranslator get _translator => widget.translator ?? ContentTranslator.instance;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void didUpdateWidget(AutoTranslatedText old) {
    super.didUpdateWidget(old);
    if (old.original != widget.original) {
      _translated = null;
      _showOriginal = false;
      _start();
    }
  }

  void _start() {
    final text = widget.original;
    if (!shouldAutoTranslate(text)) return;
    _translated = _translator.cached(text.trim());
    if (_translated != null) return;
    _translator.translate(text).then((value) {
      if (mounted && value != null && widget.original == text) setState(() => _translated = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final translated = _translated;
    if (translated == null) return widget.builder(context, widget.original);
    if (!widget.showLabel) return widget.builder(context, translated);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      widget.builder(context, _showOriginal ? widget.original : translated),
      const SizedBox(height: 3),
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _showOriginal = !_showOriginal),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.translate_rounded, size: 12, color: context.muted),
            const SizedBox(width: 3),
            Text(
              _showOriginal ? 'Original · Show translation' : 'Translated · Show original',
              style: TextStyle(fontSize: 11, color: context.muted, fontWeight: FontWeight.w600),
            ),
          ]),
        ),
      ),
    ]);
  }
}
