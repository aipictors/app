// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/sticker/mutations/__generated__/report_sticker.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/sticker/mutations/__generated__/report_sticker.data.gql.dart'
    as _i2;
import 'package:aipictors/features/sticker/mutations/__generated__/report_sticker.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'report_sticker.req.gql.g.dart';

abstract class GReportStickerReq
    implements
        Built<GReportStickerReq, GReportStickerReqBuilder>,
        _i1.OperationRequest<_i2.GReportStickerData, _i3.GReportStickerVars> {
  GReportStickerReq._();

  factory GReportStickerReq(
          [void Function(GReportStickerReqBuilder b) updates]) =
      _$GReportStickerReq;

  static void _initializeBuilder(GReportStickerReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ReportSticker',
    )
    ..executeOnListen = true;

  @override
  _i3.GReportStickerVars get vars;
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
  _i2.GReportStickerData? Function(
    _i2.GReportStickerData?,
    _i2.GReportStickerData?,
  )? get updateResult;
  @override
  _i2.GReportStickerData? get optimisticResponse;
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
  _i2.GReportStickerData? parseData(Map<String, dynamic> json) =>
      _i2.GReportStickerData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GReportStickerData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GReportStickerData, _i3.GReportStickerVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GReportStickerReq> get serializer =>
      _$gReportStickerReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReportStickerReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportStickerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReportStickerReq.serializer,
        json,
      );
}
