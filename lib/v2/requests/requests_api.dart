import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

/// 有料リクエストとプラン（Web と同じ /api/requests を使う）
const _base = 'https://www.aipictors.com';

class RequestUser {
  const RequestUser({required this.id, required this.login, required this.name, this.iconUrl});

  final String id;
  final String login;
  final String name;
  final String? iconUrl;

  static RequestUser fromJson(Map<String, dynamic> j) =>
      RequestUser(id: j.str('id'), login: j.str('login'), name: j.str('name', tr('ユーザー', 'User')), iconUrl: j.strOrNull('iconUrl'));
}

Map<String, RequestUser> _users(Map<String, dynamic> data) {
  final raw = data['users'];
  if (raw is! Map) return {};
  return {
    for (final e in raw.entries)
      if (e.value is Map) e.key.toString(): RequestUser.fromJson(Map<String, dynamic>.from(e.value as Map)),
  };
}

List<String> _strings(dynamic v) => v is List ? v.map((e) => e.toString()).toList() : const [];

class RequestPlan {
  RequestPlan(this.j);

  final Map<String, dynamic> j;
  String get id => j.str('id');
  String get userId => j.str('userId');
  String get title => j.str('title');
  String get description => j.str('description');
  String get category => j.str('category', 'ILLUSTRATION');
  List<String> get sampleImageUrls => _strings(j['sampleImageUrls']);
  int get priceCoins => j.integer('priceCoins');
  int get deliveryDays => j.integer('deliveryDays');
  int get imageCount => j.integer('imageCount');
  int get revisionCount => j.integer('revisionCount');
  int get maxActive => j.integer('maxActive');
  int? get activeCount => j['activeCount'] == null ? null : j.integer('activeCount');
  bool get isAccepting => j.boolean('isAccepting');
  bool get allowsR18 => j.boolean('allowsR18');
  bool get isHidden => j.str('status') == 'HIDDEN';
  int get orderCount => j.integer('orderCount');
  int get completedCount => j.integer('completedCount');
  bool get isFull => activeCount != null && activeCount! >= maxActive;
  bool get canApply => isAccepting && !isFull && !isHidden;
}

class RequestSettings {
  RequestSettings(this.j);

  final Map<String, dynamic> j;
  bool get acceptsFreeRequests => j.boolean('acceptsFreeRequests');
  int get minCoins => j.integer('minCoins', 100);
  bool get allowsR18 => j.boolean('allowsR18');
  int get maxActive => j.integer('maxActive', 3);
  String get note => j.str('note');
}

class CreatorProfile {
  CreatorProfile(this.plans, this.settings, this.users, this.completedCount, this.canFreeRequest);

  final List<RequestPlan> plans;
  final RequestSettings settings;
  final Map<String, RequestUser> users;
  final int completedCount;
  final bool canFreeRequest;
}

class RequestMessage {
  RequestMessage(this.j);

  final Map<String, dynamic> j;
  String get id => j.str('id');
  String? get senderUserId => j.strOrNull('senderUserId');
  String get body => j.str('body');
  List<String> get imageUrls => _strings(j['imageUrls']);
  int get createdAt => j.integer('createdAt');
}

class CoinRequest {
  CoinRequest(this.j);

  final Map<String, dynamic> j;
  String get id => j.str('id');
  String? get planTitle => j.strOrNull('planTitle');
  String get requesterUserId => j.str('requesterUserId');
  String get creatorUserId => j.str('creatorUserId');
  bool get isCreator => j.str('role') == 'CREATOR';
  String get title => j.str('title');
  String get body => j.str('body');
  List<String> get referenceImageUrls => _strings(j['referenceImageUrls']);
  bool get isR18 => j.boolean('isR18');
  int get priceCoins => j.integer('priceCoins');
  int get deliveryDays => j.integer('deliveryDays');
  int get revisionLeft => j.integer('revisionLeft');
  String get status => j.str('status');
  int get respondBy => j.integer('respondBy');
  int? get dueAt => j['dueAt'] == null ? null : j.integer('dueAt');
  int? get autoCompleteAt => j['autoCompleteAt'] == null ? null : j.integer('autoCompleteAt');
  String? get deliveryMessage => j.strOrNull('deliveryMessage');
  List<String> get deliveryImageUrls => _strings(j['deliveryImageUrls']);
  String? get closedReason => j.strOrNull('closedReason');
  /// 作品のリンクで納品されたとき（Web から作品 URL で納品できる）
  String? get deliveredWorkId => j.strOrNull('deliveredWorkId');
  Map<String, dynamic>? get settlement => j.obj('settlement');
  List<RequestMessage> get messages => j.list('messages').map(RequestMessage.new).toList();
  bool get isOpen => status == 'PENDING' || status == 'ACCEPTED' || status == 'DELIVERED';
}

