import 'dart:async';
import 'dart:convert';
import 'dart:ui' show DisplayFeature, DisplayFeatureType;

import 'package:aipictors/v2/albums/album_api.dart' show isAllowedInApp;
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/content_translate.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _readerWorkQuery = '''
query AppReaderWork(\$id: ID!) {
  work(id: \$id) {
    id title enTitle type rating isSensitive mdUrl imageURL description enDescription isCaptionBeforeBody
    user { id name }
  }
}''';

/// 作品画面で読み終えている作品の情報と本文（渡すと取り直さずにすぐ開く）
class BookReaderArgs {
  const BookReaderArgs({required this.work, this.markdown});

  final Map<String, dynamic> work;
  final String? markdown;
}

/// 本のように読む画面。Web の読書画面（縦書き・見開き・上下 2 段・書体・配色・しおり）と同じ部品を
/// アプリに入れてあり（assets/book_reader/reader.html。作り方は tool/book_reader/README.md）、
/// 作品の情報と本文はアプリで取って渡す。Web のページは開かないので、通信は本文と挿絵だけ。
/// 見開きにするかどうかは画面の大きさと形から決まり、折りたたみ端末・2 画面の端末（Surface Duo など）は
/// ヒンジの位置をアプリから渡して、左右の画面に 1 ページずつ置く。
/// ノッチ・ホームバーの幅もアプリから渡す（WebView の env(safe-area-inset-*) は端末によって 0 になり、
/// 上のメニューや下のページ数がバーの下に潜って見切れていた）。
class BookReaderScreen extends StatefulWidget {
  const BookReaderScreen({super.key, required this.workId, this.title, this.args});

  final String workId;
  final String? title;
  final BookReaderArgs? args;

  /// localStorage（しおり・続きの位置・設定）を Web の読書画面と同じ場所にするための起点
  static final Uri baseUri = Uri.parse('https://www.aipictors.com/');

  @override
  State<BookReaderScreen> createState() => _BookReaderScreenState();
}

class _BookReaderScreenState extends State<BookReaderScreen> {
  late final WebViewController _controller;

  /// reader.html が読み込まれて AipictorsReader が使えるようになった
  bool _pageLoaded = false;

