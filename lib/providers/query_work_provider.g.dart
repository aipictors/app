// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_work_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryWorkHash() => r'96fc58be48fdbabe4072eca4aec3fe079c56e862';

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

typedef QueryWorkRef = AutoDisposeStreamProviderRef<GWorkData?>;

/// See also [queryWork].
@ProviderFor(queryWork)
const queryWorkProvider = QueryWorkFamily();

/// See also [queryWork].
class QueryWorkFamily extends Family<AsyncValue<GWorkData?>> {
  /// See also [queryWork].
  const QueryWorkFamily();

  /// See also [queryWork].
  QueryWorkProvider call(
    String id,
  ) {
    return QueryWorkProvider(
      id,
    );
  }

  @override
  QueryWorkProvider getProviderOverride(
    covariant QueryWorkProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'queryWorkProvider';
}

/// See also [queryWork].
class QueryWorkProvider extends AutoDisposeStreamProvider<GWorkData?> {
  /// See also [queryWork].
  QueryWorkProvider(
    this.id,
  ) : super.internal(
          (ref) => queryWork(
            ref,
            id,
          ),
          from: queryWorkProvider,
          name: r'queryWorkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryWorkHash,
          dependencies: QueryWorkFamily._dependencies,
          allTransitiveDependencies: QueryWorkFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is QueryWorkProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
