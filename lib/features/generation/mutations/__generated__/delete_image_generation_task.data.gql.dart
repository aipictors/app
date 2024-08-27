// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_image_generation_task.data.gql.g.dart';

abstract class GDeleteImageGenerationTaskData
    implements
        Built<GDeleteImageGenerationTaskData,
            GDeleteImageGenerationTaskDataBuilder> {
  GDeleteImageGenerationTaskData._();

  factory GDeleteImageGenerationTaskData(
          [void Function(GDeleteImageGenerationTaskDataBuilder b) updates]) =
      _$GDeleteImageGenerationTaskData;

  static void _initializeBuilder(GDeleteImageGenerationTaskDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteImageGenerationTaskData_deleteImageGenerationResult
      get deleteImageGenerationResult;
  static Serializer<GDeleteImageGenerationTaskData> get serializer =>
      _$gDeleteImageGenerationTaskDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteImageGenerationTaskData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationTaskData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteImageGenerationTaskData.serializer,
        json,
      );
}

abstract class GDeleteImageGenerationTaskData_deleteImageGenerationResult
    implements
        Built<GDeleteImageGenerationTaskData_deleteImageGenerationResult,
            GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder> {
  GDeleteImageGenerationTaskData_deleteImageGenerationResult._();

  factory GDeleteImageGenerationTaskData_deleteImageGenerationResult(
      [void Function(
              GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder
                  b)
          updates]) = _$GDeleteImageGenerationTaskData_deleteImageGenerationResult;

  static void _initializeBuilder(
          GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder
              b) =>
      b..G__typename = 'ImageGenerationResultNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteImageGenerationTaskData_deleteImageGenerationResult>
      get serializer =>
          _$gDeleteImageGenerationTaskDataDeleteImageGenerationResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteImageGenerationTaskData_deleteImageGenerationResult.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationTaskData_deleteImageGenerationResult? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteImageGenerationTaskData_deleteImageGenerationResult.serializer,
        json,
      );
}
