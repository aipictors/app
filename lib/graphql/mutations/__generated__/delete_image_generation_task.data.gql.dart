// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_result_fields_fragment.data.gql.dart'
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
            GDeleteImageGenerationTaskData_deleteImageGenerationResultBuilder>,
        _i2.GImageGenerationResultFields {
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
  GDeleteImageGenerationTaskData_deleteImageGenerationResult_model get model;
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
  static Serializer<GDeleteImageGenerationTaskData_deleteImageGenerationResult>
      get serializer =>
          _$gDeleteImageGenerationTaskDataDeleteImageGenerationResultSerializer;

  @override
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

abstract class GDeleteImageGenerationTaskData_deleteImageGenerationResult_model
    implements
        Built<GDeleteImageGenerationTaskData_deleteImageGenerationResult_model,
            GDeleteImageGenerationTaskData_deleteImageGenerationResult_modelBuilder>,
        _i2.GImageGenerationResultFields_model {
  GDeleteImageGenerationTaskData_deleteImageGenerationResult_model._();

  factory GDeleteImageGenerationTaskData_deleteImageGenerationResult_model(
          [void Function(
                  GDeleteImageGenerationTaskData_deleteImageGenerationResult_modelBuilder
                      b)
              updates]) =
      _$GDeleteImageGenerationTaskData_deleteImageGenerationResult_model;

  static void _initializeBuilder(
          GDeleteImageGenerationTaskData_deleteImageGenerationResult_modelBuilder
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
          GDeleteImageGenerationTaskData_deleteImageGenerationResult_model>
      get serializer =>
          _$gDeleteImageGenerationTaskDataDeleteImageGenerationResultModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteImageGenerationTaskData_deleteImageGenerationResult_model
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteImageGenerationTaskData_deleteImageGenerationResult_model?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GDeleteImageGenerationTaskData_deleteImageGenerationResult_model
                .serializer,
            json,
          );
}
