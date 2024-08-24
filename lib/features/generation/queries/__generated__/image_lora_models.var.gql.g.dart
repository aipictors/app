// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_lora_models.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GImageLoraModelsVars> _$gImageLoraModelsVarsSerializer =
    new _$GImageLoraModelsVarsSerializer();

class _$GImageLoraModelsVarsSerializer
    implements StructuredSerializer<GImageLoraModelsVars> {
  @override
  final Iterable<Type> types = const [
    GImageLoraModelsVars,
    _$GImageLoraModelsVars
  ];
  @override
  final String wireName = 'GImageLoraModelsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GImageLoraModelsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GImageLoraModelsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GImageLoraModelsVarsBuilder().build();
  }
}

class _$GImageLoraModelsVars extends GImageLoraModelsVars {
  factory _$GImageLoraModelsVars(
          [void Function(GImageLoraModelsVarsBuilder)? updates]) =>
      (new GImageLoraModelsVarsBuilder()..update(updates))._build();

  _$GImageLoraModelsVars._() : super._();

  @override
  GImageLoraModelsVars rebuild(
          void Function(GImageLoraModelsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageLoraModelsVarsBuilder toBuilder() =>
      new GImageLoraModelsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageLoraModelsVars;
  }

  @override
  int get hashCode {
    return 286761188;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GImageLoraModelsVars').toString();
  }
}

class GImageLoraModelsVarsBuilder
    implements Builder<GImageLoraModelsVars, GImageLoraModelsVarsBuilder> {
  _$GImageLoraModelsVars? _$v;

  GImageLoraModelsVarsBuilder();

  @override
  void replace(GImageLoraModelsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageLoraModelsVars;
  }

  @override
  void update(void Function(GImageLoraModelsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageLoraModelsVars build() => _build();

  _$GImageLoraModelsVars _build() {
    final _$result = _$v ?? new _$GImageLoraModelsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
