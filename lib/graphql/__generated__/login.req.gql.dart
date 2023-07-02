// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/login.ast.gql.dart' as _i5;
import 'package:aipictors/graphql/__generated__/login.data.gql.dart' as _i2;
import 'package:aipictors/graphql/__generated__/login.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'login.req.gql.g.dart';

abstract class GLoginWithPasswordReq
    implements
        Built<GLoginWithPasswordReq, GLoginWithPasswordReqBuilder>,
        _i1.OperationRequest<_i2.GLoginWithPasswordData,
            _i3.GLoginWithPasswordVars> {
  GLoginWithPasswordReq._();

  factory GLoginWithPasswordReq(
          [Function(GLoginWithPasswordReqBuilder b) updates]) =
      _$GLoginWithPasswordReq;

  static void _initializeBuilder(GLoginWithPasswordReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'LoginWithPassword',
    )
    ..executeOnListen = true;
  @override
  _i3.GLoginWithPasswordVars get vars;
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
  _i2.GLoginWithPasswordData? Function(
    _i2.GLoginWithPasswordData?,
    _i2.GLoginWithPasswordData?,
  )? get updateResult;
  @override
  _i2.GLoginWithPasswordData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GLoginWithPasswordData? parseData(Map<String, dynamic> json) =>
      _i2.GLoginWithPasswordData.fromJson(json);
  static Serializer<GLoginWithPasswordReq> get serializer =>
      _$gLoginWithPasswordReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GLoginWithPasswordReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLoginWithPasswordReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GLoginWithPasswordReq.serializer,
        json,
      );
}
