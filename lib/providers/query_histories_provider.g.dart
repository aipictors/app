// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_histories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryHistoriesHash() => r'08b240ca0a536b30b591eb784973b2961d2fc972';

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

typedef QueryHistoriesRef = AutoDisposeStreamProviderRef<
    OperationResponse<GHistoriesData, GHistoriesVars>>;

/// See also [queryHistories].
@ProviderFor(queryHistories)
const queryHistoriesProvider = QueryHistoriesFamily();

/// See also [queryHistories].
class QueryHistoriesFamily extends Family<
    AsyncValue<OperationResponse<GHistoriesData, GHistoriesVars>>> {
  /// See also [queryHistories].
  const QueryHistoriesFamily();

  /// See also [queryHistories].
  QueryHistoriesProvider call(
    QueryHistoriesProps props,
  ) {
    return QueryHistoriesProvider(
      props,
    );
  }

  @override
  QueryHistoriesProvider getProviderOverride(
    covariant QueryHistoriesProvider provider,
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
  String? get name => r'queryHistoriesProvider';
}

/// See also [queryHistories].
class QueryHistoriesProvider extends AutoDisposeStreamProvider<
    OperationResponse<GHistoriesData, GHistoriesVars>> {
  /// See also [queryHistories].
  QueryHistoriesProvider(
    this.props,
  ) : super.internal(
          (ref) => queryHistories(
            ref,
            props,
          ),
          from: queryHistoriesProvider,
          name: r'queryHistoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryHistoriesHash,
          dependencies: QueryHistoriesFamily._dependencies,
          allTransitiveDependencies:
              QueryHistoriesFamily._allTransitiveDependencies,
        );

  final QueryHistoriesProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryHistoriesProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
