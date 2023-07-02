// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/daily_theme.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/daily_theme.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/daily_theme.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'daily_theme.req.gql.g.dart';

abstract class GDailyThemeReq
    implements
        Built<GDailyThemeReq, GDailyThemeReqBuilder>,
        _i1.OperationRequest<_i2.GDailyThemeData, _i3.GDailyThemeVars> {
  GDailyThemeReq._();

  factory GDailyThemeReq([Function(GDailyThemeReqBuilder b) updates]) =
      _$GDailyThemeReq;

  static void _initializeBuilder(GDailyThemeReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'DailyTheme',
    )
    ..executeOnListen = true;
  @override
  _i3.GDailyThemeVars get vars;
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
  _i2.GDailyThemeData? Function(
    _i2.GDailyThemeData?,
    _i2.GDailyThemeData?,
  )? get updateResult;
  @override
  _i2.GDailyThemeData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GDailyThemeData? parseData(Map<String, dynamic> json) =>
      _i2.GDailyThemeData.fromJson(json);
  static Serializer<GDailyThemeReq> get serializer =>
      _$gDailyThemeReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDailyThemeReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDailyThemeReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDailyThemeReq.serializer,
        json,
      );
}
