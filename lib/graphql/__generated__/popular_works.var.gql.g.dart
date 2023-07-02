// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPopularWorksVars> _$gPopularWorksVarsSerializer =
    new _$GPopularWorksVarsSerializer();

class _$GPopularWorksVarsSerializer
    implements StructuredSerializer<GPopularWorksVars> {
  @override
  final Iterable<Type> types = const [GPopularWorksVars, _$GPopularWorksVars];
  @override
  final String wireName = 'GPopularWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPopularWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPopularWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPopularWorksVarsBuilder().build();
  }
}

class _$GPopularWorksVars extends GPopularWorksVars {
  factory _$GPopularWorksVars(
          [void Function(GPopularWorksVarsBuilder)? updates]) =>
      (new GPopularWorksVarsBuilder()..update(updates))._build();

  _$GPopularWorksVars._() : super._();

  @override
  GPopularWorksVars rebuild(void Function(GPopularWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPopularWorksVarsBuilder toBuilder() =>
      new GPopularWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPopularWorksVars;
  }

  @override
  int get hashCode {
    return 272538412;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPopularWorksVars').toString();
  }
}

class GPopularWorksVarsBuilder
    implements Builder<GPopularWorksVars, GPopularWorksVarsBuilder> {
  _$GPopularWorksVars? _$v;

  GPopularWorksVarsBuilder();

  @override
  void replace(GPopularWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPopularWorksVars;
  }

  @override
  void update(void Function(GPopularWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPopularWorksVars build() => _build();

  _$GPopularWorksVars _build() {
    final _$result = _$v ?? new _$GPopularWorksVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
