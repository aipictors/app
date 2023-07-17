// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/mute_user.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/mute_user.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/mute_user.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'mute_user.req.gql.g.dart';

abstract class GMuteUserReq
    implements
        Built<GMuteUserReq, GMuteUserReqBuilder>,
        _i1.OperationRequest<_i2.GMuteUserData, _i3.GMuteUserVars> {
  GMuteUserReq._();

  factory GMuteUserReq([Function(GMuteUserReqBuilder b) updates]) =
      _$GMuteUserReq;

  static void _initializeBuilder(GMuteUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'MuteUser',
    )
    ..executeOnListen = true;
  @override
  _i3.GMuteUserVars get vars;
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
  _i2.GMuteUserData? Function(
    _i2.GMuteUserData?,
    _i2.GMuteUserData?,
  )? get updateResult;
  @override
  _i2.GMuteUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GMuteUserData? parseData(Map<String, dynamic> json) =>
      _i2.GMuteUserData.fromJson(json);
  static Serializer<GMuteUserReq> get serializer => _$gMuteUserReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMuteUserReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMuteUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMuteUserReq.serializer,
        json,
      );
}
