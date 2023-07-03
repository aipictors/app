// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_search_works_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$querySearchWorksHash() => r'240a1c2ed5e710a59412a53d0789e47e02803524';

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

typedef QuerySearchWorksRef = AutoDisposeFutureProviderRef<GWorksData?>;

/// See also [querySearchWorks].
@ProviderFor(querySearchWorks)
const querySearchWorksProvider = QuerySearchWorksFamily();

/// See also [querySearchWorks].
class QuerySearchWorksFamily extends Family<AsyncValue<GWorksData?>> {
  /// See also [querySearchWorks].
  const QuerySearchWorksFamily();

  /// See also [querySearchWorks].
  QuerySearchWorksProvider call(
    SearchWorksProps props,
  ) {
    return QuerySearchWorksProvider(
      props,
    );
  }

  @override
  QuerySearchWorksProvider getProviderOverride(
    covariant QuerySearchWorksProvider provider,
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
  String? get name => r'querySearchWorksProvider';
}

/// See also [querySearchWorks].
class QuerySearchWorksProvider extends AutoDisposeFutureProvider<GWorksData?> {
  /// See also [querySearchWorks].
  QuerySearchWorksProvider(
    this.props,
  ) : super.internal(
          (ref) => querySearchWorks(
            ref,
            props,
          ),
          from: querySearchWorksProvider,
          name: r'querySearchWorksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$querySearchWorksHash,
          dependencies: QuerySearchWorksFamily._dependencies,
          allTransitiveDependencies:
              QuerySearchWorksFamily._allTransitiveDependencies,
        );

  final SearchWorksProps props;

  @override
  bool operator ==(Object other) {
    return other is QuerySearchWorksProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
