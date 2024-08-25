// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/album/queries/__generated__/albums.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/album/queries/__generated__/albums.data.gql.dart'
    as _i2;
import 'package:aipictors/features/album/queries/__generated__/albums.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'albums.req.gql.g.dart';

abstract class GAlbumsReq
    implements
        Built<GAlbumsReq, GAlbumsReqBuilder>,
        _i1.OperationRequest<_i2.GAlbumsData, _i3.GAlbumsVars> {
  GAlbumsReq._();

  factory GAlbumsReq([void Function(GAlbumsReqBuilder b) updates]) =
      _$GAlbumsReq;

  static void _initializeBuilder(GAlbumsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Albums',
    )
    ..executeOnListen = true;

  @override
  _i3.GAlbumsVars get vars;
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
  _i2.GAlbumsData? Function(
    _i2.GAlbumsData?,
    _i2.GAlbumsData?,
  )? get updateResult;
  @override
  _i2.GAlbumsData? get optimisticResponse;
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
  _i2.GAlbumsData? parseData(Map<String, dynamic> json) =>
      _i2.GAlbumsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GAlbumsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GAlbumsData, _i3.GAlbumsVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GAlbumsReq> get serializer => _$gAlbumsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAlbumsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAlbumsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAlbumsReq.serializer,
        json,
      );
}
