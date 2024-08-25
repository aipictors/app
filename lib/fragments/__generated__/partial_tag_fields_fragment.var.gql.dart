// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'partial_tag_fields_fragment.var.gql.g.dart';

abstract class GPartialTagFieldsVars
    implements Built<GPartialTagFieldsVars, GPartialTagFieldsVarsBuilder> {
  GPartialTagFieldsVars._();

  factory GPartialTagFieldsVars(
          [void Function(GPartialTagFieldsVarsBuilder b) updates]) =
      _$GPartialTagFieldsVars;

  static Serializer<GPartialTagFieldsVars> get serializer =>
      _$gPartialTagFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPartialTagFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPartialTagFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPartialTagFieldsVars.serializer,
        json,
      );
}
