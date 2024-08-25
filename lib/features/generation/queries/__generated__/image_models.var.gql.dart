// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_models.var.gql.g.dart';

abstract class GImageModelsVars
    implements Built<GImageModelsVars, GImageModelsVarsBuilder> {
  GImageModelsVars._();

  factory GImageModelsVars([void Function(GImageModelsVarsBuilder b) updates]) =
      _$GImageModelsVars;

  static Serializer<GImageModelsVars> get serializer =>
      _$gImageModelsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageModelsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageModelsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageModelsVars.serializer,
        json,
      );
}
