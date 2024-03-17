// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/graphql/fragments/__generated__/work_award_notification_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/graphql/fragments/__generated__/work_award_notification_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/graphql/fragments/__generated__/work_award_notification_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'work_award_notification_fields_fragment.req.gql.g.dart';

abstract class GWorkAwardNotificationFieldsReq
    implements
        Built<GWorkAwardNotificationFieldsReq,
            GWorkAwardNotificationFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GWorkAwardNotificationFieldsData,
            _i3.GWorkAwardNotificationFieldsVars> {
  GWorkAwardNotificationFieldsReq._();

  factory GWorkAwardNotificationFieldsReq(
          [void Function(GWorkAwardNotificationFieldsReqBuilder b) updates]) =
      _$GWorkAwardNotificationFieldsReq;

  static void _initializeBuilder(GWorkAwardNotificationFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'WorkAwardNotificationFields';

  @override
  _i3.GWorkAwardNotificationFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GWorkAwardNotificationFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GWorkAwardNotificationFieldsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GWorkAwardNotificationFieldsData data) =>
      data.toJson();

  static Serializer<GWorkAwardNotificationFieldsReq> get serializer =>
      _$gWorkAwardNotificationFieldsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GWorkAwardNotificationFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWorkAwardNotificationFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GWorkAwardNotificationFieldsReq.serializer,
        json,
      );
}
