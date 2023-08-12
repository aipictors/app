// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i3;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_album_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_albums.data.gql.g.dart';

abstract class GViewerAlbumsData
    implements Built<GViewerAlbumsData, GViewerAlbumsDataBuilder> {
  GViewerAlbumsData._();

  factory GViewerAlbumsData([Function(GViewerAlbumsDataBuilder b) updates]) =
      _$GViewerAlbumsData;

  static void _initializeBuilder(GViewerAlbumsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerAlbumsData_viewer? get viewer;
  static Serializer<GViewerAlbumsData> get serializer =>
      _$gViewerAlbumsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerAlbumsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerAlbumsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerAlbumsData.serializer,
        json,
      );
}

abstract class GViewerAlbumsData_viewer
    implements
        Built<GViewerAlbumsData_viewer, GViewerAlbumsData_viewerBuilder> {
  GViewerAlbumsData_viewer._();

  factory GViewerAlbumsData_viewer(
          [Function(GViewerAlbumsData_viewerBuilder b) updates]) =
      _$GViewerAlbumsData_viewer;

  static void _initializeBuilder(GViewerAlbumsData_viewerBuilder b) =>
      b..G__typename = 'Viewer';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerAlbumsData_viewer_albums> get albums;
  static Serializer<GViewerAlbumsData_viewer> get serializer =>
      _$gViewerAlbumsDataViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerAlbumsData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerAlbumsData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerAlbumsData_viewer.serializer,
        json,
      );
}

abstract class GViewerAlbumsData_viewer_albums
    implements
        Built<GViewerAlbumsData_viewer_albums,
            GViewerAlbumsData_viewer_albumsBuilder>,
        _i2.GPartialAlbumFields {
  GViewerAlbumsData_viewer_albums._();

  factory GViewerAlbumsData_viewer_albums(
          [Function(GViewerAlbumsData_viewer_albumsBuilder b) updates]) =
      _$GViewerAlbumsData_viewer_albums;

  static void _initializeBuilder(GViewerAlbumsData_viewer_albumsBuilder b) =>
      b..G__typename = 'AlbumNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  _i3.GRating get rating;
  @override
  int get likesCount;
  @override
  int get viewsCount;
  @override
  GViewerAlbumsData_viewer_albums_thumbnailImage? get thumbnailImage;
  static Serializer<GViewerAlbumsData_viewer_albums> get serializer =>
      _$gViewerAlbumsDataViewerAlbumsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerAlbumsData_viewer_albums.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerAlbumsData_viewer_albums? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerAlbumsData_viewer_albums.serializer,
        json,
      );
}

abstract class GViewerAlbumsData_viewer_albums_thumbnailImage
    implements
        Built<GViewerAlbumsData_viewer_albums_thumbnailImage,
            GViewerAlbumsData_viewer_albums_thumbnailImageBuilder>,
        _i2.GPartialAlbumFields_thumbnailImage {
  GViewerAlbumsData_viewer_albums_thumbnailImage._();

  factory GViewerAlbumsData_viewer_albums_thumbnailImage(
      [Function(GViewerAlbumsData_viewer_albums_thumbnailImageBuilder b)
          updates]) = _$GViewerAlbumsData_viewer_albums_thumbnailImage;

  static void _initializeBuilder(
          GViewerAlbumsData_viewer_albums_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GViewerAlbumsData_viewer_albums_thumbnailImage>
      get serializer => _$gViewerAlbumsDataViewerAlbumsThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerAlbumsData_viewer_albums_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerAlbumsData_viewer_albums_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerAlbumsData_viewer_albums_thumbnailImage.serializer,
        json,
      );
}
