// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/folder.ast.gql.dart' as _i5;
import 'package:aipictors/graphql/__generated__/folder.data.gql.dart' as _i2;
import 'package:aipictors/graphql/__generated__/folder.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'folder.req.gql.g.dart';

abstract class GFolderReq
    implements
        Built<GFolderReq, GFolderReqBuilder>,
        _i1.OperationRequest<_i2.GFolderData, _i3.GFolderVars> {
  GFolderReq._();

  factory GFolderReq([Function(GFolderReqBuilder b) updates]) = _$GFolderReq;

  static void _initializeBuilder(GFolderReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Folder',
    )
    ..executeOnListen = true;

  @override
  _i3.GFolderVars get vars;
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
  _i2.GFolderData? Function(
    _i2.GFolderData?,
    _i2.GFolderData?,
  )? get updateResult;
  @override
  _i2.GFolderData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFolderData? parseData(Map<String, dynamic> json) =>
      _i2.GFolderData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GFolderData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GFolderData, _i3.GFolderVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GFolderReq> get serializer => _$gFolderReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFolderReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFolderReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFolderReq.serializer,
        json,
      );
}
