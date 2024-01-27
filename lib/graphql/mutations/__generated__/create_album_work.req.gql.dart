// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/create_album_work.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/create_album_work.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/create_album_work.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'create_album_work.req.gql.g.dart';

abstract class GCreateAlbumWorkReq
    implements
        Built<GCreateAlbumWorkReq, GCreateAlbumWorkReqBuilder>,
        _i1
        .OperationRequest<_i2.GCreateAlbumWorkData, _i3.GCreateAlbumWorkVars> {
  GCreateAlbumWorkReq._();

  factory GCreateAlbumWorkReq(
      [Function(GCreateAlbumWorkReqBuilder b) updates]) = _$GCreateAlbumWorkReq;

  static void _initializeBuilder(GCreateAlbumWorkReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateAlbumWork',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateAlbumWorkVars get vars;
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
  _i2.GCreateAlbumWorkData? Function(
    _i2.GCreateAlbumWorkData?,
    _i2.GCreateAlbumWorkData?,
  )? get updateResult;
  @override
  _i2.GCreateAlbumWorkData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateAlbumWorkData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateAlbumWorkData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GCreateAlbumWorkData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GCreateAlbumWorkData, _i3.GCreateAlbumWorkVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GCreateAlbumWorkReq> get serializer =>
      _$gCreateAlbumWorkReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateAlbumWorkReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateAlbumWorkReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateAlbumWorkReq.serializer,
        json,
      );
}
