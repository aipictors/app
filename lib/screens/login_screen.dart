import 'package:aipictors/mutations/login_with_password.dart';
import 'package:aipictors/mutations/login_with_twitter.dart';
import 'package:aipictors/utils/to_exception_message.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final isLoading = useState(false);

    final idInput = useState('');

    final passwordInput = useState('');

    return Scaffold(
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
                      width: 180,
                      child: Image.asset('assets/image/aipictors.png'),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      readOnly: isLoading.value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'ID',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9a-zA-Z@]'),
                        ),
                      ],
                      onChanged: (value) {
                        idInput.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      readOnly: isLoading.value,
                      decoration: InputDecoration(
                        hintText: 'パスワード',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
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
                        onPressed: isLoading.value
                            ? null
                            : () async {
                                isLoading.value = true;
                                await onLoginWithPassword(
                                  context,
                                  ref,
                                  idInput.value,
                                  passwordInput.value,
                                );
                                isLoading.value = false;
                              },
                        child: const Text('ログイン'),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Divider(height: 0),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: isLoading.value
                            ? null
                            : () async {
                                isLoading.value = true;
                                await onLoginWithTwitter(context, ref);
                                isLoading.value = false;
                              },
                        child: const Text('Twitterでログイン'),
                      ),
                    ),
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
        return const LoadingContainer();
      },
    );
    try {
      await loginWithPassword(login: id, password: password);
      FirebaseAnalytics.instance.logLogin();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('ログインしました')),
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
        return const LoadingContainer();
      },
    );
    try {
      await loginWithTwitter();
      FirebaseAnalytics.instance.logLogin(loginMethod: 'twitter');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('ログインしました')),
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
