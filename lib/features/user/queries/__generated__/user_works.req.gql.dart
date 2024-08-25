// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/user/queries/__generated__/user_works.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/user/queries/__generated__/user_works.data.gql.dart'
    as _i2;
import 'package:aipictors/features/user/queries/__generated__/user_works.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'user_works.req.gql.g.dart';

abstract class GUserWorksReq
    implements
        Built<GUserWorksReq, GUserWorksReqBuilder>,
        _i1.OperationRequest<_i2.GUserWorksData, _i3.GUserWorksVars> {
  GUserWorksReq._();

  factory GUserWorksReq([void Function(GUserWorksReqBuilder b) updates]) =
      _$GUserWorksReq;

  static void _initializeBuilder(GUserWorksReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserWorks',
    )
    ..executeOnListen = true;

  @override
  _i3.GUserWorksVars get vars;
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
  _i2.GUserWorksData? Function(
    _i2.GUserWorksData?,
    _i2.GUserWorksData?,
  )? get updateResult;
  @override
  _i2.GUserWorksData? get optimisticResponse;
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
  _i2.GUserWorksData? parseData(Map<String, dynamic> json) =>
      _i2.GUserWorksData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GUserWorksData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GUserWorksData, _i3.GUserWorksVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GUserWorksReq> get serializer => _$gUserWorksReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserWorksReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserWorksReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserWorksReq.serializer,
        json,
      );
}
