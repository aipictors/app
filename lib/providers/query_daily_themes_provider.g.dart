// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_daily_themes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryDailyThemesHash() => r'366d83b731980e64faa54730a1f08e00f1e7a10c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef QueryDailyThemesRef = AutoDisposeStreamProviderRef<dynamic>;

/// See also [queryDailyThemes].
@ProviderFor(queryDailyThemes)
const queryDailyThemesProvider = QueryDailyThemesFamily();

/// See also [queryDailyThemes].
class QueryDailyThemesFamily extends Family<AsyncValue<dynamic>> {
  /// See also [queryDailyThemes].
  const QueryDailyThemesFamily();

  /// See also [queryDailyThemes].
  QueryDailyThemesProvider call(
    QueryDailyThemesProps props,
  ) {
    return QueryDailyThemesProvider(
      props,
    );
  }

  @override
  QueryDailyThemesProvider getProviderOverride(
    covariant QueryDailyThemesProvider provider,
  ) {
    return call(
      provider.props,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'queryDailyThemesProvider';
}

/// See also [queryDailyThemes].
class QueryDailyThemesProvider extends AutoDisposeStreamProvider<dynamic> {
  /// See also [queryDailyThemes].
  QueryDailyThemesProvider(
    this.props,
  ) : super.internal(
          (ref) => queryDailyThemes(
            ref,
            props,
          ),
          from: queryDailyThemesProvider,
          name: r'queryDailyThemesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryDailyThemesHash,
          dependencies: QueryDailyThemesFamily._dependencies,
          allTransitiveDependencies:
              QueryDailyThemesFamily._allTransitiveDependencies,
        );

  final QueryDailyThemesProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryDailyThemesProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
