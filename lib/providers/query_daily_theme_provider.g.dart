// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_daily_theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryDailyThemeHash() => r'3dafa7011369ecd45419b4d7d231056cbcb2da75';

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

typedef QueryDailyThemeRef = AutoDisposeStreamProviderRef<
    OperationResponse<GDailyThemeData, GDailyThemeVars>>;

/// See also [queryDailyTheme].
@ProviderFor(queryDailyTheme)
const queryDailyThemeProvider = QueryDailyThemeFamily();

/// See also [queryDailyTheme].
class QueryDailyThemeFamily extends Family<
    AsyncValue<OperationResponse<GDailyThemeData, GDailyThemeVars>>> {
  /// See also [queryDailyTheme].
  const QueryDailyThemeFamily();

  /// See also [queryDailyTheme].
  QueryDailyThemeProvider call(
    QueryDailyThemeProps props,
  ) {
    return QueryDailyThemeProvider(
      props,
    );
  }

  @override
  QueryDailyThemeProvider getProviderOverride(
    covariant QueryDailyThemeProvider provider,
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
  String? get name => r'queryDailyThemeProvider';
}

/// See also [queryDailyTheme].
class QueryDailyThemeProvider extends AutoDisposeStreamProvider<
    OperationResponse<GDailyThemeData, GDailyThemeVars>> {
  /// See also [queryDailyTheme].
  QueryDailyThemeProvider(
    this.props,
  ) : super.internal(
          (ref) => queryDailyTheme(
            ref,
            props,
          ),
          from: queryDailyThemeProvider,
          name: r'queryDailyThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queryDailyThemeHash,
          dependencies: QueryDailyThemeFamily._dependencies,
          allTransitiveDependencies:
              QueryDailyThemeFamily._allTransitiveDependencies,
        );

  final QueryDailyThemeProps props;

  @override
  bool operator ==(Object other) {
    return other is QueryDailyThemeProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
