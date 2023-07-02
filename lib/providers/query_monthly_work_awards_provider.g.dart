// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_monthly_work_awards_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryMonthlyWorkAwardsHash() =>
    r'0af279783832260fb7ea0d8042e41135d0dff338';

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

typedef QueryMonthlyWorkAwardsRef
    = AutoDisposeFutureProviderRef<GWorkAwardsData?>;

/// See also [queryMonthlyWorkAwards].
@ProviderFor(queryMonthlyWorkAwards)
const queryMonthlyWorkAwardsProvider = QueryMonthlyWorkAwardsFamily();

/// See also [queryMonthlyWorkAwards].
class QueryMonthlyWorkAwardsFamily
    extends Family<AsyncValue<GWorkAwardsData?>> {
  /// See also [queryMonthlyWorkAwards].
  const QueryMonthlyWorkAwardsFamily();

  /// See also [queryMonthlyWorkAwards].
  QueryMonthlyWorkAwardsProvider call(
    QueryMonthlyWorkAwardsProps props,
  ) {
    return QueryMonthlyWorkAwardsProvider(
      props,
    );
  }

  @override
  QueryMonthlyWorkAwardsProvider getProviderOverride(
    covariant QueryMonthlyWorkAwardsProvider provider,
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
  String? get name => r'queryMonthlyWorkAwardsProvider';
}

/// See also [queryMonthlyWorkAwards].
class QueryMonthlyWorkAwardsProvider
    extends AutoDisposeFutureProvider<GWorkAwardsData?> {
  /// See also [queryMonthlyWorkAwards].
  QueryMonthlyWorkAwardsProvider(
    this.props,
  ) : super.internal(
          (ref) => queryMonthlyWorkAwards(
            ref,
            props,
          ),
          from: queryMonthlyWorkAwardsProvider,
          name: r'queryMonthlyWorkAwardsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryMonthlyWorkAwardsHash,
          dependencies: QueryMonthlyWorkAwardsFamily._dependencies,
          allTransitiveDependencies:
              QueryMonthlyWorkAwardsFamily._allTransitiveDependencies,
        );

  final QueryMonthlyWorkAwardsProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryMonthlyWorkAwardsProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
