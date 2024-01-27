// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_sticker.data.gql.g.dart';

abstract class GCreateStickerData
    implements Built<GCreateStickerData, GCreateStickerDataBuilder> {
  GCreateStickerData._();

  factory GCreateStickerData([Function(GCreateStickerDataBuilder b) updates]) =
      _$GCreateStickerData;

  static void _initializeBuilder(GCreateStickerDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateStickerData_createSticker get createSticker;
  static Serializer<GCreateStickerData> get serializer =>
      _$gCreateStickerDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateStickerData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateStickerData.serializer,
        json,
      );
}

abstract class GCreateStickerData_createSticker
    implements
        Built<GCreateStickerData_createSticker,
            GCreateStickerData_createStickerBuilder> {
  GCreateStickerData_createSticker._();

  factory GCreateStickerData_createSticker(
          [Function(GCreateStickerData_createStickerBuilder b) updates]) =
      _$GCreateStickerData_createSticker;

  static void _initializeBuilder(GCreateStickerData_createStickerBuilder b) =>
      b..G__typename = 'StickerNode';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  static Serializer<GCreateStickerData_createSticker> get serializer =>
      _$gCreateStickerDataCreateStickerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateStickerData_createSticker.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateStickerData_createSticker? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateStickerData_createSticker.serializer,
        json,
      );
}
