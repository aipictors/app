// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag_works.data.gql.g.dart';

abstract class GTagWorksData
    implements Built<GTagWorksData, GTagWorksDataBuilder> {
  GTagWorksData._();

  factory GTagWorksData([void Function(GTagWorksDataBuilder b) updates]) =
      _$GTagWorksData;

  static void _initializeBuilder(GTagWorksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTagWorksData_tag? get tag;
  static Serializer<GTagWorksData> get serializer => _$gTagWorksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagWorksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagWorksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagWorksData.serializer,
        json,
      );
}

abstract class GTagWorksData_tag
    implements Built<GTagWorksData_tag, GTagWorksData_tagBuilder> {
  GTagWorksData_tag._();

  factory GTagWorksData_tag(
          [void Function(GTagWorksData_tagBuilder b) updates]) =
      _$GTagWorksData_tag;

  static void _initializeBuilder(GTagWorksData_tagBuilder b) =>
      b..G__typename = 'TagNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GTagWorksData_tag_works> get works;
  static Serializer<GTagWorksData_tag> get serializer =>
      _$gTagWorksDataTagSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagWorksData_tag.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagWorksData_tag? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagWorksData_tag.serializer,
        json,
      );
}

abstract class GTagWorksData_tag_works
    implements
        Built<GTagWorksData_tag_works, GTagWorksData_tag_worksBuilder>,
        _i2.GPartialWorkFields {
  GTagWorksData_tag_works._();

  factory GTagWorksData_tag_works(
          [void Function(GTagWorksData_tag_worksBuilder b) updates]) =
      _$GTagWorksData_tag_works;

  static void _initializeBuilder(GTagWorksData_tag_worksBuilder b) =>
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
  static Serializer<GTagWorksData_tag_works> get serializer =>
      _$gTagWorksDataTagWorksSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTagWorksData_tag_works.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTagWorksData_tag_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTagWorksData_tag_works.serializer,
        json,
      );
}
