// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sub_work_fields_fragment.data.gql.g.dart';

abstract class GSubWorkFields {
  String get G__typename;
  String get id;
  GSubWorkFields_image get image;
  GSubWorkFields_thumbnailImage get thumbnailImage;
  Map<String, dynamic> toJson();
}

abstract class GSubWorkFields_image {
  String get G__typename;
  String get id;
  String get downloadURL;
  Map<String, dynamic> toJson();
}

abstract class GSubWorkFields_thumbnailImage {
  String get G__typename;
  String get id;
  String get downloadURL;
  Map<String, dynamic> toJson();
}

abstract class GSubWorkFieldsData
    implements
        Built<GSubWorkFieldsData, GSubWorkFieldsDataBuilder>,
        GSubWorkFields {
  GSubWorkFieldsData._();

  factory GSubWorkFieldsData([Function(GSubWorkFieldsDataBuilder b) updates]) =
      _$GSubWorkFieldsData;

  static void _initializeBuilder(GSubWorkFieldsDataBuilder b) =>
      b..G__typename = 'SubWorkNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GSubWorkFieldsData_image get image;
  @override
  GSubWorkFieldsData_thumbnailImage get thumbnailImage;
  static Serializer<GSubWorkFieldsData> get serializer =>
      _$gSubWorkFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSubWorkFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSubWorkFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSubWorkFieldsData.serializer,
        json,
      );
}

abstract class GSubWorkFieldsData_image
    implements
        Built<GSubWorkFieldsData_image, GSubWorkFieldsData_imageBuilder>,
        GSubWorkFields_image {
  GSubWorkFieldsData_image._();

  factory GSubWorkFieldsData_image(
          [Function(GSubWorkFieldsData_imageBuilder b) updates]) =
      _$GSubWorkFieldsData_image;

  static void _initializeBuilder(GSubWorkFieldsData_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GSubWorkFieldsData_image> get serializer =>
      _$gSubWorkFieldsDataImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSubWorkFieldsData_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSubWorkFieldsData_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSubWorkFieldsData_image.serializer,
        json,
      );
}

abstract class GSubWorkFieldsData_thumbnailImage
    implements
        Built<GSubWorkFieldsData_thumbnailImage,
            GSubWorkFieldsData_thumbnailImageBuilder>,
        GSubWorkFields_thumbnailImage {
  GSubWorkFieldsData_thumbnailImage._();

  factory GSubWorkFieldsData_thumbnailImage(
          [Function(GSubWorkFieldsData_thumbnailImageBuilder b) updates]) =
      _$GSubWorkFieldsData_thumbnailImage;

  static void _initializeBuilder(GSubWorkFieldsData_thumbnailImageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GSubWorkFieldsData_thumbnailImage> get serializer =>
      _$gSubWorkFieldsDataThumbnailImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSubWorkFieldsData_thumbnailImage.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSubWorkFieldsData_thumbnailImage? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSubWorkFieldsData_thumbnailImage.serializer,
        json,
      );
}
