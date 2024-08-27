// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_rating_image_generation_task.data.gql.g.dart';

abstract class GUpdateRatingImageGenerationTaskData
    implements
        Built<GUpdateRatingImageGenerationTaskData,
            GUpdateRatingImageGenerationTaskDataBuilder> {
  GUpdateRatingImageGenerationTaskData._();

  factory GUpdateRatingImageGenerationTaskData(
      [void Function(GUpdateRatingImageGenerationTaskDataBuilder b)
          updates]) = _$GUpdateRatingImageGenerationTaskData;

  static void _initializeBuilder(
          GUpdateRatingImageGenerationTaskDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
      get updateRatingImageGenerationResult;
  static Serializer<GUpdateRatingImageGenerationTaskData> get serializer =>
      _$gUpdateRatingImageGenerationTaskDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRatingImageGenerationTaskData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRatingImageGenerationTaskData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateRatingImageGenerationTaskData.serializer,
        json,
      );
}

abstract class GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
    implements
        Built<
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult,
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder> {
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult._();

  factory GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult(
          [void Function(
                  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder
                      b)
              updates]) =
      _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult;

  static void _initializeBuilder(
          GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResultBuilder
              b) =>
      b..G__typename = 'ImageGenerationResultNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  int? get rating;
  static Serializer<
          GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult>
      get serializer =>
          _$gUpdateRatingImageGenerationTaskDataUpdateRatingImageGenerationResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationResult
                .serializer,
            json,
          );
}
