import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

/// コイン残高
class CoinSummary {
  const CoinSummary({required this.free, required this.premium});

  final int free;
  final int premium;

  int get total => free + premium;

  static const zero = CoinSummary(free: 0, premium: 0);
}

/// 推しで使う内訳（フリーから先に使う。Web と同じ）
class SupportBreakdown {
  const SupportBreakdown(this.free, this.premium);

  final int free;
  final int premium;

  int get total => free + premium;

  /// 推し pt（プレミアムは 10 倍）
  int get pt => free + premium * 10;

  static SupportBreakdown? of(int amount, CoinSummary balance) {
    if (amount <= 0 || amount > balance.total) return null;
    final free = amount < balance.free ? amount : balance.free;
    final premium = amount - free;
    if (premium > balance.premium) return null;
    return SupportBreakdown(free, premium);
  }
}

/// Web（www.aipictors.com）の /api/coins/* を呼ぶ
class Coins {
  Coins._();

  static const _base = 'https://www.aipictors.com';

  static Future<Map<String, String>> _headers() async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token == null) throw const ApiException('ログインしてください');
    return {'authorization': 'Bearer $token', 'content-type': 'application/json'};
  }

  static Future<CoinSummary> summary() async {
    final res = await http.get(Uri.parse('$_base/api/coins/summary'), headers: await _headers()).timeout(const Duration(seconds: 20));
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final data = json is Map ? json['data'] : null;
    if (res.statusCode != 200 || data is! Map) {
      throw const ApiException('コイン残高を取得できませんでした');
    }
    int n(Object? v) => v is num ? v.toInt() : 0;
    return CoinSummary(free: n(data['freeBalance']), premium: n(data['premiumBalance']));
  }

  /// 推しを送る（フリーとプレミアムに分けて送る）
  static Future<void> support({
    required String recipientUserId,
    required SupportBreakdown breakdown,
    bool isAnonymous = false,
  }) async {
    final headers = await _headers();
    final requestId = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
    final futures = <Future<http.Response>>[];
    void send(String type, int amount) {
      futures.add(http
          .post(
            Uri.parse('$_base/api/coins/support'),
            headers: headers,
            body: jsonEncode({
              'recipientUserId': recipientUserId,
              'coinType': type,
              'amount': amount,
              'isAnonymous': isAnonymous,
              'source': 'app-support:$requestId:$type',
            }),
          )
          .timeout(const Duration(seconds: 30)));
    }

    if (breakdown.free > 0) send('FREE', breakdown.free);
    if (breakdown.premium > 0) send('PREMIUM', breakdown.premium);
    final responses = await Future.wait(futures);
    for (final r in responses) {
      if (r.statusCode != 200) {
        String message = '推しを送れませんでした';
        try {
          final j = jsonDecode(utf8.decode(r.bodyBytes));
          final e = j is Map ? j['error']?.toString() : null;
          if (e != null && e.isNotEmpty) message = '推しを送れませんでした（$e）';
        } catch (_) {}
        throw ApiException(message);
      }
    }
  }
}
