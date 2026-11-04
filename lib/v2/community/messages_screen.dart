import 'dart:async';

import 'package:aipictors/v2/community/paged_list.dart';
import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/core/paged.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// デバッグビルドでは本物のメッセージ・問い合わせを送らない
bool get mockSend => !kReleaseMode;

const _threadsQuery = '''
query AppMessageThreads(\$offset: Int!, \$limit: Int!) {
  viewer {
    id
    messageThreads(offset: \$offset, limit: \$limit) {
      id
      updatedAt
      recipient { $userSummaryFields }
      latestMessage { id text isMine isRead createdAt }
    }
  }
}''';

const _threadQuery = '''
query AppMessageThread(\$threadId: ID!, \$offset: Int!, \$limit: Int!) {
  viewer {
    id
    messageThread(threadId: \$threadId) {
      id
      recipient { $userSummaryFields }
      messages(offset: \$offset, limit: \$limit) { id text isMine createdAt }
    }
  }
}''';

String _timeLabel(int epoch) {
  final d = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  final now = DateTime.now();
  final hm = '${d.hour}:${d.minute.toString().padLeft(2, '0')}';
  if (d.year == now.year && d.month == now.month && d.day == now.day) return hm;
  return '${d.month}/${d.day} $hm';
}

/// メッセージの一覧
class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final _c = PagedController<Map<String, dynamic>>(
    pageSize: 30,
    idOf: (t) => t.str('id'),
    fetch: (offset, limit) async {
      final data = await Api.query(_threadsQuery, variables: {'offset': offset, 'limit': limit});
      return data.obj('viewer')?.list('messageThreads') ?? const [];
    },
  );

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!Nav.isLoggedIn) {
      return Scaffold(
        appBar: AppBar(title: const Text('メッセージ')),
        body: LoginRequiredView(
          icon: Icons.mail_outline_rounded,
          title: 'ログインするとメッセージを使えます',
          message: 'ほかのユーザーとメッセージをやり取りできます。',
          onLogin: () => Nav.login(context),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('メッセージ', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          TextButton(onPressed: () => context.push('/support/chat'), child: const Text('お問い合わせ')),
        ],
      ),
      body: PagedList<Map<String, dynamic>>(
        controller: _c,
        emptyTitle: 'メッセージはまだありません',
        emptyIcon: Icons.mail_outline_rounded,
        itemBuilder: (context, t) {
          final user = t.obj('recipient');
          final last = t.obj('latestMessage');
          final unread = last != null && !last.boolean('isMine') && !last.boolean('isRead');
          return ListTile(
            leading: UserAvatar.json(user, size: 48),
            title: Text(user?.str('name') ?? '', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text(last?.str('text') ?? '', maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(_timeLabel(last?.integer('createdAt') ?? t.integer('updatedAt')), style: TextStyle(fontSize: 11, color: context.muted)),
              if (unread) ...[
                const SizedBox(height: Ds.s4),
                Container(width: 9, height: 9, decoration: BoxDecoration(color: context.cs.primary, shape: BoxShape.circle)),
              ],
            ]),
            onTap: () => context.push('/messages/${user?.str('id')}'),
          );
        },
      ),
    );
  }
}

/// ひとりとのメッセージ
class MessageThreadScreen extends StatefulWidget {
  const MessageThreadScreen({super.key, required this.recipientId});

  final String recipientId;

  @override
  State<MessageThreadScreen> createState() => _MessageThreadScreenState();
}

class _MessageThreadScreenState extends State<MessageThreadScreen> {
  final _input = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  Map<String, dynamic>? _recipient;
  bool _loading = true;
  bool _sending = false;
  String? _error;
  Timer? _poll;

  @override
  void initState() {
    super.initState();
    _load();
    _poll = Timer.periodic(const Duration(seconds: 20), (_) => _load(silent: true));
  }

