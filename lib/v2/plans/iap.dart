import 'dart:async';
import 'dart:io';

import 'package:aipictors/v2/core/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

/// サブスク商品（App Store と Google Play で ID が違う）
final passProducts = Platform.isAndroid
    ? const {
        'pass_lite': 'LITE',
        'pass_standard': 'STANDARD',
        'pass_premium': 'PREMIUM',
      }
    : const {
        'com.aipictors.pass.lite': 'LITE',
        'com.aipictors.pass.standard': 'STANDARD',
        'com.aipictors.pass.premium': 'PREMIUM',
      };

/// コインの商品（商品 ID → 配る枚数。枚数はサーバーが決めるので、ここの数は画面に出すためだけ）
final coinProducts = Platform.isAndroid
    ? const {
        'coins_100': 100,
        'coins_1000': 1100,
        'coins_3000': 3300,
        'coins_10000': 11000,
      }
    : const {
        'com.aipictors.coins.100': 100,
        'com.aipictors.coins.1000': 1100,
        'com.aipictors.coins.3000': 3300,
        'com.aipictors.coins.10000': 11000,
      };

/// このプラットフォームでのお支払い方法の名前（paymentProvider）
String get storeProvider => Platform.isAndroid ? 'GOOGLE_PLAY' : 'APP_STORE';

String get storeName => Platform.isAndroid ? 'Google Play' : 'App Store';

String? productIdOf(String passType) {
  for (final e in passProducts.entries) {
    if (e.value == passType) return e.key;
  }
  return null;
}

enum IapPhase { idle, purchasing, syncing, done, failed, canceled }

class IapState {
  const IapState(this.phase, {this.message, this.passType, this.grantedCoins});

  final IapPhase phase;
  final String? message;
  final String? passType;

  /// コインを買ったときに、残高に足された枚数
  final int? grantedCoins;
}

/// App 内課金。購入の知らせはアプリが動いている間ずっと受け取り、サーバーに反映してから完了にする
class Iap {
  Iap._();

  static StreamSubscription<List<PurchaseDetails>>? _sub;

  static final state = ValueNotifier<IapState>(const IapState(IapPhase.idle));

  static bool get supported => Platform.isIOS || Platform.isAndroid;

  /// アカウントと購入を結びつける UUID（サーバーと同じ決まり）
  static String accountToken(String userId) => 'a1b2c3d4-0000-4000-8000-${userId.padLeft(12, '0')}';

  static void start() {
    if (!supported || _sub != null) return;
    _sub = InAppPurchase.instance.purchaseStream.listen(
      _onPurchases,
      onError: (Object e) => state.value = const IapState(IapPhase.failed, message: '購入の処理でエラーが起きました。時間をおいてもう一度お試しください'),
    );
  }

  /// 開発用: ストアの商品がない環境（シミュレーター）で、商品がある時の画面を確かめる
  static const _debugProducts = kDebugMode && bool.fromEnvironment('debugIapProducts');

  /// 商品を取れなかった理由（画面に短く出して、原因をつかめるようにする）
  static final lastProductIssue = ValueNotifier<String?>(null);

  /// ストアにつながるか（つながらないと復元もできない）
  static Future<bool> storeReachable() async {
    if (!supported) return false;
    if (_debugProducts) return true;
    try {
      return await InAppPurchase.instance.isAvailable();
    } catch (_) {
      return false;
    }
  }

  /// 買える商品。ストアに登録がないときは空（画面は「購入できません」を出す）
  static Future<List<ProductDetails>> products() async {
    if (!supported) return [];
    if (_debugProducts) {
      return [
        for (final e in passProducts.entries)
          ProductDetails(id: e.key, title: e.value, description: e.value, price: const {'LITE': '¥XXX', 'STANDARD': '¥YYY', 'PREMIUM': '¥ZZZ'}[e.value]!, rawPrice: 1, currencyCode: 'JPY'),
      ];
    }
    return _query(passProducts.keys.toSet());
  }

