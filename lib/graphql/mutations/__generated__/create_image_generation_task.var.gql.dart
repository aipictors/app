// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_image_generation_task.var.gql.g.dart';

abstract class GCreateImageGenerationTaskVars
    implements
        Built<GCreateImageGenerationTaskVars,
            GCreateImageGenerationTaskVarsBuilder> {
  GCreateImageGenerationTaskVars._();

  factory GCreateImageGenerationTaskVars(
          [void Function(GCreateImageGenerationTaskVarsBuilder b) updates]) =
      _$GCreateImageGenerationTaskVars;

  _i1.GCreateImageGenerationTaskInput get input;
  static Serializer<GCreateImageGenerationTaskVars> get serializer =>
      _$gCreateImageGenerationTaskVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateImageGenerationTaskVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateImageGenerationTaskVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateImageGenerationTaskVars.serializer,
        json,
      );
}
