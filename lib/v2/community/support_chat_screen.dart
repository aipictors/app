import 'dart:convert';

import 'package:aipictors/v2/community/app_markdown.dart';
import 'package:aipictors/v2/community/messages_screen.dart' show mockSend;
import 'package:aipictors/v2/community/web_links.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// お問い合わせの API（Web と同じ。有人の窓口はないので解決しなければ Discord を案内する）
class _SupportApi {
  static Future<Map<String, dynamic>> call(String op, Map<String, dynamic> body) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final res = await http
        .post(
          Uri.parse('https://www.aipictors.com/api/support/$op'),
          headers: {'content-type': 'application/json', if (token != null) 'authorization': 'Bearer $token'},
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 90));
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final data = json is Map ? json['data'] : null;
    if (res.statusCode != 200 || data is! Map) {
      final error = json is Map ? json['error'] : null;
      throw ApiException(error is String ? error : '通信に失敗しました');
    }
    return Map<String, dynamic>.from(data);
  }
}

/// お問い合わせ（AI）
class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  // アプリの中で解決できる相談だけを置く（カードや解約は Web の決済の話になるので出さない）
  static const _topics = [
    '感謝コインや継続ボーナスが届いていません',
    '画像の生成が失敗する・終わらない',
    '作品を投稿できません',
    'ログインできない・アカウントが別になった',
    '退会（アカウント削除）したい',
    '不快な作品を通報したい',
  ];

  final _input = TextEditingController();
  final _scroll = ScrollController();
  Map<String, dynamic>? _ticket;
  List<Map<String, dynamic>> _messages = [];
  bool _loading = true;
  bool _sending = false;
  String? _pending;
  String? _error;

  bool get _resolved => _ticket?.str('status') == 'resolved';

  @override
  void initState() {
    super.initState();
    if (Nav.isLoggedIn) {
      _load();
    } else {
      _loading = false;
    }
  }

  @override
  void dispose() {
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _toMessages(dynamic v) => v is List ? v.whereType<Map>().map((m) => Map<String, dynamic>.from(m)).toList() : [];

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await _SupportApi.call('thread', {});
      if (!mounted) return;
      setState(() {
        _ticket = data.obj('ticket');
        _messages = _toMessages(data['messages']);
        _loading = false;
      });
      _toBottom();
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = e.message;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = '通信に失敗しました';
        });
      }
    }
  }

  void _toBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) _scroll.jumpTo(_scroll.position.maxScrollExtent);
    });
  }

  Future<void> _send(String text) async {
    final body = text.trim();
    if (body.isEmpty || _sending) return;
    setState(() {
      _sending = true;
      _pending = body;
    });
    _input.clear();
    _toBottom();
    try {
      if (mockSend) {
        await Future<void>.delayed(const Duration(milliseconds: 500));
        final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        setState(() {
          _messages = [
            ..._messages,
            {'id': 'u$now', 'role': 'user', 'body': body, 'createdAt': now},
            {'id': 'a$now', 'role': 'ai', 'body': 'デバッグ中なので送信していません。**本番では AI の回答**がここに出ます。\n\n- [プラン](https://www.aipictors.com/plus)\n- [ヘルプ](https://www.aipictors.com/help)', 'createdAt': now},
          ];
        });
      } else {
        final data = await _SupportApi.call('messages', {
          'body': body,
          if (_ticket != null && !_resolved) 'ticketId': _ticket!.str('id'),
          'newTicket': false,
        });
        final same = _ticket?.str('id') == data.obj('ticket')?.str('id');
        setState(() {
          _ticket = data.obj('ticket');
          _messages = [if (same) ..._messages, ..._toMessages(data['messages'])];
        });
      }
    } on ApiException catch (e) {
      if (mounted) {
        context.toast(e.message, error: true);
        _input.text = body;
      }
    } catch (_) {
      if (mounted) {
        context.toast('通信に失敗しました', error: true);
        _input.text = body;
      }
    } finally {
      if (mounted) {
        setState(() {
          _sending = false;
          _pending = null;
        });
        _toBottom();
      }
    }
  }

  Future<void> _resolve() async {
    final id = _ticket?.str('id');
    if (id == null) return;
    try {
      if (mockSend) {
        setState(() => _ticket = {..._ticket!, 'status': 'resolved'});
        return;
      }
      final data = await _SupportApi.call('resolve', {'ticketId': id});
      if (mounted) setState(() => _ticket = data.obj('ticket') ?? _ticket);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Nav.isLoggedIn) {
      return Scaffold(
        appBar: AppBar(title: const Text('お問い合わせ')),
        body: LoginRequiredView(
          icon: Icons.support_agent_rounded,
          title: 'ログインするとお問い合わせできます',
          message: 'ログインできないときは Discord で相談してください。',
          onLogin: () => Nav.login(context),
        ),
      );
    }
    final showWelcome = !_loading && _error == null && (_messages.isEmpty || _resolved);
    return Scaffold(
      appBar: AppBar(
        title: const Text('お問い合わせ', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          if (_ticket != null && !_resolved && _messages.isNotEmpty) TextButton(onPressed: _resolve, child: const Text('解決した')),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: _loading
              ? const SkeletonList(count: 5)
              : _error != null
                  ? StateView.error(_error!, onRetry: _load)
                  : ListView(controller: _scroll, padding: const EdgeInsets.all(Ds.s12), children: [
                      for (final m in _messages) _SupportBubble(message: m),
                      if (_pending != null) ...[
                        _SupportBubble(message: {'role': 'user', 'body': _pending}),
                        const Padding(padding: EdgeInsets.all(Ds.s12), child: Align(alignment: Alignment.centerLeft, child: CircularProgressIndicator.adaptive())),
                      ],
                      if (showWelcome) ...[
                        const SizedBox(height: Ds.s8),
                        const Text('AI がお答えします。', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                        const SizedBox(height: Ds.s4),
                        Text('有人の窓口はありません。AI で解決できないときは Discord で相談してください。', style: TextStyle(color: context.muted, height: 1.5)),
                        const SizedBox(height: Ds.s12),
                        for (final t in _topics)
                          Padding(
                            padding: const EdgeInsets.only(bottom: Ds.s8),
                            child: SecondaryButton(label: t, onPressed: () => _send(t)),
                          ),
                      ],
                      const SizedBox(height: Ds.s8),
                      Center(
                        child: TextButton.icon(
                          onPressed: () => WebLinks.open(context, WebLinks.discordInvite),
                          icon: const Icon(Icons.forum_outlined, size: 18),
                          label: const Text('Discord で相談する'),
                        ),
                      ),
                    ]),
        ),
        SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(Ds.s12, Ds.s8, Ds.s8, Ds.s8),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: context.hairline))),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: _input,
                  minLines: 1,
                  maxLines: 5,
                  maxLength: 4000,
                  buildCounter: (_, {required currentLength, required isFocused, maxLength}) => null,
                  decoration: const InputDecoration(hintText: '相談したいことを入力', border: InputBorder.none, isDense: true),
                ),
              ),
              IconButton(
                tooltip: '送信',
                onPressed: _sending ? null : () => _send(_input.text),
                icon: Icon(Icons.send_rounded, color: context.cs.primary),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _SupportBubble extends StatelessWidget {
  const _SupportBubble({required this.message});

  final Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    final role = message.str('role');
    if (role == 'system') {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Ds.s8),
        child: Center(child: Text(message.str('body'), textAlign: TextAlign.center, style: TextStyle(color: context.muted, fontSize: 12))),
      );
    }
    final mine = role == 'user';
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.84),
        margin: const EdgeInsets.symmetric(vertical: Ds.s4),
        padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: Ds.s8),
        decoration: BoxDecoration(
          color: mine ? context.cs.primary : context.surfaceCard,
          borderRadius: Ds.br(16),
          border: mine ? null : Border.all(color: context.hairline),
        ),
        child: mine
            ? SelectableText(message.str('body'), style: TextStyle(color: context.cs.onPrimary, height: 1.45))
            : AppMarkdown(message.str('body')),
      ),
    );
  }
}
