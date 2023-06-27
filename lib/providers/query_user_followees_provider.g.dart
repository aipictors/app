// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_user_followees_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryUserFolloweesHash() =>
    r'80742d5c14f2abf9a4f2a52ce7b347a6674c0a0a';

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

typedef QueryUserFolloweesRef = AutoDisposeStreamProviderRef<
    OperationResponse<GUserFolloweesData, GUserFolloweesVars>>;

/// See also [queryUserFollowees].
@ProviderFor(queryUserFollowees)
const queryUserFolloweesProvider = QueryUserFolloweesFamily();

/// See also [queryUserFollowees].
class QueryUserFolloweesFamily extends Family<
    AsyncValue<OperationResponse<GUserFolloweesData, GUserFolloweesVars>>> {
  /// See also [queryUserFollowees].
  const QueryUserFolloweesFamily();

  /// See also [queryUserFollowees].
  QueryUserFolloweesProvider call(
    QueryUserFolloweesProps props,
  ) {
    return QueryUserFolloweesProvider(
      props,
    );
  }

  @override
  QueryUserFolloweesProvider getProviderOverride(
    covariant QueryUserFolloweesProvider provider,
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
  String? get name => r'queryUserFolloweesProvider';
}

/// See also [queryUserFollowees].
class QueryUserFolloweesProvider extends AutoDisposeStreamProvider<
    OperationResponse<GUserFolloweesData, GUserFolloweesVars>> {
  /// See also [queryUserFollowees].
  QueryUserFolloweesProvider(
    this.props,
  ) : super.internal(
          (ref) => queryUserFollowees(
            ref,
            props,
          ),
          from: queryUserFolloweesProvider,
          name: r'queryUserFolloweesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryUserFolloweesHash,
          dependencies: QueryUserFolloweesFamily._dependencies,
          allTransitiveDependencies:
              QueryUserFolloweesFamily._allTransitiveDependencies,
        );

  final QueryUserFolloweesProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryUserFolloweesProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
