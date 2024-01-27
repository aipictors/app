// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:aipictors/graphql/fragments/__generated__/partial_promotion_fields_fragment.data.gql.dart'
    as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'promotions.data.gql.g.dart';

abstract class GPromotionsData
    implements Built<GPromotionsData, GPromotionsDataBuilder> {
  GPromotionsData._();

  factory GPromotionsData([Function(GPromotionsDataBuilder b) updates]) =
      _$GPromotionsData;

  static void _initializeBuilder(GPromotionsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPromotionsData_promotions> get promotions;
  static Serializer<GPromotionsData> get serializer =>
      _$gPromotionsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromotionsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPromotionsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromotionsData.serializer,
        json,
      );
}

abstract class GPromotionsData_promotions
    implements
        Built<GPromotionsData_promotions, GPromotionsData_promotionsBuilder>,
        _i2.GPartialPromotionFields {
  GPromotionsData_promotions._();

  factory GPromotionsData_promotions(
          [Function(GPromotionsData_promotionsBuilder b) updates]) =
      _$GPromotionsData_promotions;

  static void _initializeBuilder(GPromotionsData_promotionsBuilder b) =>
      b..G__typename = 'PromotionNode';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String? get imageURL;
  @override
  String? get pageURL;
  @override
  int get startDateTime;
  @override
  int get endDateTime;
  static Serializer<GPromotionsData_promotions> get serializer =>
      _$gPromotionsDataPromotionsSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromotionsData_promotions.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPromotionsData_promotions? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromotionsData_promotions.serializer,
        json,
      );
}
