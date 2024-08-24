// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_image_generation_status.data.gql.g.dart';

abstract class GViewerImageGenerationStatusData
    implements
        Built<GViewerImageGenerationStatusData,
            GViewerImageGenerationStatusDataBuilder> {
  GViewerImageGenerationStatusData._();

  factory GViewerImageGenerationStatusData(
          [void Function(GViewerImageGenerationStatusDataBuilder b) updates]) =
      _$GViewerImageGenerationStatusData;

  static void _initializeBuilder(GViewerImageGenerationStatusDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerImageGenerationStatusData_imageGenerationEngineStatus
      get imageGenerationEngineStatus;
  GViewerImageGenerationStatusData_viewer? get viewer;
  static Serializer<GViewerImageGenerationStatusData> get serializer =>
      _$gViewerImageGenerationStatusDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationStatusData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationStatusData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationStatusData.serializer,
        json,
      );
}

abstract class GViewerImageGenerationStatusData_imageGenerationEngineStatus
    implements
        Built<GViewerImageGenerationStatusData_imageGenerationEngineStatus,
            GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder> {
  GViewerImageGenerationStatusData_imageGenerationEngineStatus._();

  factory GViewerImageGenerationStatusData_imageGenerationEngineStatus(
          [void Function(
                  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder
                      b)
              updates]) =
      _$GViewerImageGenerationStatusData_imageGenerationEngineStatus;

  static void _initializeBuilder(
          GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder
              b) =>
      b..G__typename = 'ImageGenerationEngineStatus';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get normalTasksCount;
  int get standardTasksCount;
  int get normalPredictionGenerationWait;
  int get standardPredictionGenerationWait;
  static Serializer<
          GViewerImageGenerationStatusData_imageGenerationEngineStatus>
      get serializer =>
          _$gViewerImageGenerationStatusDataImageGenerationEngineStatusSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationStatusData_imageGenerationEngineStatus.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationStatusData_imageGenerationEngineStatus? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationStatusData_imageGenerationEngineStatus.serializer,
        json,
      );
}

abstract class GViewerImageGenerationStatusData_viewer
    implements
        Built<GViewerImageGenerationStatusData_viewer,
            GViewerImageGenerationStatusData_viewerBuilder> {
  GViewerImageGenerationStatusData_viewer._();

  factory GViewerImageGenerationStatusData_viewer(
      [void Function(GViewerImageGenerationStatusData_viewerBuilder b)
          updates]) = _$GViewerImageGenerationStatusData_viewer;

  static void _initializeBuilder(
          GViewerImageGenerationStatusData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get remainingImageGenerationTasksCount;
  int get inProgressImageGenerationTasksCount;
  int get inProgressImageGenerationTasksCost;
  int get inProgressImageGenerationReservedTasksCount;
  int get remainingImageGenerationTasksTotalCount;
  int get availableImageGenerationMaxTasksCount;
  int get imageGenerationWaitCount;
  int get availableImageGenerationLoraModelsCount;
  int get availableConsecutiveImageGenerationsCount;
  static Serializer<GViewerImageGenerationStatusData_viewer> get serializer =>
      _$gViewerImageGenerationStatusDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerImageGenerationStatusData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerImageGenerationStatusData_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerImageGenerationStatusData_viewer.serializer,
        json,
      );
}
