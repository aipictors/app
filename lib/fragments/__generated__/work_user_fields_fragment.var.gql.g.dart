// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_user_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkUserFieldsVars> _$gWorkUserFieldsVarsSerializer =
    new _$GWorkUserFieldsVarsSerializer();

class _$GWorkUserFieldsVarsSerializer
    implements StructuredSerializer<GWorkUserFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GWorkUserFieldsVars,
    _$GWorkUserFieldsVars
  ];
  @override
  final String wireName = 'GWorkUserFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkUserFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GWorkUserFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GWorkUserFieldsVarsBuilder().build();
  }
}

class _$GWorkUserFieldsVars extends GWorkUserFieldsVars {
  factory _$GWorkUserFieldsVars(
          [void Function(GWorkUserFieldsVarsBuilder)? updates]) =>
      (new GWorkUserFieldsVarsBuilder()..update(updates))._build();

  _$GWorkUserFieldsVars._() : super._();

  @override
  GWorkUserFieldsVars rebuild(
          void Function(GWorkUserFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkUserFieldsVarsBuilder toBuilder() =>
      new GWorkUserFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkUserFieldsVars;
  }

  @override
  int get hashCode {
    return 689288892;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GWorkUserFieldsVars').toString();
  }
}

class GWorkUserFieldsVarsBuilder
    implements Builder<GWorkUserFieldsVars, GWorkUserFieldsVarsBuilder> {
  _$GWorkUserFieldsVars? _$v;

  GWorkUserFieldsVarsBuilder();

  @override
  void replace(GWorkUserFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkUserFieldsVars;
  }

  @override
  void update(void Function(GWorkUserFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkUserFieldsVars build() => _build();

  _$GWorkUserFieldsVars _build() {
    final _$result = _$v ?? new _$GWorkUserFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
