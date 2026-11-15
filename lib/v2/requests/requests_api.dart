import 'dart:convert';

import 'package:aipictors/v2/core/api.dart';
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
      RequestUser(id: j.str('id'), login: j.str('login'), name: j.str('name', 'ユーザー'), iconUrl: j.strOrNull('iconUrl'));
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

const planCategoryLabels = {'ILLUSTRATION': 'イラスト', 'ICON': 'アイコン', 'CHARACTER': 'キャラクター', 'BACKGROUND': '背景', 'WALLPAPER': '壁紙', 'OTHER': 'その他'};

const requestStatusLabels = {
  'PENDING': '承諾待ち',
  'ACCEPTED': '制作中',
  'DELIVERED': '納品済み',
  'COMPLETED': '完了',
  'DECLINED': 'お断り',
  'CANCELED': 'キャンセル',
  'EXPIRED': '期限切れ',
  'ADMIN_CANCELED': '運営がキャンセル',
  'ADMIN_COMPLETED': '運営が完了',
};

const _errorMessages = {
  'INSUFFICIENT_COINS': 'コインが足りません',
  'SELF_REQUEST': '自分にはリクエストできません',
  'PLAN_NOT_FOUND': 'このプランは見つかりませんでした',
  'NOT_ACCEPTING': 'いまはリクエストを受け付けていません',
  'PRICE_CHANGED': 'プランの価格が変わりました。画面を開き直してください',
  'FULL': '受付の上限に達しています。しばらくしてからお試しください',
  'TOO_MANY_PENDING': 'このクリエイターへの承諾待ちのリクエストが多すぎます',
  'BELOW_MINIMUM': '最低コインより少ない金額です',
  'R18_NOT_ALLOWED': 'このクリエイターは R18 のリクエストを受け付けていません',
  'BLOCKED': 'このユーザーにはリクエストできません',
  'BODY_REQUIRED': 'リクエストの内容を書いてください',
  'INVALID_PRICE': '金額は 100〜100,000 コインで指定してください',
  'INVALID_STATE': '状態が変わりました。画面を更新してください',
  'NOT_OVERDUE': '納期を過ぎるまでキャンセルできません',
  'NO_REVISIONS_LEFT': '修正の回数が残っていません',
  'DELIVERY_REQUIRED': '納品する画像を選んでください',
  'MESSAGE_REQUIRED': 'メッセージを書いてください',
  'TITLE_REQUIRED': 'タイトルを入れてください',
  'DESCRIPTION_REQUIRED': '説明を入れてください',
  'TOO_MANY_PLANS': 'プランは 20 個までです',
  'DISABLED': 'リクエストはいま停止中です',
  'Unauthorized': 'ログインしてください',
  'REASON_REQUIRED': '理由を書いてください',
};

class RequestsApi {
  RequestsApi._();

  static Future<Map<String, String>> _headers({bool required = true}) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token == null) {
      if (required) throw const ApiException('ログインしてください');
      return {'content-type': 'application/json'};
    }
    return {'authorization': 'Bearer $token', 'content-type': 'application/json'};
  }

  static dynamic _data(http.Response res) {
    Map<String, dynamic>? json;
    try {
      json = jsonDecode(res.body) as Map<String, dynamic>;
    } catch (_) {}
    final error = json?['error'];
    if (res.statusCode >= 400 || error != null) {
      final code = error?.toString() ?? 'HTTP_${res.statusCode}';
      throw ApiException(_errorMessages[code] ?? 'うまくいきませんでした。時間をおいてお試しください', code: code);
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
      throw const ApiException('通信できませんでした。電波の良いところでお試しください');
    }
    return _data(res);
  }

  static Future<dynamic> _post(Map<String, dynamic> body) async {
    final http.Response res;
    try {
      res = await http.post(Uri.parse('$_base/api/requests'), headers: await _headers(), body: jsonEncode(body)).timeout(const Duration(seconds: 30));
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException('通信できませんでした。電波の良いところでお試しください');
    }
    return _data(res);
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
    if (plan == null) throw const ApiException('このプランは見つかりませんでした');
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
