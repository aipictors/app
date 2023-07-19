// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_sticker_fields_fragment.data.gql.g.dart';

abstract class GPartialStickerFields {
  String get G__typename;
  String get id;
  String get title;
  GPartialStickerFields_image? get image;
  Map<String, dynamic> toJson();
}

abstract class GPartialStickerFields_image {
  String get G__typename;
  String get id;
  String get downloadURL;
  Map<String, dynamic> toJson();
}

abstract class GPartialStickerFieldsData
    implements
        Built<GPartialStickerFieldsData, GPartialStickerFieldsDataBuilder>,
        GPartialStickerFields {
  GPartialStickerFieldsData._();

  factory GPartialStickerFieldsData(
          [Function(GPartialStickerFieldsDataBuilder b) updates]) =
      _$GPartialStickerFieldsData;

  static void _initializeBuilder(GPartialStickerFieldsDataBuilder b) =>
      b..G__typename = 'StickerNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GPartialStickerFieldsData_image? get image;
  static Serializer<GPartialStickerFieldsData> get serializer =>
      _$gPartialStickerFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialStickerFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialStickerFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialStickerFieldsData.serializer,
        json,
      );
}

abstract class GPartialStickerFieldsData_image
    implements
        Built<GPartialStickerFieldsData_image,
            GPartialStickerFieldsData_imageBuilder>,
        GPartialStickerFields_image {
  GPartialStickerFieldsData_image._();

  factory GPartialStickerFieldsData_image(
          [Function(GPartialStickerFieldsData_imageBuilder b) updates]) =
      _$GPartialStickerFieldsData_image;

  static void _initializeBuilder(GPartialStickerFieldsData_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GPartialStickerFieldsData_image> get serializer =>
      _$gPartialStickerFieldsDataImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialStickerFieldsData_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialStickerFieldsData_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialStickerFieldsData_image.serializer,
        json,
      );
}
