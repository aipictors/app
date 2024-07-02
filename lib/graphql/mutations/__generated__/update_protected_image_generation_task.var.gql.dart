// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_protected_image_generation_task.var.gql.g.dart';

abstract class GUpdateProtectedImageGenerationTaskVars
    implements
        Built<GUpdateProtectedImageGenerationTaskVars,
            GUpdateProtectedImageGenerationTaskVarsBuilder> {
  GUpdateProtectedImageGenerationTaskVars._();

  factory GUpdateProtectedImageGenerationTaskVars(
      [void Function(GUpdateProtectedImageGenerationTaskVarsBuilder b)
          updates]) = _$GUpdateProtectedImageGenerationTaskVars;

  _i1.GUpdateProtectedImageGenerationResultInput get input;
  static Serializer<GUpdateProtectedImageGenerationTaskVars> get serializer =>
      _$gUpdateProtectedImageGenerationTaskVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateProtectedImageGenerationTaskVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProtectedImageGenerationTaskVars? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateProtectedImageGenerationTaskVars.serializer,
        json,
      );
}
