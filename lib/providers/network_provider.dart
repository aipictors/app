import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_provider.g.dart';

@riverpod
Future<ConnectivityResult> network(NetworkRef ref) async {
  ref.keepAlive();
  final resultList = await Connectivity().checkConnectivity();

  return resultList.first;
}
