// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'create_work_comment.req.gql.g.dart';

abstract class GCreateWorkCommentReq
    implements
        Built<GCreateWorkCommentReq, GCreateWorkCommentReqBuilder>,
        _i1.OperationRequest<_i2.GCreateWorkCommentData,
            _i3.GCreateWorkCommentVars> {
  GCreateWorkCommentReq._();

  factory GCreateWorkCommentReq(
          [void Function(GCreateWorkCommentReqBuilder b) updates]) =
      _$GCreateWorkCommentReq;

  static void _initializeBuilder(GCreateWorkCommentReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateWorkComment',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateWorkCommentVars get vars;
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
  _i2.GCreateWorkCommentData? Function(
    _i2.GCreateWorkCommentData?,
    _i2.GCreateWorkCommentData?,
  )? get updateResult;
  @override
  _i2.GCreateWorkCommentData? get optimisticResponse;
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
  _i2.GCreateWorkCommentData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateWorkCommentData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GCreateWorkCommentData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GCreateWorkCommentData, _i3.GCreateWorkCommentVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GCreateWorkCommentReq> get serializer =>
      _$gCreateWorkCommentReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateWorkCommentReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWorkCommentReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateWorkCommentReq.serializer,
        json,
      );
}
