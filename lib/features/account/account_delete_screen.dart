import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/account/functions/withdraw_account.dart';
import 'package:aipictors/features/config/functions/logout.dart';
import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/viewer/__generated__/viewer_user.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アカウントの削除（退会）
///
/// 誤操作を防ぐため、Web と同じくアカウントIDの先頭6文字の入力と確認が必要。
/// 有料プランはサーバー側で退会と同時に解約される。
class AccountDeleteScreen extends HookConsumerWidget {
  const AccountDeleteScreen({super.key});

  @override
  Widget build(context, ref) {
    final isLoading = useState(false);
    final hasConfirmed = useState(false);
    final controller = useTextEditingController();
    useListenable(controller);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('アカウント削除'.i18n),
        ),
        body: OperationBuilder(
          client: client.value!,
          operationRequest: GViewerUserReq(),
          builder: (context, response) {
            final user = response.data?.viewer?.user;
            if (user == null) {
              return const UnexpectedErrorContainer();
            }
            final login = user.login;
            final requiredPrefix =
                login.substring(0, login.length < 6 ? login.length : 6);
            final canWithdraw = requiredPrefix.isNotEmpty &&
                controller.text.trim() == requiredPrefix &&
                hasConfirmed.value &&
                !isLoading.value;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '退会すると元に戻せません'.i18n,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '退会すると、アカウント情報は削除され、作品は非公開になります。加入中の有料プランは退会と同時に解約され、以降の請求は発生しません。'
                        .i18n,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '同じSNS連携を使って再登録する場合は、新しいアカウントとして作成されます。'
                        .i18n,
                  ),
                  const SizedBox(height: 24),
                  Text('確認のため、アカウントIDの先頭6文字を入力してください。'.i18n),
                  const SizedBox(height: 4),
                  SelectableText(
                    '${'アカウントID'.i18n}: $login',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: requiredPrefix.isEmpty
                          ? null
                          : '先頭6文字'.i18n,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: hasConfirmed.value,
                    onChanged: (value) {
                      hasConfirmed.value = value ?? false;
                    },
                    title: Text(
                      '退会すると元に戻せないこと、有料プランが解約されることを理解しました'.i18n,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor:
                            Theme.of(context).colorScheme.onError,
                      ),
                      onPressed: canWithdraw
                          ? () => onSubmit(context, isLoading)
                          : null,
                      child: Text('退会する'.i18n),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> onSubmit(
    BuildContext context,
    ValueNotifier<bool> isLoading,
  ) async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('本当に退会しますか？'.i18n),
          content: Text('この操作は取り消せません。'.i18n),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('キャンセル'.i18n),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('退会する'.i18n),
            ),
          ],
        );
      },
    );
    if (isConfirmed != true || !context.mounted) return;

    try {
      isLoading.value = true;
      await withdrawAccount();
      try {
        await logout();
      } catch (_) {
        // 退会はサーバーで完了しているので、ログアウトの失敗は無視する
      }
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('退会しました。ご利用ありがとうございました。'.i18n)),
        );
      context.go('/');
    } catch (exception) {
      isLoading.value = false;
      if (context.mounted) showErrorSnackBar(context, exception);
    }
  }
}
