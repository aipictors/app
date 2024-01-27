// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/stickers.ast.gql.dart' as _i5;
import 'package:aipictors/graphql/__generated__/stickers.data.gql.dart' as _i2;
import 'package:aipictors/graphql/__generated__/stickers.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'stickers.req.gql.g.dart';

abstract class GStickersReq
    implements
        Built<GStickersReq, GStickersReqBuilder>,
        _i1.OperationRequest<_i2.GStickersData, _i3.GStickersVars> {
  GStickersReq._();

  factory GStickersReq([Function(GStickersReqBuilder b) updates]) =
      _$GStickersReq;

  static void _initializeBuilder(GStickersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Stickers',
    )
    ..executeOnListen = true;

  @override
  _i3.GStickersVars get vars;
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
  _i2.GStickersData? Function(
    _i2.GStickersData?,
    _i2.GStickersData?,
  )? get updateResult;
  @override
  _i2.GStickersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GStickersData? parseData(Map<String, dynamic> json) =>
      _i2.GStickersData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GStickersData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GStickersData, _i3.GStickersVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GStickersReq> get serializer => _$gStickersReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GStickersReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GStickersReq.serializer,
        json,
      );
}
