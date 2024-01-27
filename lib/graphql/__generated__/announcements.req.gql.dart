// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/__generated__/announcements.ast.gql.dart'
    as _i5;
import 'package:aipictors/graphql/__generated__/announcements.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/__generated__/announcements.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'announcements.req.gql.g.dart';

abstract class GAnnouncementsReq
    implements
        Built<GAnnouncementsReq, GAnnouncementsReqBuilder>,
        _i1.OperationRequest<_i2.GAnnouncementsData, _i3.GAnnouncementsVars> {
  GAnnouncementsReq._();

  factory GAnnouncementsReq([Function(GAnnouncementsReqBuilder b) updates]) =
      _$GAnnouncementsReq;

  static void _initializeBuilder(GAnnouncementsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Announcements',
    )
    ..executeOnListen = true;

  @override
  _i3.GAnnouncementsVars get vars;
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
  _i2.GAnnouncementsData? Function(
    _i2.GAnnouncementsData?,
    _i2.GAnnouncementsData?,
  )? get updateResult;
  @override
  _i2.GAnnouncementsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAnnouncementsData? parseData(Map<String, dynamic> json) =>
      _i2.GAnnouncementsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GAnnouncementsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GAnnouncementsData, _i3.GAnnouncementsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GAnnouncementsReq> get serializer =>
      _$gAnnouncementsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAnnouncementsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAnnouncementsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAnnouncementsReq.serializer,
        json,
      );
}
