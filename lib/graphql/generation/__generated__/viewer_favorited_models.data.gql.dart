// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i2;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_favorited_models.data.gql.g.dart';

abstract class GViewerFavoritedImageGenerationModelsData
    implements
        Built<GViewerFavoritedImageGenerationModelsData,
            GViewerFavoritedImageGenerationModelsDataBuilder> {
  GViewerFavoritedImageGenerationModelsData._();

  factory GViewerFavoritedImageGenerationModelsData(
      [void Function(GViewerFavoritedImageGenerationModelsDataBuilder b)
          updates]) = _$GViewerFavoritedImageGenerationModelsData;

  static void _initializeBuilder(
          GViewerFavoritedImageGenerationModelsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerFavoritedImageGenerationModelsData_viewer? get viewer;
  static Serializer<GViewerFavoritedImageGenerationModelsData> get serializer =>
      _$gViewerFavoritedImageGenerationModelsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFavoritedImageGenerationModelsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFavoritedImageGenerationModelsData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFavoritedImageGenerationModelsData.serializer,
        json,
      );
}

abstract class GViewerFavoritedImageGenerationModelsData_viewer
    implements
        Built<GViewerFavoritedImageGenerationModelsData_viewer,
            GViewerFavoritedImageGenerationModelsData_viewerBuilder> {
  GViewerFavoritedImageGenerationModelsData_viewer._();

  factory GViewerFavoritedImageGenerationModelsData_viewer(
      [void Function(GViewerFavoritedImageGenerationModelsData_viewerBuilder b)
          updates]) = _$GViewerFavoritedImageGenerationModelsData_viewer;

  static void _initializeBuilder(
          GViewerFavoritedImageGenerationModelsData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<
          GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>
      get favoritedImageGenerationModels;
  static Serializer<GViewerFavoritedImageGenerationModelsData_viewer>
      get serializer =>
          _$gViewerFavoritedImageGenerationModelsDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFavoritedImageGenerationModelsData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFavoritedImageGenerationModelsData_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerFavoritedImageGenerationModelsData_viewer.serializer,
        json,
      );
}

abstract class GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
    implements
        Built<
            GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels,
            GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder> {
  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels._();

  factory GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels(
          [void Function(
                  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder
                      b)
              updates]) =
      _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels;

  static void _initializeBuilder(
          GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder
              b) =>
      b..G__typename = 'ImageModelNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String get displayName;
  _i2.GImageModelCategory get category;
  String? get thumbnailImageURL;
  String get type;
  static Serializer<
          GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>
      get serializer =>
          _$gViewerFavoritedImageGenerationModelsDataViewerFavoritedImageGenerationModelsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
                .serializer,
            json,
          );
}
