// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_work_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSubWorkFieldsVars> _$gSubWorkFieldsVarsSerializer =
    new _$GSubWorkFieldsVarsSerializer();

class _$GSubWorkFieldsVarsSerializer
    implements StructuredSerializer<GSubWorkFieldsVars> {
  @override
  final Iterable<Type> types = const [GSubWorkFieldsVars, _$GSubWorkFieldsVars];
  @override
  final String wireName = 'GSubWorkFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSubWorkFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GSubWorkFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GSubWorkFieldsVarsBuilder().build();
  }
}

class _$GSubWorkFieldsVars extends GSubWorkFieldsVars {
  factory _$GSubWorkFieldsVars(
          [void Function(GSubWorkFieldsVarsBuilder)? updates]) =>
      (new GSubWorkFieldsVarsBuilder()..update(updates))._build();

  _$GSubWorkFieldsVars._() : super._();

  @override
  GSubWorkFieldsVars rebuild(
          void Function(GSubWorkFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSubWorkFieldsVarsBuilder toBuilder() =>
      new GSubWorkFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSubWorkFieldsVars;
  }

  @override
  int get hashCode {
    return 159814916;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GSubWorkFieldsVars').toString();
  }
}

class GSubWorkFieldsVarsBuilder
    implements Builder<GSubWorkFieldsVars, GSubWorkFieldsVarsBuilder> {
  _$GSubWorkFieldsVars? _$v;

  GSubWorkFieldsVarsBuilder();

  @override
  void replace(GSubWorkFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSubWorkFieldsVars;
  }

  @override
  void update(void Function(GSubWorkFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSubWorkFieldsVars build() => _build();

  _$GSubWorkFieldsVars _build() {
    final _$result = _$v ?? new _$GSubWorkFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
