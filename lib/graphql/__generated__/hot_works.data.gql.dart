// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hot_works.data.gql.g.dart';

abstract class GHotWorksData
    implements Built<GHotWorksData, GHotWorksDataBuilder> {
  GHotWorksData._();

  factory GHotWorksData([void Function(GHotWorksDataBuilder b) updates]) =
      _$GHotWorksData;

  static void _initializeBuilder(GHotWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GHotWorksData_hotWorks> get hotWorks;
  static Serializer<GHotWorksData> get serializer => _$gHotWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotWorksData.serializer,
        json,
      );
}

abstract class GHotWorksData_hotWorks
    implements
        Built<GHotWorksData_hotWorks, GHotWorksData_hotWorksBuilder>,
        _i2.GPartialWorkFields {
  GHotWorksData_hotWorks._();

  factory GHotWorksData_hotWorks(
          [void Function(GHotWorksData_hotWorksBuilder b) updates]) =
      _$GHotWorksData_hotWorks;

  static void _initializeBuilder(GHotWorksData_hotWorksBuilder b) =>
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
  GHotWorksData_hotWorks_thumbnailImage? get thumbnailImage;
  static Serializer<GHotWorksData_hotWorks> get serializer =>
      _$gHotWorksDataHotWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotWorksData_hotWorks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotWorksData_hotWorks? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotWorksData_hotWorks.serializer,
        json,
      );
}

abstract class GHotWorksData_hotWorks_thumbnailImage
    implements
        Built<GHotWorksData_hotWorks_thumbnailImage,
            GHotWorksData_hotWorks_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GHotWorksData_hotWorks_thumbnailImage._();

  factory GHotWorksData_hotWorks_thumbnailImage(
      [void Function(GHotWorksData_hotWorks_thumbnailImageBuilder b)
          updates]) = _$GHotWorksData_hotWorks_thumbnailImage;

  static void _initializeBuilder(
          GHotWorksData_hotWorks_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GHotWorksData_hotWorks_thumbnailImage> get serializer =>
      _$gHotWorksDataHotWorksThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHotWorksData_hotWorks_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotWorksData_hotWorks_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHotWorksData_hotWorks_thumbnailImage.serializer,
        json,
      );
}
