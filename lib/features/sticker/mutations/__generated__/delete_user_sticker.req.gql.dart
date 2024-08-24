// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/sticker/mutations/__generated__/delete_user_sticker.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/sticker/mutations/__generated__/delete_user_sticker.data.gql.dart'
    as _i2;
import 'package:aipictors/features/sticker/mutations/__generated__/delete_user_sticker.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'delete_user_sticker.req.gql.g.dart';

abstract class GDeleteUserStickerReq
    implements
        Built<GDeleteUserStickerReq, GDeleteUserStickerReqBuilder>,
        _i1.OperationRequest<_i2.GDeleteUserStickerData,
            _i3.GDeleteUserStickerVars> {
  GDeleteUserStickerReq._();

  factory GDeleteUserStickerReq(
          [void Function(GDeleteUserStickerReqBuilder b) updates]) =
      _$GDeleteUserStickerReq;

  static void _initializeBuilder(GDeleteUserStickerReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'DeleteUserSticker',
    )
    ..executeOnListen = true;

  @override
  _i3.GDeleteUserStickerVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GDeleteUserStickerData? Function(
    _i2.GDeleteUserStickerData?,
    _i2.GDeleteUserStickerData?,
  )? get updateResult;
  @override
  _i2.GDeleteUserStickerData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GDeleteUserStickerData? parseData(Map<String, dynamic> json) =>
      _i2.GDeleteUserStickerData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GDeleteUserStickerData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GDeleteUserStickerData, _i3.GDeleteUserStickerVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GDeleteUserStickerReq> get serializer =>
      _$gDeleteUserStickerReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDeleteUserStickerReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteUserStickerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDeleteUserStickerReq.serializer,
        json,
      );
}