  /// 本を開き終えた（読み込み中の表示を消す）
  bool _isReady = false;
  bool _opened = false;
  Map<String, dynamic>? _payload;
  String? _error;
  Timer? _giveUp;
  String? _lastInsets;
  String? _lastSegments;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setOnConsoleMessage((m) {
        if (kDebugMode) debugPrint('book reader console: ${m.level.name} ${m.message}');
      })
      ..addJavaScriptChannel('AipictorsApp', onMessageReceived: (message) {
        if (kDebugMode) debugPrint('book reader: ${message.message}');
        if (!mounted) return;
        switch (message.message) {
          case 'loaded':
            _pageLoaded = true;
            _syncLayout(force: true);
            _openIfReady();
          case 'ready':
            _giveUp?.cancel();
            setState(() => _isReady = true);
          case 'close':
            Navigator.of(context).maybePop();
        }
      })
      ..setNavigationDelegate(NavigationDelegate(
        // 本文の中のリンクは読書画面の中では開かず、ブラウザに渡す
        onNavigationRequest: (request) {
          final uri = Uri.tryParse(request.url);
          if (uri == null || !request.isMainFrame) return NavigationDecision.navigate;
          if (uri.scheme == 'about' || uri.scheme == 'data' || uri.toString() == BookReaderScreen.baseUri.toString()) {
            return NavigationDecision.navigate;
          }
          if (uri.scheme == 'http' || uri.scheme == 'https') {
            launchUrl(uri, mode: LaunchMode.externalApplication);
          }
          return NavigationDecision.prevent;
        },
      ));
    _loadPage();
    _loadBook();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 回転・折りたたみの開閉・2 画面への広げ／戻しで、余白とヒンジを渡し直す
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncLayout());
  }

  @override
  void dispose() {
    _giveUp?.cancel();
    super.dispose();
  }

  Future<void> _loadPage() async {
    try {
      final html = await rootBundle.loadString('assets/book_reader/reader.html');
      await _controller.loadHtmlString(html, baseUrl: BookReaderScreen.baseUri.toString());
    } catch (e) {
      debugPrint('book reader: $e');
      if (mounted) setState(() => _error = tr('読書画面を開けませんでした', "Couldn't open the reader"));
    }
  }

  Future<void> _loadBook() async {
    setState(() {
      _error = null;
      _isReady = false;
    });
    _giveUp?.cancel();
    // 知らせが来ないときも操作できるように、しばらくしたら読み込み中の表示を消す
    _giveUp = Timer(const Duration(seconds: 15), () {
      if (mounted && _opened) setState(() => _isReady = true);
    });
    try {
      var work = widget.args?.work;
      if (work == null || !work.containsKey('isCaptionBeforeBody')) {
        final data = await Api.query(_readerWorkQuery, variables: {'id': widget.workId});
        work = data.obj('work');
      }
      if (!mounted) return;
      if (work == null) {
        setState(() => _error = tr('作品を読み込めませんでした', "Couldn't load this work"));
        return;
      }
      final type = work.str('type');
      // R18（Android 版は全年齢以外・センシティブ）は開かない
      if ((type != 'NOVEL' && type != 'COLUMN') || !isAllowedInApp(work)) {
        setState(() => _error = tr('この作品は本のように読めません', "This work can't be opened in the reader"));
        return;
      }
      var markdown = widget.args?.markdown;
      final mdUrl = work.strOrNull('mdUrl');
      if (markdown == null && mdUrl != null) {
        final r = await http.get(Uri.parse(mdUrl)).timeout(const Duration(seconds: 20));
        if (r.statusCode != 200) throw Exception('markdown ${r.statusCode}');
        // 本文の置き場は content-type を返さないので、UTF-8 として読む
        markdown = utf8.decode(r.bodyBytes, allowMalformed: true);
      }
      if (!mounted) return;
      final description = localizedContent(work.str('description'), work.strOrNull('enDescription')).trim();
      _payload = {
        'md': markdown ?? '',
        'title': localizedContent(work.str('title'), work.strOrNull('enTitle')),
        'authorName': work.obj('user')?.strOrNull('name'),
        'coverUrl': work.strOrNull('imageURL'),
        'foreword': work.boolean('isCaptionBeforeBody') && description.isNotEmpty ? description : null,
        'workId': work.str('id').isEmpty ? widget.workId : work.str('id'),
        'workType': type,
        'lang': L10n.isJa ? 'ja' : 'en',
      };
      _openIfReady();
    } catch (e) {
      debugPrint('book reader: $e');
      if (mounted) setState(() => _error = tr('本文を読み込めませんでした', "Couldn't load the text"));
    }
  }

  Future<void> _openIfReady() async {
    final payload = _payload;
    if (!_pageLoaded || payload == null || !mounted) return;
    _opened = true;
    try {
      await _controller.runJavaScript('window.AipictorsReader.open(${jsonEncode(payload)})');
    } catch (e) {
      debugPrint('book reader: $e');
      if (mounted) setState(() => _error = tr('本文を読み込めませんでした', "Couldn't load the text"));
    }
  }

  /// ノッチ・ステータスバー・ホームバーの幅と、折りたたみ・2 画面のヒンジを読書画面に渡す。
  /// 左右の余白（横向きのノッチ）は WebView の外で取るので、ここでは上下だけ渡す
  Future<void> _syncLayout({bool force = false}) async {
    if (!_pageLoaded || !mounted) return;
    final media = MediaQuery.of(context);
    final padding = media.padding;
    final insets = jsonEncode({'top': padding.top, 'right': 0, 'bottom': padding.bottom, 'left': 0});
    final segments = jsonEncode(readerSegments(
      size: media.size,
      left: padding.left,
      right: padding.right,
      features: media.displayFeatures,
    ));
    if (!force && insets == _lastInsets && segments == _lastSegments) return;
    _lastInsets = insets;
    _lastSegments = segments;
    try {
      await _controller.runJavaScript('window.AipictorsReader.setInsets($insets);window.AipictorsReader.setSegments($segments)');
    } catch (e) {
      debugPrint('book reader: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // 読書画面の紙の色に合わせて、開く前・端の色が浮かないようにする
    final paper = isDark ? const Color(0xFF211D18) : const Color(0xFFFBF6EA);
    final ink = isDark ? const Color(0xFFEADFCB) : const Color(0xFF3B2F22);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: paper,
        body: Stack(children: [
          // 上下は端まで使い（余白は読書画面が取る）、左右は横向きのノッチを避ける
          Positioned.fill(
            child: SafeArea(
              top: false,
              bottom: false,
              child: WebViewWidget(controller: _controller),
            ),
          ),
          if (_error != null)
            Positioned.fill(
              child: ColoredBox(
                color: paper,
                child: SafeArea(
                  child: StateView.error(_error!, onRetry: () {
                    _payload = null;
                    _opened = false;
                    if (!_pageLoaded) _loadPage();
                    _loadBook();
                  }),
                ),
              ),
            ),
          if (!_isReady && _error == null)
            Positioned.fill(
              child: ColoredBox(
                color: paper,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2.5, color: ink.withValues(alpha: 0.6))),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      widget.title == null ? tr('本を開いています', 'Opening the book') : tr('「${widget.title}」を開いています', 'Opening "${widget.title}"'),
                      style: TextStyle(color: ink.withValues(alpha: 0.75), fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
              ),
            ),
          // 読み込み中・失敗したときの戻り口（開いたあとは読書画面の「閉じる」を使う）
          if (!_isReady || _error != null)
            Positioned(
              left: MediaQuery.paddingOf(context).left + 6,
              top: MediaQuery.paddingOf(context).top + 6,
              child: _BackChip(onTap: () => Navigator.of(context).maybePop()),
            ),
        ]),
      ),
    );
  }
}

