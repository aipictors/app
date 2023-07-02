// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_user_fields_fragment.var.gql.g.dart';

abstract class GWorkUserFieldsVars
    implements Built<GWorkUserFieldsVars, GWorkUserFieldsVarsBuilder> {
  GWorkUserFieldsVars._();

  factory GWorkUserFieldsVars(
      [Function(GWorkUserFieldsVarsBuilder b) updates]) = _$GWorkUserFieldsVars;

  static Serializer<GWorkUserFieldsVars> get serializer =>
      _$gWorkUserFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkUserFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkUserFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkUserFieldsVars.serializer,
        json,
      );
}
