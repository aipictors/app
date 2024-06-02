// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_image_generation_task.var.gql.g.dart';

abstract class GDeleteImageGenerationTaskVars
    implements
        Built<GDeleteImageGenerationTaskVars,
            GDeleteImageGenerationTaskVarsBuilder> {
  GDeleteImageGenerationTaskVars._();

  factory GDeleteImageGenerationTaskVars(
          [void Function(GDeleteImageGenerationTaskVarsBuilder b) updates]) =
      _$GDeleteImageGenerationTaskVars;

  _i1.GDeleteImageGenerationTaskInput get input;
  static Serializer<GDeleteImageGenerationTaskVars> get serializer =>
      _$gDeleteImageGenerationTaskVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteImageGenerationTaskVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationTaskVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteImageGenerationTaskVars.serializer,
        json,
      );
}
