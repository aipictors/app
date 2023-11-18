import 'dart:io';

import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// EULA
/// iOSアプリの場合はアプリ起動時に確認する
class HelloTermsScreen extends HookConsumerWidget {
  const HelloTermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('はじめに'.i18n),
        actions: [
          IconButton(
            icon: const Icon(Icons.language_rounded),
            onPressed: () {
              context.push('/config/language');
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(children: [
          const SizedBox(height: 40),
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset('assets/images/aipictors.png'),
          ),
          const SizedBox(height: 40),
          Text(
            'このアプリにはユーザの投稿したコンテンツが含まれています。利用するには以下の規約に同意する必要があります。'.i18n,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Row(children: [
            Expanded(
              child: FilledButton.tonal(
                style: FilledButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('利用規約'.i18n),
                onPressed: () {
                  context.push('/terms');
                },
              ),
            ),
          ]),
          if (Platform.isIOS) const SizedBox(height: 16),
          if (Platform.isIOS)
            Row(children: [
              Expanded(
                child: FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text('利用規約（EULA）'.i18n),
                  onPressed: () {
                    context.push('/terms/eula');
                  },
                ),
              ),
            ]),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: FilledButton.tonal(
                style: FilledButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('プライバシーポリシー'.i18n),
                onPressed: () {
                  context.push('/privacy');
                },
              ),
            ),
          ]),
          const SizedBox(height: 40),
          Row(children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('同意して進む'.i18n),
                onPressed: () {
                  final notifier = ref.read(configProvider.notifier);
                  notifier.updateEulaCheck(true);
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
