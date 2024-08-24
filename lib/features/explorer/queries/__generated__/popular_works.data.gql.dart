// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'popular_works.data.gql.g.dart';

abstract class GPopularWorksData
    implements Built<GPopularWorksData, GPopularWorksDataBuilder> {
  GPopularWorksData._();

  factory GPopularWorksData(
          [void Function(GPopularWorksDataBuilder b) updates]) =
      _$GPopularWorksData;

  static void _initializeBuilder(GPopularWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPopularWorksData_popularWorks> get popularWorks;
  static Serializer<GPopularWorksData> get serializer =>
      _$gPopularWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPopularWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPopularWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPopularWorksData.serializer,
        json,
      );
}

abstract class GPopularWorksData_popularWorks
    implements
        Built<GPopularWorksData_popularWorks,
            GPopularWorksData_popularWorksBuilder>,
        _i2.GPartialWorkFields {
  GPopularWorksData_popularWorks._();

  factory GPopularWorksData_popularWorks(
          [void Function(GPopularWorksData_popularWorksBuilder b) updates]) =
      _$GPopularWorksData_popularWorks;

  static void _initializeBuilder(GPopularWorksData_popularWorksBuilder b) =>
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
  String get imageURL;
  @override
  int get imageWidth;
  @override
  int get imageHeight;
  @override
  String get largeThumbnailImageURL;
  @override
  int get largeThumbnailImageWidth;
  @override
  int get largeThumbnailImageHeight;
  @override
  String get smallThumbnailImageURL;
  @override
  int get smallThumbnailImageWidth;
  @override
  int get smallThumbnailImageHeight;
  @override
  double? get thumbnailImagePosition;
  @override
  double get imageAspectRatio;
  static Serializer<GPopularWorksData_popularWorks> get serializer =>
      _$gPopularWorksDataPopularWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPopularWorksData_popularWorks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPopularWorksData_popularWorks? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPopularWorksData_popularWorks.serializer,
        json,
      );
}
