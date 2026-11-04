import 'package:aipictors/providers/home_tab_index_provider.dart';
import 'package:aipictors/v2/core/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// 本文の中のリンクを開く。購入の画面は Web に出さずアプリのプラン画面へ
class WebLinks {
  WebLinks._();

  static const discordInvite = 'https://discord.gg/hcQggQEYfn';

  static final _purchasePath = RegExp(r'^/(plus|plans|generation/plans|premium-coins|coins|my/coins|my/plan)(/|$)');
  static final _bareLink = RegExp(r'(?<![\(\[<])https?://(?:www\.)?aipictors\.com(?:/[a-z]{2})?/(?:plus|plans|generation/plans|premium-coins|coins|my/coins|my/plan)[^\s)\]]*');

  static bool _isAipictors(Uri u) => u.host == 'aipictors.com' || u.host == 'www.aipictors.com';

  static bool _isStripe(Uri u) => u.host == 'stripe.com' || u.host.endsWith('.stripe.com');

  static String _path(Uri u) {
    final p = u.path;
    final m = RegExp(r'^/(en|ja)(/.*)?$').firstMatch(p);
    return m == null ? p : (m.group(2) ?? '/');
  }

  /// 購入の画面へのリンクか
  static bool isPurchase(String url) {
    final u = Uri.tryParse(url);
    if (u == null) return false;
    if (_isStripe(u)) return true;
    if (u.host.isEmpty || _isAipictors(u)) return _purchasePath.hasMatch(_path(u));
    return false;
  }

  /// 文章にそのまま書かれた購入の URL を、アプリのプラン画面へのリンクにする
  static String rewriteMarkdown(String markdown) => markdown.replaceAllMapped(_bareLink, (m) => '[プラン](${m.group(0)})');

  /// アプリに同じ画面があるときのパス
  static String? _inAppPath(String path) {
    final segments = path.split('/').where((s) => s.isNotEmpty).toList();
    if (segments.isEmpty) return '/';
    final head = segments.first;
    final rest = segments.length > 1 ? segments[1] : null;
    switch (head) {
      case 'posts':
      case 'r':
        if (head == 'posts' && rest != null && RegExp(r'^\d+$').hasMatch(rest)) return '/works/$rest';
        return null;
      case 'tags':
        return rest == null ? '/tags' : '/tags/$rest';
      case 'search':
        return rest == null ? '/search' : '/search/$rest';
      case 'releases':
      case 'events':
        return path;
      case 'collections':
        return rest == null ? '/albums' : '/folders/$rest';
      case 'rankings':
      case 'ai-rankings':
      case 'coin-rankings':
      case 'themes':
      case 'models':
      case 'novels':
      case 'notes':
      case 'new-works':
      case 'announcements':
      case 'help':
      case 'guideline':
      case 'terms':
      case 'privacy':
      case 'roadmap':
      case 'albums':
      case 'messages':
        return '/$head';
      case 'support':
        return '/support/chat';
    }
    return null;
  }

  static Future<void> open(BuildContext context, String url) async {
    final u = Uri.tryParse(url);
    if (u == null) return;
    if (isPurchase(url)) {
      Nav.plans(context);
      return;
    }
    if (u.host.isEmpty || _isAipictors(u)) {
      if (_path(u).startsWith('/generation')) {
        // 生成はアプリのタブで開く（Web の生成画面にはプランの案内がある）
        ProviderScope.containerOf(context, listen: false).read(homeTabIndexProvider.notifier).update(2);
        context.go('/');
        return;
      }
      final inApp = _inAppPath(_path(u));
      if (inApp != null) {
        context.push(inApp);
        return;
      }
    }
    final target = u.host.isEmpty ? Uri.parse('https://www.aipictors.com$url') : u;
    await launchUrl(target, mode: LaunchMode.externalApplication);
  }
}
