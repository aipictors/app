// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_image_generation_task.data.gql.g.dart';

abstract class GViewerImageGenerationTaskData
    implements
        Built<GViewerImageGenerationTaskData,
            GViewerImageGenerationTaskDataBuilder> {
  GViewerImageGenerationTaskData._();

  factory GViewerImageGenerationTaskData(
          [void Function(GViewerImageGenerationTaskDataBuilder b) updates]) =
      _$GViewerImageGenerationTaskData;

  static void _initializeBuilder(GViewerImageGenerationTaskDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerImageGenerationTaskData_imageGenerationTask get imageGenerationTask;
  static Serializer<GViewerImageGenerationTaskData> get serializer =>
      _$gViewerImageGenerationTaskDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTaskData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTaskData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationTaskData.serializer,
        json,
      );
}

abstract class GViewerImageGenerationTaskData_imageGenerationTask
    implements
        Built<GViewerImageGenerationTaskData_imageGenerationTask,
            GViewerImageGenerationTaskData_imageGenerationTaskBuilder>,
        _i2.GImageGenerationTaskFields {
  GViewerImageGenerationTaskData_imageGenerationTask._();

  factory GViewerImageGenerationTaskData_imageGenerationTask(
      [void Function(
              GViewerImageGenerationTaskData_imageGenerationTaskBuilder b)
          updates]) = _$GViewerImageGenerationTaskData_imageGenerationTask;

  static void _initializeBuilder(
          GViewerImageGenerationTaskData_imageGenerationTaskBuilder b) =>
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
  GViewerImageGenerationTaskData_imageGenerationTask_model get model;
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
  int? get controlNetGuidanceEnd;
  @override
  int? get controlNetGuidanceStart;
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
  static Serializer<GViewerImageGenerationTaskData_imageGenerationTask>
      get serializer =>
          _$gViewerImageGenerationTaskDataImageGenerationTaskSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTaskData_imageGenerationTask.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTaskData_imageGenerationTask? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationTaskData_imageGenerationTask.serializer,
        json,
      );
}

abstract class GViewerImageGenerationTaskData_imageGenerationTask_model
    implements
        Built<GViewerImageGenerationTaskData_imageGenerationTask_model,
            GViewerImageGenerationTaskData_imageGenerationTask_modelBuilder>,
        _i2.GImageGenerationTaskFields_model {
  GViewerImageGenerationTaskData_imageGenerationTask_model._();

  factory GViewerImageGenerationTaskData_imageGenerationTask_model(
      [void Function(
              GViewerImageGenerationTaskData_imageGenerationTask_modelBuilder b)
          updates]) = _$GViewerImageGenerationTaskData_imageGenerationTask_model;

  static void _initializeBuilder(
          GViewerImageGenerationTaskData_imageGenerationTask_modelBuilder b) =>
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
  static Serializer<GViewerImageGenerationTaskData_imageGenerationTask_model>
      get serializer =>
          _$gViewerImageGenerationTaskDataImageGenerationTaskModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTaskData_imageGenerationTask_model.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTaskData_imageGenerationTask_model? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationTaskData_imageGenerationTask_model.serializer,
        json,
      );
}
