// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_popular_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedPopularWorksVars> _$gFeedPopularWorksVarsSerializer =
    new _$GFeedPopularWorksVarsSerializer();

class _$GFeedPopularWorksVarsSerializer
    implements StructuredSerializer<GFeedPopularWorksVars> {
  @override
  final Iterable<Type> types = const [
    GFeedPopularWorksVars,
    _$GFeedPopularWorksVars
  ];
  @override
  final String wireName = 'GFeedPopularWorksVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedPopularWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFeedPopularWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFeedPopularWorksVarsBuilder().build();
  }
}

class _$GFeedPopularWorksVars extends GFeedPopularWorksVars {
  factory _$GFeedPopularWorksVars(
          [void Function(GFeedPopularWorksVarsBuilder)? updates]) =>
      (new GFeedPopularWorksVarsBuilder()..update(updates))._build();

  _$GFeedPopularWorksVars._() : super._();

  @override
  GFeedPopularWorksVars rebuild(
          void Function(GFeedPopularWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedPopularWorksVarsBuilder toBuilder() =>
      new GFeedPopularWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedPopularWorksVars;
  }

  @override
  int get hashCode {
    return 919546260;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GFeedPopularWorksVars').toString();
  }
}

class GFeedPopularWorksVarsBuilder
    implements Builder<GFeedPopularWorksVars, GFeedPopularWorksVarsBuilder> {
  _$GFeedPopularWorksVars? _$v;

  GFeedPopularWorksVarsBuilder();

  @override
  void replace(GFeedPopularWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedPopularWorksVars;
  }

  @override
  void update(void Function(GFeedPopularWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedPopularWorksVars build() => _build();

  _$GFeedPopularWorksVars _build() {
    final _$result = _$v ?? new _$GFeedPopularWorksVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
