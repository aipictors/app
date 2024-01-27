// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/user_stickers.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/user_stickers.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/user_stickers.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'user_stickers.req.gql.g.dart';

abstract class GUserStickersReq
    implements
        Built<GUserStickersReq, GUserStickersReqBuilder>,
        _i1.OperationRequest<_i2.GUserStickersData, _i3.GUserStickersVars> {
  GUserStickersReq._();

  factory GUserStickersReq([Function(GUserStickersReqBuilder b) updates]) =
      _$GUserStickersReq;

  static void _initializeBuilder(GUserStickersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserStickers',
    )
    ..executeOnListen = true;

  @override
  _i3.GUserStickersVars get vars;
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
  _i2.GUserStickersData? Function(
    _i2.GUserStickersData?,
    _i2.GUserStickersData?,
  )? get updateResult;
  @override
  _i2.GUserStickersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUserStickersData? parseData(Map<String, dynamic> json) =>
      _i2.GUserStickersData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GUserStickersData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GUserStickersData, _i3.GUserStickersVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GUserStickersReq> get serializer =>
      _$gUserStickersReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserStickersReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserStickersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserStickersReq.serializer,
        json,
      );
}
