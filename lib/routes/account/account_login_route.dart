import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/__generated__/viewer_user.req.gql.dart';
import 'package:aipictors/mutations/update_account_login.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/routes/account/widgets/change_login_id_form.dart';
import 'package:aipictors/routes/home/widgets/loading_screen.dart';
import 'package:aipictors/utils/show_error_snack_bar.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/unexpected_error_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// 設定・ログインIDの変更
class AccountLoginScreen extends HookConsumerWidget {
  const AccountLoginScreen({super.key});

  @override
  Widget build(context, ref) {
    final isLoading = useState(false);

    final newID = useState('');

    final isValidID = useState(false);

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
          title: Text('ログインIDの変更'.i18n),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('現在のログインID'.i18n),
                        Text(
                          '@${user.login}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ChangeLoginIDForm(
                      readOnly: isLoading.value,
                      decoration: InputDecoration(
                        hintText: '新しいログインID'.i18n,
                      ),
                      onValidate: (valid, id) {
                        //setState() or markNeedsBuild() called during buildを防ぐため
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          isValidID.value = valid;
                          newID.value = id;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FilledButton(
                          onPressed: !isLoading.value && isValidID.value
                              ? () async {
                                  try {
                                    isLoading.value = true;
                                    await onSubmit(context, newID.value);
                                    isLoading.value = false;
                                  } catch (exception, _) {
                                    isLoading.value = false;
                                  }
                                }
                              : null,
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

  onSubmit(BuildContext context, String login) async {
    try {
      FirebaseAnalytics.instance.logEvent(
        name: 'update_account_login',
      );
      await updateAccountLogin((builder) {
        return builder..vars.input.login = login;
      });
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('ログインIDを更新しました。'.i18n)),
        );
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace);
      showErrorSnackBar(context, exception);
      rethrow;
    }
  }
}
