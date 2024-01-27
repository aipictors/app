// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sticker.data.gql.g.dart';

abstract class GStickerData
    implements Built<GStickerData, GStickerDataBuilder> {
  GStickerData._();

  factory GStickerData([Function(GStickerDataBuilder b) updates]) =
      _$GStickerData;

  static void _initializeBuilder(GStickerDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GStickerData_sticker? get sticker;
  static Serializer<GStickerData> get serializer => _$gStickerDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData.serializer,
        json,
      );
}

abstract class GStickerData_sticker
    implements Built<GStickerData_sticker, GStickerData_stickerBuilder> {
  GStickerData_sticker._();

  factory GStickerData_sticker(
          [Function(GStickerData_stickerBuilder b) updates]) =
      _$GStickerData_sticker;

  static void _initializeBuilder(GStickerData_stickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  int get createdAt;
  String get title;
  GStickerData_sticker_image? get image;
  int get downloadsCount;
  int get likesCount;
  int get usesCount;
  static Serializer<GStickerData_sticker> get serializer =>
      _$gStickerDataStickerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData_sticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData_sticker? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData_sticker.serializer,
        json,
      );
}

abstract class GStickerData_sticker_image
    implements
        Built<GStickerData_sticker_image, GStickerData_sticker_imageBuilder> {
  GStickerData_sticker_image._();

  factory GStickerData_sticker_image(
          [Function(GStickerData_sticker_imageBuilder b) updates]) =
      _$GStickerData_sticker_image;

  static void _initializeBuilder(GStickerData_sticker_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get downloadURL;
  static Serializer<GStickerData_sticker_image> get serializer =>
      _$gStickerDataStickerImageSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickerData_sticker_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerData_sticker_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickerData_sticker_image.serializer,
        json,
      );
}
