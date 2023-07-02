// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_work_comments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryWorkCommentsHash() => r'9dd51cb11923feee4fef336f9e2bc0b69c50af9d';

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

typedef QueryWorkCommentsRef = AutoDisposeFutureProviderRef<GWorkCommentsData?>;

/// See also [queryWorkComments].
@ProviderFor(queryWorkComments)
const queryWorkCommentsProvider = QueryWorkCommentsFamily();

/// See also [queryWorkComments].
class QueryWorkCommentsFamily extends Family<AsyncValue<GWorkCommentsData?>> {
  /// See also [queryWorkComments].
  const QueryWorkCommentsFamily();

  /// See also [queryWorkComments].
  QueryWorkCommentsProvider call(
    QueryWorkCommentsProps props,
  ) {
    return QueryWorkCommentsProvider(
      props,
    );
  }

  @override
  QueryWorkCommentsProvider getProviderOverride(
    covariant QueryWorkCommentsProvider provider,
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
  String? get name => r'queryWorkCommentsProvider';
}

/// See also [queryWorkComments].
class QueryWorkCommentsProvider
    extends AutoDisposeFutureProvider<GWorkCommentsData?> {
  /// See also [queryWorkComments].
  QueryWorkCommentsProvider(
    this.props,
  ) : super.internal(
          (ref) => queryWorkComments(
            ref,
            props,
          ),
          from: queryWorkCommentsProvider,
          name: r'queryWorkCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryWorkCommentsHash,
          dependencies: QueryWorkCommentsFamily._dependencies,
          allTransitiveDependencies:
              QueryWorkCommentsFamily._allTransitiveDependencies,
        );

  final QueryWorkCommentsProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryWorkCommentsProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
