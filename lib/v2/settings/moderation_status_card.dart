import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:flutter/material.dart';

/// アカウントの状態（ガイドライン違反の回数と、コメント・投稿の停止）。問題が無ければ何も出さない
/// Web のアカウント設定の「アカウントの状態」と同じ内容（viewerModerationStatus）
class ModerationStatusCard extends StatefulWidget {
  const ModerationStatusCard({super.key});

  @override
  State<ModerationStatusCard> createState() => _ModerationStatusCardState();
}

class _ModerationStatusCardState extends State<ModerationStatusCard> {
  Map<String, dynamic>? _status;

  static const _query =
      r'query AppViewerModerationStatus { viewerModerationStatus { commentStrikeCount postStrikeCount commentRestriction { id endsAt reason } postRestriction { id endsAt reason } } }';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await Api.query(_query);
      if (mounted) setState(() => _status = data.obj('viewerModerationStatus'));
    } on ApiException catch (_) {
      // 読めなくても設定画面は出す（サーバーが古いときも）
    }
  }

  static String _jst(int unix) {
    final d = DateTime.fromMillisecondsSinceEpoch(unix * 1000, isUtc: true).add(const Duration(hours: 9));
    String p(int n) => n.toString().padLeft(2, '0');
    return '${d.year}/${p(d.month)}/${p(d.day)} ${p(d.hour)}:${p(d.minute)}';
  }

  String _line(String label, Map<String, dynamic> row) {
    final endsAt = row['endsAt'];
    final until = endsAt is num ? tr('${_jst(endsAt.toInt())} まで', 'until ${_jst(endsAt.toInt())} (JST)') : tr('運営が解除するまで', 'until lifted by the staff');
    return tr('$labelは $until 停止されています（理由: ${row.str('reason')}）', '$label is restricted $until (reason: ${row.str('reason')})');
  }

  @override
  Widget build(BuildContext context) {
    final s = _status;
    if (s == null) return const SizedBox.shrink();
    final comment = s.obj('commentRestriction');
    final post = s.obj('postRestriction');
    final commentStrikes = s.integer('commentStrikeCount');
    final postStrikes = s.integer('postStrikeCount');
    if (comment == null && post == null && commentStrikes + postStrikes == 0) return const SizedBox.shrink();
    final error = context.cs.error;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s12, Ds.s16, 0),
      child: Container(
        padding: const EdgeInsets.all(Ds.s12),
        decoration: BoxDecoration(
          color: error.withValues(alpha: 0.06),
          borderRadius: Ds.br(14),
          border: Border.all(color: error.withValues(alpha: 0.4)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.shield_outlined, size: 18, color: error),
            const SizedBox(width: 6),
            Text(tr('アカウントの状態', 'Account status'), style: const TextStyle(fontWeight: FontWeight.w800)),
          ]),
          if (comment != null) ...[const SizedBox(height: 6), Text(_line(tr('コメント', 'Comments'), comment), style: const TextStyle(height: 1.4))],
          if (post != null) ...[const SizedBox(height: 6), Text(_line(tr('作品の投稿', 'Posting'), post), style: const TextStyle(height: 1.4))],
          const SizedBox(height: 6),
          Text(
            tr(
              '直近 90 日のガイドライン違反: コメント $commentStrikes 回・投稿 $postStrikes 回。違反は 90 日で消え、回数が増えるほど停止が長くなります。',
              'Guideline strikes in the last 90 days: comments $commentStrikes, posts $postStrikes. Strikes expire after 90 days; repeated strikes lead to longer restrictions.',
            ),
            style: TextStyle(color: context.muted, fontSize: 12.5, height: 1.4),
          ),
        ]),
      ),
    );
  }
}
