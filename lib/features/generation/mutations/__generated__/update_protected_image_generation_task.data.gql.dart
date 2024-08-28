// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_protected_image_generation_task.data.gql.g.dart';

abstract class GUpdateProtectedImageGenerationTaskData
    implements
        Built<GUpdateProtectedImageGenerationTaskData,
            GUpdateProtectedImageGenerationTaskDataBuilder> {
  GUpdateProtectedImageGenerationTaskData._();

  factory GUpdateProtectedImageGenerationTaskData(
      [void Function(GUpdateProtectedImageGenerationTaskDataBuilder b)
          updates]) = _$GUpdateProtectedImageGenerationTaskData;

  static void _initializeBuilder(
          GUpdateProtectedImageGenerationTaskDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
      get updateProtectedImageGenerationResult;
  static Serializer<GUpdateProtectedImageGenerationTaskData> get serializer =>
      _$gUpdateProtectedImageGenerationTaskDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProtectedImageGenerationTaskData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProtectedImageGenerationTaskData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateProtectedImageGenerationTaskData.serializer,
        json,
      );
}

abstract class GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
    implements
        Built<
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult,
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder> {
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult._();

  factory GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult(
          [void Function(
                  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder
                      b)
              updates]) =
      _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult;

  static void _initializeBuilder(
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder
              b) =>
      b..G__typename = 'ImageGenerationResultNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  bool? get isProtected;
  static Serializer<
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult>
      get serializer =>
          _$gUpdateProtectedImageGenerationTaskDataUpdateProtectedImageGenerationResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult
                .serializer,
            json,
          );
}
