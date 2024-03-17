// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_user_sticker.data.gql.g.dart';

abstract class GDeleteUserStickerData
    implements Built<GDeleteUserStickerData, GDeleteUserStickerDataBuilder> {
  GDeleteUserStickerData._();

  factory GDeleteUserStickerData(
          [void Function(GDeleteUserStickerDataBuilder b) updates]) =
      _$GDeleteUserStickerData;

  static void _initializeBuilder(GDeleteUserStickerDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteUserStickerData_deleteSticker get deleteSticker;
  static Serializer<GDeleteUserStickerData> get serializer =>
      _$gDeleteUserStickerDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteUserStickerData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteUserStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteUserStickerData.serializer,
        json,
      );
}

abstract class GDeleteUserStickerData_deleteSticker
    implements
        Built<GDeleteUserStickerData_deleteSticker,
            GDeleteUserStickerData_deleteStickerBuilder> {
  GDeleteUserStickerData_deleteSticker._();

  factory GDeleteUserStickerData_deleteSticker(
      [void Function(GDeleteUserStickerData_deleteStickerBuilder b)
          updates]) = _$GDeleteUserStickerData_deleteSticker;

  static void _initializeBuilder(
          GDeleteUserStickerData_deleteStickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GDeleteUserStickerData_deleteSticker> get serializer =>
      _$gDeleteUserStickerDataDeleteStickerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteUserStickerData_deleteSticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteUserStickerData_deleteSticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteUserStickerData_deleteSticker.serializer,
        json,
      );
}
