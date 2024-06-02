// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.data.gql.dart'
    as _i2;
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
  GDeleteImageGenerationTaskData_deleteImageGenerationTask
      get deleteImageGenerationTask;
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

abstract class GDeleteImageGenerationTaskData_deleteImageGenerationTask
    implements
        Built<GDeleteImageGenerationTaskData_deleteImageGenerationTask,
            GDeleteImageGenerationTaskData_deleteImageGenerationTaskBuilder>,
        _i2.GImageGenerationTaskFields {
  GDeleteImageGenerationTaskData_deleteImageGenerationTask._();

  factory GDeleteImageGenerationTaskData_deleteImageGenerationTask(
      [void Function(
              GDeleteImageGenerationTaskData_deleteImageGenerationTaskBuilder b)
          updates]) = _$GDeleteImageGenerationTaskData_deleteImageGenerationTask;

  static void _initializeBuilder(
          GDeleteImageGenerationTaskData_deleteImageGenerationTaskBuilder b) =>
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
  GDeleteImageGenerationTaskData_deleteImageGenerationTask_model get model;
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
  static Serializer<GDeleteImageGenerationTaskData_deleteImageGenerationTask>
      get serializer =>
          _$gDeleteImageGenerationTaskDataDeleteImageGenerationTaskSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteImageGenerationTaskData_deleteImageGenerationTask.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationTaskData_deleteImageGenerationTask? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteImageGenerationTaskData_deleteImageGenerationTask.serializer,
        json,
      );
}

abstract class GDeleteImageGenerationTaskData_deleteImageGenerationTask_model
    implements
        Built<GDeleteImageGenerationTaskData_deleteImageGenerationTask_model,
            GDeleteImageGenerationTaskData_deleteImageGenerationTask_modelBuilder>,
        _i2.GImageGenerationTaskFields_model {
  GDeleteImageGenerationTaskData_deleteImageGenerationTask_model._();

  factory GDeleteImageGenerationTaskData_deleteImageGenerationTask_model(
          [void Function(
                  GDeleteImageGenerationTaskData_deleteImageGenerationTask_modelBuilder
                      b)
              updates]) =
      _$GDeleteImageGenerationTaskData_deleteImageGenerationTask_model;

  static void _initializeBuilder(
          GDeleteImageGenerationTaskData_deleteImageGenerationTask_modelBuilder
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
          GDeleteImageGenerationTaskData_deleteImageGenerationTask_model>
      get serializer =>
          _$gDeleteImageGenerationTaskDataDeleteImageGenerationTaskModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteImageGenerationTaskData_deleteImageGenerationTask_model
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationTaskData_deleteImageGenerationTask_model?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GDeleteImageGenerationTaskData_deleteImageGenerationTask_model
                .serializer,
            json,
          );
}
