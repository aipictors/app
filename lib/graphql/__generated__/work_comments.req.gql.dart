// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/work_comments.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/work_comments.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/work_comments.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'work_comments.req.gql.g.dart';

abstract class GWorkCommentsReq
    implements
        Built<GWorkCommentsReq, GWorkCommentsReqBuilder>,
        _i1.OperationRequest<_i2.GWorkCommentsData, _i3.GWorkCommentsVars> {
  GWorkCommentsReq._();

  factory GWorkCommentsReq([void Function(GWorkCommentsReqBuilder b) updates]) =
      _$GWorkCommentsReq;

  static void _initializeBuilder(GWorkCommentsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'WorkComments',
    )
    ..executeOnListen = true;

  @override
  _i3.GWorkCommentsVars get vars;
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
  _i2.GWorkCommentsData? Function(
    _i2.GWorkCommentsData?,
    _i2.GWorkCommentsData?,
  )? get updateResult;
  @override
  _i2.GWorkCommentsData? get optimisticResponse;
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
  _i2.GWorkCommentsData? parseData(Map<String, dynamic> json) =>
      _i2.GWorkCommentsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GWorkCommentsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GWorkCommentsData, _i3.GWorkCommentsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GWorkCommentsReq> get serializer =>
      _$gWorkCommentsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GWorkCommentsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkCommentsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GWorkCommentsReq.serializer,
        json,
      );
}
