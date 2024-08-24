// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHotWorksVars> _$gHotWorksVarsSerializer =
    new _$GHotWorksVarsSerializer();

class _$GHotWorksVarsSerializer implements StructuredSerializer<GHotWorksVars> {
  @override
  final Iterable<Type> types = const [GHotWorksVars, _$GHotWorksVars];
  @override
  final String wireName = 'GHotWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHotWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GHotWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHotWorksVarsBuilder().build();
  }
}

class _$GHotWorksVars extends GHotWorksVars {
  factory _$GHotWorksVars([void Function(GHotWorksVarsBuilder)? updates]) =>
      (new GHotWorksVarsBuilder()..update(updates))._build();

  _$GHotWorksVars._() : super._();

  @override
  GHotWorksVars rebuild(void Function(GHotWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotWorksVarsBuilder toBuilder() => new GHotWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotWorksVars;
  }

  @override
  int get hashCode {
    return 399405184;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHotWorksVars').toString();
  }
}

class GHotWorksVarsBuilder
    implements Builder<GHotWorksVars, GHotWorksVarsBuilder> {
  _$GHotWorksVars? _$v;

  GHotWorksVarsBuilder();

  @override
  void replace(GHotWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotWorksVars;
  }

  @override
  void update(void Function(GHotWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotWorksVars build() => _build();

  _$GHotWorksVars _build() {
    final _$result = _$v ?? new _$GHotWorksVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
