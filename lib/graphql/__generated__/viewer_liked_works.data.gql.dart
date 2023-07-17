// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_liked_works.data.gql.g.dart';

abstract class GViewerLikedWorksData
    implements Built<GViewerLikedWorksData, GViewerLikedWorksDataBuilder> {
  GViewerLikedWorksData._();

  factory GViewerLikedWorksData(
          [Function(GViewerLikedWorksDataBuilder b) updates]) =
      _$GViewerLikedWorksData;

  static void _initializeBuilder(GViewerLikedWorksDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerLikedWorksData_viewer? get viewer;
  static Serializer<GViewerLikedWorksData> get serializer =>
      _$gViewerLikedWorksDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerLikedWorksData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerLikedWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerLikedWorksData.serializer,
        json,
      );
}

abstract class GViewerLikedWorksData_viewer
    implements
        Built<GViewerLikedWorksData_viewer,
            GViewerLikedWorksData_viewerBuilder> {
  GViewerLikedWorksData_viewer._();

  factory GViewerLikedWorksData_viewer(
          [Function(GViewerLikedWorksData_viewerBuilder b) updates]) =
      _$GViewerLikedWorksData_viewer;

  static void _initializeBuilder(GViewerLikedWorksData_viewerBuilder b) =>
      b..G__typename = 'Viewer';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerLikedWorksData_viewer_likedWorks> get likedWorks;
  static Serializer<GViewerLikedWorksData_viewer> get serializer =>
      _$gViewerLikedWorksDataViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerLikedWorksData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerLikedWorksData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerLikedWorksData_viewer.serializer,
        json,
      );
}

abstract class GViewerLikedWorksData_viewer_likedWorks
    implements
        Built<GViewerLikedWorksData_viewer_likedWorks,
            GViewerLikedWorksData_viewer_likedWorksBuilder>,
        _i2.GPartialWorkFields {
  GViewerLikedWorksData_viewer_likedWorks._();

  factory GViewerLikedWorksData_viewer_likedWorks(
      [Function(GViewerLikedWorksData_viewer_likedWorksBuilder b)
          updates]) = _$GViewerLikedWorksData_viewer_likedWorks;

  static void _initializeBuilder(
          GViewerLikedWorksData_viewer_likedWorksBuilder b) =>
      b..G__typename = 'WorkNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  int get createdAt;
  @override
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImage? get thumbnailImage;
  static Serializer<GViewerLikedWorksData_viewer_likedWorks> get serializer =>
      _$gViewerLikedWorksDataViewerLikedWorksSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerLikedWorksData_viewer_likedWorks.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerLikedWorksData_viewer_likedWorks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerLikedWorksData_viewer_likedWorks.serializer,
        json,
      );
}

abstract class GViewerLikedWorksData_viewer_likedWorks_thumbnailImage
    implements
        Built<GViewerLikedWorksData_viewer_likedWorks_thumbnailImage,
            GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImage._();

  factory GViewerLikedWorksData_viewer_likedWorks_thumbnailImage(
      [Function(GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder b)
          updates]) = _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage;

  static void _initializeBuilder(
          GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GViewerLikedWorksData_viewer_likedWorks_thumbnailImage>
      get serializer =>
          _$gViewerLikedWorksDataViewerLikedWorksThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerLikedWorksData_viewer_likedWorks_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerLikedWorksData_viewer_likedWorks_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerLikedWorksData_viewer_likedWorks_thumbnailImage.serializer,
        json,
      );
}
