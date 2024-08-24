// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_user_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialUserFieldsVars> _$gPartialUserFieldsVarsSerializer =
    new _$GPartialUserFieldsVarsSerializer();

class _$GPartialUserFieldsVarsSerializer
    implements StructuredSerializer<GPartialUserFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialUserFieldsVars,
    _$GPartialUserFieldsVars
  ];
  @override
  final String wireName = 'GPartialUserFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialUserFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialUserFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialUserFieldsVarsBuilder().build();
  }
}

class _$GPartialUserFieldsVars extends GPartialUserFieldsVars {
  factory _$GPartialUserFieldsVars(
          [void Function(GPartialUserFieldsVarsBuilder)? updates]) =>
      (new GPartialUserFieldsVarsBuilder()..update(updates))._build();

  _$GPartialUserFieldsVars._() : super._();

  @override
  GPartialUserFieldsVars rebuild(
          void Function(GPartialUserFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialUserFieldsVarsBuilder toBuilder() =>
      new GPartialUserFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialUserFieldsVars;
  }

  @override
  int get hashCode {
    return 830467880;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialUserFieldsVars').toString();
  }
}

class GPartialUserFieldsVarsBuilder
    implements Builder<GPartialUserFieldsVars, GPartialUserFieldsVarsBuilder> {
  _$GPartialUserFieldsVars? _$v;

  GPartialUserFieldsVarsBuilder();

  @override
  void replace(GPartialUserFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialUserFieldsVars;
  }

  @override
  void update(void Function(GPartialUserFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialUserFieldsVars build() => _build();

  _$GPartialUserFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialUserFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
