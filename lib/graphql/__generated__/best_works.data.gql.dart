// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'best_works.data.gql.g.dart';

abstract class GBestWorksData
    implements Built<GBestWorksData, GBestWorksDataBuilder> {
  GBestWorksData._();

  factory GBestWorksData([void Function(GBestWorksDataBuilder b) updates]) =
      _$GBestWorksData;

  static void _initializeBuilder(GBestWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GBestWorksData_bestWorks> get bestWorks;
  static Serializer<GBestWorksData> get serializer =>
      _$gBestWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBestWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBestWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBestWorksData.serializer,
        json,
      );
}

abstract class GBestWorksData_bestWorks
    implements
        Built<GBestWorksData_bestWorks, GBestWorksData_bestWorksBuilder>,
        _i2.GPartialWorkFields {
  GBestWorksData_bestWorks._();

  factory GBestWorksData_bestWorks(
          [void Function(GBestWorksData_bestWorksBuilder b) updates]) =
      _$GBestWorksData_bestWorks;

  static void _initializeBuilder(GBestWorksData_bestWorksBuilder b) =>
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
  GBestWorksData_bestWorks_thumbnailImage? get thumbnailImage;
  static Serializer<GBestWorksData_bestWorks> get serializer =>
      _$gBestWorksDataBestWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBestWorksData_bestWorks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBestWorksData_bestWorks? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBestWorksData_bestWorks.serializer,
        json,
      );
}

abstract class GBestWorksData_bestWorks_thumbnailImage
    implements
        Built<GBestWorksData_bestWorks_thumbnailImage,
            GBestWorksData_bestWorks_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GBestWorksData_bestWorks_thumbnailImage._();

  factory GBestWorksData_bestWorks_thumbnailImage(
      [void Function(GBestWorksData_bestWorks_thumbnailImageBuilder b)
          updates]) = _$GBestWorksData_bestWorks_thumbnailImage;

  static void _initializeBuilder(
          GBestWorksData_bestWorks_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GBestWorksData_bestWorks_thumbnailImage> get serializer =>
      _$gBestWorksDataBestWorksThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBestWorksData_bestWorks_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBestWorksData_bestWorks_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBestWorksData_bestWorks_thumbnailImage.serializer,
        json,
      );
}
