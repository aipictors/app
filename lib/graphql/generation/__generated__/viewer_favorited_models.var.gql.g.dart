// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_favorited_models.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerFavoritedImageGenerationModelsVars>
    _$gViewerFavoritedImageGenerationModelsVarsSerializer =
    new _$GViewerFavoritedImageGenerationModelsVarsSerializer();

class _$GViewerFavoritedImageGenerationModelsVarsSerializer
    implements StructuredSerializer<GViewerFavoritedImageGenerationModelsVars> {
  @override
  final Iterable<Type> types = const [
    GViewerFavoritedImageGenerationModelsVars,
    _$GViewerFavoritedImageGenerationModelsVars
  ];
  @override
  final String wireName = 'GViewerFavoritedImageGenerationModelsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFavoritedImageGenerationModelsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GViewerFavoritedImageGenerationModelsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GViewerFavoritedImageGenerationModelsVarsBuilder().build();
  }
}

class _$GViewerFavoritedImageGenerationModelsVars
    extends GViewerFavoritedImageGenerationModelsVars {
  factory _$GViewerFavoritedImageGenerationModelsVars(
          [void Function(GViewerFavoritedImageGenerationModelsVarsBuilder)?
              updates]) =>
      (new GViewerFavoritedImageGenerationModelsVarsBuilder()..update(updates))
          ._build();

  _$GViewerFavoritedImageGenerationModelsVars._() : super._();

  @override
  GViewerFavoritedImageGenerationModelsVars rebuild(
          void Function(GViewerFavoritedImageGenerationModelsVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFavoritedImageGenerationModelsVarsBuilder toBuilder() =>
      new GViewerFavoritedImageGenerationModelsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFavoritedImageGenerationModelsVars;
  }

  @override
  int get hashCode {
    return 368853093;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(
            r'GViewerFavoritedImageGenerationModelsVars')
        .toString();
  }
}

class GViewerFavoritedImageGenerationModelsVarsBuilder
    implements
        Builder<GViewerFavoritedImageGenerationModelsVars,
            GViewerFavoritedImageGenerationModelsVarsBuilder> {
  _$GViewerFavoritedImageGenerationModelsVars? _$v;

  GViewerFavoritedImageGenerationModelsVarsBuilder();

  @override
  void replace(GViewerFavoritedImageGenerationModelsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFavoritedImageGenerationModelsVars;
  }

  @override
  void update(
      void Function(GViewerFavoritedImageGenerationModelsVarsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFavoritedImageGenerationModelsVars build() => _build();

  _$GViewerFavoritedImageGenerationModelsVars _build() {
    final _$result = _$v ?? new _$GViewerFavoritedImageGenerationModelsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
