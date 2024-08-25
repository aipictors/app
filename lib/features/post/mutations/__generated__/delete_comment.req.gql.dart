// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/post/mutations/__generated__/delete_comment.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/post/mutations/__generated__/delete_comment.data.gql.dart'
    as _i2;
import 'package:aipictors/features/post/mutations/__generated__/delete_comment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'delete_comment.req.gql.g.dart';

abstract class GDeleteCommentReq
    implements
        Built<GDeleteCommentReq, GDeleteCommentReqBuilder>,
        _i1.OperationRequest<_i2.GDeleteCommentData, _i3.GDeleteCommentVars> {
  GDeleteCommentReq._();

  factory GDeleteCommentReq(
          [void Function(GDeleteCommentReqBuilder b) updates]) =
      _$GDeleteCommentReq;

  static void _initializeBuilder(GDeleteCommentReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'DeleteComment',
    )
    ..executeOnListen = true;

  @override
  _i3.GDeleteCommentVars get vars;
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
  _i2.GDeleteCommentData? Function(
    _i2.GDeleteCommentData?,
    _i2.GDeleteCommentData?,
  )? get updateResult;
  @override
  _i2.GDeleteCommentData? get optimisticResponse;
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
  _i2.GDeleteCommentData? parseData(Map<String, dynamic> json) =>
      _i2.GDeleteCommentData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GDeleteCommentData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GDeleteCommentData, _i3.GDeleteCommentVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GDeleteCommentReq> get serializer =>
      _$gDeleteCommentReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDeleteCommentReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteCommentReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDeleteCommentReq.serializer,
        json,
      );
}
