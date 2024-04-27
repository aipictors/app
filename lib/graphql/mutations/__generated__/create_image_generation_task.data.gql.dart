// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_image_generation_task.data.gql.g.dart';

abstract class GCreateImageGenerationTaskData
    implements
        Built<GCreateImageGenerationTaskData,
            GCreateImageGenerationTaskDataBuilder> {
  GCreateImageGenerationTaskData._();

  factory GCreateImageGenerationTaskData(
          [void Function(GCreateImageGenerationTaskDataBuilder b) updates]) =
      _$GCreateImageGenerationTaskData;

  static void _initializeBuilder(GCreateImageGenerationTaskDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateImageGenerationTaskData_createImageGenerationTask
      get createImageGenerationTask;
  static Serializer<GCreateImageGenerationTaskData> get serializer =>
      _$gCreateImageGenerationTaskDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateImageGenerationTaskData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateImageGenerationTaskData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateImageGenerationTaskData.serializer,
        json,
      );
}

abstract class GCreateImageGenerationTaskData_createImageGenerationTask
    implements
        Built<GCreateImageGenerationTaskData_createImageGenerationTask,
            GCreateImageGenerationTaskData_createImageGenerationTaskBuilder> {
  GCreateImageGenerationTaskData_createImageGenerationTask._();

  factory GCreateImageGenerationTaskData_createImageGenerationTask(
      [void Function(
              GCreateImageGenerationTaskData_createImageGenerationTaskBuilder b)
          updates]) = _$GCreateImageGenerationTaskData_createImageGenerationTask;

  static void _initializeBuilder(
          GCreateImageGenerationTaskData_createImageGenerationTaskBuilder b) =>
      b..G__typename = 'ImageGenerationTaskNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get prompt;
  String get negativePrompt;
  double get seed;
  int get steps;
  int get scale;
  String get sampler;
  int get clipSkip;
  _i2.GImageGenerationSizeType get sizeType;
  String? get t2tImageUrl;
  String? get t2tMaskImageUrl;
  String? get t2tDenoisingStrengthSize;
  String? get t2tInpaintingFillSize;
  int? get rating;
  int? get completedAt;
  _i2.GImageGenerationStatus get status;
  bool get isDeleted;
  bool? get isProtected;
  int get count;
  _i2.GImageGenerationType get generationType;
  GCreateImageGenerationTaskData_createImageGenerationTask_model get model;
  String? get vae;
  String? get token;
  String? get thumbnailToken;
  String? get nanoid;
  int? get estimatedSeconds;
  String? get controlNetControlMode;
  bool? get controlNetEnabled;
  int? get controlNetGuidanceEnd;
  int? get controlNetGuidanceStart;
  bool? get controlNetPixelPerfect;
  int? get controlNetProcessorRes;
  String? get controlNetResizeMode;
  int? get controlNetThresholdA;
  int? get controlNetThresholdB;
  double? get controlNetWeight;
  String? get controlNetModule;
  String? get controlNetModel;
  bool? get controlNetSaveDetectedMap;
  String? get controlNetHrOption;
  double? get upscaleSize;
  static Serializer<GCreateImageGenerationTaskData_createImageGenerationTask>
      get serializer =>
          _$gCreateImageGenerationTaskDataCreateImageGenerationTaskSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateImageGenerationTaskData_createImageGenerationTask.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateImageGenerationTaskData_createImageGenerationTask? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateImageGenerationTaskData_createImageGenerationTask.serializer,
        json,
      );
}

abstract class GCreateImageGenerationTaskData_createImageGenerationTask_model
    implements
        Built<GCreateImageGenerationTaskData_createImageGenerationTask_model,
            GCreateImageGenerationTaskData_createImageGenerationTask_modelBuilder> {
  GCreateImageGenerationTaskData_createImageGenerationTask_model._();

  factory GCreateImageGenerationTaskData_createImageGenerationTask_model(
          [void Function(
                  GCreateImageGenerationTaskData_createImageGenerationTask_modelBuilder
                      b)
              updates]) =
      _$GCreateImageGenerationTaskData_createImageGenerationTask_model;

  static void _initializeBuilder(
          GCreateImageGenerationTaskData_createImageGenerationTask_modelBuilder
              b) =>
      b..G__typename = 'ImageGeneratorNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String get type;
  static Serializer<
          GCreateImageGenerationTaskData_createImageGenerationTask_model>
      get serializer =>
          _$gCreateImageGenerationTaskDataCreateImageGenerationTaskModelSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateImageGenerationTaskData_createImageGenerationTask_model
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateImageGenerationTaskData_createImageGenerationTask_model?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GCreateImageGenerationTaskData_createImageGenerationTask_model
                .serializer,
            json,
          );
}
