// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_generation_task_fields_fragment.data.gql.g.dart';

abstract class GImageGenerationTaskFields {
  String get G__typename;
  String get id;
  String get prompt;
  String get negativePrompt;
  double get seed;
  int get steps;
  int get scale;
  String get sampler;
  int get clipSkip;
  _i1.GImageGenerationSizeType get sizeType;
  String? get t2tImageUrl;
  String? get t2tMaskImageUrl;
  String? get t2tDenoisingStrengthSize;
  String? get t2tInpaintingFillSize;
  int? get rating;
  int? get completedAt;
  _i1.GImageGenerationStatus get status;
  bool get isDeleted;
  bool? get isProtected;
  int get count;
  _i1.GImageGenerationType get generationType;
  GImageGenerationTaskFields_model get model;
  String? get vae;
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
  String? get imageFileName;
  String? get thumbnailImageFileName;
  String? get token;
  String? get thumbnailToken;
  Map<String, dynamic> toJson();
}

abstract class GImageGenerationTaskFields_model {
  String get G__typename;
  String get id;
  String get name;
  String get type;
  Map<String, dynamic> toJson();
}

abstract class GImageGenerationTaskFieldsData
    implements
        Built<GImageGenerationTaskFieldsData,
            GImageGenerationTaskFieldsDataBuilder>,
        GImageGenerationTaskFields {
  GImageGenerationTaskFieldsData._();

  factory GImageGenerationTaskFieldsData(
          [void Function(GImageGenerationTaskFieldsDataBuilder b) updates]) =
      _$GImageGenerationTaskFieldsData;

  static void _initializeBuilder(GImageGenerationTaskFieldsDataBuilder b) =>
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
  _i1.GImageGenerationSizeType get sizeType;
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
  _i1.GImageGenerationStatus get status;
  @override
  bool get isDeleted;
  @override
  bool? get isProtected;
  @override
  int get count;
  @override
  _i1.GImageGenerationType get generationType;
  @override
  GImageGenerationTaskFieldsData_model get model;
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
  static Serializer<GImageGenerationTaskFieldsData> get serializer =>
      _$gImageGenerationTaskFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GImageGenerationTaskFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationTaskFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GImageGenerationTaskFieldsData.serializer,
        json,
      );
}

abstract class GImageGenerationTaskFieldsData_model
    implements
        Built<GImageGenerationTaskFieldsData_model,
            GImageGenerationTaskFieldsData_modelBuilder>,
        GImageGenerationTaskFields_model {
  GImageGenerationTaskFieldsData_model._();

  factory GImageGenerationTaskFieldsData_model(
      [void Function(GImageGenerationTaskFieldsData_modelBuilder b)
          updates]) = _$GImageGenerationTaskFieldsData_model;

  static void _initializeBuilder(
          GImageGenerationTaskFieldsData_modelBuilder b) =>
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
  static Serializer<GImageGenerationTaskFieldsData_model> get serializer =>
      _$gImageGenerationTaskFieldsDataModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GImageGenerationTaskFieldsData_model.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationTaskFieldsData_model? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GImageGenerationTaskFieldsData_model.serializer,
        json,
      );
}
