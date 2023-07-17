// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_sticker.data.gql.g.dart';

abstract class GUpdateStickerData
    implements Built<GUpdateStickerData, GUpdateStickerDataBuilder> {
  GUpdateStickerData._();

  factory GUpdateStickerData([Function(GUpdateStickerDataBuilder b) updates]) =
      _$GUpdateStickerData;

  static void _initializeBuilder(GUpdateStickerDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateStickerData_updateSticker get updateSticker;
  static Serializer<GUpdateStickerData> get serializer =>
      _$gUpdateStickerDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateStickerData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateStickerData.serializer,
        json,
      );
}

abstract class GUpdateStickerData_updateSticker
    implements
        Built<GUpdateStickerData_updateSticker,
            GUpdateStickerData_updateStickerBuilder> {
  GUpdateStickerData_updateSticker._();

  factory GUpdateStickerData_updateSticker(
          [Function(GUpdateStickerData_updateStickerBuilder b) updates]) =
      _$GUpdateStickerData_updateSticker;

  static void _initializeBuilder(GUpdateStickerData_updateStickerBuilder b) =>
      b..G__typename = 'StickerNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  static Serializer<GUpdateStickerData_updateSticker> get serializer =>
      _$gUpdateStickerDataUpdateStickerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateStickerData_updateSticker.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateStickerData_updateSticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateStickerData_updateSticker.serializer,
        json,
      );
}
