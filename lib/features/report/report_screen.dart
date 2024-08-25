import 'package:aipictors/__generated__/schema.schema.gql.dart';
import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 報告
class ReportScreen extends HookConsumerWidget {
  const ReportScreen({
    super.key,
    required this.title,
    required this.onSubmit,
  });

  final String title;
  final Function(GReportReason, String) onSubmit;

  @override
  Widget build(context, ref) {
    final reason = useState<GReportReason?>(null);
    final comment = useState('');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          InkWell(
            onTap: () {
              if (reason.value == null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text('報告理由を選択してください'.i18n)),
                  );
                return;
              }
              context.pop();
              onSubmit(reason.value!, comment.value);
            },
            child: Row(
              children: [
                const Icon(Icons.send_rounded),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '送信'.i18n,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '報告理由'.i18n,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField(
                  hint: Text(
                    '報告理由'.i18n,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  value: reason.value,
                  isExpanded: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  items: [
                    DropdownMenuItem(
                        value: GReportReason.AGE_MISMATCH,
                        child: Text('対象年齢が異なる（過度な性的表現など）'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.CHILD_PORNOGRAPHY,
                        child:
                            Text('実写に見える作品で、児童ポルノと認定される恐れのある内容が含まれている'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.COMMERCIAL_CONTENT,
                        child: Text('商業用の広告や宣伝、勧誘を目的とする情報が含まれている'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.EXCESSIVE_GORE,
                        child: Text('過度なグロテスク表現が含まれている'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.ILLEGAL_CONTENT,
                        child: Text('サイトで禁止されているコンテンツへの誘導が含まれている'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.NO_MOSAIC,
                        child: Text('必要なモザイク加工がされていない'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.PRIVACY_VIOLATION,
                        child: Text('プライバシーまたは肖像権を侵害している'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.TASTE_MISMATCH,
                        child: Text('テイストが異なる'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.UNAUTHORIZED_REPOST,
                        child: Text('無断転載している'.i18n)),
                    DropdownMenuItem(
                        value: GReportReason.OTHER, child: Text('その他'.i18n)),
                  ],
                  onChanged: (value) {
                    reason.value = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '詳細（任意）'.i18n,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Text('無断転載、プライバシー、肖像権についての報告の場合は、転載元や侵害されている人物の情報を記載してください'.i18n),
              const SizedBox(height: 16),
              TextField(
                maxLines: null,
                onChanged: (value) {
                  comment.value = value;
                },
                decoration: InputDecoration(
                  hintText: '問題の詳細を入力してください'.i18n,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
