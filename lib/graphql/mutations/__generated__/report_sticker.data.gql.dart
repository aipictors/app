// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_sticker.data.gql.g.dart';

abstract class GReportStickerData
    implements Built<GReportStickerData, GReportStickerDataBuilder> {
  GReportStickerData._();

  factory GReportStickerData([Function(GReportStickerDataBuilder b) updates]) =
      _$GReportStickerData;

  static void _initializeBuilder(GReportStickerDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get reportSticker;
  static Serializer<GReportStickerData> get serializer =>
      _$gReportStickerDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportStickerData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportStickerData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportStickerData.serializer,
        json,
      );
}
