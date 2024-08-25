// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_comment.var.gql.g.dart';

abstract class GReportCommentVars
    implements Built<GReportCommentVars, GReportCommentVarsBuilder> {
  GReportCommentVars._();

  factory GReportCommentVars(
          [void Function(GReportCommentVarsBuilder b) updates]) =
      _$GReportCommentVars;

  _i1.GReportCommentInput get input;
  static Serializer<GReportCommentVars> get serializer =>
      _$gReportCommentVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GReportCommentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportCommentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GReportCommentVars.serializer,
        json,
      );
}
