import 'package:flutter/material.dart';

/// 「探す」タブ（検索の入口・人気タグ・ランキングなど）
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('探す')));
}

/// 検索結果（作品・ユーザー・タグ）
class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(text)));
}

/// タグの作品一覧
class TagScreen extends StatelessWidget {
  const TagScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('#$name')));
}

/// ランキング（デイリー・ウィークリー・マンスリー）
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('ランキング')));
}