/// 折りたたみ端末・2 画面の端末で、画面を左右に分けるヒンジ（折り目）があれば、
/// Viewport Segments API と同じ形（左右 2 つの範囲。WebView の左端を 0 とする論理ピクセル）にする。
/// 上下に分かれる向き（本を縦に持って横に折る形）や、ヒンジが無ければ null
@visibleForTesting
List<Map<String, double>>? readerSegments({
  required Size size,
  required double left,
  required double right,
  required List<DisplayFeature> features,
}) {
  final width = size.width - left - right;
  for (final feature in features) {
    if (feature.type == DisplayFeatureType.cutout) continue;
    final b = feature.bounds;
    // 縦に画面を貫いていて、左右に分けるもの
    final splitsLeftRight = b.height >= size.height * 0.9 && b.width < size.width * 0.25;
    if (!splitsLeftRight) continue;
    // 折り目は開き切っていても（flat）見開きにする。2 画面のヒンジは常に分かれている
    final start = (b.left - left).clamp(0.0, width);
    final end = (b.right - left).clamp(0.0, width);
    if (start < 120 || width - end < 120) continue;
    return [
      {'x': 0, 'y': 0, 'width': start, 'height': size.height},
      {'x': end, 'y': 0, 'width': width - end, 'height': size.height},
    ];
  }
  return null;
}

class _BackChip extends StatelessWidget {
  const _BackChip({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.55,
      child: Material(
        color: context.cs.surface,
        shape: const CircleBorder(),
        elevation: 1,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Icon(Icons.arrow_back_rounded, size: 20, color: context.cs.onSurface),
          ),
        ),
      ),
    );
  }
}