  @override
  void dispose() {
    _poll?.cancel();
    _input.dispose();
    super.dispose();
  }

  Future<void> _load({bool silent = false}) async {
    try {
      final data = await Api.query(_threadQuery, variables: {'threadId': widget.recipientId, 'offset': 0, 'limit': 60});
      final thread = data.obj('viewer')?.obj('messageThread');
      Map<String, dynamic>? recipient = thread?.obj('recipient');
      if (recipient == null && _recipient == null) {
        final u = await Api.query('query AppMessageRecipient(\$id: ID!) { user(id: \$id) { $userSummaryFields } }', variables: {'id': widget.recipientId});
        recipient = u.obj('user');
      }
      if (!mounted) return;
      setState(() {
        _recipient = recipient ?? _recipient;
        final server = thread?.list('messages') ?? const <Map<String, dynamic>>[];
        // 確認用に手元だけで足したものは消さない
        final local = _messages.where((m) => m.boolean('isLocal')).toList();
        _messages = [...local, ...server];
        _loading = false;
        _error = null;
      });
    } on ApiException catch (e) {
      if (mounted && !silent) {
        setState(() {
          _loading = false;
          _error = e.message;
        });
      }
    }
  }

  Future<void> _send() async {
    final text = _input.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      if (mockSend) {
        setState(() {
          _messages = [
            {'id': 'local-${DateTime.now().millisecondsSinceEpoch}', 'text': text, 'isMine': true, 'isLocal': true, 'createdAt': DateTime.now().millisecondsSinceEpoch ~/ 1000},
            ..._messages,
          ];
        });
        context.toast('デバッグ中なので送信していません');
      } else {
        await Api.mutate(r'mutation AppCreateMessage($input: CreateMessageInput!) { createMessage(input: $input) { id } }', variables: {
          'input': {'recipientId': widget.recipientId, 'text': text},
        });
        await _load(silent: true);
      }
      _input.clear();
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = _recipient?.str('name') ?? '';
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        actions: [
          PopupMenuButton<String>(
            onSelected: (v) {
              if (v == 'user') Nav.user(context, widget.recipientId);
              if (v == 'report') context.push('/users/${widget.recipientId}/report');
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'user', child: Text('プロフィール（ブロック・ミュート）')),
              PopupMenuItem(value: 'report', child: Text('通報する')),
            ],
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: _loading
              ? const SkeletonList(count: 6)
              : _error != null
                  ? StateView.error(_error!, onRetry: _load)
                  : _messages.isEmpty
                      ? StateView.empty('まだメッセージはありません', icon: Icons.mail_outline_rounded)
                      : ListView.builder(
                          reverse: true,
                          padding: const EdgeInsets.all(Ds.s12),
                          itemCount: _messages.length,
                          itemBuilder: (context, i) => _Bubble(message: _messages[i]),
                        ),
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
                  decoration: const InputDecoration(hintText: 'メッセージを入力', border: InputBorder.none, isDense: true),
                ),
              ),
              IconButton(
                tooltip: '送信',
                onPressed: _sending ? null : _send,
                icon: Icon(Icons.send_rounded, color: context.cs.primary),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});

  final Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    final mine = message.boolean('isMine');
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.76),
        margin: const EdgeInsets.symmetric(vertical: Ds.s4),
        padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: Ds.s8),
        decoration: BoxDecoration(
          color: mine ? context.cs.primary : context.surfaceCard,
          borderRadius: Ds.br(16),
          border: mine ? null : Border.all(color: context.hairline),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SelectableText(message.str('text'), style: TextStyle(color: mine ? context.cs.onPrimary : null, height: 1.45)),
          const SizedBox(height: Ds.s2),
          Text(
            _timeLabel(message.integer('createdAt')),
            style: TextStyle(fontSize: 10, color: mine ? context.cs.onPrimary.withValues(alpha: 0.75) : context.muted),
          ),
        ]),
      ),
    );
  }
}
