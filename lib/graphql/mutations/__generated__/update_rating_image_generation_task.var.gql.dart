// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_rating_image_generation_task.var.gql.g.dart';

abstract class GUpdateRatingImageGenerationTaskVars
    implements
        Built<GUpdateRatingImageGenerationTaskVars,
            GUpdateRatingImageGenerationTaskVarsBuilder> {
  GUpdateRatingImageGenerationTaskVars._();

  factory GUpdateRatingImageGenerationTaskVars(
      [void Function(GUpdateRatingImageGenerationTaskVarsBuilder b)
          updates]) = _$GUpdateRatingImageGenerationTaskVars;

  _i1.GUpdateRatingImageGenerationResultInput get input;
  static Serializer<GUpdateRatingImageGenerationTaskVars> get serializer =>
      _$gUpdateRatingImageGenerationTaskVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GUpdateRatingImageGenerationTaskVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRatingImageGenerationTaskVars? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GUpdateRatingImageGenerationTaskVars.serializer,
        json,
      );
}
