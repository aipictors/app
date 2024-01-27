// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/album_works.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/album_works.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/album_works.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'album_works.req.gql.g.dart';

abstract class GAlbumWorksReq
    implements
        Built<GAlbumWorksReq, GAlbumWorksReqBuilder>,
        _i1.OperationRequest<_i2.GAlbumWorksData, _i3.GAlbumWorksVars> {
  GAlbumWorksReq._();

  factory GAlbumWorksReq([Function(GAlbumWorksReqBuilder b) updates]) =
      _$GAlbumWorksReq;

  static void _initializeBuilder(GAlbumWorksReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AlbumWorks',
    )
    ..executeOnListen = true;

  @override
  _i3.GAlbumWorksVars get vars;
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
  _i2.GAlbumWorksData? Function(
    _i2.GAlbumWorksData?,
    _i2.GAlbumWorksData?,
  )? get updateResult;
  @override
  _i2.GAlbumWorksData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAlbumWorksData? parseData(Map<String, dynamic> json) =>
      _i2.GAlbumWorksData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GAlbumWorksData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GAlbumWorksData, _i3.GAlbumWorksVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GAlbumWorksReq> get serializer =>
      _$gAlbumWorksReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAlbumWorksReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAlbumWorksReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAlbumWorksReq.serializer,
        json,
      );
}
