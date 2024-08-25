// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generation_result_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GImageGenerationResultFieldsVars>
    _$gImageGenerationResultFieldsVarsSerializer =
    new _$GImageGenerationResultFieldsVarsSerializer();

class _$GImageGenerationResultFieldsVarsSerializer
    implements StructuredSerializer<GImageGenerationResultFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GImageGenerationResultFieldsVars,
    _$GImageGenerationResultFieldsVars
  ];
  @override
  final String wireName = 'GImageGenerationResultFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GImageGenerationResultFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GImageGenerationResultFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GImageGenerationResultFieldsVarsBuilder().build();
  }
}

class _$GImageGenerationResultFieldsVars
    extends GImageGenerationResultFieldsVars {
  factory _$GImageGenerationResultFieldsVars(
          [void Function(GImageGenerationResultFieldsVarsBuilder)? updates]) =>
      (new GImageGenerationResultFieldsVarsBuilder()..update(updates))._build();

  _$GImageGenerationResultFieldsVars._() : super._();

  @override
  GImageGenerationResultFieldsVars rebuild(
          void Function(GImageGenerationResultFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageGenerationResultFieldsVarsBuilder toBuilder() =>
      new GImageGenerationResultFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageGenerationResultFieldsVars;
  }

  @override
  int get hashCode {
    return 265747680;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GImageGenerationResultFieldsVars')
        .toString();
  }
}

class GImageGenerationResultFieldsVarsBuilder
    implements
        Builder<GImageGenerationResultFieldsVars,
            GImageGenerationResultFieldsVarsBuilder> {
  _$GImageGenerationResultFieldsVars? _$v;

  GImageGenerationResultFieldsVarsBuilder();

  @override
  void replace(GImageGenerationResultFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageGenerationResultFieldsVars;
  }

  @override
  void update(void Function(GImageGenerationResultFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageGenerationResultFieldsVars build() => _build();

  _$GImageGenerationResultFieldsVars _build() {
    final _$result = _$v ?? new _$GImageGenerationResultFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
