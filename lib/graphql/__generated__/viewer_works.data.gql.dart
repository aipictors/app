// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'viewer_works.data.gql.g.dart';

abstract class GViewerWorksData
    implements Built<GViewerWorksData, GViewerWorksDataBuilder> {
  GViewerWorksData._();

  factory GViewerWorksData([void Function(GViewerWorksDataBuilder b) updates]) =
      _$GViewerWorksData;

  static void _initializeBuilder(GViewerWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerWorksData_viewer? get viewer;
  static Serializer<GViewerWorksData> get serializer =>
      _$gViewerWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerWorksData.serializer,
        json,
      );
}

abstract class GViewerWorksData_viewer
    implements Built<GViewerWorksData_viewer, GViewerWorksData_viewerBuilder> {
  GViewerWorksData_viewer._();

  factory GViewerWorksData_viewer(
          [void Function(GViewerWorksData_viewerBuilder b) updates]) =
      _$GViewerWorksData_viewer;

  static void _initializeBuilder(GViewerWorksData_viewerBuilder b) =>
      b..G__typename = 'Viewer';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GViewerWorksData_viewer_works> get works;
  static Serializer<GViewerWorksData_viewer> get serializer =>
      _$gViewerWorksDataViewerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerWorksData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerWorksData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerWorksData_viewer.serializer,
        json,
      );
}

abstract class GViewerWorksData_viewer_works
    implements
        Built<GViewerWorksData_viewer_works,
            GViewerWorksData_viewer_worksBuilder>,
        _i2.GPartialWorkFields {
  GViewerWorksData_viewer_works._();

  factory GViewerWorksData_viewer_works(
          [void Function(GViewerWorksData_viewer_worksBuilder b) updates]) =
      _$GViewerWorksData_viewer_works;

  static void _initializeBuilder(GViewerWorksData_viewer_worksBuilder b) =>
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
  GViewerWorksData_viewer_works_thumbnailImage? get thumbnailImage;
  static Serializer<GViewerWorksData_viewer_works> get serializer =>
      _$gViewerWorksDataViewerWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerWorksData_viewer_works.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerWorksData_viewer_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerWorksData_viewer_works.serializer,
        json,
      );
}

abstract class GViewerWorksData_viewer_works_thumbnailImage
    implements
        Built<GViewerWorksData_viewer_works_thumbnailImage,
            GViewerWorksData_viewer_works_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GViewerWorksData_viewer_works_thumbnailImage._();

  factory GViewerWorksData_viewer_works_thumbnailImage(
      [void Function(GViewerWorksData_viewer_works_thumbnailImageBuilder b)
          updates]) = _$GViewerWorksData_viewer_works_thumbnailImage;

  static void _initializeBuilder(
          GViewerWorksData_viewer_works_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GViewerWorksData_viewer_works_thumbnailImage>
      get serializer => _$gViewerWorksDataViewerWorksThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerWorksData_viewer_works_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerWorksData_viewer_works_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerWorksData_viewer_works_thumbnailImage.serializer,
        json,
      );
}
