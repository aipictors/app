// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/viewer_muted_tags.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/viewer_muted_tags.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/viewer_muted_tags.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'viewer_muted_tags.req.gql.g.dart';

abstract class GViewerMutedTagsReq
    implements
        Built<GViewerMutedTagsReq, GViewerMutedTagsReqBuilder>,
        _i1
        .OperationRequest<_i2.GViewerMutedTagsData, _i3.GViewerMutedTagsVars> {
  GViewerMutedTagsReq._();

  factory GViewerMutedTagsReq(
      [Function(GViewerMutedTagsReqBuilder b) updates]) = _$GViewerMutedTagsReq;

  static void _initializeBuilder(GViewerMutedTagsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ViewerMutedTags',
    )
    ..executeOnListen = true;

  @override
  _i3.GViewerMutedTagsVars get vars;
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
  _i2.GViewerMutedTagsData? Function(
    _i2.GViewerMutedTagsData?,
    _i2.GViewerMutedTagsData?,
  )? get updateResult;
  @override
  _i2.GViewerMutedTagsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GViewerMutedTagsData? parseData(Map<String, dynamic> json) =>
      _i2.GViewerMutedTagsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GViewerMutedTagsData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GViewerMutedTagsData, _i3.GViewerMutedTagsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GViewerMutedTagsReq> get serializer =>
      _$gViewerMutedTagsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GViewerMutedTagsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerMutedTagsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GViewerMutedTagsReq.serializer,
        json,
      );
}
