// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/users.ast.gql.dart' as _i5;
import 'package:aipictors/graphql/__generated__/users.data.gql.dart' as _i2;
import 'package:aipictors/graphql/__generated__/users.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'users.req.gql.g.dart';

abstract class GUsersReq
    implements
        Built<GUsersReq, GUsersReqBuilder>,
        _i1.OperationRequest<_i2.GUsersData, _i3.GUsersVars> {
  GUsersReq._();

  factory GUsersReq([Function(GUsersReqBuilder b) updates]) = _$GUsersReq;

  static void _initializeBuilder(GUsersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Users',
    )
    ..executeOnListen = true;
  @override
  _i3.GUsersVars get vars;
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
  _i2.GUsersData? Function(
    _i2.GUsersData?,
    _i2.GUsersData?,
  )? get updateResult;
  @override
  _i2.GUsersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUsersData? parseData(Map<String, dynamic> json) =>
      _i2.GUsersData.fromJson(json);
  static Serializer<GUsersReq> get serializer => _$gUsersReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUsersReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUsersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUsersReq.serializer,
        json,
      );
}
