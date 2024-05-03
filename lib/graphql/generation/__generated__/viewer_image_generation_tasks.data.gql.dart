// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/image_generation_task_fields_fragment.data.gql.dart'
    as _i2;
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
            GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder>,
        _i2.GImageGenerationTaskFields {
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
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model get model;
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
  static Serializer<GViewerImageGenerationTasksData_viewer_imageGenerationTasks>
      get serializer =>
          _$gViewerImageGenerationTasksDataViewerImageGenerationTasksSerializer;

  @override
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
            GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder>,
        _i2.GImageGenerationTaskFields_model {
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
          GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model>
      get serializer =>
          _$gViewerImageGenerationTasksDataViewerImageGenerationTasksModelSerializer;

  @override
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
