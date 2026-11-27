import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

/// コイン残高
class CoinSummary {
  const CoinSummary({required this.free, required this.premium, this.supportAccepted = true, this.premiumAccepted = true, this.rewardJoined = false});

  final int free;
  final int premium;

  /// 推す相手が推しを受け付けている（「推しを受け付けない」にしていない。summary(supportTo:) のときだけ分かる。分からなければ true）
  final bool supportAccepted;

  /// 推す相手がプレミアムコインでの推しを受け取る（summary(supportTo:) のときだけ分かる。分からなければ true）
  final bool premiumAccepted;

  /// 推す相手がクリエイター報酬に参加中（summary(supportTo:) のときだけ分かる）
  final bool rewardJoined;

  int get total => free + premium;

  /// この推しでプレミアムコインを使える（相手が受け取る）。推しはユーザーへの推しだけなので、ほかの条件はない
  bool get premiumUsable => premiumAccepted;

  /// 推しで使える残高（プレミアムコインを使えないときはフリーだけ）
  CoinSummary get forSupport => premiumUsable ? this : CoinSummary(free: free, premium: 0, supportAccepted: supportAccepted, premiumAccepted: premiumAccepted, rewardJoined: rewardJoined);

  static const zero = CoinSummary(free: 0, premium: 0);
}

/// API が作品付きの推し（workId・コメントの推し）を断ったときの code。推しはフリー・プレミアムともユーザーへの推しだけ
const supportUserOnlyCode = 'SUPPORT_USER_ONLY';

/// 作品への推しを断られたときに出す文言（API の error と同じ）
String supportUserOnlyNote() => tr('作品への推しは終了しました。推しはユーザー（プロフィール）への推しだけになりました', 'Supporting works has ended. You can now only support users (from their profile).');

/// API の断りが「推しはユーザーへの推しだけ」によるものか（GraphQL のエラーは code か文言で見る）
bool isSupportUserOnlyError(ApiException e) => e.code == supportUserOnlyCode || e.message.contains(supportUserOnlyCode) || e.message.contains('作品への推しは終了');

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

  /// supportTo を渡すと、推す相手の受け取りの状態（supportAccepted・premiumAccepted・rewardJoined）も同じ応答で受け取る
  static Future<CoinSummary> summary({String? supportTo}) async {
    final query = supportTo != null && RegExp(r'^\d+$').hasMatch(supportTo) ? '?supportTo=$supportTo' : '';
    final res = await http.get(Uri.parse('$_base/api/coins/summary$query'), headers: await _headers()).timeout(const Duration(seconds: 20));
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    final data = json is Map ? json['data'] : null;
    if (res.statusCode != 200 || data is! Map) {
      throw const ApiException('コイン残高を取得できませんでした');
    }
    int n(Object? v) => v is num ? v.toInt() : 0;
    final target = data['supportTarget'];
    return CoinSummary(
      free: n(data['freeBalance']),
      premium: n(data['premiumBalance']),
      supportAccepted: target is Map ? target['supportAccepted'] != false : true,
      premiumAccepted: target is Map ? target['premiumAccepted'] != false : true,
      rewardJoined: target is Map && target['rewardJoined'] == true,
    );
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
        String? code;
        try {
          final j = jsonDecode(utf8.decode(r.bodyBytes));
          final e = j is Map ? j['error']?.toString() : null;
          code = j is Map ? j['code']?.toString() : null;
          if (e != null && e.isNotEmpty) message = '推しを送れませんでした（$e）';
        } catch (_) {}
        // Web の /api/coins/support は code を落として error の文言だけ返すことがあるので、文言でも見る
        final e = ApiException(message, code: code);
        if (isSupportUserOnlyError(e)) throw ApiException(supportUserOnlyNote(), code: supportUserOnlyCode);
        throw e;
      }
    }
  }
}
