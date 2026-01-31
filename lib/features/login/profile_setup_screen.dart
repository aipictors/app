import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/user/functions/update_user_profile.dart';
import 'package:aipictors/utils/to_exception_message.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileSetupScreen extends HookConsumerWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayName = useState('');
    final isSubmitting = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール初期設定'.i18n),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ニックネーム（表示名）を設定してください'.i18n,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              TextField(
                enabled: !isSubmitting.value,
                decoration: InputDecoration(
                  labelText: '表示名'.i18n,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  displayName.value = value.trim();
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: (!isSubmitting.value && displayName.value.isNotEmpty)
                    ? () async {
                        isSubmitting.value = true;
                        await _submit(context, displayName.value);
                        isSubmitting.value = false;
                      }
                    : null,
                child: Text('保存'.i18n),
              ),
              const SizedBox(height: 12),
              Text(
                '※あとから設定画面で変更できます'.i18n,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context, String displayName) async {
    FocusManager.instance.primaryFocus?.unfocus();

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const LoadingProgress();
      },
    );

    try {
      await updateUserProfile((b) => b..vars.input.displayName = displayName);

      if (context.mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('プロフィールを保存しました'.i18n)),
          );
      }
    } catch (exception) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text(toExceptionMessage(exception))),
          );
      }
    } finally {
      if (context.canPop()) {
        context.pop();
      }
      if (context.mounted && context.canPop()) {
        context.pop();
      }
    }
  }
}
