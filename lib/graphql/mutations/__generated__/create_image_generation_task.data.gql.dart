// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.data.gql.dart'
    as _i2;
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
            GCreateImageGenerationTaskData_createImageGenerationTaskBuilder>,
        _i2.GImageGenerationTaskFields {
  GCreateImageGenerationTaskData_createImageGenerationTask._();

  factory GCreateImageGenerationTaskData_createImageGenerationTask(
      [void Function(
              GCreateImageGenerationTaskData_createImageGenerationTaskBuilder b)
          updates]) = _$GCreateImageGenerationTaskData_createImageGenerationTask;

  static void _initializeBuilder(
          GCreateImageGenerationTaskData_createImageGenerationTaskBuilder b) =>
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
  GCreateImageGenerationTaskData_createImageGenerationTask_model get model;
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
  static Serializer<GCreateImageGenerationTaskData_createImageGenerationTask>
      get serializer =>
          _$gCreateImageGenerationTaskDataCreateImageGenerationTaskSerializer;

  @override
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
            GCreateImageGenerationTaskData_createImageGenerationTask_modelBuilder>,
        _i2.GImageGenerationTaskFields_model {
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
          GCreateImageGenerationTaskData_createImageGenerationTask_model>
      get serializer =>
          _$gCreateImageGenerationTaskDataCreateImageGenerationTaskModelSerializer;

  @override
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
