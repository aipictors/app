// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.data.gql.dart'
    as _i2;
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
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask
      get updateRatingImageGenerationTask;
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

abstract class GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask
    implements
        Built<
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask,
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTaskBuilder>,
        _i2.GImageGenerationTaskFields {
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask._();

  factory GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask(
          [void Function(
                  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTaskBuilder
                      b)
              updates]) =
      _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask;

  static void _initializeBuilder(
          GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTaskBuilder
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
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model
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
          GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask>
      get serializer =>
          _$gUpdateRatingImageGenerationTaskDataUpdateRatingImageGenerationTaskSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask
                .serializer,
            json,
          );
}

abstract class GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model
    implements
        Built<
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model,
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_modelBuilder>,
        _i2.GImageGenerationTaskFields_model {
  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model._();

  factory GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model(
          [void Function(
                  GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_modelBuilder
                      b)
              updates]) =
      _$GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model;

  static void _initializeBuilder(
          GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_modelBuilder
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
          GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model>
      get serializer =>
          _$gUpdateRatingImageGenerationTaskDataUpdateRatingImageGenerationTaskModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateRatingImageGenerationTaskData_updateRatingImageGenerationTask_model
                .serializer,
            json,
          );
}
