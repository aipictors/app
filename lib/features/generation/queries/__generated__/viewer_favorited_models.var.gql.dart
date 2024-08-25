// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_favorited_models.var.gql.g.dart';

abstract class GViewerFavoritedImageGenerationModelsVars
    implements
        Built<GViewerFavoritedImageGenerationModelsVars,
            GViewerFavoritedImageGenerationModelsVarsBuilder> {
  GViewerFavoritedImageGenerationModelsVars._();

  factory GViewerFavoritedImageGenerationModelsVars(
      [void Function(GViewerFavoritedImageGenerationModelsVarsBuilder b)
          updates]) = _$GViewerFavoritedImageGenerationModelsVars;

  static Serializer<GViewerFavoritedImageGenerationModelsVars> get serializer =>
      _$gViewerFavoritedImageGenerationModelsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFavoritedImageGenerationModelsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFavoritedImageGenerationModelsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFavoritedImageGenerationModelsVars.serializer,
        json,
      );
}
