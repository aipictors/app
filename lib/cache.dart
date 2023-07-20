import 'package:aipictors/repositories/hive_repository.dart';
import 'package:ferry/ferry.dart';

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
          // 'works': FieldPolicy(
          //   keyArgs: const [],
          //   merge: (existing, incoming, options) {
          //     final linkedHashSet = LinkedHashSet<dynamic>(
          //       equals: jsonMapEquals,
          //       hashCode: const DeepCollectionEquality().hash,
          //     )
          //       ..addAll(existing ?? [])
          //       ..addAll(incoming ?? []);
          //     return linkedHashSet.toList().toList();
          //   },
          // ),
        },
      ),
    },
  );

  _cache = cache;

  return cache;
}
