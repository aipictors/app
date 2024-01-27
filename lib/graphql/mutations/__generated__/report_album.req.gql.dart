// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/report_album.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/report_album.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/report_album.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'report_album.req.gql.g.dart';

abstract class GReportAlbumReq
    implements
        Built<GReportAlbumReq, GReportAlbumReqBuilder>,
        _i1.OperationRequest<_i2.GReportAlbumData, _i3.GReportAlbumVars> {
  GReportAlbumReq._();

  factory GReportAlbumReq([Function(GReportAlbumReqBuilder b) updates]) =
      _$GReportAlbumReq;

  static void _initializeBuilder(GReportAlbumReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ReportAlbum',
    )
    ..executeOnListen = true;

  @override
  _i3.GReportAlbumVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GReportAlbumData? Function(
    _i2.GReportAlbumData?,
    _i2.GReportAlbumData?,
  )? get updateResult;
  @override
  _i2.GReportAlbumData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GReportAlbumData? parseData(Map<String, dynamic> json) =>
      _i2.GReportAlbumData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GReportAlbumData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GReportAlbumData, _i3.GReportAlbumVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GReportAlbumReq> get serializer =>
      _$gReportAlbumReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReportAlbumReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportAlbumReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReportAlbumReq.serializer,
        json,
      );
}
