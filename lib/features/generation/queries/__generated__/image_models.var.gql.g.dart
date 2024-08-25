// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_models.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GImageModelsVars> _$gImageModelsVarsSerializer =
    new _$GImageModelsVarsSerializer();

class _$GImageModelsVarsSerializer
    implements StructuredSerializer<GImageModelsVars> {
  @override
  final Iterable<Type> types = const [GImageModelsVars, _$GImageModelsVars];
  @override
  final String wireName = 'GImageModelsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GImageModelsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GImageModelsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GImageModelsVarsBuilder().build();
  }
}

class _$GImageModelsVars extends GImageModelsVars {
  factory _$GImageModelsVars(
          [void Function(GImageModelsVarsBuilder)? updates]) =>
      (new GImageModelsVarsBuilder()..update(updates))._build();

  _$GImageModelsVars._() : super._();

  @override
  GImageModelsVars rebuild(void Function(GImageModelsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageModelsVarsBuilder toBuilder() =>
      new GImageModelsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageModelsVars;
  }

  @override
  int get hashCode {
    return 136234815;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GImageModelsVars').toString();
  }
}

class GImageModelsVarsBuilder
    implements Builder<GImageModelsVars, GImageModelsVarsBuilder> {
  _$GImageModelsVars? _$v;

  GImageModelsVarsBuilder();

  @override
  void replace(GImageModelsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageModelsVars;
  }

  @override
  void update(void Function(GImageModelsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageModelsVars build() => _build();

  _$GImageModelsVars _build() {
    final _$result = _$v ?? new _$GImageModelsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
