// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'promotion.var.gql.g.dart';

abstract class GPromotionVars
    implements Built<GPromotionVars, GPromotionVarsBuilder> {
  GPromotionVars._();

  factory GPromotionVars([Function(GPromotionVarsBuilder b) updates]) =
      _$GPromotionVars;

  String get id;
  static Serializer<GPromotionVars> get serializer =>
      _$gPromotionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromotionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPromotionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromotionVars.serializer,
        json,
      );
}
