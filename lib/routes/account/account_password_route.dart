import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_user.req.gql.dart';
import 'package:aipictors/mutations/update_account_password.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/routes/home/widgets/loading_screen.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// 設定・パスワード変更
class AccountPasswordScreen extends HookConsumerWidget {
  const AccountPasswordScreen({super.key});

  @override
  Widget build(context, ref) {
    final isLoading = useState(false);

    final controller = useTextEditingController();

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GViewerUserReq();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('パスワードの変更'.i18n),
        ),
        body: OperationBuilder(
          client: client.value!,
          operationRequest: request,
          builder: (context, response) {
            final user = response.data?.viewer?.user;
            if (user == null) {
              return const UnexpectedErrorContainer();
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9a-zA-Z@]'),
                        ),
                      ],
                      decoration: InputDecoration(
                        hintText: '新しいパスワード'.i18n,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FilledButton(
                          onPressed: isLoading.value
                              ? null
                              : () async {
                                  try {
                                    isLoading.value = true;
                                    await onSubmit(context, controller.text);
                                    isLoading.value = false;
                                  } catch (exception, _) {
                                    isLoading.value = false;
                                  }
                                },
                          child: Text('更新'.i18n),
                        ),
                      ],
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

  onSubmit(BuildContext context, String newPassword) async {
    try {
      FirebaseAnalytics.instance.logEvent(
        name: 'update_account_password',
      );
      await updateAccountPassword((builder) {
        return builder
          ..vars.input.currentPassword = null
          ..vars.input.newPassword = newPassword;
      });
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('パスワードを更新しました。'.i18n)),
        );
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      showErrorSnackBar(context, exception);
      rethrow;
    }
  }
}
