// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_folder.var.gql.g.dart';

abstract class GReportFolderVars
    implements Built<GReportFolderVars, GReportFolderVarsBuilder> {
  GReportFolderVars._();

  factory GReportFolderVars(
          [void Function(GReportFolderVarsBuilder b) updates]) =
      _$GReportFolderVars;

  _i1.GReportFolderInput get input;
  static Serializer<GReportFolderVars> get serializer =>
      _$gReportFolderVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GReportFolderVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportFolderVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GReportFolderVars.serializer,
        json,
      );
}
