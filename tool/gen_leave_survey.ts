// 解約・退会のアンケートの質問を Web（aipictors/aipictors の app/utils/leave-survey.ts）から書き出す
//   bun tool/gen_leave_survey.ts <aipictors の app/utils/leave-survey.ts の絶対パス> > lib/v2/settings/leave_survey_data.dart
const mod = await import(process.argv[2])
const q = (s: string) => `'${s.replace(/\\/g, "\\\\").replace(/'/g, "\\'").replace(/\$/g, "\\$")}'`
const t = (x: readonly [string, string]) => `(${q(x[0])}, ${q(x[1])})`
const group = (g: any) =>
  `LeaveSurveyGroup(id: ${q(g.id)}, question: ${t(g.question)}${g.showIf ? `, showIf: (${q(g.showIf.group)}, ${q(g.showIf.value)})` : ""}, options: [\n${g.options.map((o: any) => `      LeaveSurveyOption(${q(o.value)}, ${t(o.label)}),`).join("\n")}\n    ])`
const reason = (r: any) =>
  `  LeaveSurveyReason(value: ${q(r.value)}, label: ${t(r.label)}, groups: [\n${r.groups.map((g: any) => `    ${group(g)},`).join("\n")}\n  ]${r.text ? `, text: LeaveSurveyText(label: ${t(r.text.label)}, placeholder: ${t(r.text.placeholder)}, required: ${r.text.required === true})` : ""}),`
console.log(`// 自動生成（aipictors/aipictors の app/utils/leave-survey.ts から tool/gen_leave_survey.ts で書き出し）。手で直さず Web 側を直して書き出し直す
// ignore_for_file: lines_longer_than_80_chars
part of 'leave_survey.dart';

const int leaveSurveyMinText = ${mod.LEAVE_SURVEY_MIN_TEXT};

const List<LeaveSurveyReason> subscriptionLeaveReasons = [
${mod.SUBSCRIPTION_LEAVE_REASONS.map(reason).join("\n")}
];

const List<LeaveSurveyReason> accountLeaveReasons = [
${mod.ACCOUNT_LEAVE_REASONS.map(reason).join("\n")}
];`)
