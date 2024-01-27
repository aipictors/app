// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sub_work_fields_fragment.var.gql.g.dart';

abstract class GSubWorkFieldsVars
    implements Built<GSubWorkFieldsVars, GSubWorkFieldsVarsBuilder> {
  GSubWorkFieldsVars._();

  factory GSubWorkFieldsVars([Function(GSubWorkFieldsVarsBuilder b) updates]) =
      _$GSubWorkFieldsVars;

  static Serializer<GSubWorkFieldsVars> get serializer =>
      _$gSubWorkFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSubWorkFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSubWorkFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSubWorkFieldsVars.serializer,
        json,
      );
}
