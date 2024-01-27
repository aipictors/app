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
  BuiltList<GStickersData_stickers> get stickers;
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

abstract class GStickersData_stickers
    implements
        Built<GStickersData_stickers, GStickersData_stickersBuilder>,
        _i2.GPartialStickerFields {
  GStickersData_stickers._();

  factory GStickersData_stickers(
          [Function(GStickersData_stickersBuilder b) updates]) =
      _$GStickersData_stickers;

  static void _initializeBuilder(GStickersData_stickersBuilder b) =>
      b..G__typename = 'StickerNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GStickersData_stickers_image? get image;
  @override
  int get likesCount;
  @override
  int get downloadsCount;
  @override
  int get usesCount;
  static Serializer<GStickersData_stickers> get serializer =>
      _$gStickersDataStickersSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickersData_stickers.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickersData_stickers? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickersData_stickers.serializer,
        json,
      );
}

abstract class GStickersData_stickers_image
    implements
        Built<GStickersData_stickers_image,
            GStickersData_stickers_imageBuilder>,
        _i2.GPartialStickerFields_image {
  GStickersData_stickers_image._();

  factory GStickersData_stickers_image(
          [Function(GStickersData_stickers_imageBuilder b) updates]) =
      _$GStickersData_stickers_image;

  static void _initializeBuilder(GStickersData_stickers_imageBuilder b) =>
      b..G__typename = 'ImageNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GStickersData_stickers_image> get serializer =>
      _$gStickersDataStickersImageSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStickersData_stickers_image.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickersData_stickers_image? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStickersData_stickers_image.serializer,
        json,
      );
}
