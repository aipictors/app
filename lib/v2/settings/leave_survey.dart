import 'dart:convert';
import 'dart:io';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:flutter/material.dart';

part 'leave_survey_data.dart';

/// 解約・退会の理由のアンケート（主な理由 → 理由ごとの追加質問（複数選択） → 自由記述 → 改善してほしいこと）
/// 質問は Web と同じ（leave_survey_data.dart は Web の app/utils/leave-survey.ts から書き出したもの）。
/// 保存は aipictors-api（解約: subscription_cancel_reasons.details、退会: account_leave_reasons）

class LeaveSurveyOption {
  const LeaveSurveyOption(this.value, this.label);
  final String value;
  final (String, String) label;
}

class LeaveSurveyGroup {
  const LeaveSurveyGroup({required this.id, required this.question, required this.options, this.showIf});
  final String id;
  final (String, String) question;
  final List<LeaveSurveyOption> options;

  /// ほかの質問でこの選択肢を選んだときだけ出す（質問の id, 選択肢の値）
  final (String, String)? showIf;
}

class LeaveSurveyText {
  const LeaveSurveyText({required this.label, required this.placeholder, this.required = false});
  final (String, String) label;
  final (String, String) placeholder;
  final bool required;
}

class LeaveSurveyReason {
  const LeaveSurveyReason({required this.value, required this.label, required this.groups, this.text});
  final String value;
  final (String, String) label;
  final List<LeaveSurveyGroup> groups;
  final LeaveSurveyText? text;
}

enum LeaveSurveyKind { subscription, account }

String _t((String, String) text) => tr(text.$1, text.$2);

/// 答え（画面の状態）
class LeaveSurveyAnswer extends ChangeNotifier {
  LeaveSurveyAnswer(this.kind);

  final LeaveSurveyKind kind;
  String? reason;
  final Map<String, Set<String>> choices = {};
  final text = TextEditingController();
  final improvement = TextEditingController();

  List<LeaveSurveyReason> get reasons => kind == LeaveSurveyKind.subscription ? subscriptionLeaveReasons : accountLeaveReasons;

  LeaveSurveyReason? get selected {
    for (final r in reasons) {
      if (r.value == reason) return r;
    }
    return null;
  }

  List<LeaveSurveyGroup> get visibleGroups => (selected?.groups ?? [])
      .where((g) => g.showIf == null || (choices[g.showIf!.$1]?.contains(g.showIf!.$2) ?? false))
      .toList();

  /// 追加質問のうち、まだ 1 つも選んでいないもの（どれも必須）
  List<LeaveSurveyGroup> get missingGroups => visibleGroups.where((g) => choices[g.id]?.isNotEmpty != true).toList();

  /// 詳しい説明がまだ足りないか（required の理由は leaveSurveyMinText 文字以上）
  bool get isTextMissing => selected?.text?.required == true && text.text.trim().length < leaveSurveyMinText;

  /// 送れる状態か（理由を選び、追加質問にすべて答え、詳しい説明を書いた）
  bool get isComplete => selected != null && missingGroups.isEmpty && !isTextMissing;

  void selectReason(String value) {
    if (reason == value) return;
    reason = value;
    choices.clear();
    text.clear();
    notifyListeners();
  }

  /// 自由記述の文字数で「送れるか」が変わるので、入力のたびに知らせる
  void touch() => notifyListeners();

  void toggle(String group, String value) {
    final set = choices.putIfAbsent(group, () => <String>{});
    if (!set.remove(value)) set.add(value);
    notifyListeners();
  }

  /// aipictors-api に送る details（見えていない質問の答えは送らない）
  String toDetailsJson() {
    final picked = <String, List<String>>{};
    for (final g in visibleGroups) {
      final values = choices[g.id];
      if (values != null && values.isNotEmpty) picked[g.id] = values.toList();
    }
    final note = text.text.trim();
    final better = improvement.text.trim();
    return jsonEncode({
      'choices': picked,
      'text': selected?.text != null ? (note.length > 500 ? note.substring(0, 500) : note) : '',
      'improvement': better.length > 1000 ? better.substring(0, 1000) : better,
      'source': Platform.isIOS ? 'ios' : (Platform.isAndroid ? 'android' : 'app'),
    });
  }

