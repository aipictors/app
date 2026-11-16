import 'dart:async';

import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 本のように読む画面。Web と同じ読み方（縦書き・見開き・上下 2 段・書体・配色・しおり）を
/// そのまま使えるように、Web の読書画面を全画面で開く。
/// 見開きにするかどうかは画面の大きさと形から決まるので、折りたたみ端末やタブレットでも同じように読める。
/// 作品ページではなく読書画面だけのページ（/posts/:id/reader）を開くので、作品ページの読み込みを待たない。
class BookReaderScreen extends StatefulWidget {
  const BookReaderScreen({super.key, required this.workId, this.title});

  final String workId;
  final String? title;

  static Uri uriOf(String workId) =>
      Uri.parse('https://www.aipictors.com/posts/$workId/reader?app=1');

  @override
  State<BookReaderScreen> createState() => _BookReaderScreenState();
}

class _BookReaderScreenState extends State<BookReaderScreen> {
  late final WebViewController _controller;
  bool _isReady = false;
  String? _error;
  Timer? _giveUp;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      // 読書画面の「閉じる」とつながる（Web 側は app=1 のときだけ送る）
      ..addJavaScriptChannel('AipictorsApp', onMessageReceived: (message) {
        if (!mounted) return;
        if (message.message == 'ready') {
          setState(() => _isReady = true);
          return;
        }
        if (message.message == 'close') Navigator.of(context).maybePop();
      })
      ..setNavigationDelegate(NavigationDelegate(
        onWebResourceError: (error) {
          // 本文の画像などの失敗では閉じない。最初のページが開けなかったときだけ知らせる
          if (!mounted || !error.isForMainFrame!) return;
          setState(() => _error = tr('うまく読み込めませんでした', "Couldn't load"));
        },
      ))
      ..loadRequest(BookReaderScreen.uriOf(widget.workId));
    // 知らせが来ないときも操作できるように、しばらくしたら読み込み中の表示を消す
    _giveUp = Timer(const Duration(seconds: 12), () {
      if (mounted) setState(() => _isReady = true);
    });
  }

  @override
  void dispose() {
    _giveUp?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cs.surface,
      // ステータスバー・ホームバーの下に読書画面のメニューが潜って押せなくならないように、安全な範囲に置く
      body: Stack(children: [
        Positioned.fill(child: SafeArea(child: WebViewWidget(controller: _controller))),
        if (_error != null)
          Positioned.fill(
            child: ColoredBox(
              color: context.cs.surface,
              child: StateView.error(_error!, onRetry: () {
                setState(() => _error = null);
                _controller.loadRequest(BookReaderScreen.uriOf(widget.workId));
              }),
            ),
          ),
        if (!_isReady && _error == null)
          Positioned.fill(
            child: ColoredBox(
              color: context.cs.surface,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2.5)),
                const SizedBox(height: 14),
                Text(
                  widget.title == null ? tr('本を開いています', 'Opening the book') : tr('「${widget.title}」を開いています', 'Opening "${widget.title}"'),
                  style: TextStyle(color: context.muted, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
          ),
        // 読み込み中・失敗したときの戻り口（開いたあとは読書画面の「閉じる」に重なるので出さない）
        if (!_isReady || _error != null)
          Positioned(
            left: 6,
            top: MediaQuery.paddingOf(context).top + 6,
            child: _BackChip(onTap: () => Navigator.of(context).maybePop()),
          ),
      ]),
    );
  }
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
