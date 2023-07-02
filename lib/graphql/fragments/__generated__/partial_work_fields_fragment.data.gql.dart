// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_work_fields_fragment.data.gql.g.dart';

abstract class GPartialWorkFields {
  String get G__typename;
  String get id;
  String get title;
  GPartialWorkFields_image? get image;
  GPartialWorkFields_thumbnailImage? get thumbnailImage;
  Map<String, dynamic> toJson();
}

abstract class GPartialWorkFields_image {
  String get G__typename;
  String get id;
  String get downloadURL;
  Map<String, dynamic> toJson();
}

abstract class GPartialWorkFields_thumbnailImage {
  String get G__typename;
  String get id;
  String get downloadURL;
  Map<String, dynamic> toJson();
}

abstract class GPartialWorkFieldsData
    implements
        Built<GPartialWorkFieldsData, GPartialWorkFieldsDataBuilder>,
        GPartialWorkFields {
  GPartialWorkFieldsData._();

  factory GPartialWorkFieldsData(
          [Function(GPartialWorkFieldsDataBuilder b) updates]) =
      _$GPartialWorkFieldsData;

  static void _initializeBuilder(GPartialWorkFieldsDataBuilder b) =>
      b..G__typename = 'WorkNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GPartialWorkFieldsData_image? get image;
  @override
  GPartialWorkFieldsData_thumbnailImage? get thumbnailImage;
  static Serializer<GPartialWorkFieldsData> get serializer =>
      _$gPartialWorkFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialWorkFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialWorkFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialWorkFieldsData.serializer,
        json,
      );
}

abstract class GPartialWorkFieldsData_image
    implements
        Built<GPartialWorkFieldsData_image,
            GPartialWorkFieldsData_imageBuilder>,
        GPartialWorkFields_image {
  GPartialWorkFieldsData_image._();

  factory GPartialWorkFieldsData_image(
          [Function(GPartialWorkFieldsData_imageBuilder b) updates]) =
      _$GPartialWorkFieldsData_image;

  static void _initializeBuilder(GPartialWorkFieldsData_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GPartialWorkFieldsData_image> get serializer =>
      _$gPartialWorkFieldsDataImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialWorkFieldsData_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialWorkFieldsData_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialWorkFieldsData_image.serializer,
        json,
      );
}

abstract class GPartialWorkFieldsData_thumbnailImage
    implements
        Built<GPartialWorkFieldsData_thumbnailImage,
            GPartialWorkFieldsData_thumbnailImageBuilder>,
        GPartialWorkFields_thumbnailImage {
  GPartialWorkFieldsData_thumbnailImage._();

  factory GPartialWorkFieldsData_thumbnailImage(
          [Function(GPartialWorkFieldsData_thumbnailImageBuilder b) updates]) =
      _$GPartialWorkFieldsData_thumbnailImage;

  static void _initializeBuilder(
          GPartialWorkFieldsData_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GPartialWorkFieldsData_thumbnailImage> get serializer =>
      _$gPartialWorkFieldsDataThumbnailImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialWorkFieldsData_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialWorkFieldsData_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialWorkFieldsData_thumbnailImage.serializer,
        json,
      );
}
