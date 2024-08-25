// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/features/daily_theme/queries/__generated__/daily_themes.ast.gql.dart'
    as _i5;
import 'package:aipictors/features/daily_theme/queries/__generated__/daily_themes.data.gql.dart'
    as _i2;
import 'package:aipictors/features/daily_theme/queries/__generated__/daily_themes.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'daily_themes.req.gql.g.dart';

abstract class GDailyThemesReq
    implements
        Built<GDailyThemesReq, GDailyThemesReqBuilder>,
        _i1.OperationRequest<_i2.GDailyThemesData, _i3.GDailyThemesVars> {
  GDailyThemesReq._();

  factory GDailyThemesReq([void Function(GDailyThemesReqBuilder b) updates]) =
      _$GDailyThemesReq;

  static void _initializeBuilder(GDailyThemesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'DailyThemes',
    )
    ..executeOnListen = true;

  @override
  _i3.GDailyThemesVars get vars;
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
  _i2.GDailyThemesData? Function(
    _i2.GDailyThemesData?,
    _i2.GDailyThemesData?,
  )? get updateResult;
  @override
  _i2.GDailyThemesData? get optimisticResponse;
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
  _i2.GDailyThemesData? parseData(Map<String, dynamic> json) =>
      _i2.GDailyThemesData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GDailyThemesData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GDailyThemesData, _i3.GDailyThemesVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GDailyThemesReq> get serializer =>
      _$gDailyThemesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDailyThemesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDailyThemesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDailyThemesReq.serializer,
        json,
      );
}
