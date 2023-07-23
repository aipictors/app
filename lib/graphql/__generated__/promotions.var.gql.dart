// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'promotions.var.gql.g.dart';

abstract class GPromotionsVars
    implements Built<GPromotionsVars, GPromotionsVarsBuilder> {
  GPromotionsVars._();

  factory GPromotionsVars([Function(GPromotionsVarsBuilder b) updates]) =
      _$GPromotionsVars;

  int get offset;
  int get limit;
  static Serializer<GPromotionsVars> get serializer =>
      _$gPromotionsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromotionsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromotionsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromotionsVars.serializer,
        json,
      );
}
