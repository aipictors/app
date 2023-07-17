// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_work.var.gql.g.dart';

abstract class GDeleteWorkVars
    implements Built<GDeleteWorkVars, GDeleteWorkVarsBuilder> {
  GDeleteWorkVars._();

  factory GDeleteWorkVars([Function(GDeleteWorkVarsBuilder b) updates]) =
      _$GDeleteWorkVars;

  _i1.GDeleteWorkInput get input;
  static Serializer<GDeleteWorkVars> get serializer =>
      _$gDeleteWorkVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GDeleteWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GDeleteWorkVars.serializer,
        json,
      );
}
