// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_work_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialWorkFieldsVars> _$gPartialWorkFieldsVarsSerializer =
    new _$GPartialWorkFieldsVarsSerializer();

class _$GPartialWorkFieldsVarsSerializer
    implements StructuredSerializer<GPartialWorkFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialWorkFieldsVars,
    _$GPartialWorkFieldsVars
  ];
  @override
  final String wireName = 'GPartialWorkFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialWorkFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialWorkFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialWorkFieldsVarsBuilder().build();
  }
}

class _$GPartialWorkFieldsVars extends GPartialWorkFieldsVars {
  factory _$GPartialWorkFieldsVars(
          [void Function(GPartialWorkFieldsVarsBuilder)? updates]) =>
      (new GPartialWorkFieldsVarsBuilder()..update(updates))._build();

  _$GPartialWorkFieldsVars._() : super._();

  @override
  GPartialWorkFieldsVars rebuild(
          void Function(GPartialWorkFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialWorkFieldsVarsBuilder toBuilder() =>
      new GPartialWorkFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialWorkFieldsVars;
  }

  @override
  int get hashCode {
    return 875278351;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialWorkFieldsVars').toString();
  }
}

class GPartialWorkFieldsVarsBuilder
    implements Builder<GPartialWorkFieldsVars, GPartialWorkFieldsVarsBuilder> {
  _$GPartialWorkFieldsVars? _$v;

  GPartialWorkFieldsVarsBuilder();

  @override
  void replace(GPartialWorkFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialWorkFieldsVars;
  }

  @override
  void update(void Function(GPartialWorkFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialWorkFieldsVars build() => _build();

  _$GPartialWorkFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialWorkFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
