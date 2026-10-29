import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 画面の行き先
class Nav {
  Nav._();

  static bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;

  static void work(BuildContext context, String id) => context.push('/works/$id');

  /// [id] はユーザーの ID（数字）
  static void user(BuildContext context, String id) => context.push('/users/$id');

  static void tag(BuildContext context, String name) => context.push('/tags/${Uri.encodeComponent(name)}');

  static void search(BuildContext context, String text) => context.push('/search/${Uri.encodeComponent(text)}');

  static void login(BuildContext context) => context.push('/login');

  static void plans(BuildContext context) => context.push('/plans');

  static void rankings(BuildContext context) => context.push('/rankings');

  static void generationTask(BuildContext context, String id) => context.push('/generation/tasks/$id');

  /// ログインしていなければログイン画面へ。していれば true
  static bool requireLogin(BuildContext context) {
    if (isLoggedIn) return true;
    login(context);
    return false;
  }
}
