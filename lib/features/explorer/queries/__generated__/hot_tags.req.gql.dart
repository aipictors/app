// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/explorer/queries/__generated__/hot_tags.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/explorer/queries/__generated__/hot_tags.data.gql.dart'
    as _i2;
import 'package:aipictors/features/explorer/queries/__generated__/hot_tags.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'hot_tags.req.gql.g.dart';

abstract class GHotTagsReq
    implements
        Built<GHotTagsReq, GHotTagsReqBuilder>,
        _i1.OperationRequest<_i2.GHotTagsData, _i3.GHotTagsVars> {
  GHotTagsReq._();

  factory GHotTagsReq([void Function(GHotTagsReqBuilder b) updates]) =
      _$GHotTagsReq;

  static void _initializeBuilder(GHotTagsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'HotTags',
    )
    ..executeOnListen = true;

  @override
  _i3.GHotTagsVars get vars;
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
  _i2.GHotTagsData? Function(
    _i2.GHotTagsData?,
    _i2.GHotTagsData?,
  )? get updateResult;
  @override
  _i2.GHotTagsData? get optimisticResponse;
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
  _i2.GHotTagsData? parseData(Map<String, dynamic> json) =>
      _i2.GHotTagsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GHotTagsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GHotTagsData, _i3.GHotTagsVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GHotTagsReq> get serializer => _$gHotTagsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHotTagsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHotTagsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHotTagsReq.serializer,
        json,
      );
}
