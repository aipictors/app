// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generation_task_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GImageGenerationTaskFieldsVars>
    _$gImageGenerationTaskFieldsVarsSerializer =
    new _$GImageGenerationTaskFieldsVarsSerializer();

class _$GImageGenerationTaskFieldsVarsSerializer
    implements StructuredSerializer<GImageGenerationTaskFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GImageGenerationTaskFieldsVars,
    _$GImageGenerationTaskFieldsVars
  ];
  @override
  final String wireName = 'GImageGenerationTaskFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GImageGenerationTaskFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GImageGenerationTaskFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GImageGenerationTaskFieldsVarsBuilder().build();
  }
}

class _$GImageGenerationTaskFieldsVars extends GImageGenerationTaskFieldsVars {
  factory _$GImageGenerationTaskFieldsVars(
          [void Function(GImageGenerationTaskFieldsVarsBuilder)? updates]) =>
      (new GImageGenerationTaskFieldsVarsBuilder()..update(updates))._build();

  _$GImageGenerationTaskFieldsVars._() : super._();

  @override
  GImageGenerationTaskFieldsVars rebuild(
          void Function(GImageGenerationTaskFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageGenerationTaskFieldsVarsBuilder toBuilder() =>
      new GImageGenerationTaskFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageGenerationTaskFieldsVars;
  }

  @override
  int get hashCode {
    return 639330546;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GImageGenerationTaskFieldsVars')
        .toString();
  }
}

class GImageGenerationTaskFieldsVarsBuilder
    implements
        Builder<GImageGenerationTaskFieldsVars,
            GImageGenerationTaskFieldsVarsBuilder> {
  _$GImageGenerationTaskFieldsVars? _$v;

  GImageGenerationTaskFieldsVarsBuilder();

  @override
  void replace(GImageGenerationTaskFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageGenerationTaskFieldsVars;
  }

  @override
  void update(void Function(GImageGenerationTaskFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageGenerationTaskFieldsVars build() => _build();

  _$GImageGenerationTaskFieldsVars _build() {
    final _$result = _$v ?? new _$GImageGenerationTaskFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
