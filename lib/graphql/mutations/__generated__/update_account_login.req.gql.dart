// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/update_account_login.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/update_account_login.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/update_account_login.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'update_account_login.req.gql.g.dart';

abstract class GUpdateAccountLoginReq
    implements
        Built<GUpdateAccountLoginReq, GUpdateAccountLoginReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateAccountLoginData,
            _i3.GUpdateAccountLoginVars> {
  GUpdateAccountLoginReq._();

  factory GUpdateAccountLoginReq(
          [Function(GUpdateAccountLoginReqBuilder b) updates]) =
      _$GUpdateAccountLoginReq;

  static void _initializeBuilder(GUpdateAccountLoginReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UpdateAccountLogin',
    )
    ..executeOnListen = true;
  @override
  _i3.GUpdateAccountLoginVars get vars;
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
  _i2.GUpdateAccountLoginData? Function(
    _i2.GUpdateAccountLoginData?,
    _i2.GUpdateAccountLoginData?,
  )? get updateResult;
  @override
  _i2.GUpdateAccountLoginData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUpdateAccountLoginData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateAccountLoginData.fromJson(json);
  static Serializer<GUpdateAccountLoginReq> get serializer =>
      _$gUpdateAccountLoginReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUpdateAccountLoginReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateAccountLoginReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUpdateAccountLoginReq.serializer,
        json,
      );
}
