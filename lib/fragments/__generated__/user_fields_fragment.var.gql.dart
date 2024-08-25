// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_fields_fragment.var.gql.g.dart';

abstract class GUserFieldsVars
    implements Built<GUserFieldsVars, GUserFieldsVarsBuilder> {
  GUserFieldsVars._();

  factory GUserFieldsVars([void Function(GUserFieldsVarsBuilder b) updates]) =
      _$GUserFieldsVars;

  static Serializer<GUserFieldsVars> get serializer =>
      _$gUserFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFieldsVars.serializer,
        json,
      );
}
