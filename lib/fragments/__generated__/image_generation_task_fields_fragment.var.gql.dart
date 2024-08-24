// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_generation_task_fields_fragment.var.gql.g.dart';

abstract class GImageGenerationTaskFieldsVars
    implements
        Built<GImageGenerationTaskFieldsVars,
            GImageGenerationTaskFieldsVarsBuilder> {
  GImageGenerationTaskFieldsVars._();

  factory GImageGenerationTaskFieldsVars(
          [void Function(GImageGenerationTaskFieldsVarsBuilder b) updates]) =
      _$GImageGenerationTaskFieldsVars;

  static Serializer<GImageGenerationTaskFieldsVars> get serializer =>
      _$gImageGenerationTaskFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GImageGenerationTaskFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationTaskFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GImageGenerationTaskFieldsVars.serializer,
        json,
      );
}
