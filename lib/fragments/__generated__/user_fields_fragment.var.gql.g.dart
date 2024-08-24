// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFieldsVars> _$gUserFieldsVarsSerializer =
    new _$GUserFieldsVarsSerializer();

class _$GUserFieldsVarsSerializer
    implements StructuredSerializer<GUserFieldsVars> {
  @override
  final Iterable<Type> types = const [GUserFieldsVars, _$GUserFieldsVars];
  @override
  final String wireName = 'GUserFieldsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GUserFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GUserFieldsVarsBuilder().build();
  }
}

class _$GUserFieldsVars extends GUserFieldsVars {
  factory _$GUserFieldsVars([void Function(GUserFieldsVarsBuilder)? updates]) =>
      (new GUserFieldsVarsBuilder()..update(updates))._build();

  _$GUserFieldsVars._() : super._();

  @override
  GUserFieldsVars rebuild(void Function(GUserFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFieldsVarsBuilder toBuilder() =>
      new GUserFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFieldsVars;
  }

  @override
  int get hashCode {
    return 51217839;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GUserFieldsVars').toString();
  }
}

class GUserFieldsVarsBuilder
    implements Builder<GUserFieldsVars, GUserFieldsVarsBuilder> {
  _$GUserFieldsVars? _$v;

  GUserFieldsVarsBuilder();

  @override
  void replace(GUserFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFieldsVars;
  }

  @override
  void update(void Function(GUserFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFieldsVars build() => _build();

  _$GUserFieldsVars _build() {
    final _$result = _$v ?? new _$GUserFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
