// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/report_user.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/report_user.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/report_user.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'report_user.req.gql.g.dart';

abstract class GReportUserReq
    implements
        Built<GReportUserReq, GReportUserReqBuilder>,
        _i1.OperationRequest<_i2.GReportUserData, _i3.GReportUserVars> {
  GReportUserReq._();

  factory GReportUserReq([Function(GReportUserReqBuilder b) updates]) =
      _$GReportUserReq;

  static void _initializeBuilder(GReportUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ReportUser',
    )
    ..executeOnListen = true;
  @override
  _i3.GReportUserVars get vars;
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
  _i2.GReportUserData? Function(
    _i2.GReportUserData?,
    _i2.GReportUserData?,
  )? get updateResult;
  @override
  _i2.GReportUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GReportUserData? parseData(Map<String, dynamic> json) =>
      _i2.GReportUserData.fromJson(json);
  static Serializer<GReportUserReq> get serializer =>
      _$gReportUserReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReportUserReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReportUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReportUserReq.serializer,
        json,
      );
}
