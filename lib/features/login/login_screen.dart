import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/features/login/functions/login_with_password.dart';
import 'package:aipictors/features/login/functions/login_with_twitter.dart';
import 'package:aipictors/features/login/widgets/login_id_form.dart';
import 'package:aipictors/utils/to_exception_message.dart';
import 'package:aipictors/widgets/loading_progress.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ログイン
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final isLoading = useState(false);

    final isValidID = useState(false);

    final hidePassword = useState(true);

    final idInput = useState('');

    final passwordInput = useState('');

    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'.i18n),
      ),
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('assets/images/aipictors.png'),
                    ),
                    const SizedBox(height: 40),
                    LoginIDForm(
                      readOnly: isLoading.value,
                      decoration: InputDecoration(
                        hintText: 'ユーザID'.i18n,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onValidate: (valid, id) {
                        // setState() or markNeedsBuild() called during buildを防ぐため
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          isValidID.value = valid;
                          idInput.value = id;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: hidePassword.value,
                      readOnly: isLoading.value,
                      decoration: InputDecoration(
                        hintText: 'パスワード'.i18n,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(hidePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            hidePassword.value = !hidePassword.value;
                          },
                        ),
                      ),
                      onChanged: (value) {
                        passwordInput.value = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: isValidID.value &&
                                !isLoading.value &&
                                passwordInput.value.isNotEmpty
                            ? () async {
                                isLoading.value = true;
                                await onLoginWithPassword(
                                  context,
                                  ref,
                                  idInput.value,
                                  passwordInput.value,
                                );
                                isLoading.value = false;
                              }
                            : null,
                        child: Text('ログイン'.i18n),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Divider(height: 0),
                    const SizedBox(height: 32),
                    Text(
                      '現在、アプリでのログインはパスワード認証のみに対応しています。パスワードはサイトから設定または変更できます。'
                          .i18n,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    // const SizedBox(height: 40),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: FilledButton(
                    //     style: FilledButton.styleFrom(
                    //       fixedSize: const Size.fromHeight(48),
                    //     ),
                    //     onPressed: null,
                    //     // onPressed: isLoading.value
                    //     //     ? null
                    //     //     : () async {
                    //     //         isLoading.value = true;
                    //     //         await onLoginWithTwitter(context, ref);
                    //     //         isLoading.value = false;
                    //     //       },
                    //     child: Text('X(Twitter)でログイン'.i18n),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onLoginWithPassword(
    BuildContext context,
    WidgetRef ref,
    String id,
    String password,
  ) async {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog<void>(
      context: context,
      builder: (_) {
        return const LoadingProgress();
      },
    );
    try {
      await loginWithPassword(login: id, password: password);
      FirebaseAnalytics.instance.logLogin();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('ログインしました'.i18n)),
        );
    } catch (exception) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(toExceptionMessage(exception))),
        );
    }
    // ignore: use_build_context_synchronously
    if (context.canPop()) {
      // ignore: use_build_context_synchronously
      context.pop();
    }
  }

  onLoginWithTwitter(
    BuildContext context,
    WidgetRef ref,
  ) async {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog<void>(
      context: context,
      builder: (_) {
        return const LoadingProgress();
      },
    );
    try {
      await loginWithTwitter();
      FirebaseAnalytics.instance.logLogin(loginMethod: 'twitter');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('ログインしました'.i18n)),
        );
    } catch (exception) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(toExceptionMessage(exception))),
        );
    }
    // ignore: use_build_context_synchronously
    if (context.canPop()) {
      // ignore: use_build_context_synchronously
      context.pop();
    }
  }
}
