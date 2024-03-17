// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_user_sticker.data.gql.g.dart';

abstract class GCreateUserStickerData
    implements Built<GCreateUserStickerData, GCreateUserStickerDataBuilder> {
  GCreateUserStickerData._();

  factory GCreateUserStickerData(
          [void Function(GCreateUserStickerDataBuilder b) updates]) =
      _$GCreateUserStickerData;

  static void _initializeBuilder(GCreateUserStickerDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateUserStickerData_createSticker get createSticker;
  static Serializer<GCreateUserStickerData> get serializer =>
      _$gCreateUserStickerDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserStickerData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserStickerData.serializer,
        json,
      );
}

abstract class GCreateUserStickerData_createSticker
    implements
        Built<GCreateUserStickerData_createSticker,
            GCreateUserStickerData_createStickerBuilder> {
  GCreateUserStickerData_createSticker._();

  factory GCreateUserStickerData_createSticker(
      [void Function(GCreateUserStickerData_createStickerBuilder b)
          updates]) = _$GCreateUserStickerData_createSticker;

  static void _initializeBuilder(
          GCreateUserStickerData_createStickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateUserStickerData_createSticker> get serializer =>
      _$gCreateUserStickerDataCreateStickerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserStickerData_createSticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserStickerData_createSticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserStickerData_createSticker.serializer,
        json,
      );
}
