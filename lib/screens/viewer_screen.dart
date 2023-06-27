import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/query_user_provider.dart';

class ViewerScreen extends HookConsumerWidget {
  const ViewerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    const userId = "3293";

    final queryUser = ref.watch(queryUserProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ'),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: queryUser.when(
            data: (data) {
              if (data.data!.user == null) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).disabledColor,
                );
              }
              final user = data.data!.user!;
              print(user);
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              );
            },
            error: (error, stackTrace) {
              return const Text("エラー");
            },
            loading: () {
              return Container();
              // const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
