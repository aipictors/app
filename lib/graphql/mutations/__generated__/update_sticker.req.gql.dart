// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/update_sticker.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/update_sticker.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/update_sticker.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'update_sticker.req.gql.g.dart';

abstract class GUpdateStickerReq
    implements
        Built<GUpdateStickerReq, GUpdateStickerReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateStickerData, _i3.GUpdateStickerVars> {
  GUpdateStickerReq._();

  factory GUpdateStickerReq([Function(GUpdateStickerReqBuilder b) updates]) =
      _$GUpdateStickerReq;

  static void _initializeBuilder(GUpdateStickerReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UpdateSticker',
    )
    ..executeOnListen = true;
  @override
  _i3.GUpdateStickerVars get vars;
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
  _i2.GUpdateStickerData? Function(
    _i2.GUpdateStickerData?,
    _i2.GUpdateStickerData?,
  )? get updateResult;
  @override
  _i2.GUpdateStickerData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUpdateStickerData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateStickerData.fromJson(json);
  static Serializer<GUpdateStickerReq> get serializer =>
      _$gUpdateStickerReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUpdateStickerReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateStickerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUpdateStickerReq.serializer,
        json,
      );
}