  String? get noteForOther {
    if (reason != 'other') return null;
    final note = text.text.trim();
    return note.length > 500 ? note.substring(0, 500) : note;
  }

  @override
  void dispose() {
    text.dispose();
    improvement.dispose();
    super.dispose();
  }
}

/// 解約・退会の理由を送る（失敗しても解約・退会は止めない）
class LeaveSurveyApi {
  LeaveSurveyApi._();

  static Future<void> sendSubscriptionCancel(LeaveSurveyAnswer answer) async {
    if (answer.reason == null) return;
    try {
      await Api.mutate(r'''
mutation AppSubmitSubscriptionCancelSurvey($input: SubmitSubscriptionCancelSurveyInput!) {
  submitSubscriptionCancelSurvey(input: $input)
}''', variables: {
        'input': {'reason': answer.reason, 'note': answer.noteForOther, 'details': answer.toDetailsJson()},
      });
    } catch (_) {
      // アンケートの失敗でストアを開けなくしない
    }
  }

  static Future<void> sendAccountLeave(LeaveSurveyAnswer answer, {required String outcome}) async {
    if (answer.reason == null) return;
    try {
      await Api.mutate(r'''
mutation AppSubmitAccountLeaveSurvey($input: SubmitAccountLeaveSurveyInput!) {
  submitAccountLeaveSurvey(input: $input)
}''', variables: {
        'input': {'reason': answer.reason, 'outcome': outcome, 'note': answer.noteForOther, 'details': answer.toDetailsJson()},
      });
    } catch (_) {
      // アンケートの失敗で退会・一時停止を止めない
    }
  }
}

/// アンケートの入力欄（ListView などの中に置く）
class LeaveSurveyFields extends StatelessWidget {
  const LeaveSurveyFields({super.key, required this.answer});

