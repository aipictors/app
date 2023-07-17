// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/user_folders.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/user_folders.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/user_folders.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'user_folders.req.gql.g.dart';

abstract class GUserFolderReq
    implements
        Built<GUserFolderReq, GUserFolderReqBuilder>,
        _i1.OperationRequest<_i2.GUserFolderData, _i3.GUserFolderVars> {
  GUserFolderReq._();

  factory GUserFolderReq([Function(GUserFolderReqBuilder b) updates]) =
      _$GUserFolderReq;

  static void _initializeBuilder(GUserFolderReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserFolder',
    )
    ..executeOnListen = true;
  @override
  _i3.GUserFolderVars get vars;
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
  _i2.GUserFolderData? Function(
    _i2.GUserFolderData?,
    _i2.GUserFolderData?,
  )? get updateResult;
  @override
  _i2.GUserFolderData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUserFolderData? parseData(Map<String, dynamic> json) =>
      _i2.GUserFolderData.fromJson(json);
  static Serializer<GUserFolderReq> get serializer =>
      _$gUserFolderReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserFolderReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserFolderReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserFolderReq.serializer,
        json,
      );
}
