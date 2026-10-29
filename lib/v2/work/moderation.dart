import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:flutter/material.dart';

const reportReasons = [
  ('AGE_MISMATCH', '年齢制限の設定が正しくない'),
  ('ILLEGAL_CONTENT', '違法・不適切な内容'),
  ('CHILD_PORNOGRAPHY', '児童の性的な表現'),
  ('EXCESSIVE_GORE', '過度に暴力的・グロテスク'),
  ('NO_MOSAIC', '修正がされていない'),
  ('UNAUTHORIZED_REPOST', '無断転載'),
  ('PRIVACY_VIOLATION', 'プライバシーの侵害'),
  ('COMMERCIAL_CONTENT', '宣伝・スパム'),
  ('TASTE_MISMATCH', '好みに合わない'),
  ('OTHER', 'その他'),
];

enum ReportTarget { work, comment, user }

/// 通報シート。送れたら true
Future<bool> showReportSheet(BuildContext context, {required ReportTarget target, required String id}) async {
  if (!Nav.requireLogin(context)) return false;
  final ok = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: context.surfaceCard,
    builder: (_) => _ReportSheet(target: target, id: id),
  );
  if (ok == true && context.mounted) {
    context.toast('通報しました。運営が確認します', icon: Icons.flag_rounded);
  }
  return ok == true;
}

class _ReportSheet extends StatefulWidget {
  const _ReportSheet({required this.target, required this.id});

  final ReportTarget target;
  final String id;

  @override
  State<_ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<_ReportSheet> {
  String? _reason;
  final _comment = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    if (_reason == null) return;
    setState(() => _sending = true);
    try {
      switch (widget.target) {
        case ReportTarget.work:
          await Api.mutate(r'mutation AppReportWork($input: ReportWorkInput!) { reportWork(input: $input) }', variables: {
            'input': {'workId': widget.id, 'reason': _reason, 'comment': _comment.text.trim()},
          });
        case ReportTarget.comment:
          await Api.mutate(r'mutation AppReportComment($input: ReportCommentInput!) { reportComment(input: $input) }', variables: {
            'input': {'commentId': widget.id, 'reason': _reason, 'comment': _comment.text.trim()},
          });
        case ReportTarget.user:
          await Api.mutate(r'mutation AppReportUser($input: ReportUserInput!) { reportUser(input: $input) }', variables: {
            'input': {'userId': widget.id, 'reason': _reason},
          });
      }
      if (mounted) Navigator.pop(context, true);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _sending = false);
      context.toast(e.message, error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = switch (widget.target) {
      ReportTarget.work => '作品を通報',
      ReportTarget.comment => 'コメントを通報',
      ReportTarget.user => 'ユーザーを通報',
    };
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text('理由を選んでください。通報した人の情報が相手に伝わることはありません。', style: TextStyle(color: context.muted, fontSize: 13)),
            const SizedBox(height: 8),
            RadioGroup<String>(
              groupValue: _reason,
              onChanged: (v) => setState(() => _reason = v),
              child: Column(children: [
                for (final r in reportReasons)
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    value: r.$1,
                    title: Text(r.$2),
                  ),
              ]),
            ),
            if (widget.target != ReportTarget.user) ...[
              const SizedBox(height: 8),
              TextField(
                controller: _comment,
                maxLines: 3,
                maxLength: 500,
                decoration: const InputDecoration(hintText: '補足（任意）', border: OutlineInputBorder()),
              ),
            ],
            const SizedBox(height: 8),
            FilledButton(
              onPressed: _reason == null || _sending ? null : _send,
              style: FilledButton.styleFrom(backgroundColor: context.cs.error, minimumSize: const Size.fromHeight(48)),
              child: _sending
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('通報する'),
            ),
          ],
        ),
      ),
    );
  }
}

/// ミュート・ブロック
Future<bool> muteUser(BuildContext context, String userId, String name) async {
  if (!Nav.requireLogin(context)) return false;
  final ok = await _confirm(context, '$nameさんをミュートしますか？', 'この人の作品やコメントが表示されなくなります。設定からいつでも解除できます。', 'ミュートする');
  if (!ok) return false;
  try {
    await Api.mutate(r'mutation AppMuteUser($input: MuteUserInput!) { muteUser(input: $input) { id } }', variables: {
      'input': {'userId': userId},
    });
    if (context.mounted) context.toast('ミュートしました', icon: Icons.volume_off_rounded);
    return true;
  } on ApiException catch (e) {
    if (context.mounted) context.toast(e.message, error: true);
    return false;
  }
}

Future<bool> blockUser(BuildContext context, String userId, String name) async {
  if (!Nav.requireLogin(context)) return false;
  final ok = await _confirm(context, '$nameさんをブロックしますか？', 'お互いの作品やコメントが表示されなくなり、フォローも解除されます。設定からいつでも解除できます。', 'ブロックする');
  if (!ok) return false;
  try {
    await Api.mutate(r'mutation AppBlockUser($input: BlockUserInput!) { blockUser(input: $input) { id } }', variables: {
      'input': {'userId': userId},
    });
    if (context.mounted) context.toast('ブロックしました', icon: Icons.block_rounded);
    return true;
  } on ApiException catch (e) {
    if (context.mounted) context.toast(e.message, error: true);
    return false;
  }
}

Future<bool> _confirm(BuildContext context, String title, String message, String action) async {
  final r = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('キャンセル')),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(action, style: TextStyle(color: Theme.of(context).colorScheme.error, fontWeight: FontWeight.w700)),
        ),
      ],
    ),
  );
  return r == true;
}
