import 'package:aipictors/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スタンプのブックマークに関するダイアログ
class StickerBookmarkDialog extends HookConsumerWidget {
  const StickerBookmarkDialog({
    super.key,
    required this.isBookmarkedForComment,
    required this.isBookmarkedForReply,
    required this.onSubmit,
    required this.onCancel,
  });
  final bool isBookmarkedForComment;
  final bool isBookmarkedForReply;
  final Function(bool comment, bool reply) onSubmit;
  final VoidCallback onCancel;

  @override
  Widget build(context, ref) {
    final comment = useState(isBookmarkedForComment);
    final reply = useState(isBookmarkedForReply);
    return AlertDialog(
      title: Text('ブックマーク'.i18n),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'スタンプの保存先を指定してください'.i18n,
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: comment.value,
                onChanged: (value) {
                  comment.value = value ?? false;
                },
              ),
              Text('コメント用'.i18n)
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: reply.value,
                onChanged: (value) {
                  reply.value = value ?? false;
                },
              ),
              Text('返信用'.i18n)
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text('やめる'.i18n),
        ),
        FilledButton.tonal(
          onPressed: () {
            onSubmit(comment.value, reply.value);
          },
          child: Text('決定'.i18n),
        ),
      ],
    );
  }
}
