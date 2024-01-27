// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/sticker.ast.gql.dart' as _i5;
import 'package:aipictors/graphql/__generated__/sticker.data.gql.dart' as _i2;
import 'package:aipictors/graphql/__generated__/sticker.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'sticker.req.gql.g.dart';

abstract class GStickerReq
    implements
        Built<GStickerReq, GStickerReqBuilder>,
        _i1.OperationRequest<_i2.GStickerData, _i3.GStickerVars> {
  GStickerReq._();

  factory GStickerReq([Function(GStickerReqBuilder b) updates]) = _$GStickerReq;

  static void _initializeBuilder(GStickerReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Sticker',
    )
    ..executeOnListen = true;

  @override
  _i3.GStickerVars get vars;
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
  _i2.GStickerData? Function(
    _i2.GStickerData?,
    _i2.GStickerData?,
  )? get updateResult;
  @override
  _i2.GStickerData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GStickerData? parseData(Map<String, dynamic> json) =>
      _i2.GStickerData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GStickerData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GStickerData, _i3.GStickerVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GStickerReq> get serializer => _$gStickerReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GStickerReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStickerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GStickerReq.serializer,
        json,
      );
}
