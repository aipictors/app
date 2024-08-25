// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_tag_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialTagFieldsVars> _$gPartialTagFieldsVarsSerializer =
    new _$GPartialTagFieldsVarsSerializer();

class _$GPartialTagFieldsVarsSerializer
    implements StructuredSerializer<GPartialTagFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialTagFieldsVars,
    _$GPartialTagFieldsVars
  ];
  @override
  final String wireName = 'GPartialTagFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialTagFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialTagFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialTagFieldsVarsBuilder().build();
  }
}

class _$GPartialTagFieldsVars extends GPartialTagFieldsVars {
  factory _$GPartialTagFieldsVars(
          [void Function(GPartialTagFieldsVarsBuilder)? updates]) =>
      (new GPartialTagFieldsVarsBuilder()..update(updates))._build();

  _$GPartialTagFieldsVars._() : super._();

  @override
  GPartialTagFieldsVars rebuild(
          void Function(GPartialTagFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialTagFieldsVarsBuilder toBuilder() =>
      new GPartialTagFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialTagFieldsVars;
  }

  @override
  int get hashCode {
    return 624932594;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialTagFieldsVars').toString();
  }
}

class GPartialTagFieldsVarsBuilder
    implements Builder<GPartialTagFieldsVars, GPartialTagFieldsVarsBuilder> {
  _$GPartialTagFieldsVars? _$v;

  GPartialTagFieldsVarsBuilder();

  @override
  void replace(GPartialTagFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialTagFieldsVars;
  }

  @override
  void update(void Function(GPartialTagFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialTagFieldsVars build() => _build();

  _$GPartialTagFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialTagFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
