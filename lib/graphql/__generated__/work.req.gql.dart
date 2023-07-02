// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/work.ast.gql.dart' as _i5;
import 'package:aipictors/graphql/__generated__/work.data.gql.dart' as _i2;
import 'package:aipictors/graphql/__generated__/work.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'work.req.gql.g.dart';

abstract class GWorkReq
    implements
        Built<GWorkReq, GWorkReqBuilder>,
        _i1.OperationRequest<_i2.GWorkData, _i3.GWorkVars> {
  GWorkReq._();

  factory GWorkReq([Function(GWorkReqBuilder b) updates]) = _$GWorkReq;

  static void _initializeBuilder(GWorkReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Work',
    )
    ..executeOnListen = true;
  @override
  _i3.GWorkVars get vars;
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
  _i2.GWorkData? Function(
    _i2.GWorkData?,
    _i2.GWorkData?,
  )? get updateResult;
  @override
  _i2.GWorkData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GWorkData? parseData(Map<String, dynamic> json) =>
      _i2.GWorkData.fromJson(json);
  static Serializer<GWorkReq> get serializer => _$gWorkReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GWorkReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GWorkReq.serializer,
        json,
      );
}
