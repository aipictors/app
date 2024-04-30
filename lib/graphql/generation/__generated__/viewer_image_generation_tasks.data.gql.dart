// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_image_generation_tasks.data.gql.g.dart';

abstract class GViewerImageGenerationTasksData
    implements
        Built<GViewerImageGenerationTasksData,
            GViewerImageGenerationTasksDataBuilder> {
  GViewerImageGenerationTasksData._();

  factory GViewerImageGenerationTasksData(
          [void Function(GViewerImageGenerationTasksDataBuilder b) updates]) =
      _$GViewerImageGenerationTasksData;

  static void _initializeBuilder(GViewerImageGenerationTasksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerImageGenerationTasksData_viewer? get viewer;
  static Serializer<GViewerImageGenerationTasksData> get serializer =>
      _$gViewerImageGenerationTasksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTasksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTasksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationTasksData.serializer,
        json,
      );
}

abstract class GViewerImageGenerationTasksData_viewer
    implements
        Built<GViewerImageGenerationTasksData_viewer,
            GViewerImageGenerationTasksData_viewerBuilder> {
  GViewerImageGenerationTasksData_viewer._();

  factory GViewerImageGenerationTasksData_viewer(
      [void Function(GViewerImageGenerationTasksData_viewerBuilder b)
          updates]) = _$GViewerImageGenerationTasksData_viewer;

  static void _initializeBuilder(
          GViewerImageGenerationTasksData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerImageGenerationTasksData_viewer_imageGenerationTasks>
      get imageGenerationTasks;
  static Serializer<GViewerImageGenerationTasksData_viewer> get serializer =>
      _$gViewerImageGenerationTasksDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTasksData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTasksData_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationTasksData_viewer.serializer,
        json,
      );
}

abstract class GViewerImageGenerationTasksData_viewer_imageGenerationTasks
    implements
        Built<GViewerImageGenerationTasksData_viewer_imageGenerationTasks,
            GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder> {
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks._();

  factory GViewerImageGenerationTasksData_viewer_imageGenerationTasks(
      [void Function(
              GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder
                  b)
          updates]) = _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks;

  static void _initializeBuilder(
          GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder
              b) =>
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
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model get model;
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
  String? get imageFileName;
  String? get thumbnailImageFileName;
  static Serializer<GViewerImageGenerationTasksData_viewer_imageGenerationTasks>
      get serializer =>
          _$gViewerImageGenerationTasksDataViewerImageGenerationTasksSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTasksData_viewer_imageGenerationTasks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTasksData_viewer_imageGenerationTasks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationTasksData_viewer_imageGenerationTasks.serializer,
        json,
      );
}

abstract class GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model
    implements
        Built<GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model,
            GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder> {
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model._();

  factory GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model(
          [void Function(
                  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder
                      b)
              updates]) =
      _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model;

  static void _initializeBuilder(
          GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder
              b) =>
      b..G__typename = 'ImageGeneratorNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String get type;
  static Serializer<
          GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model>
      get serializer =>
          _$gViewerImageGenerationTasksDataViewerImageGenerationTasksModelSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model
                .serializer,
            json,
          );
}
