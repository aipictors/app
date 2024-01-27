// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/work_comment_responses.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/work_comment_responses.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/work_comment_responses.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'work_comment_responses.req.gql.g.dart';

abstract class GWorkCommentResponsesReq
    implements
        Built<GWorkCommentResponsesReq, GWorkCommentResponsesReqBuilder>,
        _i1.OperationRequest<_i2.GWorkCommentResponsesData,
            _i3.GWorkCommentResponsesVars> {
  GWorkCommentResponsesReq._();

  factory GWorkCommentResponsesReq(
          [Function(GWorkCommentResponsesReqBuilder b) updates]) =
      _$GWorkCommentResponsesReq;

  static void _initializeBuilder(GWorkCommentResponsesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'WorkCommentResponses',
    )
    ..executeOnListen = true;

  @override
  _i3.GWorkCommentResponsesVars get vars;
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
  _i2.GWorkCommentResponsesData? Function(
    _i2.GWorkCommentResponsesData?,
    _i2.GWorkCommentResponsesData?,
  )? get updateResult;
  @override
  _i2.GWorkCommentResponsesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GWorkCommentResponsesData? parseData(Map<String, dynamic> json) =>
      _i2.GWorkCommentResponsesData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GWorkCommentResponsesData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GWorkCommentResponsesData,
      _i3.GWorkCommentResponsesVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GWorkCommentResponsesReq> get serializer =>
      _$gWorkCommentResponsesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GWorkCommentResponsesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentResponsesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GWorkCommentResponsesReq.serializer,
        json,
      );
}
