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
  GCreateUserStickerData_createUserSticker get createUserSticker;
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

abstract class GCreateUserStickerData_createUserSticker
    implements
        Built<GCreateUserStickerData_createUserSticker,
            GCreateUserStickerData_createUserStickerBuilder> {
  GCreateUserStickerData_createUserSticker._();

  factory GCreateUserStickerData_createUserSticker(
      [void Function(GCreateUserStickerData_createUserStickerBuilder b)
          updates]) = _$GCreateUserStickerData_createUserSticker;

  static void _initializeBuilder(
          GCreateUserStickerData_createUserStickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GCreateUserStickerData_createUserSticker> get serializer =>
      _$gCreateUserStickerDataCreateUserStickerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserStickerData_createUserSticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserStickerData_createUserSticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserStickerData_createUserSticker.serializer,
        json,
      );
}
