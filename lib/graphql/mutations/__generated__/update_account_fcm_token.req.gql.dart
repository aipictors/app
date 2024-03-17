// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/update_account_fcm_token.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/update_account_fcm_token.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/update_account_fcm_token.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'update_account_fcm_token.req.gql.g.dart';

abstract class GUpdateAccountFcmTokenReq
    implements
        Built<GUpdateAccountFcmTokenReq, GUpdateAccountFcmTokenReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateAccountFcmTokenData,
            _i3.GUpdateAccountFcmTokenVars> {
  GUpdateAccountFcmTokenReq._();

  factory GUpdateAccountFcmTokenReq(
          [void Function(GUpdateAccountFcmTokenReqBuilder b) updates]) =
      _$GUpdateAccountFcmTokenReq;

  static void _initializeBuilder(GUpdateAccountFcmTokenReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UpdateAccountFcmToken',
    )
    ..executeOnListen = true;

  @override
  _i3.GUpdateAccountFcmTokenVars get vars;
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
  _i2.GUpdateAccountFcmTokenData? Function(
    _i2.GUpdateAccountFcmTokenData?,
    _i2.GUpdateAccountFcmTokenData?,
  )? get updateResult;
  @override
  _i2.GUpdateAccountFcmTokenData? get optimisticResponse;
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
  _i2.GUpdateAccountFcmTokenData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateAccountFcmTokenData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GUpdateAccountFcmTokenData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GUpdateAccountFcmTokenData,
      _i3.GUpdateAccountFcmTokenVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GUpdateAccountFcmTokenReq> get serializer =>
      _$gUpdateAccountFcmTokenReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUpdateAccountFcmTokenReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateAccountFcmTokenReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUpdateAccountFcmTokenReq.serializer,
        json,
      );
}
