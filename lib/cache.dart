import 'dart:collection';

import 'package:aipictors/repositories/hive_repository.dart';
import 'package:ferry/ferry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

Cache? _cache;

Cache createCache() {
  if (_cache != null) {
    return _cache!;
  }

  final store = HiveRepository.getStore();

  final cache = Cache(
    store: store,
    typePolicies: {
      'Query': TypePolicy(
        fields: {
          'works': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
          'users': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
          'contributors': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
          'folders': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
          'dailyThemes': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
          'stickers': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
          'tags': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
          'workAwards': FieldPolicy(
            keyArgs: const [],
            merge: (existing, incoming, options) {
              final linkedHashSet = LinkedHashSet<dynamic>(
                equals: jsonMapEquals,
                hashCode: const DeepCollectionEquality().hash,
              )
                ..addAll(existing ?? [])
                ..addAll(incoming ?? []);
              return linkedHashSet.toList().toList();
            },
          ),
        },
      ),
    },
  );

  _cache = cache;

  return cache;
}
