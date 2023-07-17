// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_bookmarked_works.data.gql.g.dart';

abstract class GViewerBookmarkedWorksData
    implements
        Built<GViewerBookmarkedWorksData, GViewerBookmarkedWorksDataBuilder> {
  GViewerBookmarkedWorksData._();

  factory GViewerBookmarkedWorksData(
          [Function(GViewerBookmarkedWorksDataBuilder b) updates]) =
      _$GViewerBookmarkedWorksData;

  static void _initializeBuilder(GViewerBookmarkedWorksDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerBookmarkedWorksData_viewer? get viewer;
  static Serializer<GViewerBookmarkedWorksData> get serializer =>
      _$gViewerBookmarkedWorksDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerBookmarkedWorksData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerBookmarkedWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerBookmarkedWorksData.serializer,
        json,
      );
}

abstract class GViewerBookmarkedWorksData_viewer
    implements
        Built<GViewerBookmarkedWorksData_viewer,
            GViewerBookmarkedWorksData_viewerBuilder> {
  GViewerBookmarkedWorksData_viewer._();

  factory GViewerBookmarkedWorksData_viewer(
          [Function(GViewerBookmarkedWorksData_viewerBuilder b) updates]) =
      _$GViewerBookmarkedWorksData_viewer;

  static void _initializeBuilder(GViewerBookmarkedWorksData_viewerBuilder b) =>
      b..G__typename = 'Viewer';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>
      get bookmarkedWorks;
  static Serializer<GViewerBookmarkedWorksData_viewer> get serializer =>
      _$gViewerBookmarkedWorksDataViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerBookmarkedWorksData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerBookmarkedWorksData_viewer? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerBookmarkedWorksData_viewer.serializer,
        json,
      );
}

abstract class GViewerBookmarkedWorksData_viewer_bookmarkedWorks
    implements
        Built<GViewerBookmarkedWorksData_viewer_bookmarkedWorks,
            GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder>,
        _i2.GPartialWorkFields {
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks._();

  factory GViewerBookmarkedWorksData_viewer_bookmarkedWorks(
      [Function(GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder b)
          updates]) = _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks;

  static void _initializeBuilder(
          GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder b) =>
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
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage?
      get thumbnailImage;
  static Serializer<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>
      get serializer =>
          _$gViewerBookmarkedWorksDataViewerBookmarkedWorksSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerBookmarkedWorksData_viewer_bookmarkedWorks.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerBookmarkedWorksData_viewer_bookmarkedWorks? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerBookmarkedWorksData_viewer_bookmarkedWorks.serializer,
        json,
      );
}

abstract class GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage
    implements
        Built<GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage,
            GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage._();

  factory GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage(
          [Function(
                  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder
                      b)
              updates]) =
      _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage;

  static void _initializeBuilder(
          GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder
              b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<
          GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage>
      get serializer =>
          _$gViewerBookmarkedWorksDataViewerBookmarkedWorksThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage
            .serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage
                .serializer,
            json,
          );
}
