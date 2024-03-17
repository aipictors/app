// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/create_user_sticker.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/create_user_sticker.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/create_user_sticker.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'create_user_sticker.req.gql.g.dart';

abstract class GCreateUserStickerReq
    implements
        Built<GCreateUserStickerReq, GCreateUserStickerReqBuilder>,
        _i1.OperationRequest<_i2.GCreateUserStickerData,
            _i3.GCreateUserStickerVars> {
  GCreateUserStickerReq._();

  factory GCreateUserStickerReq(
          [void Function(GCreateUserStickerReqBuilder b) updates]) =
      _$GCreateUserStickerReq;

  static void _initializeBuilder(GCreateUserStickerReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateUserSticker',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateUserStickerVars get vars;
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
  _i2.GCreateUserStickerData? Function(
    _i2.GCreateUserStickerData?,
    _i2.GCreateUserStickerData?,
  )? get updateResult;
  @override
  _i2.GCreateUserStickerData? get optimisticResponse;
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
  _i2.GCreateUserStickerData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateUserStickerData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GCreateUserStickerData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GCreateUserStickerData, _i3.GCreateUserStickerVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GCreateUserStickerReq> get serializer =>
      _$gCreateUserStickerReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateUserStickerReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserStickerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateUserStickerReq.serializer,
        json,
      );
}
