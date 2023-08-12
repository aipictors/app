// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/schema.schema.gql.dart' as _i1;
import 'package:aipictors/__generated__/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_album.var.gql.g.dart';

abstract class GReportAlbumVars
    implements Built<GReportAlbumVars, GReportAlbumVarsBuilder> {
  GReportAlbumVars._();

  factory GReportAlbumVars([Function(GReportAlbumVarsBuilder b) updates]) =
      _$GReportAlbumVars;

  _i1.GReportAlbumInput get input;
  static Serializer<GReportAlbumVars> get serializer =>
      _$gReportAlbumVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GReportAlbumVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReportAlbumVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GReportAlbumVars.serializer,
        json,
      );
}
