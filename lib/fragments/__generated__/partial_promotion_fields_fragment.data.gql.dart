// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_promotion_fields_fragment.data.gql.g.dart';

abstract class GPartialPromotionFields {
  String get G__typename;
  String get id;
  String get title;
  String get description;
  String? get imageURL;
  String? get pageURL;
  int get startDateTime;
  int get endDateTime;
  Map<String, dynamic> toJson();
}

abstract class GPartialPromotionFieldsData
    implements
        Built<GPartialPromotionFieldsData, GPartialPromotionFieldsDataBuilder>,
        GPartialPromotionFields {
  GPartialPromotionFieldsData._();

  factory GPartialPromotionFieldsData(
          [void Function(GPartialPromotionFieldsDataBuilder b) updates]) =
      _$GPartialPromotionFieldsData;

  static void _initializeBuilder(GPartialPromotionFieldsDataBuilder b) =>
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
  static Serializer<GPartialPromotionFieldsData> get serializer =>
      _$gPartialPromotionFieldsDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialPromotionFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialPromotionFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialPromotionFieldsData.serializer,
        json,
      );
}
