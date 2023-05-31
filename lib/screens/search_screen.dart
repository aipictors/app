import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("検索"),
          ],
        ),
      ),
    );
  }
}
