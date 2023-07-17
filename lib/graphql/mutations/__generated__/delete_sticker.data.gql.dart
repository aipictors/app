// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_sticker.data.gql.g.dart';

abstract class GDeleteStickerData
    implements Built<GDeleteStickerData, GDeleteStickerDataBuilder> {
  GDeleteStickerData._();

  factory GDeleteStickerData([Function(GDeleteStickerDataBuilder b) updates]) =
      _$GDeleteStickerData;

  static void _initializeBuilder(GDeleteStickerDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeleteStickerData_deleteSticker get deleteSticker;
  static Serializer<GDeleteStickerData> get serializer =>
      _$gDeleteStickerDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteStickerData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteStickerData.serializer,
        json,
      );
}

abstract class GDeleteStickerData_deleteSticker
    implements
        Built<GDeleteStickerData_deleteSticker,
            GDeleteStickerData_deleteStickerBuilder> {
  GDeleteStickerData_deleteSticker._();

  factory GDeleteStickerData_deleteSticker(
          [Function(GDeleteStickerData_deleteStickerBuilder b) updates]) =
      _$GDeleteStickerData_deleteSticker;

  static void _initializeBuilder(GDeleteStickerData_deleteStickerBuilder b) =>
      b..G__typename = 'StickerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  static Serializer<GDeleteStickerData_deleteSticker> get serializer =>
      _$gDeleteStickerDataDeleteStickerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteStickerData_deleteSticker.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteStickerData_deleteSticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteStickerData_deleteSticker.serializer,
        json,
      );
}
