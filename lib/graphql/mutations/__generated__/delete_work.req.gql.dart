// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/delete_work.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/delete_work.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/delete_work.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'delete_work.req.gql.g.dart';

abstract class GDeleteWorkReq
    implements
        Built<GDeleteWorkReq, GDeleteWorkReqBuilder>,
        _i1.OperationRequest<_i2.GDeleteWorkData, _i3.GDeleteWorkVars> {
  GDeleteWorkReq._();

  factory GDeleteWorkReq([Function(GDeleteWorkReqBuilder b) updates]) =
      _$GDeleteWorkReq;

  static void _initializeBuilder(GDeleteWorkReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'DeleteWork',
    )
    ..executeOnListen = true;
  @override
  _i3.GDeleteWorkVars get vars;
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
  _i2.GDeleteWorkData? Function(
    _i2.GDeleteWorkData?,
    _i2.GDeleteWorkData?,
  )? get updateResult;
  @override
  _i2.GDeleteWorkData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GDeleteWorkData? parseData(Map<String, dynamic> json) =>
      _i2.GDeleteWorkData.fromJson(json);
  static Serializer<GDeleteWorkReq> get serializer =>
      _$gDeleteWorkReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDeleteWorkReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteWorkReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDeleteWorkReq.serializer,
        json,
      );
}