class RequestList {
  RequestList(this.requests, this.counts, this.users);

  final List<CoinRequest> requests;
  final Map<String, int> counts;
  final Map<String, RequestUser> users;
}

Map<String, String> get planCategoryLabels => L10n.isJa
    ? const {'ILLUSTRATION': 'イラスト', 'ICON': 'アイコン', 'CHARACTER': 'キャラクター', 'BACKGROUND': '背景', 'WALLPAPER': '壁紙', 'OTHER': 'その他'}
    : const {'ILLUSTRATION': 'Illustration', 'ICON': 'Icon', 'CHARACTER': 'Character', 'BACKGROUND': 'Background', 'WALLPAPER': 'Wallpaper', 'OTHER': 'Other'};

Map<String, String> get requestStatusLabels => L10n.isJa
    ? const {
        'PENDING': '承諾待ち',
        'ACCEPTED': '制作中',
        'DELIVERED': '納品済み',
        'COMPLETED': '完了',
        'DECLINED': 'お断り',
        'CANCELED': 'キャンセル',
        'EXPIRED': '期限切れ',
        'ADMIN_CANCELED': '運営がキャンセル',
        'ADMIN_COMPLETED': '運営が完了',
      }
    : const {
        'PENDING': 'Waiting',
        'ACCEPTED': 'In progress',
        'DELIVERED': 'Delivered',
        'COMPLETED': 'Completed',
        'DECLINED': 'Declined',
        'CANCELED': 'Canceled',
        'EXPIRED': 'Expired',
        'ADMIN_CANCELED': 'Canceled by staff',
        'ADMIN_COMPLETED': 'Completed by staff',
      };

/// API のエラーコード → (日本語, 英語)
const _errorMessages = {
  'INSUFFICIENT_COINS': ('コインが足りません', 'Not enough coins'),
  'SELF_REQUEST': ('自分にはリクエストできません', 'You cannot request yourself'),
  'PLAN_NOT_FOUND': ('このプランは見つかりませんでした', 'This plan was not found'),
  'NOT_ACCEPTING': ('いまはリクエストを受け付けていません', 'Not accepting requests now'),
  'PRICE_CHANGED': ('プランの価格が変わりました。画面を開き直してください', 'The plan price changed. Please reopen the screen'),
  'FULL': ('受付の上限に達しています。しばらくしてからお試しください', 'This creator is full right now. Please try again later'),
  'TOO_MANY_PENDING': ('このクリエイターへの承諾待ちのリクエストが多すぎます', 'Too many requests are waiting for this creator'),
  'BELOW_MINIMUM': ('最低コインより少ない金額です', 'Below the minimum coins'),
  'R18_NOT_ALLOWED': ('このクリエイターは R18 のリクエストを受け付けていません', 'This creator does not accept R18 requests'),
  'BLOCKED': ('このユーザーにはリクエストできません', 'You cannot request this user'),
  'BODY_REQUIRED': ('リクエストの内容を書いてください', 'Please describe your request'),
  'INVALID_PRICE': ('金額は 100〜100,000 コインで指定してください', 'Please set 100–100,000 coins'),
  'INVALID_STATE': ('状態が変わりました。画面を更新してください', 'The status changed. Please refresh'),
  'NOT_OVERDUE': ('納期を過ぎるまでキャンセルできません', 'You can cancel only after the due date'),
  'NO_REVISIONS_LEFT': ('修正の回数が残っていません', 'No revisions left'),
  'DELIVERY_REQUIRED': ('納品する画像を選んでください', 'Please choose images to deliver'),
  'MESSAGE_REQUIRED': ('メッセージを書いてください', 'Please write a message'),
  'TITLE_REQUIRED': ('タイトルを入れてください', 'Please enter a title'),
  'DESCRIPTION_REQUIRED': ('説明を入れてください', 'Please enter a description'),
  'TOO_MANY_PLANS': ('プランは 20 個までです', 'Up to 20 plans'),
  'DISABLED': ('リクエストはいま停止中です', 'Requests are paused now'),
  'Unauthorized': ('ログインしてください', 'Please log in'),
  'REASON_REQUIRED': ('理由を書いてください', 'Please write a reason'),
  'CLOSED': ('終わってから 30 日を過ぎたのでメッセージは送れません', 'Messages are closed 30 days after the request ended'),
  'NOT_FOUND': ('この依頼は見つかりませんでした', 'This request was not found'),
  'FORBIDDEN': ('この操作はできません', 'You cannot do this'),
  'CREATOR_NOT_FOUND': ('クリエイターが見つかりませんでした', 'Creator not found'),
};

