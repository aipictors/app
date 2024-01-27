// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_tag_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i3;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hot_tags.data.gql.g.dart';

abstract class GHotTagsData
    implements Built<GHotTagsData, GHotTagsDataBuilder> {
  GHotTagsData._();

  factory GHotTagsData([Function(GHotTagsDataBuilder b) updates]) =
      _$GHotTagsData;

  static void _initializeBuilder(GHotTagsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GHotTagsData_hotTags> get hotTags;
  static Serializer<GHotTagsData> get serializer => _$gHotTagsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotTagsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotTagsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotTagsData.serializer,
        json,
      );
}

abstract class GHotTagsData_hotTags
    implements
        Built<GHotTagsData_hotTags, GHotTagsData_hotTagsBuilder>,
        _i2.GPartialTagFields {
  GHotTagsData_hotTags._();

  factory GHotTagsData_hotTags(
          [Function(GHotTagsData_hotTagsBuilder b) updates]) =
      _$GHotTagsData_hotTags;

  static void _initializeBuilder(GHotTagsData_hotTagsBuilder b) =>
      b..G__typename = 'TagNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  GHotTagsData_hotTags_firstWork? get firstWork;
  static Serializer<GHotTagsData_hotTags> get serializer =>
      _$gHotTagsDataHotTagsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotTagsData_hotTags.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotTagsData_hotTags? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotTagsData_hotTags.serializer,
        json,
      );
}

abstract class GHotTagsData_hotTags_firstWork
    implements
        Built<GHotTagsData_hotTags_firstWork,
            GHotTagsData_hotTags_firstWorkBuilder>,
        _i3.GPartialWorkFields {
  GHotTagsData_hotTags_firstWork._();

  factory GHotTagsData_hotTags_firstWork(
          [Function(GHotTagsData_hotTags_firstWorkBuilder b) updates]) =
      _$GHotTagsData_hotTags_firstWork;

  static void _initializeBuilder(GHotTagsData_hotTags_firstWorkBuilder b) =>
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
  GHotTagsData_hotTags_firstWork_thumbnailImage? get thumbnailImage;
  static Serializer<GHotTagsData_hotTags_firstWork> get serializer =>
      _$gHotTagsDataHotTagsFirstWorkSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotTagsData_hotTags_firstWork.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotTagsData_hotTags_firstWork? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotTagsData_hotTags_firstWork.serializer,
        json,
      );
}

abstract class GHotTagsData_hotTags_firstWork_thumbnailImage
    implements
        Built<GHotTagsData_hotTags_firstWork_thumbnailImage,
            GHotTagsData_hotTags_firstWork_thumbnailImageBuilder>,
        _i3.GPartialWorkFields_thumbnailImage {
  GHotTagsData_hotTags_firstWork_thumbnailImage._();

  factory GHotTagsData_hotTags_firstWork_thumbnailImage(
      [Function(GHotTagsData_hotTags_firstWork_thumbnailImageBuilder b)
          updates]) = _$GHotTagsData_hotTags_firstWork_thumbnailImage;

  static void _initializeBuilder(
          GHotTagsData_hotTags_firstWork_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GHotTagsData_hotTags_firstWork_thumbnailImage>
      get serializer => _$gHotTagsDataHotTagsFirstWorkThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotTagsData_hotTags_firstWork_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotTagsData_hotTags_firstWork_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotTagsData_hotTags_firstWork_thumbnailImage.serializer,
        json,
      );
}
