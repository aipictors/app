// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_user_followers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryUserFollowersHash() =>
    r'9ceac9cd9d0e37e0afc3bf736d72a503d968d964';

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

typedef QueryUserFollowersRef = AutoDisposeStreamProviderRef<
    OperationResponse<GUserFollowersData, GUserFollowersVars>>;

/// See also [queryUserFollowers].
@ProviderFor(queryUserFollowers)
const queryUserFollowersProvider = QueryUserFollowersFamily();

/// See also [queryUserFollowers].
class QueryUserFollowersFamily extends Family<
    AsyncValue<OperationResponse<GUserFollowersData, GUserFollowersVars>>> {
  /// See also [queryUserFollowers].
  const QueryUserFollowersFamily();

  /// See also [queryUserFollowers].
  QueryUserFollowersProvider call(
    QueryUserFollowersProps props,
  ) {
    return QueryUserFollowersProvider(
      props,
    );
  }

  @override
  QueryUserFollowersProvider getProviderOverride(
    covariant QueryUserFollowersProvider provider,
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
  String? get name => r'queryUserFollowersProvider';
}

/// See also [queryUserFollowers].
class QueryUserFollowersProvider extends AutoDisposeStreamProvider<
    OperationResponse<GUserFollowersData, GUserFollowersVars>> {
  /// See also [queryUserFollowers].
  QueryUserFollowersProvider(
    this.props,
  ) : super.internal(
          (ref) => queryUserFollowers(
            ref,
            props,
          ),
          from: queryUserFollowersProvider,
          name: r'queryUserFollowersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryUserFollowersHash,
          dependencies: QueryUserFollowersFamily._dependencies,
          allTransitiveDependencies:
              QueryUserFollowersFamily._allTransitiveDependencies,
        );

  final QueryUserFollowersProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryUserFollowersProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
