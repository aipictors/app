// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'works.data.gql.g.dart';

abstract class GWorksData implements Built<GWorksData, GWorksDataBuilder> {
  GWorksData._();

  factory GWorksData([Function(GWorksDataBuilder b) updates]) = _$GWorksData;

  static void _initializeBuilder(GWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GWorksData_works> get works;
  static Serializer<GWorksData> get serializer => _$gWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorksData.serializer,
        json,
      );
}

abstract class GWorksData_works
    implements
        Built<GWorksData_works, GWorksData_worksBuilder>,
        _i2.GPartialWorkFields {
  GWorksData_works._();

  factory GWorksData_works([Function(GWorksData_worksBuilder b) updates]) =
      _$GWorksData_works;

  static void _initializeBuilder(GWorksData_worksBuilder b) =>
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
  GWorksData_works_thumbnailImage? get thumbnailImage;
  static Serializer<GWorksData_works> get serializer =>
      _$gWorksDataWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorksData_works.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorksData_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorksData_works.serializer,
        json,
      );
}

abstract class GWorksData_works_thumbnailImage
    implements
        Built<GWorksData_works_thumbnailImage,
            GWorksData_works_thumbnailImageBuilder>,
        _i2.GPartialWorkFields_thumbnailImage {
  GWorksData_works_thumbnailImage._();

  factory GWorksData_works_thumbnailImage(
          [Function(GWorksData_works_thumbnailImageBuilder b) updates]) =
      _$GWorksData_works_thumbnailImage;

  static void _initializeBuilder(GWorksData_works_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GWorksData_works_thumbnailImage> get serializer =>
      _$gWorksDataWorksThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorksData_works_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorksData_works_thumbnailImage? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorksData_works_thumbnailImage.serializer,
        json,
      );
}
