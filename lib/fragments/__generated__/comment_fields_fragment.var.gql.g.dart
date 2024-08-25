// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCommentFieldsVars> _$gCommentFieldsVarsSerializer =
    new _$GCommentFieldsVarsSerializer();

class _$GCommentFieldsVarsSerializer
    implements StructuredSerializer<GCommentFieldsVars> {
  @override
  final Iterable<Type> types = const [GCommentFieldsVars, _$GCommentFieldsVars];
  @override
  final String wireName = 'GCommentFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCommentFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GCommentFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GCommentFieldsVarsBuilder().build();
  }
}

class _$GCommentFieldsVars extends GCommentFieldsVars {
  factory _$GCommentFieldsVars(
          [void Function(GCommentFieldsVarsBuilder)? updates]) =>
      (new GCommentFieldsVarsBuilder()..update(updates))._build();

  _$GCommentFieldsVars._() : super._();

  @override
  GCommentFieldsVars rebuild(
          void Function(GCommentFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCommentFieldsVarsBuilder toBuilder() =>
      new GCommentFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCommentFieldsVars;
  }

  @override
  int get hashCode {
    return 903989379;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GCommentFieldsVars').toString();
  }
}

class GCommentFieldsVarsBuilder
    implements Builder<GCommentFieldsVars, GCommentFieldsVarsBuilder> {
  _$GCommentFieldsVars? _$v;

  GCommentFieldsVarsBuilder();

  @override
  void replace(GCommentFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCommentFieldsVars;
  }

  @override
  void update(void Function(GCommentFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCommentFieldsVars build() => _build();

  _$GCommentFieldsVars _build() {
    final _$result = _$v ?? new _$GCommentFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
