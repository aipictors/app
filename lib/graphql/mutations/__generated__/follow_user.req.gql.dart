// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/follow_user.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/follow_user.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/follow_user.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'follow_user.req.gql.g.dart';

abstract class GFollowUserReq
    implements
        Built<GFollowUserReq, GFollowUserReqBuilder>,
        _i1.OperationRequest<_i2.GFollowUserData, _i3.GFollowUserVars> {
  GFollowUserReq._();

  factory GFollowUserReq([Function(GFollowUserReqBuilder b) updates]) =
      _$GFollowUserReq;

  static void _initializeBuilder(GFollowUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'FollowUser',
    )
    ..executeOnListen = true;
  @override
  _i3.GFollowUserVars get vars;
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
  _i2.GFollowUserData? Function(
    _i2.GFollowUserData?,
    _i2.GFollowUserData?,
  )? get updateResult;
  @override
  _i2.GFollowUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFollowUserData? parseData(Map<String, dynamic> json) =>
      _i2.GFollowUserData.fromJson(json);
  static Serializer<GFollowUserReq> get serializer =>
      _$gFollowUserReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFollowUserReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFollowUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFollowUserReq.serializer,
        json,
      );
}
