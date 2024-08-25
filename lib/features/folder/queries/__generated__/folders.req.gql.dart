// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/folder/queries/__generated__/folders.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/folder/queries/__generated__/folders.data.gql.dart'
    as _i2;
import 'package:aipictors/features/folder/queries/__generated__/folders.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'folders.req.gql.g.dart';

abstract class GFoldersReq
    implements
        Built<GFoldersReq, GFoldersReqBuilder>,
        _i1.OperationRequest<_i2.GFoldersData, _i3.GFoldersVars> {
  GFoldersReq._();

  factory GFoldersReq([void Function(GFoldersReqBuilder b) updates]) =
      _$GFoldersReq;

  static void _initializeBuilder(GFoldersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Folders',
    )
    ..executeOnListen = true;

  @override
  _i3.GFoldersVars get vars;
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
  _i2.GFoldersData? Function(
    _i2.GFoldersData?,
    _i2.GFoldersData?,
  )? get updateResult;
  @override
  _i2.GFoldersData? get optimisticResponse;
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
  _i2.GFoldersData? parseData(Map<String, dynamic> json) =>
      _i2.GFoldersData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GFoldersData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GFoldersData, _i3.GFoldersVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GFoldersReq> get serializer => _$gFoldersReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFoldersReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFoldersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFoldersReq.serializer,
        json,
      );
}
