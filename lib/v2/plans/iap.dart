import 'dart:async';
import 'dart:io';

import 'package:aipictors/v2/core/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// App Store のサブスク商品
const passProducts = {
  'com.aipictors.pass.lite': 'LITE',
  'com.aipictors.pass.standard': 'STANDARD',
  'com.aipictors.pass.premium': 'PREMIUM',
};

String? productIdOf(String passType) {
  for (final e in passProducts.entries) {
    if (e.value == passType) return e.key;
  }
  return null;
}

enum IapPhase { idle, purchasing, syncing, done, failed, canceled }

class IapState {
  const IapState(this.phase, {this.message, this.passType});

  final IapPhase phase;
  final String? message;
  final String? passType;
}

/// App 内課金。購入の知らせはアプリが動いている間ずっと受け取り、サーバーに反映してから完了にする
class Iap {
  Iap._();

  static StreamSubscription<List<PurchaseDetails>>? _sub;

  static final state = ValueNotifier<IapState>(const IapState(IapPhase.idle));

  static bool get supported => Platform.isIOS;

  /// アカウントと購入を結びつける UUID（サーバーと同じ決まり）
  static String accountToken(String userId) => 'a1b2c3d4-0000-4000-8000-${userId.padLeft(12, '0')}';

  static void start() {
    if (!supported || _sub != null) return;
    _sub = InAppPurchase.instance.purchaseStream.listen(
      _onPurchases,
      onError: (Object e) => state.value = IapState(IapPhase.failed, message: '購入の処理でエラーが起きました（$e）'),
    );
  }

  static Future<List<ProductDetails>> products() async {
    if (!supported) return [];
    final available = await InAppPurchase.instance.isAvailable();
    if (!available) throw const ApiException('App Store に接続できませんでした');
    final res = await InAppPurchase.instance.queryProductDetails(passProducts.keys.toSet());
    if (res.error != null && res.productDetails.isEmpty) {
      throw ApiException('プランの情報を取得できませんでした（${res.error!.message}）');
    }
    return res.productDetails;
  }

  static Future<void> buy(ProductDetails product, {required String userId}) async {
    start();
    state.value = const IapState(IapPhase.purchasing);
    try {
      await InAppPurchase.instance.buyNonConsumable(
        purchaseParam: PurchaseParam(productDetails: product, applicationUserName: accountToken(userId)),
      );
    } catch (e) {
      state.value = IapState(IapPhase.failed, message: '購入を開始できませんでした（$e）');
    }
  }

  static Future<void> restore() async {
    start();
    state.value = const IapState(IapPhase.syncing);
    await InAppPurchase.instance.restorePurchases();
    // 復元するものが無いときは何も届かないので、少し待って元に戻す
    Future.delayed(const Duration(seconds: 6), () {
      if (state.value.phase == IapPhase.syncing) {
        state.value = const IapState(IapPhase.done, message: '復元できる購入はありませんでした');
      }
    });
  }

  static Future<Map<String, dynamic>?> sync(List<String> signedTransactions) async {
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
          if (p.verificationData.serverVerificationData.isNotEmpty) toSync.add(p);
      }
    }
    if (toSync.isEmpty) return;
    if (FirebaseAuth.instance.currentUser == null) {
      state.value = const IapState(IapPhase.failed, message: 'ログインすると購入がアカウントに反映されます');
      return;
    }
    state.value = const IapState(IapPhase.syncing);
    try {
      final result = await sync(toSync.map((p) => p.verificationData.serverVerificationData).toList());
      for (final p in toSync) {
        if (p.pendingCompletePurchase) await InAppPurchase.instance.completePurchase(p);
      }
      Api.clearCache();
      state.value = IapState(IapPhase.done, passType: result?.strOrNull('passType'));
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
