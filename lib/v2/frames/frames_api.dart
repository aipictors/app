import 'dart:math';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/models.dart';
import 'package:aipictors/v2/frames/gacha_rules.dart';

/// ガチャの自分の状態（Web の SpecialGachaState）
class GachaState {
  const GachaState({
    required this.exchangePoints,
    required this.shards,
    required this.totalPulls,
    required this.freePullsToday,
    required this.isPremiumDealAvailable,
    required this.selectedHeaderFrameSlug,
    required this.owned,
  });

  final int exchangePoints;
  final int shards;
  final int totalPulls;
  final int freePullsToday;
  final bool isPremiumDealAvailable;
  final String? selectedHeaderFrameSlug;

  /// prizeId → 持っている数
  final Map<String, int> owned;

  bool owns(GachaPrize prize) => (owned[prize.id] ?? 0) > 0;

  int get ownedInPool => GachaRules.pool.where(owns).length;

  static GachaState fromJson(Map<String, dynamic> j) => GachaState(
        exchangePoints: j.integer('exchangePoints'),
        shards: j.integer('shards'),
        totalPulls: j.integer('totalPulls'),
        freePullsToday: j.integer('freePullsToday'),
        isPremiumDealAvailable: j.boolean('isPremiumDealAvailable', true),
        selectedHeaderFrameSlug: j.strOrNull('selectedHeaderFrameSlug'),
        owned: {for (final p in j.list('ownedPrizes')) p.str('prizeId'): p.integer('count')},
      );

  static const empty = GachaState(
    exchangePoints: 0,
    shards: 0,
    totalPulls: 0,
    freePullsToday: 0,
    isPremiumDealAvailable: true,
    selectedHeaderFrameSlug: null,
    owned: {},
  );
}

class GachaPull {
  const GachaPull({required this.prize, required this.isNew, required this.shards, required this.byGuarantee});

  final GachaPrize prize;
  final bool isNew;
  final int shards;
  final bool byGuarantee;
}

class GachaDrawResult {
  const GachaDrawResult({required this.costCoins, required this.pulls, required this.state});

  final int costCoins;
  final List<GachaPull> pulls;
  final GachaState state;

  int get shards => pulls.fold(0, (sum, p) => sum + p.shards);
}

/// 枠選びに出す枠（Web の AvatarFrameItem）
class FrameItem {
  const FrameItem({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.requiredPassType,
    required this.priceCoins,
    required this.isPremiumCoinsOnly,
    required this.frame,
    this.isGachaOnly = false,
  });

  final String id;
  final String slug;
  final String name;
  final String? description;
  final String requiredPassType;
  final int? priceCoins;
  final bool isPremiumCoinsOnly;
  final AvatarFrame frame;
  final bool isGachaOnly;

  bool get isCoinFrame => priceCoins != null;

  static FrameItem fromJson(Map<String, dynamic> j) => FrameItem(
        id: j.str('id'),
        slug: j.str('slug'),
        name: j.str('name'),
        description: j.strOrNull('description'),
        requiredPassType: j.str('requiredPassType', 'FREE'),
        priceCoins: j['priceCoins'] is num ? (j['priceCoins'] as num).toInt() : null,
        isPremiumCoinsOnly: j.boolean('isPremiumCoinsOnly'),
        isGachaOnly: j.boolean('isGachaOnly'),
        frame: AvatarFrame.fromJson(j) ?? const AvatarFrame(frameType: 'GRADIENT'),
      );
}

/// 枠選びの画面のデータ（Web の ProfileAvatarFrameSettings）
class FrameSettings {
  const FrameSettings({
    required this.frames,
    required this.ownedFrameIds,
    required this.appliedFrameId,
    required this.currentPassType,
    required this.iconUrl,
    required this.userName,
    this.headerImageUrl,
  });

  final List<FrameItem> frames;
  final Set<String> ownedFrameIds;
  final String? appliedFrameId;
  final String? currentPassType;
  final String? iconUrl;
  final String userName;
  final String? headerImageUrl;

  FrameItem? byId(String? id) {
    if (id == null) return null;
    for (final f in frames) {
      if (f.id == id) return f;
    }
    return null;
  }
}

/// 枠を使えるか（Web の toUserAvatarFrameAccess）
enum FrameAccess { available, needsPlan, needsCoins }

class FrameRules {
  FrameRules._();

  static const _passRank = {'LITE': 1, 'STANDARD': 2, 'PREMIUM': 3};

  static int passRank(String? pass) => _passRank[pass] ?? 0;

  static String passLabel(String? pass) => _passRank.containsKey(pass) ? pass! : 'FREE';

  /// コインの枠は買った人だけ、サブスクの枠はそのプラン以上の間だけ使える
  static FrameAccess access(FrameItem frame, {required String? currentPassType, required Set<String> ownedFrameIds}) {
    if (frame.isCoinFrame) return ownedFrameIds.contains(frame.id) ? FrameAccess.available : FrameAccess.needsCoins;
    return passRank(currentPassType) >= passRank(frame.requiredPassType) ? FrameAccess.available : FrameAccess.needsPlan;
  }

  /// 分類（Web の USER_AVATAR_FRAME_CATEGORIES）。装飾の slug は deco-<分類>-<名前>
  static const categories = <(String, String, String)>[
    ('all', 'すべて', 'All'),
    ('special', 'スペシャル', 'Special'),
    ('plan', 'プラン限定', 'Plan exclusive'),
    ('sweets', 'スイーツ', 'Sweets'),
    ('cute', 'かわいい', 'Cute'),
    ('cool', 'かっこいい', 'Cool'),
    ('nature', '自然', 'Nature'),
    ('fantasy', 'ファンタジー', 'Fantasy'),
    ('element', '炎・氷・宇宙', 'Elements'),
    ('cyber', 'サイバー', 'Cyber'),
    ('wa', '和', 'Japanese'),
    ('creator', 'クリエイター', 'Creator'),
    ('basic', 'シンプル', 'Simple'),
  ];

