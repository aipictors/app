// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_stickers.data.gql.g.dart';

abstract class GUserStickersData
    implements Built<GUserStickersData, GUserStickersDataBuilder> {
  GUserStickersData._();

  factory GUserStickersData([Function(GUserStickersDataBuilder b) updates]) =
      _$GUserStickersData;

  static void _initializeBuilder(GUserStickersDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserStickersData_user? get user;
  static Serializer<GUserStickersData> get serializer =>
      _$gUserStickersDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserStickersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersData.serializer,
        json,
      );
}

abstract class GUserStickersData_user
    implements Built<GUserStickersData_user, GUserStickersData_userBuilder> {
  GUserStickersData_user._();

  factory GUserStickersData_user(
          [Function(GUserStickersData_userBuilder b) updates]) =
      _$GUserStickersData_user;

  static void _initializeBuilder(GUserStickersData_userBuilder b) =>
      b..G__typename = 'UserNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  BuiltList<GUserStickersData_user_stickers> get stickers;
  static Serializer<GUserStickersData_user> get serializer =>
      _$gUserStickersDataUserSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersData_user.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserStickersData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersData_user.serializer,
        json,
      );
}

abstract class GUserStickersData_user_stickers
    implements
        Built<GUserStickersData_user_stickers,
            GUserStickersData_user_stickersBuilder>,
        _i2.GPartialStickerFields {
  GUserStickersData_user_stickers._();

  factory GUserStickersData_user_stickers(
          [Function(GUserStickersData_user_stickersBuilder b) updates]) =
      _$GUserStickersData_user_stickers;

  static void _initializeBuilder(GUserStickersData_user_stickersBuilder b) =>
      b..G__typename = 'StickerNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  GUserStickersData_user_stickers_image? get image;
  static Serializer<GUserStickersData_user_stickers> get serializer =>
      _$gUserStickersDataUserStickersSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersData_user_stickers.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserStickersData_user_stickers? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersData_user_stickers.serializer,
        json,
      );
}

abstract class GUserStickersData_user_stickers_image
    implements
        Built<GUserStickersData_user_stickers_image,
            GUserStickersData_user_stickers_imageBuilder>,
        _i2.GPartialStickerFields_image {
  GUserStickersData_user_stickers_image._();

  factory GUserStickersData_user_stickers_image(
          [Function(GUserStickersData_user_stickers_imageBuilder b) updates]) =
      _$GUserStickersData_user_stickers_image;

  static void _initializeBuilder(
          GUserStickersData_user_stickers_imageBuilder b) =>
      b..G__typename = 'ImageNode';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get downloadURL;
  static Serializer<GUserStickersData_user_stickers_image> get serializer =>
      _$gUserStickersDataUserStickersImageSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStickersData_user_stickers_image.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserStickersData_user_stickers_image? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStickersData_user_stickers_image.serializer,
        json,
      );
}
