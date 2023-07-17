// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_work.var.gql.g.dart';

abstract class GReportWorkVars
    implements Built<GReportWorkVars, GReportWorkVarsBuilder> {
  GReportWorkVars._();

  factory GReportWorkVars([Function(GReportWorkVarsBuilder b) updates]) =
      _$GReportWorkVars;

  _i1.GReportWorkInput get input;
  static Serializer<GReportWorkVars> get serializer =>
      _$gReportWorkVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GReportWorkVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReportWorkVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GReportWorkVars.serializer,
        json,
      );
}
