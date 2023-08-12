// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/viewer_albums.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/viewer_albums.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/viewer_albums.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'viewer_albums.req.gql.g.dart';

abstract class GViewerAlbumsReq
    implements
        Built<GViewerAlbumsReq, GViewerAlbumsReqBuilder>,
        _i1.OperationRequest<_i2.GViewerAlbumsData, _i3.GViewerAlbumsVars> {
  GViewerAlbumsReq._();

  factory GViewerAlbumsReq([Function(GViewerAlbumsReqBuilder b) updates]) =
      _$GViewerAlbumsReq;

  static void _initializeBuilder(GViewerAlbumsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ViewerAlbums',
    )
    ..executeOnListen = true;
  @override
  _i3.GViewerAlbumsVars get vars;
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
  _i2.GViewerAlbumsData? Function(
    _i2.GViewerAlbumsData?,
    _i2.GViewerAlbumsData?,
  )? get updateResult;
  @override
  _i2.GViewerAlbumsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GViewerAlbumsData? parseData(Map<String, dynamic> json) =>
      _i2.GViewerAlbumsData.fromJson(json);
  static Serializer<GViewerAlbumsReq> get serializer =>
      _$gViewerAlbumsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GViewerAlbumsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GViewerAlbumsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GViewerAlbumsReq.serializer,
        json,
      );
}
