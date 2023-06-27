// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_daily_work_awards_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryDailyWorkAwardsHash() =>
    r'3ea60b3300cce6f54f759b8874d0868c3a42bd07';

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

typedef QueryDailyWorkAwardsRef = AutoDisposeStreamProviderRef<
    OperationResponse<GWorkAwardsData, GWorkAwardsVars>>;

/// See also [queryDailyWorkAwards].
@ProviderFor(queryDailyWorkAwards)
const queryDailyWorkAwardsProvider = QueryDailyWorkAwardsFamily();

/// See also [queryDailyWorkAwards].
class QueryDailyWorkAwardsFamily extends Family<
    AsyncValue<OperationResponse<GWorkAwardsData, GWorkAwardsVars>>> {
  /// See also [queryDailyWorkAwards].
  const QueryDailyWorkAwardsFamily();

  /// See also [queryDailyWorkAwards].
  QueryDailyWorkAwardsProvider call(
    QueryDailyWorkAwardsProps props,
  ) {
    return QueryDailyWorkAwardsProvider(
      props,
    );
  }

  @override
  QueryDailyWorkAwardsProvider getProviderOverride(
    covariant QueryDailyWorkAwardsProvider provider,
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
  String? get name => r'queryDailyWorkAwardsProvider';
}

/// See also [queryDailyWorkAwards].
class QueryDailyWorkAwardsProvider extends AutoDisposeStreamProvider<
    OperationResponse<GWorkAwardsData, GWorkAwardsVars>> {
  /// See also [queryDailyWorkAwards].
  QueryDailyWorkAwardsProvider(
    this.props,
  ) : super.internal(
          (ref) => queryDailyWorkAwards(
            ref,
            props,
          ),
          from: queryDailyWorkAwardsProvider,
          name: r'queryDailyWorkAwardsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryDailyWorkAwardsHash,
          dependencies: QueryDailyWorkAwardsFamily._dependencies,
          allTransitiveDependencies:
              QueryDailyWorkAwardsFamily._allTransitiveDependencies,
        );

  final QueryDailyWorkAwardsProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryDailyWorkAwardsProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
