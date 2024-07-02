// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_result_fields_fragment.data.gql.dart'
    as _i2;
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
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResultBuilder>,
        _i2.GImageGenerationResultFields {
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

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get prompt;
  @override
  String get negativePrompt;
  @override
  double get seed;
  @override
  int get steps;
  @override
  int get scale;
  @override
  String get sampler;
  @override
  int get clipSkip;
  @override
  _i3.GImageGenerationSizeType get sizeType;
  @override
  String? get t2tImageUrl;
  @override
  String? get t2tMaskImageUrl;
  @override
  String? get t2tDenoisingStrengthSize;
  @override
  String? get t2tInpaintingFillSize;
  @override
  int? get rating;
  @override
  int? get completedAt;
  @override
  _i3.GImageGenerationStatus get status;
  @override
  bool? get isProtected;
  @override
  _i3.GImageGenerationType get generationType;
  @override
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model
      get model;
  @override
  String? get vae;
  @override
  String? get nanoid;
  @override
  int? get estimatedSeconds;
  @override
  String? get controlNetControlMode;
  @override
  bool? get controlNetEnabled;
  @override
  double? get controlNetGuidanceEnd;
  @override
  double? get controlNetGuidanceStart;
  @override
  bool? get controlNetPixelPerfect;
  @override
  int? get controlNetProcessorRes;
  @override
  String? get controlNetResizeMode;
  @override
  int? get controlNetThresholdA;
  @override
  int? get controlNetThresholdB;
  @override
  double? get controlNetWeight;
  @override
  String? get controlNetModule;
  @override
  String? get controlNetModel;
  @override
  bool? get controlNetSaveDetectedMap;
  @override
  String? get controlNetHrOption;
  @override
  double? get upscaleSize;
  @override
  String? get imageFileName;
  @override
  String? get thumbnailImageFileName;
  @override
  String? get token;
  @override
  String? get thumbnailToken;
  static Serializer<
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult>
      get serializer =>
          _$gUpdateProtectedImageGenerationTaskDataUpdateProtectedImageGenerationResultSerializer;

  @override
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

abstract class GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model
    implements
        Built<
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model,
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_modelBuilder>,
        _i2.GImageGenerationResultFields_model {
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model._();

  factory GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model(
          [void Function(
                  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_modelBuilder
                      b)
              updates]) =
      _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model;

  static void _initializeBuilder(
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_modelBuilder
              b) =>
      b..G__typename = 'ImageGeneratorNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  static Serializer<
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model>
      get serializer =>
          _$gUpdateProtectedImageGenerationTaskDataUpdateProtectedImageGenerationResultModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationResult_model
                .serializer,
            json,
          );
}
