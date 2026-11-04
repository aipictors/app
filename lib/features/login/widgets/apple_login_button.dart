import 'package:aipictors/default.i18n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Apple でサインインするボタン（iOS だけ表示する）
class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) {
      return const SizedBox.shrink();
    }
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: IgnorePointer(
        ignoring: isLoading,
        child: Opacity(
          opacity: isLoading ? 0.5 : 1,
          child: SignInWithAppleButton(
            text: 'Appleでサインイン'.i18n,
            height: 48,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            style: isDark
                ? SignInWithAppleButtonStyle.white
                : SignInWithAppleButtonStyle.black,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
