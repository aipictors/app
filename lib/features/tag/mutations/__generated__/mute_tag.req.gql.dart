// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/tag/mutations/__generated__/mute_tag.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/tag/mutations/__generated__/mute_tag.data.gql.dart'
    as _i2;
import 'package:aipictors/features/tag/mutations/__generated__/mute_tag.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'mute_tag.req.gql.g.dart';

abstract class GMuteTagReq
    implements
        Built<GMuteTagReq, GMuteTagReqBuilder>,
        _i1.OperationRequest<_i2.GMuteTagData, _i3.GMuteTagVars> {
  GMuteTagReq._();

  factory GMuteTagReq([void Function(GMuteTagReqBuilder b) updates]) =
      _$GMuteTagReq;

  static void _initializeBuilder(GMuteTagReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'MuteTag',
    )
    ..executeOnListen = true;

  @override
  _i3.GMuteTagVars get vars;
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
  _i2.GMuteTagData? Function(
    _i2.GMuteTagData?,
    _i2.GMuteTagData?,
  )? get updateResult;
  @override
  _i2.GMuteTagData? get optimisticResponse;
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
  _i2.GMuteTagData? parseData(Map<String, dynamic> json) =>
      _i2.GMuteTagData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GMuteTagData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GMuteTagData, _i3.GMuteTagVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GMuteTagReq> get serializer => _$gMuteTagReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMuteTagReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMuteTagReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMuteTagReq.serializer,
        json,
      );
}
