import 'package:flutter/material.dart';

/// ユーザーのページ（プロフィール・作品・フォロー）
class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.userId});

  /// ユーザー ID（数字）。ログイン名が来ることもある
  final String userId;

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(userId)));
}
