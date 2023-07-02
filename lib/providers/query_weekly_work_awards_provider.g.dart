// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_weekly_work_awards_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryWeeklyWorkAwardsHash() =>
    r'dafc334be0e9790f568fe75b58bbf9b55df5be90';

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

typedef QueryWeeklyWorkAwardsRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [queryWeeklyWorkAwards].
@ProviderFor(queryWeeklyWorkAwards)
const queryWeeklyWorkAwardsProvider = QueryWeeklyWorkAwardsFamily();

/// See also [queryWeeklyWorkAwards].
class QueryWeeklyWorkAwardsFamily extends Family<AsyncValue<dynamic>> {
  /// See also [queryWeeklyWorkAwards].
  const QueryWeeklyWorkAwardsFamily();

  /// See also [queryWeeklyWorkAwards].
  QueryWeeklyWorkAwardsProvider call(
    QueryWeeklyWorkAwardsProps props,
  ) {
    return QueryWeeklyWorkAwardsProvider(
      props,
    );
  }

  @override
  QueryWeeklyWorkAwardsProvider getProviderOverride(
    covariant QueryWeeklyWorkAwardsProvider provider,
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
  String? get name => r'queryWeeklyWorkAwardsProvider';
}

/// See also [queryWeeklyWorkAwards].
class QueryWeeklyWorkAwardsProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [queryWeeklyWorkAwards].
  QueryWeeklyWorkAwardsProvider(
    this.props,
  ) : super.internal(
          (ref) => queryWeeklyWorkAwards(
            ref,
            props,
          ),
          from: queryWeeklyWorkAwardsProvider,
          name: r'queryWeeklyWorkAwardsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryWeeklyWorkAwardsHash,
          dependencies: QueryWeeklyWorkAwardsFamily._dependencies,
          allTransitiveDependencies:
              QueryWeeklyWorkAwardsFamily._allTransitiveDependencies,
        );

  final QueryWeeklyWorkAwardsProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryWeeklyWorkAwardsProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
