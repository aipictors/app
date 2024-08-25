// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_generation_result_fields_fragment.data.gql.g.dart';

abstract class GImageGenerationResultFields {
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
  bool? get isProtected;
  _i1.GImageGenerationType get generationType;
  GImageGenerationResultFields_model get model;
  String? get vae;
  String? get nanoid;
  int? get estimatedSeconds;
  String? get controlNetControlMode;
  bool? get controlNetEnabled;
  double? get controlNetGuidanceEnd;
  double? get controlNetGuidanceStart;
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

abstract class GImageGenerationResultFields_model {
  String get G__typename;
  String get id;
  String get name;
  String get type;
  Map<String, dynamic> toJson();
}

abstract class GImageGenerationResultFieldsData
    implements
        Built<GImageGenerationResultFieldsData,
            GImageGenerationResultFieldsDataBuilder>,
        GImageGenerationResultFields {
  GImageGenerationResultFieldsData._();

  factory GImageGenerationResultFieldsData(
          [void Function(GImageGenerationResultFieldsDataBuilder b) updates]) =
      _$GImageGenerationResultFieldsData;

  static void _initializeBuilder(GImageGenerationResultFieldsDataBuilder b) =>
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
  bool? get isProtected;
  @override
  _i1.GImageGenerationType get generationType;
  @override
  GImageGenerationResultFieldsData_model get model;
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
  static Serializer<GImageGenerationResultFieldsData> get serializer =>
      _$gImageGenerationResultFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GImageGenerationResultFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationResultFieldsData? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GImageGenerationResultFieldsData.serializer,
        json,
      );
}

abstract class GImageGenerationResultFieldsData_model
    implements
        Built<GImageGenerationResultFieldsData_model,
            GImageGenerationResultFieldsData_modelBuilder>,
        GImageGenerationResultFields_model {
  GImageGenerationResultFieldsData_model._();

  factory GImageGenerationResultFieldsData_model(
      [void Function(GImageGenerationResultFieldsData_modelBuilder b)
          updates]) = _$GImageGenerationResultFieldsData_model;

  static void _initializeBuilder(
          GImageGenerationResultFieldsData_modelBuilder b) =>
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
  static Serializer<GImageGenerationResultFieldsData_model> get serializer =>
      _$gImageGenerationResultFieldsDataModelSerializer;

  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GImageGenerationResultFieldsData_model.serializer,
        this,
      ) as Map<String, dynamic>);

  static GImageGenerationResultFieldsData_model? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GImageGenerationResultFieldsData_model.serializer,
        json,
      );
}
