import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:aipictors/v2/user/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

/// ミュート・ブロック・通報
class UserActions {
  UserActions._();

  static Future<bool> setMuted(BuildContext context, UserProfile u, bool mute) async {
    if (!Nav.requireLogin(context)) return false;
    try {
      await UserApi.mute(u.id, mute);
      u.isMuted = mute;
      if (context.mounted) {
        context.toast(mute ? '${u.name}さんをミュートしました。作品が一覧に出なくなります' : 'ミュートを解除しました', icon: mute ? Icons.volume_off_rounded : Icons.volume_up_rounded);
      }
      return true;
    } on ApiException catch (e) {
      if (context.mounted) context.toast(e.message, error: true);
      return false;
    }
  }

  static Future<bool> setBlocked(BuildContext context, UserProfile u, bool block) async {
    if (!Nav.requireLogin(context)) return false;
    if (block) {
      final ok = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('${u.name}さんをブロックしますか？'),
          content: const Text('ブロックすると、相手はあなたをフォローしたり、作品にコメントしたりできなくなります。相手の作品もあなたに表示されなくなります。ブロックしたことは相手に通知されません。'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('キャンセル')),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('ブロックする', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      );
      if (ok != true) return false;
    }
    try {
      await UserApi.block(u.id, block);
      u.isBlocked = block;
      if (block) u.isFollowee = false;
      if (context.mounted) context.toast(block ? 'ブロックしました' : 'ブロックを解除しました', icon: Icons.block_rounded);
      return true;
    } on ApiException catch (e) {
      if (context.mounted) context.toast(e.message, error: true);
      return false;
    }
  }

  static Future<bool> report(BuildContext context, UserProfile u) async {
    if (!Nav.requireLogin(context)) return false;
    final reason = await showModalBottomSheet<ReportReasonItem>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _ReportSheet(name: u.name),
    );
    if (reason == null) return false;
    try {
      await UserApi.report(u.id, reason);
      if (context.mounted) context.toast('通報を受け付けました。ご協力ありがとうございます', icon: Icons.flag_rounded);
      return true;
    } on ApiException catch (e) {
      if (context.mounted) context.toast(e.message, error: true);
      return false;
    }
  }
}

/// ··· を押したときの選択肢。状態が変わったら true
Future<bool?> showUserActionsSheet(BuildContext context, {required UserProfile user, required bool isSelf}) {
  final url = 'https://www.aipictors.com/users/${user.login}';
  return showModalBottomSheet<bool>(
    context: context,
    showDragHandle: true,
    useSafeArea: true,
    builder: (sheet) {
      Widget item(IconData icon, String label, Future<bool> Function() run, {bool danger = false}) => ListTile(
            leading: Icon(icon, color: danger ? Theme.of(sheet).colorScheme.error : null),
            title: Text(label, style: TextStyle(fontWeight: FontWeight.w700, color: danger ? Theme.of(sheet).colorScheme.error : null)),
            onTap: () async {
              Navigator.pop(sheet);
              await run();
            },
          );
      return SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          item(Icons.ios_share_rounded, 'プロフィールを共有', () async {
            await Share.share('${user.name}（@${user.login}）さんの作品 $url');
            return false;
          }),
          item(Icons.link_rounded, 'リンクをコピー', () async {
            await Clipboard.setData(ClipboardData(text: url));
            if (context.mounted) context.toast('リンクをコピーしました', icon: Icons.link_rounded);
            return false;
          }),
          if (!isSelf) ...[
            const Divider(height: 8),
            item(user.isMuted ? Icons.volume_up_rounded : Icons.volume_off_rounded, user.isMuted ? 'ミュートを解除' : 'ミュートする', () => UserActions.setMuted(context, user, !user.isMuted)),
            item(Icons.block_rounded, user.isBlocked ? 'ブロックを解除' : 'ブロックする', () => UserActions.setBlocked(context, user, !user.isBlocked), danger: !user.isBlocked),
            item(Icons.flag_rounded, '通報する', () => UserActions.report(context, user), danger: true),
          ],
          const SizedBox(height: 8),
        ]),
      );
    },
  ).then((_) => true);
}

class _ReportSheet extends StatefulWidget {
  const _ReportSheet({required this.name});

  final String name;

  @override
  State<_ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<_ReportSheet> {
  ReportReasonItem? _reason;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text('${widget.name}さんを通報', style: context.tt.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
            child: Text('理由を選んでください。運営が内容を確認し、規約に違反している場合は対応します。', style: context.tt.bodySmall?.copyWith(color: context.muted, height: 1.5)),
          ),
          RadioGroup<ReportReasonItem>(
            groupValue: _reason,
            onChanged: (v) => setState(() => _reason = v),
            child: Column(children: [
              for (final r in ReportReasonItem.values)
                RadioListTile<ReportReasonItem>(
                  value: r,
                  title: Text(r.label, style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
            ]),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: context.cs.error,
                  foregroundColor: context.cs.onError,
                  shape: RoundedRectangleBorder(borderRadius: Ds.br(25)),
                ),
                onPressed: _reason == null ? null : () => Navigator.pop(context, _reason),
                child: const Text('通報する', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
