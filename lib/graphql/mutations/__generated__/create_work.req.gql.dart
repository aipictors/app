// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/create_work.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/create_work.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/create_work.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'create_work.req.gql.g.dart';

abstract class GCreateWorkReq
    implements
        Built<GCreateWorkReq, GCreateWorkReqBuilder>,
        _i1.OperationRequest<_i2.GCreateWorkData, _i3.GCreateWorkVars> {
  GCreateWorkReq._();

  factory GCreateWorkReq([Function(GCreateWorkReqBuilder b) updates]) =
      _$GCreateWorkReq;

  static void _initializeBuilder(GCreateWorkReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateWork',
    )
    ..executeOnListen = true;
  @override
  _i3.GCreateWorkVars get vars;
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
  _i2.GCreateWorkData? Function(
    _i2.GCreateWorkData?,
    _i2.GCreateWorkData?,
  )? get updateResult;
  @override
  _i2.GCreateWorkData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateWorkData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateWorkData.fromJson(json);
  static Serializer<GCreateWorkReq> get serializer =>
      _$gCreateWorkReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateWorkReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateWorkReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateWorkReq.serializer,
        json,
      );
}
