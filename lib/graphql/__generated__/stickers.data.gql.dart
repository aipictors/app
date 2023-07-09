// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stickers.data.gql.g.dart';

abstract class GStickersData
    implements Built<GStickersData, GStickersDataBuilder> {
  GStickersData._();

  factory GStickersData([Function(GStickersDataBuilder b) updates]) =
      _$GStickersData;

  static void _initializeBuilder(GStickersDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GStickersData_works>? get works;
  static Serializer<GStickersData> get serializer => _$gStickersDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickersData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStickersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickersData.serializer,
        json,
      );
}

abstract class GStickersData_works
    implements
        Built<GStickersData_works, GStickersData_worksBuilder>,
        _i2.GPartialStickerFields {
  GStickersData_works._();

  factory GStickersData_works(
      [Function(GStickersData_worksBuilder b) updates]) = _$GStickersData_works;

  static void _initializeBuilder(GStickersData_worksBuilder b) =>
      b..G__typename = 'WorkNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GStickersData_works_image? get image;
  static Serializer<GStickersData_works> get serializer =>
      _$gStickersDataWorksSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickersData_works.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStickersData_works? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickersData_works.serializer,
        json,
      );
}

abstract class GStickersData_works_image
    implements
        Built<GStickersData_works_image, GStickersData_works_imageBuilder>,
        _i2.GPartialStickerFields_image {
  GStickersData_works_image._();

  factory GStickersData_works_image(
          [Function(GStickersData_works_imageBuilder b) updates]) =
      _$GStickersData_works_image;

  static void _initializeBuilder(GStickersData_works_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GStickersData_works_image> get serializer =>
      _$gStickersDataWorksImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickersData_works_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GStickersData_works_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickersData_works_image.serializer,
        json,
      );
}