  /// ストアに商品を聞く。起動直後は空で返ることがあるので、空なら少し待ってやり直す
  static Future<List<ProductDetails>> _query(Set<String> ids) async {
    if (!await storeReachable()) {
      lastProductIssue.value = '$storeName につながりませんでした';
      return [];
    }
    for (var attempt = 0; attempt < 3; attempt++) {
      if (attempt > 0) {
        await Future<void>.delayed(Duration(milliseconds: 800 * attempt));
      }
      ProductDetailsResponse res;
      try {
        res = await InAppPurchase.instance.queryProductDetails(ids);
      } catch (e) {
        lastProductIssue.value = '商品を読み込めませんでした';
        if (kDebugMode) {
          // ignore: avoid_print
          print('[Iap] query failed: $e');
        }
        continue;
      }
      if (res.productDetails.isNotEmpty) {
        lastProductIssue.value = null;
        return res.productDetails;
      }
      if (res.error != null) {
        lastProductIssue.value = '$storeName のエラー: ${res.error!.code}';
      } else if (res.notFoundIDs.isNotEmpty) {
        lastProductIssue.value = '商品が見つかりませんでした（${res.notFoundIDs.length} 件）';
      }
      if (kDebugMode) {
        // ignore: avoid_print
        print('[Iap] empty: error=${res.error?.code} notFound=${res.notFoundIDs}');
      }
    }
    return [];
  }

  /// 開発用（debugIapProducts）のコインの値段。ストアに合わせておく
  static const _debugCoinPrices = {100: '¥100', 1100: '¥1,000', 3300: '¥3,000', 11000: '¥10,000'};

  /// 買えるコインの商品（値段はストアの設定をそのまま出す）
  static Future<List<ProductDetails>> coinItems() async {
    if (!supported) return [];
    if (_debugProducts) {
      return [
        for (final e in coinProducts.entries)
          ProductDetails(
            id: e.key,
            title: '${e.value} コイン',
            description: '${e.value} コイン',
            price: _debugCoinPrices[e.value] ?? '',
            rawPrice: 1,
            currencyCode: 'JPY',
          ),
      ]..sort((a, b) => (coinProducts[a.id] ?? 0).compareTo(coinProducts[b.id] ?? 0));
    }
    final items = (await _query(coinProducts.keys.toSet())).toList()
      ..sort((a, b) => (coinProducts[a.id] ?? 0).compareTo(coinProducts[b.id] ?? 0));
    return items;
  }

  /// コインを買う（1 回きりの買い物なので buyConsumable）
  static Future<void> buyCoins(ProductDetails product, {required String userId}) async {
    start();
    state.value = const IapState(IapPhase.purchasing);
    try {
      final started = await InAppPurchase.instance.buyConsumable(
        purchaseParam: PurchaseParam(productDetails: product, applicationUserName: accountToken(userId)),
      );
      if (!started) state.value = const IapState(IapPhase.failed, message: '購入を開始できませんでした。時間をおいてもう一度お試しください');
    } catch (_) {
      state.value = const IapState(IapPhase.failed, message: '購入を開始できませんでした。時間をおいてもう一度お試しください');
    }
  }

  static Future<void> buy(ProductDetails product, {required String userId}) async {
    start();
    state.value = const IapState(IapPhase.purchasing);
    try {
      PurchaseParam param = PurchaseParam(productDetails: product, applicationUserName: accountToken(userId));
      if (Platform.isAndroid && product is GooglePlayProductDetails) {
        // 加入中の別プランがあれば、Google Play のプラン変更として扱う
        final addition = InAppPurchase.instance.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
        final past = await addition.queryPastPurchases();
        final old = past.pastPurchases.where((p) => passProducts.containsKey(p.productID) && p.productID != product.id).firstOrNull;
        param = GooglePlayPurchaseParam(
          productDetails: product,
          applicationUserName: accountToken(userId),
          offerToken: product.offerToken,
          changeSubscriptionParam: old == null ? null : ChangeSubscriptionParam(oldPurchaseDetails: old, replacementMode: ReplacementMode.chargeProratedPrice),
        );
      }
      final started = await InAppPurchase.instance.buyNonConsumable(purchaseParam: param);
      if (!started) state.value = const IapState(IapPhase.failed, message: '購入を開始できませんでした。時間をおいてもう一度お試しください');
    } catch (_) {
      state.value = const IapState(IapPhase.failed, message: '購入を開始できませんでした。時間をおいてもう一度お試しください');
    }
  }

  static Future<void> restore() async {
    start();
    state.value = const IapState(IapPhase.syncing);
    try {
      await InAppPurchase.instance.restorePurchases();
    } catch (_) {
      state.value = IapState(IapPhase.failed, message: '$storeName に接続できませんでした。時間をおいてもう一度お試しください');
      return;
    }
    // 復元するものが無いときは何も届かないので、少し待って元に戻す
    Future.delayed(const Duration(seconds: 6), () {
      if (state.value.phase == IapPhase.syncing) {
        state.value = const IapState(IapPhase.done, message: '復元できる購入はありませんでした');
      }
    });
  }

