// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_promotion_fields_fragment.var.gql.g.dart';

abstract class GPartialPromotionFieldsVars
    implements
        Built<GPartialPromotionFieldsVars, GPartialPromotionFieldsVarsBuilder> {
  GPartialPromotionFieldsVars._();

  factory GPartialPromotionFieldsVars(
          [Function(GPartialPromotionFieldsVarsBuilder b) updates]) =
      _$GPartialPromotionFieldsVars;

  static Serializer<GPartialPromotionFieldsVars> get serializer =>
      _$gPartialPromotionFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialPromotionFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialPromotionFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialPromotionFieldsVars.serializer,
        json,
      );
}
