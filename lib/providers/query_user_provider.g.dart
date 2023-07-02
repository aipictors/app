// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryUserHash() => r'5b4d351b789b1818ac767da140dbc37e7806e661';

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

typedef QueryUserRef = AutoDisposeStreamProviderRef<dynamic>;

/// See also [queryUser].
@ProviderFor(queryUser)
const queryUserProvider = QueryUserFamily();

/// See also [queryUser].
class QueryUserFamily extends Family<AsyncValue<dynamic>> {
  /// See also [queryUser].
  const QueryUserFamily();

  /// See also [queryUser].
  QueryUserProvider call(
    String id,
  ) {
    return QueryUserProvider(
      id,
    );
  }

  @override
  QueryUserProvider getProviderOverride(
    covariant QueryUserProvider provider,
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
  String? get name => r'queryUserProvider';
}

/// See also [queryUser].
class QueryUserProvider extends AutoDisposeStreamProvider<dynamic> {
  /// See also [queryUser].
  QueryUserProvider(
    this.id,
  ) : super.internal(
          (ref) => queryUser(
            ref,
            id,
          ),
          from: queryUserProvider,
          name: r'queryUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryUserHash,
          dependencies: QueryUserFamily._dependencies,
          allTransitiveDependencies: QueryUserFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is QueryUserProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
