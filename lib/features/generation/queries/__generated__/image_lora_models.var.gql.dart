// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_lora_models.var.gql.g.dart';

abstract class GImageLoraModelsVars
    implements Built<GImageLoraModelsVars, GImageLoraModelsVarsBuilder> {
  GImageLoraModelsVars._();

  factory GImageLoraModelsVars(
          [void Function(GImageLoraModelsVarsBuilder b) updates]) =
      _$GImageLoraModelsVars;

  static Serializer<GImageLoraModelsVars> get serializer =>
      _$gImageLoraModelsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageLoraModelsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageLoraModelsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageLoraModelsVars.serializer,
        json,
      );
}
