// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/__generated__/serializers.gql.dart' as _i6;
import 'package:aipictors/fragments/__generated__/liked_work_notification_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/fragments/__generated__/liked_work_notification_fields_fragment.data.gql.dart'
    as _i2;
import 'package:aipictors/fragments/__generated__/liked_work_notification_fields_fragment.var.gql.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;

part 'liked_work_notification_fields_fragment.req.gql.g.dart';

abstract class GLikedWorkNotificationFieldsReq
    implements
        Built<GLikedWorkNotificationFieldsReq,
            GLikedWorkNotificationFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GLikedWorkNotificationFieldsData,
            _i3.GLikedWorkNotificationFieldsVars> {
  GLikedWorkNotificationFieldsReq._();

  factory GLikedWorkNotificationFieldsReq(
          [void Function(GLikedWorkNotificationFieldsReqBuilder b) updates]) =
      _$GLikedWorkNotificationFieldsReq;

  static void _initializeBuilder(GLikedWorkNotificationFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'LikedWorkNotificationFields';

  @override
  _i3.GLikedWorkNotificationFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GLikedWorkNotificationFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GLikedWorkNotificationFieldsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GLikedWorkNotificationFieldsData data) =>
      data.toJson();

  static Serializer<GLikedWorkNotificationFieldsReq> get serializer =>
      _$gLikedWorkNotificationFieldsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GLikedWorkNotificationFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLikedWorkNotificationFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GLikedWorkNotificationFieldsReq.serializer,
        json,
      );
}
