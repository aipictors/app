import 'dart:io';

import 'package:aipictors/cache.dart';
import 'package:aipictors/config.dart';
import 'package:aipictors/repositories/config_repository.dart';
import 'package:aipictors/utils/safe_json_http_client.dart';
import 'package:aipictors/utils/custom_response_parser.dart';
import 'package:ferry/ferry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:http/http.dart' as http;

Future<Client> createClient() async {
  final cache = createCache();

  final token = await FirebaseAuth.instance.currentUser?.getIdToken(true);

  final language = const ConfigRepository().language;

  var endpoint = DefaultConfig.graphqlEndpoint.trim();
  if (!kReleaseMode) {
    // ignore: avoid_print
    print('GraphQL endpoint: $endpoint');
  }

  late final HttpLink httpLink;
  try {
    httpLink = HttpLink(
      endpoint,
      parser: const CustomResponseParser(),
      httpClient: SafeJsonHttpClient(http.Client()),
      defaultHeaders: {
        if (token != null) 'authorization': 'Bearer $token',
        'flutter-version': DefaultConfig.version,
        'flutter-secret-token': DefaultConfig.secretToken,
        'flutter-os': Platform.operatingSystem.toUpperCase(),
        'language': language.toUpperCase(),
        'platform': 'flutter',
      },
    );
  } catch (exception) {
    // If endpoint is malformed, fall back so the app can still show a real error screen.
    endpoint = 'https://aipics.fly.dev';
    if (!kReleaseMode) {
      // ignore: avoid_print
      print('Falling back GraphQL endpoint to: $endpoint ($exception)');
    }
    httpLink = HttpLink(
      endpoint,
      parser: const CustomResponseParser(),
      httpClient: SafeJsonHttpClient(http.Client()),
      defaultHeaders: {
        if (token != null) 'authorization': 'Bearer $token',
        'flutter-version': DefaultConfig.version,
        'flutter-secret-token': DefaultConfig.secretToken,
        'flutter-os': Platform.operatingSystem.toUpperCase(),
        'language': language.toUpperCase(),
        'platform': 'flutter',
      },
    );
  }

  return Client(
    link: httpLink,
    cache: cache,
    defaultFetchPolicies: {
      OperationType.query: FetchPolicy.CacheAndNetwork,
    },
  );
}