/// エラーコードを利用者向けの文に
String requestErrorMessage(String code) {
  final m = _errorMessages[code];
  if (m != null) return tr(m.$1, m.$2);
  return tr('うまくいきませんでした。時間をおいてお試しください', 'Something went wrong. Please try again later');
}

/// 終わった理由。API の決まった値（overdue など）は文に、それ以外（お断りの理由など）はそのまま
String requestClosedReason(String reason) => switch (reason) {
  'overdue' => tr('納期を過ぎたためキャンセルされました', 'Canceled because it was overdue'),
  'requester' => tr('依頼者が取り下げました', 'Withdrawn by the requester'),
  'no_response' => tr('期限までに承諾されませんでした', 'Not accepted before the deadline'),
  'auto' => tr('期限が来たので自動で完了しました', 'Completed automatically'),
  _ => reason,
};

/// 運営（API）が依頼に書き込むお知らせのメッセージ。英語表示では訳して出す
String requestSystemMessage(String body) {
  if (L10n.isJa) return body;
  const exact = {
    '依頼を承諾しました': 'The request was accepted',
    '依頼者が依頼を取り下げました。コインは全額返却されました': 'The requester withdrew the request. Coins were fully returned',
    '納期を過ぎたため依頼者がキャンセルしました。コインは全額返却されました': 'The requester canceled because it was overdue. Coins were fully returned',
    '納品しました': 'Delivered',
  };
  final hit = exact[body];
  if (hit != null) return hit;
  const declined = '依頼をお断りしました。コインは全額返却されました';
  if (body.startsWith(declined)) {
    final rest = body.substring(declined.length).replaceFirst('\n理由: ', '\nReason: ');
    return 'The request was declined. Coins were fully returned$rest';
  }
  if (body.startsWith('修正をお願いしました\n')) return 'Revision requested\n${body.substring('修正をお願いしました\n'.length)}';
  return body;
}

class RequestsApi {
  RequestsApi._();