  final LeaveSurveyAnswer answer;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: answer,
      builder: (context, _) {
        final reason = answer.selected;
        return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (final r in answer.reasons)
            Padding(
              padding: const EdgeInsets.only(bottom: Ds.s6),
              child: Pressable(
                onTap: () => answer.selectReason(r.value),
                child: AnimatedContainer(
                  duration: Ds.fast,
                  padding: const EdgeInsets.symmetric(horizontal: Ds.s12, vertical: 10),
                  decoration: BoxDecoration(
                    color: answer.reason == r.value ? Ds.sky.withValues(alpha: 0.12) : context.surfaceCard,
                    borderRadius: Ds.br(12),
                    border: Border.all(color: answer.reason == r.value ? Ds.sky : context.cs.outlineVariant),
                  ),
                  child: Row(children: [
                    Icon(answer.reason == r.value ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                        size: 20, color: answer.reason == r.value ? Ds.sky : context.muted),
                    const SizedBox(width: Ds.s8),
                    Expanded(child: Text(_t(r.label), style: const TextStyle(fontSize: 14))),
                  ]),
                ),
              ),
            ),
          if (reason != null)
            Container(
              margin: const EdgeInsets.only(top: Ds.s6),
              padding: const EdgeInsets.all(Ds.s12),
              decoration: BoxDecoration(color: context.skeleton.withValues(alpha: 0.5), borderRadius: Ds.br(14)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                for (final g in answer.visibleGroups) ...[
                  Text.rich(TextSpan(children: [
                    TextSpan(text: _t(g.question), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
                    TextSpan(text: tr(' 必須', ' Required'), style: TextStyle(color: context.cs.error, fontSize: 12)),
                    TextSpan(text: tr('（いくつでも）', ' (choose any)'), style: TextStyle(color: context.muted, fontSize: 12)),
                  ])),
                  const SizedBox(height: Ds.s6),
                  Wrap(spacing: Ds.s6, runSpacing: Ds.s6, children: [
                    for (final o in g.options)
                      AppChip(_t(o.label), selected: answer.choices[g.id]?.contains(o.value) ?? false, onTap: () => answer.toggle(g.id, o.value)),
                  ]),
                  const SizedBox(height: Ds.s12),
                ],
                if (reason.text != null) ...[
                  Text.rich(TextSpan(children: [
                    TextSpan(text: _t(reason.text!.label), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
                    if (reason.text!.required) TextSpan(text: tr(' 必須', ' Required'), style: TextStyle(color: context.cs.error, fontSize: 12)),
                  ])),
                  const SizedBox(height: Ds.s6),
                  TextField(
                    controller: answer.text,
                    maxLength: 500,
                    maxLines: 3,
                    minLines: 2,
                    onChanged: (_) => answer.touch(),
                    decoration: settingsField(context, '', hint: _t(reason.text!.placeholder)).copyWith(labelText: null),
                  ),
                  if (reason.text!.required && answer.text.text.trim().length < leaveSurveyMinText)
                    Text(
                      tr('$leaveSurveyMinText文字以上で入力してください（あと${leaveSurveyMinText - answer.text.text.trim().length}文字）',
                          'Please write at least $leaveSurveyMinText characters (${leaveSurveyMinText - answer.text.text.trim().length} more)'),
                      style: TextStyle(color: context.muted, fontSize: 12),
                    ),
                  const SizedBox(height: Ds.s8),
                ],
                Text.rich(TextSpan(children: [
                  TextSpan(text: tr('改善してほしいこと', 'What should we improve?'), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
                  TextSpan(text: tr('（任意）', ' (optional)'), style: TextStyle(color: context.muted, fontSize: 12)),
                ])),
                const SizedBox(height: Ds.s6),
                TextField(
                  controller: answer.improvement,
                  maxLength: 1000,
                  maxLines: 3,
                  minLines: 2,
                  decoration: settingsField(context, '', hint: tr('あれば自由に書いてください', "Anything you'd like to tell us")).copyWith(labelText: null),
                ),
              ]),
            ),
        ]);
      },
    );
  }
}

/// ストアの定期購入を管理する画面を開く前に、解約の理由を聞く（プラン画面の「ストアで管理」）
/// 戻り値: ストアを開いてよいか（閉じたら false）
Future<bool> showStoreCancelSurveySheet(BuildContext context) async {
  final answer = LeaveSurveyAnswer(LeaveSurveyKind.subscription);
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85,
        maxChildSize: 0.95,
        builder: (context, controller) => ListenableBuilder(
          listenable: answer,
          builder: (context, _) => ListView(controller: controller, padding: const EdgeInsets.fromLTRB(Ds.s16, 0, Ds.s16, Ds.s32), children: [
            Text(tr('解約をお考えですか？', 'Thinking of cancelling?'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
            const SizedBox(height: Ds.s4),
            Text(
              tr('よければ理由を教えてください。これからの改善に使わせていただきます。解約・プランの変更はこのあと開くストアの画面で行えます。',
                  'If you like, tell us why. It helps us improve. You can cancel or change your plan on the store screen that opens next.'),
              style: TextStyle(color: context.muted, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: Ds.s12),
            LeaveSurveyFields(answer: answer),
            const SizedBox(height: Ds.s16),
            FilledButton(
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              onPressed: answer.isComplete
                  ? () async {
                      await LeaveSurveyApi.sendSubscriptionCancel(answer);
                      if (context.mounted) Navigator.of(context).pop(true);
                    }
                  : null,
              child: Text(tr('送ってストアを開く', 'Send and open the store')),
            ),
            const SizedBox(height: Ds.s8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(tr('解約ではない（そのままストアを開く）', "I'm not cancelling (just open the store)")),
            ),
          ]),
        ),
      ),
    ),
  );
  answer.dispose();
  return result == true;
}
