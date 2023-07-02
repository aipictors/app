// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_user_fields_fragment.var.gql.g.dart';

abstract class GPartialUserFieldsVars
    implements Built<GPartialUserFieldsVars, GPartialUserFieldsVarsBuilder> {
  GPartialUserFieldsVars._();

  factory GPartialUserFieldsVars(
          [Function(GPartialUserFieldsVarsBuilder b) updates]) =
      _$GPartialUserFieldsVars;

  static Serializer<GPartialUserFieldsVars> get serializer =>
      _$gPartialUserFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialUserFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPartialUserFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialUserFieldsVars.serializer,
        json,
      );
}
