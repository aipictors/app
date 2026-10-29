import 'dart:convert';
import 'dart:io';

import 'package:aipictors/config.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// GraphQL のエラー（画面にそのまま出せる文言を持つ）
class ApiException implements Exception {
  const ApiException(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() => message;
}

/// 新しい画面から使う軽量な GraphQL クライアント。
/// Web と同じクエリをそのまま投げ、結果は Map で受け取る。
class Api {
  Api._();

  static final _client = http.Client();

  static final Map<String, _CacheEntry> _cache = {};

  static String get endpoint => DefaultConfig.graphqlEndpoint.trim();

  static Future<Map<String, String>> _headers() async {
    String? token;
    try {
      token = await FirebaseAuth.instance.currentUser?.getIdToken();
    } catch (_) {
      token = null;
    }
    final language = const ConfigRepository().language;
    String version = '';
    try {
      version = DefaultConfig.version;
    } catch (_) {}
    return {
      'content-type': 'application/json',
      if (token != null) 'authorization': 'Bearer $token',
      'flutter-version': version,
      'flutter-secret-token': DefaultConfig.secretToken,
      'flutter-os': Platform.operatingSystem.toUpperCase(),
      'language': language.toUpperCase(),
      'platform': 'flutter',
    };
  }

  /// 読み取り。[cacheFor] を指定すると、その間は同じ結果を使い回す
  static Future<Map<String, dynamic>> query(
    String document, {
    Map<String, dynamic>? variables,
    Duration? cacheFor,
  }) async {
    final key = cacheFor == null
        ? null
        : '${FirebaseAuth.instance.currentUser?.uid}|$document|${jsonEncode(variables ?? {})}';
    if (key != null) {
      final hit = _cache[key];
      if (hit != null && hit.expiresAt.isAfter(DateTime.now())) {
        return hit.data;
      }
    }
    final data = await _send(document, variables);
    if (key != null) {
      _cache[key] = _CacheEntry(data, DateTime.now().add(cacheFor!));
    }
    return data;
  }

  /// 書き込み。キャッシュはすべて捨てる
  static Future<Map<String, dynamic>> mutate(
    String document, {
    Map<String, dynamic>? variables,
  }) async {
    final data = await _send(document, variables);
    _cache.clear();
    return data;
  }

  static void clearCache() => _cache.clear();

  static Future<Map<String, dynamic>> _send(
    String document,
    Map<String, dynamic>? variables,
  ) async {
    final http.Response response;
    try {
      response = await _client
          .post(
            Uri.parse(endpoint),
            headers: await _headers(),
            body: jsonEncode({
              'query': document,
              if (variables != null) 'variables': variables,
            }),
          )
          .timeout(const Duration(seconds: 40));
    } on SocketException {
      throw const ApiException('通信できませんでした。電波の良いところでもう一度お試しください');
    } catch (_) {
      throw const ApiException('通信に失敗しました。もう一度お試しください');
    }

    Map<String, dynamic> json;
    try {
      json = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    } catch (_) {
      throw ApiException('サーバーからの応答を読めませんでした（${response.statusCode}）');
    }

    final errors = json['errors'];
    if (errors is List && errors.isNotEmpty) {
      final first = errors.first as Map<String, dynamic>;
      final message = (first['message'] ?? 'エラーが発生しました').toString();
      final code = (first['extensions'] is Map) ? first['extensions']['code']?.toString() : null;
      if (kDebugMode) {
        // ignore: avoid_print
        print('[Api] $message\n${document.split('\n').first}');
      }
      if (json['data'] == null) {
        throw ApiException(message, code: code);
      }
    }
    final data = json['data'];
    if (data is! Map<String, dynamic>) {
      throw const ApiException('データを取得できませんでした');
    }
    return data;
  }
}

class _CacheEntry {
  _CacheEntry(this.data, this.expiresAt);

  final Map<String, dynamic> data;
  final DateTime expiresAt;
}

/// Map から安全に値を取り出す小さな助け
extension JsonRead on Map<String, dynamic> {
  String str(String key, [String fallback = '']) => this[key]?.toString() ?? fallback;

  String? strOrNull(String key) {
    final v = this[key];
    if (v == null) return null;
    final s = v.toString();
    return s.isEmpty ? null : s;
  }

  int integer(String key, [int fallback = 0]) {
    final v = this[key];
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse(v?.toString() ?? '') ?? fallback;
  }

  double number(String key, [double fallback = 0]) {
    final v = this[key];
    if (v is num) return v.toDouble();
    return double.tryParse(v?.toString() ?? '') ?? fallback;
  }

  bool boolean(String key, [bool fallback = false]) {
    final v = this[key];
    if (v is bool) return v;
    return fallback;
  }

  Map<String, dynamic>? obj(String key) {
    final v = this[key];
    return v is Map<String, dynamic> ? v : null;
  }

  List<Map<String, dynamic>> list(String key) {
    final v = this[key];
    if (v is! List) return const [];
    return v.whereType<Map<String, dynamic>>().toList();
  }
}
