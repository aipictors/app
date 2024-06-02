// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_image_generation_status.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerImageGenerationStatusVars>
    _$gViewerImageGenerationStatusVarsSerializer =
    new _$GViewerImageGenerationStatusVarsSerializer();

class _$GViewerImageGenerationStatusVarsSerializer
    implements StructuredSerializer<GViewerImageGenerationStatusVars> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationStatusVars,
    _$GViewerImageGenerationStatusVars
  ];
  @override
  final String wireName = 'GViewerImageGenerationStatusVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerImageGenerationStatusVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GViewerImageGenerationStatusVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GViewerImageGenerationStatusVarsBuilder().build();
  }
}

class _$GViewerImageGenerationStatusVars
    extends GViewerImageGenerationStatusVars {
  factory _$GViewerImageGenerationStatusVars(
          [void Function(GViewerImageGenerationStatusVarsBuilder)? updates]) =>
      (new GViewerImageGenerationStatusVarsBuilder()..update(updates))._build();

  _$GViewerImageGenerationStatusVars._() : super._();

  @override
  GViewerImageGenerationStatusVars rebuild(
          void Function(GViewerImageGenerationStatusVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationStatusVarsBuilder toBuilder() =>
      new GViewerImageGenerationStatusVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerImageGenerationStatusVars;
  }

  @override
  int get hashCode {
    return 682140739;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GViewerImageGenerationStatusVars')
        .toString();
  }
}

class GViewerImageGenerationStatusVarsBuilder
    implements
        Builder<GViewerImageGenerationStatusVars,
            GViewerImageGenerationStatusVarsBuilder> {
  _$GViewerImageGenerationStatusVars? _$v;

  GViewerImageGenerationStatusVarsBuilder();

  @override
  void replace(GViewerImageGenerationStatusVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerImageGenerationStatusVars;
  }

  @override
  void update(void Function(GViewerImageGenerationStatusVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationStatusVars build() => _build();

  _$GViewerImageGenerationStatusVars _build() {
    final _$result = _$v ?? new _$GViewerImageGenerationStatusVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
