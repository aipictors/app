// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_generation_result_fields_fragment.var.gql.g.dart';

abstract class GImageGenerationResultFieldsVars
    implements
        Built<GImageGenerationResultFieldsVars,
            GImageGenerationResultFieldsVarsBuilder> {
  GImageGenerationResultFieldsVars._();

  factory GImageGenerationResultFieldsVars(
          [void Function(GImageGenerationResultFieldsVarsBuilder b) updates]) =
      _$GImageGenerationResultFieldsVars;

  static Serializer<GImageGenerationResultFieldsVars> get serializer =>
      _$gImageGenerationResultFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageGenerationResultFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationResultFieldsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageGenerationResultFieldsVars.serializer,
        json,
      );
}
