// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_work_fields_fragment.var.gql.g.dart';

abstract class GPartialWorkFieldsVars
    implements Built<GPartialWorkFieldsVars, GPartialWorkFieldsVarsBuilder> {
  GPartialWorkFieldsVars._();

  factory GPartialWorkFieldsVars(
          [Function(GPartialWorkFieldsVarsBuilder b) updates]) =
      _$GPartialWorkFieldsVars;

  static Serializer<GPartialWorkFieldsVars> get serializer =>
      _$gPartialWorkFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialWorkFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialWorkFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialWorkFieldsVars.serializer,
        json,
      );
}