  /// コインの購入をサーバーに反映する（配った枚数を返す）
  static Future<int> syncCoins(List<PurchaseDetails> purchases) async {
    if (Platform.isAndroid) {
      final data = await Api.mutate(r'''
mutation AppSyncGooglePlayCoins($input: SyncGooglePlayCoinPurchasesInput!) {
  syncGooglePlayCoinPurchases(input: $input) { grantedCoins premiumCoinBalance }
}''', variables: {
        'input': {
          'purchases': [
            for (final p in purchases) {'productId': p.productID, 'purchaseToken': p.verificationData.serverVerificationData},
          ],
        },
      });
      return data.obj('syncGooglePlayCoinPurchases')?.integer('grantedCoins') ?? 0;
    }
    final data = await Api.mutate(r'''
mutation AppSyncAppStoreCoins($input: SyncAppStoreCoinPurchasesInput!) {
  syncAppStoreCoinPurchases(input: $input) { grantedCoins premiumCoinBalance }
}''', variables: {
      'input': {'signedTransactions': purchases.map((p) => p.verificationData.serverVerificationData).toList()},
    });
    return data.obj('syncAppStoreCoinPurchases')?.integer('grantedCoins') ?? 0;
  }

  static Future<Map<String, dynamic>?> sync(List<PurchaseDetails> purchases) async {
    if (Platform.isAndroid) {
      final data = await Api.mutate(r'''
mutation AppSyncGooglePlay($input: SyncGooglePlayPurchasesInput!) {
  syncGooglePlayPurchases(input: $input) { passType periodEnd paymentProvider }
}''', variables: {
        'input': {
          'purchases': [
            for (final p in purchases) {'productId': p.productID, 'purchaseToken': p.verificationData.serverVerificationData},
          ],
        },
      });
      return data.obj('syncGooglePlayPurchases');
    }
    final signedTransactions = purchases.map((p) => p.verificationData.serverVerificationData).toList();
    final data = await Api.mutate(r'''
mutation AppSyncAppStore($input: SyncAppStoreTransactionsInput!) {
  syncAppStoreTransactions(input: $input) { passType periodEnd paymentProvider }
}''', variables: {
      'input': {'signedTransactions': signedTransactions},
    });
    return data.obj('syncAppStoreTransactions');
  }

  static Future<void> _onPurchases(List<PurchaseDetails> purchases) async {
    final toSync = <PurchaseDetails>[];
    final coinsToSync = <PurchaseDetails>[];
    for (final p in purchases) {
      switch (p.status) {
        case PurchaseStatus.pending:
          state.value = const IapState(IapPhase.purchasing, message: '承認待ちです');
        case PurchaseStatus.canceled:
          state.value = const IapState(IapPhase.canceled);
          if (p.pendingCompletePurchase) await InAppPurchase.instance.completePurchase(p);
        case PurchaseStatus.error:
          state.value = IapState(IapPhase.failed, message: p.error?.message ?? '購入できませんでした');
          if (p.pendingCompletePurchase) await InAppPurchase.instance.completePurchase(p);
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          if (p.verificationData.serverVerificationData.isEmpty) break;
          if (coinProducts.containsKey(p.productID)) {
            // コインは 1 回きり。復元で同じものが来てもサーバーが 2 重に配らない
            coinsToSync.add(p);
          } else {
            toSync.add(p);
          }
      }
    }
    if (toSync.isEmpty && coinsToSync.isEmpty) return;
    if (FirebaseAuth.instance.currentUser == null) {
      state.value = const IapState(IapPhase.failed, message: 'ログインすると購入がアカウントに反映されます');
      return;
    }
    state.value = const IapState(IapPhase.syncing);
    try {
      var grantedCoins = 0;
      if (coinsToSync.isNotEmpty) {
        grantedCoins = await syncCoins(coinsToSync);
        for (final p in coinsToSync) {
          if (p.pendingCompletePurchase) await InAppPurchase.instance.completePurchase(p);
        }
      }
      final result = toSync.isEmpty ? null : await sync(toSync);
      for (final p in toSync) {
        if (p.pendingCompletePurchase) await InAppPurchase.instance.completePurchase(p);
      }
      Api.clearCache();
      state.value = IapState(
        IapPhase.done,
        passType: result?.strOrNull('passType'),
        grantedCoins: coinsToSync.isEmpty ? null : grantedCoins,
      );
    } on ApiException catch (e) {
      // 完了にしないで次回起動時にもう一度送る
      state.value = IapState(IapPhase.failed, message: e.message);
      if (kDebugMode) {
        // ignore: avoid_print
        print('[Iap] sync failed: ${e.message}');
      }
    }
  }
}
