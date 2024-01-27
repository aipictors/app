// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/best_works.ast.gql.dart' as _i5;
import 'package:aipictors/graphql/__generated__/best_works.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/best_works.var.gql.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'best_works.req.gql.g.dart';

abstract class GBestWorksReq
    implements
        Built<GBestWorksReq, GBestWorksReqBuilder>,
        _i1.OperationRequest<_i2.GBestWorksData, _i3.GBestWorksVars> {
  GBestWorksReq._();

  factory GBestWorksReq([Function(GBestWorksReqBuilder b) updates]) =
      _$GBestWorksReq;

  static void _initializeBuilder(GBestWorksReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'BestWorks',
    )
    ..executeOnListen = true;

  @override
  _i3.GBestWorksVars get vars;
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
  _i2.GBestWorksData? Function(
    _i2.GBestWorksData?,
    _i2.GBestWorksData?,
  )? get updateResult;
  @override
  _i2.GBestWorksData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GBestWorksData? parseData(Map<String, dynamic> json) =>
      _i2.GBestWorksData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GBestWorksData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GBestWorksData, _i3.GBestWorksVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GBestWorksReq> get serializer => _$gBestWorksReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GBestWorksReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBestWorksReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GBestWorksReq.serializer,
        json,
      );
}
