// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_hot_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedHotWorksVars> _$gFeedHotWorksVarsSerializer =
    new _$GFeedHotWorksVarsSerializer();

class _$GFeedHotWorksVarsSerializer
    implements StructuredSerializer<GFeedHotWorksVars> {
  @override
  final Iterable<Type> types = const [GFeedHotWorksVars, _$GFeedHotWorksVars];
  @override
  final String wireName = 'GFeedHotWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFeedHotWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFeedHotWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFeedHotWorksVarsBuilder().build();
  }
}

class _$GFeedHotWorksVars extends GFeedHotWorksVars {
  factory _$GFeedHotWorksVars(
          [void Function(GFeedHotWorksVarsBuilder)? updates]) =>
      (new GFeedHotWorksVarsBuilder()..update(updates))._build();

  _$GFeedHotWorksVars._() : super._();

  @override
  GFeedHotWorksVars rebuild(void Function(GFeedHotWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedHotWorksVarsBuilder toBuilder() =>
      new GFeedHotWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedHotWorksVars;
  }

  @override
  int get hashCode {
    return 326077548;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GFeedHotWorksVars').toString();
  }
}

class GFeedHotWorksVarsBuilder
    implements Builder<GFeedHotWorksVars, GFeedHotWorksVarsBuilder> {
  _$GFeedHotWorksVars? _$v;

  GFeedHotWorksVarsBuilder();

  @override
  void replace(GFeedHotWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedHotWorksVars;
  }

  @override
  void update(void Function(GFeedHotWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedHotWorksVars build() => _build();

  _$GFeedHotWorksVars _build() {
    final _$result = _$v ?? new _$GFeedHotWorksVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
