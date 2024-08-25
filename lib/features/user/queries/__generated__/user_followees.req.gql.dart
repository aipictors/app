// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/user/queries/__generated__/user_followees.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/user/queries/__generated__/user_followees.data.gql.dart'
    as _i2;
import 'package:aipictors/features/user/queries/__generated__/user_followees.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'user_followees.req.gql.g.dart';

abstract class GUserFolloweesReq
    implements
        Built<GUserFolloweesReq, GUserFolloweesReqBuilder>,
        _i1.OperationRequest<_i2.GUserFolloweesData, _i3.GUserFolloweesVars> {
  GUserFolloweesReq._();

  factory GUserFolloweesReq(
          [void Function(GUserFolloweesReqBuilder b) updates]) =
      _$GUserFolloweesReq;

  static void _initializeBuilder(GUserFolloweesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserFollowees',
    )
    ..executeOnListen = true;

  @override
  _i3.GUserFolloweesVars get vars;
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
  _i2.GUserFolloweesData? Function(
    _i2.GUserFolloweesData?,
    _i2.GUserFolloweesData?,
  )? get updateResult;
  @override
  _i2.GUserFolloweesData? get optimisticResponse;
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
  _i2.GUserFolloweesData? parseData(Map<String, dynamic> json) =>
      _i2.GUserFolloweesData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GUserFolloweesData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GUserFolloweesData, _i3.GUserFolloweesVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GUserFolloweesReq> get serializer =>
      _$gUserFolloweesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserFolloweesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFolloweesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserFolloweesReq.serializer,
        json,
      );
}
