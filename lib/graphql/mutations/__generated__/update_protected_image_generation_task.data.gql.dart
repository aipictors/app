// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.data.gql.dart'
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
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask
      get updateProtectedImageGenerationTask;
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

abstract class GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask
    implements
        Built<
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask,
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTaskBuilder>,
        _i2.GImageGenerationTaskFields {
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask._();

  factory GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask(
          [void Function(
                  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTaskBuilder
                      b)
              updates]) =
      _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask;

  static void _initializeBuilder(
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTaskBuilder
              b) =>
      b..G__typename = 'ImageGenerationTaskNode';

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
  bool get isDeleted;
  @override
  bool? get isProtected;
  @override
  int get count;
  @override
  _i3.GImageGenerationType get generationType;
  @override
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model
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
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask>
      get serializer =>
          _$gUpdateProtectedImageGenerationTaskDataUpdateProtectedImageGenerationTaskSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask
                .serializer,
            json,
          );
}

abstract class GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model
    implements
        Built<
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model,
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_modelBuilder>,
        _i2.GImageGenerationTaskFields_model {
  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model._();

  factory GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model(
          [void Function(
                  GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_modelBuilder
                      b)
              updates]) =
      _$GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model;

  static void _initializeBuilder(
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_modelBuilder
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
          GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model>
      get serializer =>
          _$gUpdateProtectedImageGenerationTaskDataUpdateProtectedImageGenerationTaskModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateProtectedImageGenerationTaskData_updateProtectedImageGenerationTask_model
                .serializer,
            json,
          );
}