  static Future<Map<String, String>> _headers({bool required = true}) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token == null) {
      if (required) throw ApiException(requestErrorMessage('Unauthorized'), code: 'Unauthorized');
      return {'content-type': 'application/json'};
    }
    return {'authorization': 'Bearer $token', 'content-type': 'application/json'};
  }

  /// 応答 { error, data } を読む。失敗は ApiException（code に API のエラーコード）
  static dynamic parse(http.Response res) {
    Map<String, dynamic>? json;
    try {
      // 応答は charset なしの application/json なので、bodyBytes を UTF-8 で読む（res.body は latin1 になり日本語が化ける）
      json = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
    } catch (_) {}
    final error = json?['error'];
    if (res.statusCode >= 400 || error != null) {
      final code = error?.toString() ?? 'HTTP_${res.statusCode}';
      throw ApiException(requestErrorMessage(code), code: code);
    }
    return json?['data'];
  }

  static Future<dynamic> _get(Map<String, String> params, {bool auth = true}) async {
    final uri = Uri.parse('$_base/api/requests').replace(queryParameters: params);
    final http.Response res;
    try {
      res = await http.get(uri, headers: await _headers(required: auth)).timeout(const Duration(seconds: 20));
    } on ApiException {
      rethrow;
    } catch (_) {
      throw ApiException(tr('通信できませんでした。電波の良いところでお試しください', 'Could not connect. Please check your connection'), code: 'NETWORK');
    }
    return parse(res);
  }

  static Future<dynamic> _post(Map<String, dynamic> body) async {
    final http.Response res;
    try {
      res = await http.post(Uri.parse('$_base/api/requests'), headers: await _headers(), body: jsonEncode(body)).timeout(const Duration(seconds: 30));
    } on ApiException {
      rethrow;
    } catch (_) {
      throw ApiException(tr('通信できませんでした。電波の良いところでお試しください', 'Could not connect. Please check your connection'), code: 'NETWORK');
    }
    return parse(res);
  }

  static Map<String, dynamic> _map(dynamic v) => v is Map ? Map<String, dynamic>.from(v) : <String, dynamic>{};

  static Future<(List<RequestPlan>, Map<String, RequestUser>)> plans({String? category, String sort = 'popular'}) async {
    final data = _map(
      await _get({
        'op': 'plans',
        if (category != null && category.isNotEmpty) 'category': category,
        if (sort != 'popular') 'sort': sort,
      }, auth: false),
    );
    return (data.list('plans').map(RequestPlan.new).toList(), _users(data));
  }

  static Future<(RequestPlan, Map<String, RequestUser>)> plan(String id) async {
    final data = _map(await _get({'op': 'plan', 'id': id}, auth: false));
    final plan = data.obj('plan');
    if (plan == null) throw ApiException(requestErrorMessage('PLAN_NOT_FOUND'), code: 'PLAN_NOT_FOUND');
    return (RequestPlan(plan), _users(data));
  }

  static Future<CreatorProfile> creator(String userId) async {
    final data = _map(await _get({'op': 'creator', 'userId': userId}, auth: false));
    return CreatorProfile(
      data.list('plans').map(RequestPlan.new).toList(),
      RequestSettings(data.obj('settings') ?? {}),
      _users(data),
      data.integer('completedCount'),
      data.boolean('canFreeRequest'),
    );
  }

  static Future<RequestList> list({required bool sent, required String status}) async {
    final data = _map(await _get({'op': 'list', 'role': sent ? 'sent' : 'received', 'status': status}));
    final counts = <String, int>{};
    final raw = data['counts'];
    if (raw is Map) {
      for (final e in raw.entries) {
        counts[e.key.toString()] = int.tryParse(e.value.toString()) ?? 0;
      }
    }
    return RequestList(data.list('requests').map(CoinRequest.new).toList(), counts, _users(data));
  }

  static Future<(int, int)> badge() async {
    final data = _map(await _get({'op': 'badge'}));
    return (data.integer('received'), data.integer('toConfirm'));
  }

  static Future<(CoinRequest, Map<String, RequestUser>)> detail(String id) async {
    final data = _map(await _get({'op': 'detail', 'id': id}));
    return (CoinRequest(data.obj('request') ?? {}), _users(data));
  }

  /// 申し込み。二度押しは clientKey で 1 回になる
  static Future<String> apply(Map<String, dynamic> input) async {
    final data = _map(await _post({'op': 'apply', ...input}));
    return data.str('requestId');
  }

  static Future<CoinRequest?> act(String id, String action, [Map<String, dynamic> extra = const {}]) async {
    final data = _map(await _post({'op': 'action', 'id': id, 'action': action, ...extra}));
    final r = data.obj('request');
    return r == null ? null : CoinRequest(r);
  }

  static Future<void> savePlan(Map<String, dynamic> input) => _post({'op': 'save-plan', ...input});

  static Future<void> deletePlan(String id) => _post({'op': 'delete-plan', 'id': id});

  static Future<void> reportPlan(String id, String reason) => _post({'op': 'report-plan', 'id': id, 'reason': reason});

  static Future<void> saveSettings(Map<String, dynamic> input) => _post({'op': 'save-settings', ...input});
}
