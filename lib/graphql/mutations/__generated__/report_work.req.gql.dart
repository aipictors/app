// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/report_work.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/report_work.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/report_work.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'report_work.req.gql.g.dart';

abstract class GReportWorkReq
    implements
        Built<GReportWorkReq, GReportWorkReqBuilder>,
        _i1.OperationRequest<_i2.GReportWorkData, _i3.GReportWorkVars> {
  GReportWorkReq._();

  factory GReportWorkReq([Function(GReportWorkReqBuilder b) updates]) =
      _$GReportWorkReq;

  static void _initializeBuilder(GReportWorkReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ReportWork',
    )
    ..executeOnListen = true;
  @override
  _i3.GReportWorkVars get vars;
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
  _i2.GReportWorkData? Function(
    _i2.GReportWorkData?,
    _i2.GReportWorkData?,
  )? get updateResult;
  @override
  _i2.GReportWorkData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GReportWorkData? parseData(Map<String, dynamic> json) =>
      _i2.GReportWorkData.fromJson(json);
  static Serializer<GReportWorkReq> get serializer =>
      _$gReportWorkReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReportWorkReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReportWorkReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReportWorkReq.serializer,
        json,
      );
}
