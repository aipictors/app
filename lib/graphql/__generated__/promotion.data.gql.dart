// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'promotion.data.gql.g.dart';

abstract class GPromotionData
    implements Built<GPromotionData, GPromotionDataBuilder> {
  GPromotionData._();

  factory GPromotionData([Function(GPromotionDataBuilder b) updates]) =
      _$GPromotionData;

  static void _initializeBuilder(GPromotionDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPromotionData_promotion? get promotion;
  static Serializer<GPromotionData> get serializer =>
      _$gPromotionDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromotionData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromotionData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromotionData.serializer,
        json,
      );
}

abstract class GPromotionData_promotion
    implements
        Built<GPromotionData_promotion, GPromotionData_promotionBuilder> {
  GPromotionData_promotion._();

  factory GPromotionData_promotion(
          [Function(GPromotionData_promotionBuilder b) updates]) =
      _$GPromotionData_promotion;

  static void _initializeBuilder(GPromotionData_promotionBuilder b) =>
      b..G__typename = 'PromotionNode';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  String get description;
  String? get imageURL;
  String? get pageURL;
  int get startDateTime;
  int get endDateTime;
  static Serializer<GPromotionData_promotion> get serializer =>
      _$gPromotionDataPromotionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromotionData_promotion.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromotionData_promotion? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromotionData_promotion.serializer,
        json,
      );
}