  static String category(String slug) {
    final key = RegExp(r'^deco-([a-z]+)-').firstMatch(slug)?.group(1);
    return categories.any((c) => c.$1 == key && key != 'all') ? key! : 'basic';
  }
}

class FramesApi {
  FramesApi._();

  static const _stateFields = '''
    exchangePoints
    shards
    totalPulls
    freePullsToday
    isPremiumDealAvailable
    selectedHeaderFrameSlug
    ownedPrizes { prizeId count }
''';

  static Future<GachaState> viewerGacha() async {
    final data = await Api.query('query AppViewerGacha { viewerGacha { $_stateFields } }');
    final j = data.obj('viewerGacha');
    return j == null ? GachaState.empty : GachaState.fromJson(j);
  }

  static String _requestId() {
    final r = Random.secure();
    final b = List<int>.generate(16, (_) => r.nextInt(256));
    b[6] = (b[6] & 0x0f) | 0x40;
    b[8] = (b[8] & 0x3f) | 0x80;
    final h = b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
    return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-${h.substring(16, 20)}-${h.substring(20)}';
  }

  /// 抽選とコインの支払いはサーバー。expectedCostCoins が今の値段と違えば GACHA_PRICE_CHANGED
  static Future<GachaDrawResult> draw({required GachaCoinType coinType, required int count, required int expectedCostCoins}) async {
    final data = await Api.mutate('''
mutation AppDrawGacha(\$input: DrawGachaInput!) {
  drawGacha(input: \$input) {
    drawId
    costCoins
    pulls { prizeId isNew shards byGuarantee }
    state { $_stateFields }
  }
}''', variables: {
      'input': {'requestId': _requestId(), 'coinType': coinType.value, 'count': count, 'expectedCostCoins': expectedCostCoins},
    });
    final j = data.obj('drawGacha') ?? const <String, dynamic>{};
    final pulls = <GachaPull>[];
    for (final p in j.list('pulls')) {
      final prize = GachaPrize.byId(p.str('prizeId'));
      if (prize == null) continue;
      pulls.add(GachaPull(prize: prize, isNew: p.boolean('isNew'), shards: p.integer('shards'), byGuarantee: p.boolean('byGuarantee')));
    }
    return GachaDrawResult(costCoins: j.integer('costCoins'), pulls: pulls, state: GachaState.fromJson(j.obj('state') ?? const {}));
  }

  static Future<GachaState> exchange(GachaPrize prize, {required bool shards}) async {
    final data = await Api.mutate('mutation AppExchangeGachaPrize(\$input: ExchangeGachaPrizeInput!) { exchangeGachaPrize(input: \$input) { $_stateFields } }', variables: {
      'input': {'prizeId': prize.id, 'method': shards ? 'SHARDS' : 'POINTS'},
    });
    return GachaState.fromJson(data.obj('exchangeGachaPrize') ?? const {});
  }

  /// ヘッダー枠を着ける（null で外す）
  static Future<GachaState> selectHeaderFrame(String? slug) async {
    final data = await Api.mutate('mutation AppSelectGachaHeaderFrame(\$input: SelectGachaHeaderFrameInput!) { selectGachaHeaderFrame(input: \$input) { $_stateFields } }', variables: {
      'input': {'slug': slug},
    });
    return GachaState.fromJson(data.obj('selectGachaHeaderFrame') ?? const {});
  }

  /// 枠選びのデータ。ガチャの枠は持っているものだけ返ってくる
  static Future<FrameSettings> frameSettings() async {
    const frameFields = 'id slug name description requiredPassType priceCoins isPremiumCoinsOnly isGachaOnly frameType backgroundStyle overlayImageUrl borderPadding';
    final data = await Api.query('''
query AppFrameSettings {
  viewer { id user { id name iconUrl headerImageUrl } currentPass { id type } }
  userSetting { id selectedUserAvatarFrame { id } }
  viewerOwnedUserAvatarFrameIds
  userAvatarFrames { $frameFields }
}''');
    final viewer = data.obj('viewer');
    return FrameSettings(
      frames: data.list('userAvatarFrames').map(FrameItem.fromJson).toList(),
      ownedFrameIds: {for (final v in (data['viewerOwnedUserAvatarFrameIds'] as List?) ?? const []) v.toString()},
      appliedFrameId: data.obj('userSetting')?.obj('selectedUserAvatarFrame')?.strOrNull('id'),
      currentPassType: viewer?.obj('currentPass')?.strOrNull('type'),
      iconUrl: viewer?.obj('user')?.strOrNull('iconUrl'),
      userName: viewer?.obj('user')?.str('name') ?? '',
      headerImageUrl: viewer?.obj('user')?.strOrNull('headerImageUrl'),
    );
  }

  /// アイコン枠を付ける（null で外す）
  static Future<void> applyIconFrame(String? frameId) async {
    await Api.mutate('mutation AppApplyUserAvatarFrame(\$input: UpdateUserSettingInput!) { updateUserSetting(input: \$input) { id selectedUserAvatarFrame { id } } }', variables: {
      'input': {'selectedUserAvatarFrameId': frameId},
    });
  }

  /// コインの枠を買う（買っただけでは付かない）
  static Future<void> purchaseIconFrame(String frameId) async {
    await Api.mutate('mutation AppPurchaseUserAvatarFrame(\$input: PurchaseUserAvatarFrameInput!) { purchaseUserAvatarFrame(input: \$input) }', variables: {
      'input': {'frameId': frameId},
    });
  }
}
